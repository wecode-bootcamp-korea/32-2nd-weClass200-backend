from django.urls import path
from users.views import CreatorView, KakaoLoginView

urlpatterns = [
    path('/kakao', KakaoLoginView.as_view()),
    path('/creator', CreatorView.as_view())
]