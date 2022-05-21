from django.db import models


class User(models.Model):
    name          = models.CharField(max_length=30)
    kakao_id      = models.BigIntegerField(default=0, null=True)
    email         = models.CharField(max_length=200, null=True)
    phone_number  = models.CharField(max_length=50, null=True)
    profile_image = models.CharField(max_length=500, null=True)
    gender        = models.CharField(max_length=30, null=True)
    age           = models.PositiveIntegerField(null=True)
    myclasses     = models.ManyToManyField('products.Product', through="users.MyClass", related_name='user_myclass')
    reviews       = models.ManyToManyField('products.Product', through="users.Review", related_name='user_review')
    likes         = models.ManyToManyField('products.Product', through="users.Like", related_name='user_like')

    class Meta:
        db_table = 'users'

class Creator(models.Model):
    user          = models.ForeignKey('users.User', on_delete=models.CASCADE)
    nickname      = models.CharField(max_length=30)
    email         = models.CharField(max_length=200)
    phone_number  = models.CharField(max_length=50, null=True)
    profile_image = models.CharField(max_length=500)
    introduction  = models.CharField(max_length=1000)
    carrer        = models.CharField(max_length=1000)

    class Meta:
        db_table = 'creators'

class MyClass(models.Model):
    user    = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    product = models.ForeignKey('products.Product', on_delete=models.SET_NULL, 
                                null=True, related_name='product_myclass')

    class Meta:
        db_table = 'myclasses'

class Like(models.Model):
    user    = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    product = models.ForeignKey('products.Product', on_delete=models.SET_NULL, 
                                null=True, related_name='product_like')

    class Meta:
        db_table = 'likes'

class Review(models.Model):
    user         = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    product      = models.ForeignKey('products.Product', on_delete=models.SET_NULL, 
                                      null=True, related_name='product_review')
    score        = models.PositiveIntegerField()
    detail       = models.CharField(max_length=1000)
    created_at   = models.DateTimeField(auto_now_add=True)
    updated_at   = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'reviews'

class ReviewImage(models.Model):
    review     = models.ForeignKey(Review, on_delete=models.SET_NULL, 
                                   null=True, related_name='images')
    image_urls = models.CharField(max_length=500, null=True, default=None)

    class Meta:
        db_table = 'review_images'