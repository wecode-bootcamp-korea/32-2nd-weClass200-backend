import json
import jwt
import requests

from django.views     import View
from django.http      import JsonResponse, HttpResponse
from django.conf      import settings
from django.db        import transaction
from django.db.models import Count

from users.models    import Review, ReviewImage, User, Like, MyClass, Creator
from products.models import Product
from core.utils      import login_decorator

class LikeView(View):
    @login_decorator
    def post(self,request):
        data       = json.loads(request.body)
        product_id = data['product_id']
        user_id    = request.user.id

        if Like.objects.filter(product_id = product_id, user_id = user_id).exists():
            Like.objects.filter(product_id = product_id, user_id = user_id).delete()
            return HttpResponse(status = 204)

        Like.objects.create(user_id = user_id, product_id = product_id)
        return JsonResponse({'message' : 'liked'}, status=201)

class ReviewView(View):
    @login_decorator
    def post(self, request):    
        data       = json.loads(request.body)
        user_id    = request.user.id
        score      = data['rating']
        product_id = data['product_id']
        detail     = data['content']
        image_url  = data['image_url']
        
        # if MyClass.objects.filter(product_id = product_id, user_id = user_id).exists():
        Review.objects.filter(product_id = product_id, user_id = user_id).update_or_create(
            user_id    = user_id,
            product_id = product_id,
            score      = score,
            detail     = detail
        )

        review_id = Review.objects.filter(user_id = user_id, product_id = product_id)[0].id

        ReviewImage.objects.update_or_create(
            review_id  = review_id,
            image_urls = image_url
        )
        return JsonResponse({'message' : 'created'}, status = 201)
        # return JsonResponse({'message' : '구매하지 않은 강의입니다'}, status = 400)

    @login_decorator
    def delete(self, request):
        data       = json.loads(request.body)
        user_id    = request.user.id
        product_id = data['product_id']
        review     = Review.objects.get(product_id = product_id, user_id = user_id)

        with transaction.atomic():
            review.images.all().delete()
            review.delete()
        return HttpResponse(status = 204)

class MyClassView(View):
    @login_decorator
    def post(self,request):
        user_id    = request.user.id
        data       = json.loads(request.body)
        product_id = data['product_id']
        
        if MyClass.objects.filter(product_id = product_id, user_id = user_id).exists():
            return JsonResponse({'message' : '이미 구매한 강의입니다'}, status = 400)

        with transaction.atomic():
            MyClass.objects.create(
                user_id    = user_id,
                product_id = product_id
            )
        return JsonResponse({'message' : '구매 성공'}, status = 201)

class MyPageView(View):
    @login_decorator
    def get(self, request):
        user_id           = request.user.id
        liked_products    = Product.objects.filter(product_like__user_id = user_id).annotate(like_amount=Count('product_like__id')) \
                            .prefetch_related('images','product_like')
        learning_products = Product.objects.filter(product_myclass__user_id = user_id).annotate(review_amount=Count('product_review__id')) \
                            .prefetch_related('images','product_myclass')
        like_result       = []
        my_class_result   = []

        for product in liked_products:
            like_result.append({
                "id"            : product.id,
                "content_name"  : product.name,
                "creator_name"  : product.creator.nickname,
                "thumb_img"     : product.images.all()[0].image_urls,
                "month"         : product.period,
                "price_amount"  : int(product.price),
                "discount_rate" : product.discount_rate,
                "like_amount"   : product.like_amount
            })

        for product in learning_products:
            my_class_result.append({
                "id"           : product.id,
                "content_name" : product.name,
                "creator_name" : product.creator.nickname,
                "thumb_img"    : product.images.all()[0].image_urls,
                "month"        : product.period,
            })
        return JsonResponse({'liked_products' : like_result, 'myclasses' : my_class_result}, status = 200)
        
def get_kakao_user_information(access_token):
    header = {
        "Authorization" : f'Bearer {access_token}',
        "Content-type"  : "application/x-www-form-unlencoded;charset=utf-8"
    }
    kakao_user_info = requests.get("https://kapi.kakao.com/v2/user/me", headers = header, timeout = 2)

    if not kakao_user_info.status_code == 200: 
        return False

    return kakao_user_info.json()        

class KakaoLoginView(View):
    def get(self, request):
        new_token       = request.headers.get('Authorization', None)
        kakao_user_info = get_kakao_user_information(new_token)

        if not kakao_user_info:
            return JsonResponse({"message" : "INVALID_KAKAO_TOKEN"}, status = 401)
            
        kakao_id        = kakao_user_info['id']
        nickname        = kakao_user_info['kakao_account']['profile']['nickname']
        profile_image   = kakao_user_info['kakao_account']['profile']['profile_image_url']
        email           = kakao_user_info['kakao_account']['email']
        

        user, created = User.objects.get_or_create(
            kakao_id = kakao_id, 
            defaults = {'name' : nickname, 'email' : email, 'profile_image' : profile_image}
            )   
        new_token = jwt.encode({'id':user.id}, settings.SECRET_KEY, algorithm = settings.ALGORITHM)

        if created:
            return JsonResponse({"message" : "NEW_USER", "new_token" : new_token, "name" : user.name, 'img' : user.profile_image}, status = 201)
        
        return JsonResponse({"message" : "REGISTERED_USER", "new_token" : new_token, "name" : user.name, 'img' : user.profile_image}, status = 200)

class CreatorView(View):
    @login_decorator
    def post(self, request):
        try:
            
            data = json.loads(request.body)
            user_id      = request.user.id
            nickname      = data['nickname']
            email         = data['email']
            phone_number  = data['phone_number']
            profile_image = data['profile_image']
            introduction  = data['introduction']
            carrer        = data['carrer']
            
            Creator.objects.update_or_create(
                user_id  = user_id,
                defaults = {
                    'nickname'     : nickname,
                    'email'        : email,
                    'phone_number' : phone_number,
                    'profile_image': profile_image,
                    'introduction' : introduction,
                    'carrer'       : carrer
                }
            )

            with transaction.atomic():
                Creator.objects.update_or_create(
                    user_id      = user_id,
                    nickname     = nickname,
                    email        = email,
                    phone_number = phone_number,
                    introduction = introduction,
                    carrer       = carrer
                )
            return JsonResponse({'message' : "SUCCESS"}, status = 201)
        
        except KeyError:
            return JsonResponse({'message' : "KEY_ERROR"}, status = 401)

        except json.JSONDecodeError:
            return JsonResponse({"message": "DECODE_ERROR"}, status=400)
