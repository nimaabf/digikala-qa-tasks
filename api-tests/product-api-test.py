import requests
from jsonschema import validate, ValidationError

url = "https://api.digikala.com/v1/search"
params = {
    "q": "گوشی موبایل"
}

schema = {
    "type": "object",
    "properties": {
        "data": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "name": {"type": "string"},
                    "price": {"type": "integer"}
                },
                "required": ["name", "price"]
            }
        }
    },
    "required": ["data"]
}

try:
    response = requests.get(url, params=params)

    if response.status_code == 200:
        print(
            f"Request was a Success with status code: {response.status_code}")
        data = response.json()

        try:
            validate(instance=data, schema=schema)
            print("Response matches the schema.")
        except ValidationError as e:
            print(f"Response does not match the schema: {e.message}")

        print("Search Results:")
        for item in data.get("data", []):
            print(f"Product Name: {item.get('name')}")
            print(f"Product Price: {item.get('price')}")
            print("-" * 20)

    else:
        print(f"Request failed with status code: {response.status_code}")

except requests.exceptions.RequestException as e:
    print(f"An error occurred: {e}")
