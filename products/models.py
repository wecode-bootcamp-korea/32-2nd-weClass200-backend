from django.db import models


class MainCategory(models.Model):
    name = models.CharField(max_length=50)

    class Meta:
        db_table = 'main_categories'

class SubCategory(models.Model):
    name         = models.CharField(max_length=50)
    maincategory = models.ForeignKey(MainCategory, on_delete=models.SET_NULL, null=True)

    class Meta:
        db_table = 'sub_categories'

class Product(models.Model):
    name            = models.CharField(max_length=50)
    creator         = models.ForeignKey('users.Creator', on_delete=models.SET_NULL, 
                                         null=True, related_name='creator')
    subcategory     = models.ForeignKey(SubCategory, on_delete=models.SET_NULL, null=True)
    price           = models.DecimalField(max_digits=10, decimal_places=2)
    description     = models.CharField(max_length=1000)
    period          = models.PositiveIntegerField(null=True)
    review_score    = models.DecimalField(max_digits=2, decimal_places=1)
    created_at      = models.DateTimeField(auto_now_add=True)
    updated_at      = models.DateTimeField(auto_now=True)
    discount_rate   = models.IntegerField(null=True)
    discount_coupon = models.IntegerField(null=True)

    class Meta:
        db_table = 'products'

class ProductImage(models.Model):
    product    = models.ForeignKey(Product, on_delete=models.SET_NULL,
                                   null=True, related_name='images')
    image_urls = models.CharField(max_length=500, null=True, default=None)

    class Meta:
        db_table = 'product_images'