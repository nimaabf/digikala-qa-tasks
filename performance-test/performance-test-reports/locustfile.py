from locust import HttpUser, task, between


class DigikalaLoadTest(HttpUser):

    wait_time = between(1, 5)

    @task
    def load_home_page(self):
        self.client.get("https://digikala.com")

    @task
    def load_product_page(self):
        self.client.get("/product/dkp-4278853")
