import jwt, requests

from django.views     import View
from django.http      import JsonResponse
from django.conf      import settings

from users.models     import User
        
def get_kakao_user_information(access_token):
    header = {
        "Authorization" : f'Bearer {access_token}',
        "Content-type"  : "application/x-www-form-unlencoded;charset=utf-8"
    }
    kakao_user_info = requests.get("https://kapi.kakao.com/v2/user/me", headers = header, timeout = 5)
    print(type(kakao_user_info.json().get('code')))
    if kakao_user_info.json().get('code') == -401:
        return JsonResponse({"message" : "this access_token does not exist"}, status = 401)
    return kakao_user_info.json()        
    
class KakaoLoginView(View):
    def get(self, request):
        new_token       = request.headers.get('Authorization', None)
        kakao_user_info = get_kakao_user_information(new_token)
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
            return JsonResponse({"message" : "NEW_USER", "new_token" : new_token}, status = 201)
        
        return JsonResponse({"message" : "REGISTERED_USER", "new_token" : new_token}, status = 200)