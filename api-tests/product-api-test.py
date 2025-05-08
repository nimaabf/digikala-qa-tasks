import json
from jsonschema import validate, ValidationError


def test_mocked_response():
    with open("mock_response.json", "r", encoding="utf-8") as f:
        data = json.load(f)

    schema = {
        "type": "object",
        "properties": {
            "data": {
                "type": "object",
                "properties": {
                    "products": {
                        "type": "array",
                        "items": {
                            "type": "object",
                            "properties": {
                                "title_fa": {"type": "string"},
                                "price": {
                                    "type": "object",
                                    "properties": {
                                        "selling_price": {"type": "number"}
                                    },
                                    "required": ["selling_price"]
                                }
                            },
                            "required": ["title_fa", "price"]
                        }
                    }
                },
                "required": ["products"]
            }
        },
        "required": ["data"]
    }

    try:
        validate(instance=data, schema=schema)
    except ValidationError as e:
        assert False, f"Schema validation failed: {e.message}"

    products = data["data"]["products"]
    if not products:
        print("No products found.")
    else:
        for item in products:
            name = item["title_fa"]
            price = item["price"]["selling_price"]
            print(f"Product: {name}")
            print(f"Price: {price}")
            print("-" * 20)
