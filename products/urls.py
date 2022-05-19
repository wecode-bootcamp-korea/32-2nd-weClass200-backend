from unicodedata import category
from django.urls    import path
from products.views import PublicProductView, PrivateProductView, PublicProductsView, PrivateProductsView ,MainCategoriesView, CreateProductView

urlpatterns = [
    path('/public', PublicProductsView.as_view()),
    path('/private', PrivateProductsView.as_view()),
    path('/public/<int:product_id>', PublicProductView.as_view()),
    path('/private/<int:product_id>', PrivateProductView.as_view()),
    path('/nav', MainCategoriesView.as_view()),
    path('/createclass', CreateProductView.as_view())
]

