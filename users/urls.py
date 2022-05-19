from django.urls import path
from users.views import KakaoLoginView, MyPageView, ReviewView, LikeView, MyClassView, CreatorView

urlpatterns = [
    path('/buy', MyClassView.as_view()),
    path('/like', LikeView.as_view()),
    path('/kakao', KakaoLoginView.as_view()),
    path('/review', ReviewView.as_view()),
    path('/mypage', MyPageView.as_view()),
    path('/creator', CreatorView.as_view())
]