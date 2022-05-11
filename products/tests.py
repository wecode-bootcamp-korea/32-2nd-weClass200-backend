from urllib import response
from django.test import TestCase, Client
from products.models import MainCategory, SubCategory, Product, Status
from users.models    import Creator, User


class NavTest(TestCase):
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
        main_category = []
        mcs = MainCategory.objects.filter(id = 1)

        for mc in mcs:
            sub_category = []
            sbs = SubCategory.objects.filter(maincategory_id = mc.id)
            for sb in sbs:
                print(sb)
                print(sbs)
                sub_category.append({
                    "id" : sb.id,
                    "subTitle" : sb.name
                })
            main_category.append({
                "id" : mc.id,
                "category" : mc.name,
                "subCategory" : sub_category
            })

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {"result" : main_category})