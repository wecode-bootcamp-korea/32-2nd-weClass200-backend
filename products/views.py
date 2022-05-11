import json

from django.http     import JsonResponse
from django.views    import View
from products.models import MainCategory, SubCategory, Product
from users.models    import Like, MyClass


class DetailView(View):
    def get(self, request, product_id):
        user_id       = json.loads(request.body)['user_id']
        result        = []
        review_result = []
        product       = Product.objects.get(id = product_id)
        reviews       = product.product_review.all()
        is_liked      = False
        is_learning   = False

        if Like.objects.filter(user_id = user_id, product_id = product.id).exists():
            is_liked = True

        if MyClass.objects.filter(user_id = user_id, product_id = product.id).exists():
            is_learning = True

        for review in reviews:
            review_result.append({
                "id"           : review.id,
                "userName"     : review.user.name,
                "content"      : review.detail,
                "rating"       : review.score,
                "review_image" : review.images.image_urls.split(',')[0],
                "post_date"    : review.updated_at
            })

        result.append({
                "id" : product.id,
                "content_name"    : product.name,
                "creator_name"    : product.creator.name,
                "thum_img"        : product.images.image_urls.split(',')[0],
                "upload_date"     : product.created_at,
                "discount_rate"   : product.discount_rate,
                "discount_coupon" : product.discount_coupon,
                "month"           : product.period, 
                "is_liked"        : is_liked,
                "is_learning"     : is_learning,
                "status"          : "today",
                "reviews"         : review_result
            })
        return JsonResponse({'product' : result}, status = 200)

