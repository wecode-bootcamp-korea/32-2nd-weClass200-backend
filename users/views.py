import jwt, requests, json

from django.views     import View
from django.http      import JsonResponse
from django.conf      import settings

from core.utils       import login_decorator

from users.models     import User, Creator
        
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
            defaults = {'name' : nickname, 'email' : email, 'profile_image' :profile_image}
            )   
        new_token = jwt.encode({'id':user.id}, settings.SECRET_KEY, algorithm=settings.ALGORITHM)

        if created:
            return JsonResponse({"message" : "NEW_USER", "new_token" : new_token, "name" : user.name, 'img' : user.profile_image}, status = 201)
        
        return JsonResponse({"message" : "REGISTERED_USER", "new_token" : new_token, "name" : user.name, 'img' : user.profile_image}, status = 200)

class CreatorView(View):
    @login_decorator
    def post(self, request):
        try:
            data = json.loads(request.body)

            user_id      = request.user.id

            nickname     = data['nickname']
            email        = data['email']
            phone_number = data['phone_number']
            introduction = data['introduction']
            carrer       = data['carrer']
            
            Creator.objects.update_or_create(
                user_id  = user_id,
                defaults = {
                    nickname     : nickname,
                    email        : email,
                    phone_number : phone_number,
                    introduction : introduction,
                    carrer       : carrer
                }
            )

            return JsonResponse({'message' : "SUCCESS"}, status = 201)
        
        except KeyError:
            return JsonResponse({'message' : "KEY_ERROR"}, status = 401)

        except json.JSONDecodeError:
            return JsonResponse({"message": "DECODE_ERROR"}, status=400)
