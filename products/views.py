from django.db.models import Q, Count
from django.http      import JsonResponse
from django.views     import View

from core.utils       import login_decorator
from products.models  import MainCategory, Product
from users.models     import Like, MyClass, ReviewImage

class MainCategoriesView(View):
    def get(self, request):
        main_categories = MainCategory.objects.prefetch_related("subcategory_set")
        
        results = []

        for main_category in main_categories:
            sub_categories = [{
                "id" : sub_category.id,
                "subTitle" : sub_category.name
            } for sub_category in main_category.subcategory_set.all()]

            results.append({
                "id"          : main_category.id,
                "category"    : main_category.name,
                "subCategory" : sub_categories
            })

        return JsonResponse({'results' : results}, status=200)

class PublicProductsView(View):
    def get(self,request):
        type_name = request.GET.getlist("type_name")
        search    = request.GET.get("search")
        ordering  = request.GET.get("ordering", "id")
        offset    = request.GET.get("offset", 0)
        limit     = request.GET.get("limit",  8)
        results   = []
        order_by_option = {
                "id"     : "id",
                "price"  : "price",
                "new"    : "-updated_at",
                "score"  : "-review_score",
                "like"   : "-like_amount",
                "review" : "-review_amount"
            }

        q = Q()
        
        if type_name:
            q &= Q(type__name__in = type_name) | Q(subcategory__maincategory__name__in = type_name) | Q(subcategory__name__in = type_name)

        if search:
            q &= Q(name__icontains = search) 

        products = Product.objects.filter(q) \
            .select_related("creator") \
            .annotate(like_amount=Count('product_like__id')) \
            .annotate(review_amount=Count('product_review__id')) \
            .prefetch_related("images") \
            .order_by(order_by_option[ordering])[offset : offset + limit]

        for product in products:
            results.append({
            "id"              : product.id,
            "type"            : product.type.name,
            "content_name"    : product.name,
            "creator_name"    : product.creator.nickname,
            "thumb_img"       : product.images.all()[0].image_urls,
            "price_amount"    : int(product.price),
            "discount_rate"   : product.discount_rate,
            "discount_coupon" : product.discount_coupon,
            "month"           : product.period,
            "like_amount"     : product.like_amount,
            "upload_date"     : str(product.created_at).replace('-','')[2:8]
        })
        return JsonResponse({'products' : results}, status=200)

class PrivateProductsView(View):
    @login_decorator
    def get(self,request):
        user_id     = request.user.id
        type_name   = request.GET.getlist("type_name")
        search      = request.GET.get("search")
        ordering    = request.GET.get("ordering", "id")
        offset      = request.GET.get("offset", 0)
        limit       = request.GET.get("limit",  8)
        results     = []
        is_liked    = False
        is_learning = False
        order_by_option = {
                "id"     : "id",
                "price"  : "price",
                "new"    : "-updated_at",
                "score"  : "-review_score",
                "like"   : "-like_amount",
                "review" : "-review_amount"
            }

        q = Q()
        
        if type_name:
            q &= Q(type__name__in = type_name) | Q(subcategory__maincategory__name__in = type_name) | Q(subcategory__name__in = type_name)

        if search:
            q &= Q(name__icontains = search) 

        products = Product.objects.filter(q) \
            .select_related("creator") \
            .annotate(like_amount=Count('product_like__id')) \
            .annotate(review_amount=Count('product_review__id')) \
            .prefetch_related("images") \
            .order_by(order_by_option[ordering])[offset : offset + limit]

        for product in products:
            if Like.objects.filter(user_id = user_id, product_id = product.id).exists():
                is_liked = True

            if MyClass.objects.filter(user_id = user_id, product_id = product.id).exists():
                is_learning = True

            results.append({
            "id"              : product.id,
            "type"            : product.type.name,
            "content_name"    : product.name,
            "creator_name"    : product.creator.nickname,
            "thumb_img"       : product.images.all()[0].image_urls,
            "price_amount"    : int(product.price),
            "discount_rate"   : product.discount_rate,
            "discount_coupon" : product.discount_coupon,
            "month"           : product.period,
            "like_amount"     : product.like_amount,
            "upload_date"     : str(product.created_at).replace('-','')[2:8],
            "is_learning"     : is_learning,
            "is_liked"        : is_liked
        })
           
        return JsonResponse({'products' : results}, status=200)

class PublicProductView(View):
    def get(self, request, product_id):
        print(product_id)
        result        = []
        review_result = []
        product       = Product.objects.get(id = product_id)
        reviews       = product.product_review.all()

        for review in reviews:
            if ReviewImage.objects.filter(review_id = review.id).exists():
                print(review.id)
                print(review.images.all())
                review_result.append({
                    "id"           : review.id,
                    "user_name"    : review.user.name,
                    "content"      : review.detail,
                    "rating"       : review.score,
                    "review_image" : review.images.all()[0].image_urls.split(',')[0],
                    "post_date"    : review.updated_at
                })
            else :
                review_result.append({
                    "id"           : review.id,
                    "user_name"    : review.user.name,
                    "content"      : review.detail,
                    "rating"       : review.score,
                    "post_date"    : review.updated_at
                })

        result.append({
                "id" : product.id,
                "content_name"    : product.name,
                "creator_name"    : product.creator.nickname,
                "thumb_img"       : product.images.all()[0].image_urls,
                "price"           : int(product.price),
                "upload_date"     : str(product.created_at).replace('-','')[2:8],
                "discount_rate"   : product.discount_rate,
                "discount_coupon" : product.discount_coupon,
                "month"           : product.period, 
                "like_amount"     : product.product_like.all().count(),
                "status"          : "today",
                "reviews"         : review_result
            })
        return JsonResponse({'product' : result}, status = 200)
        
class PrivateProductView(View):
    @login_decorator
    def get(self, request, product_id):
        result        = []
        review_result = []
        product       = Product.objects.get(id = product_id)
        user_id       = request.user.id
        reviews       = product.product_review.all()
        is_liked      = False
        is_learning   = False

        if Like.objects.filter(user_id = user_id, product_id = product.id).exists():
            is_liked = True

        if MyClass.objects.filter(user_id = user_id, product_id = product.id).exists():
            is_learning = True

        for review in reviews:
            if ReviewImage.objects.filter(review_id = review.id).exists():
                print(review.id)
                print(review.images.all())
                review_result.append({
                    "id"           : review.id,
                    "user_name"    : review.user.name,
                    "content"      : review.detail,
                    "rating"       : review.score,
                    "review_image" : review.images.all()[0].image_urls.split(',')[0],
                    "post_date"    : review.updated_at
                })
            else :
                review_result.append({
                    "id"           : review.id,
                    "user_name"    : review.user.name,
                    "content"      : review.detail,
                    "rating"       : review.score,
                    "post_date"    : review.updated_at
                })

        result.append({
                "id" : product.id,
                "content_name"    : product.name,
                "creator_name"    : product.creator.nickname,
                "thumb_img"       : product.images.all()[0].image_urls,
                "price"           : int(product.price),
                "upload_date"     : str(product.created_at).replace('-','')[2:8],
                "discount_rate"   : product.discount_rate,
                "discount_coupon" : product.discount_coupon,
                "month"           : product.period, 
                "like_amount"     : product.product_like.all().count(),
                "is_liked"        : is_liked,
                "is_learning"     : is_learning,
                "reviews"         : review_result
            })
        return JsonResponse({'product' : result}, status = 200)



