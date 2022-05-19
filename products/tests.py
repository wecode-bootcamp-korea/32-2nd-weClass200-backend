from urllib import response
from django.test import TestCase, Client
from products.models import MainCategory, SubCategory, Product, Status
from users.models    import Creator, User


class MainCategoryTest(TestCase):
    def setUp(self):
        MainCategory.objects.create(
            id = 1,
            name = 'main'
        )
        SubCategory.objects.bulk_create(
            [SubCategory(
                id = 1,
                maincategory_id = 1,
                name = 'sub1'
            ),
            SubCategory(
                id = 2,
                maincategory_id = 1,
                name = 'sub2'
            )
            ]
        )
    
    def tearDown(self):
        MainCategory.objects.all().delete()
        SubCategory.objects.all().delete()

    def test_nav_loading_success(self):
        client = Client()
        response = client.get('/products/nav')
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

        print(response)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {"results" : results})