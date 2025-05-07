import json
from jsonschema import validate


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

    validate(instance=data, schema=schema)

    products = data.get("data", {}).get("products", [])

    if len(products) > 0:
        for item in products:
            name = item.get("title_fa")
            price = item.get("price", {}).get("selling_price")
            print(f"Product Name: {name}")
            print(f"Product Price: {price if price else 'Unknown'}")
            print("-" * 20)
    else:
        print("No products found.")
