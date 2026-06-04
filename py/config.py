# RestApiBeispiele SDK configuration


def make_config():
    return {
        "main": {
            "name": "RestApiBeispiele",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://api.predic8.de",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "delete": {},
                "product": {},
            },
        },
        "entity": {
      "delete": {
        "fields": [],
        "name": "delete",
        "op": {
          "remove": {
            "name": "remove",
            "points": [
              {
                "args": {
                  "params": [
                    {
                      "example": 22,
                      "kind": "param",
                      "name": "product_id",
                      "orig": "product_id",
                      "reqd": True,
                      "type": "`$INTEGER`",
                      "active": True,
                    },
                  ],
                },
                "method": "DELETE",
                "orig": "/shop/v2/products/{productId}",
                "parts": [
                  "shop",
                  "v2",
                  "products",
                  "{product_id}",
                ],
                "rename": {
                  "param": {
                    "productId": "product_id",
                  },
                },
                "select": {
                  "exist": [
                    "product_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "remove",
          },
        },
        "relations": {
          "ancestors": [
            [
              "product",
            ],
          ],
        },
      },
      "product": {
        "fields": [
          {
            "name": "id",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "name",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
              "update": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "price",
            "op": {
              "create": {
                "req": True,
                "type": "`$NUMBER`",
              },
              "update": {
                "req": True,
                "type": "`$NUMBER`",
              },
            },
            "req": False,
            "type": "`$NUMBER`",
            "active": True,
            "index$": 2,
          },
          {
            "name": "self_link",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 3,
          },
        ],
        "name": "product",
        "op": {
          "create": {
            "name": "create",
            "points": [
              {
                "method": "POST",
                "orig": "/shop/v2/products/",
                "parts": [
                  "shop",
                  "v2",
                  "products",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "create",
          },
          "load": {
            "name": "load",
            "points": [
              {
                "args": {
                  "params": [
                    {
                      "example": 22,
                      "kind": "param",
                      "name": "id",
                      "orig": "product_id",
                      "reqd": True,
                      "type": "`$INTEGER`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/shop/v2/products/{productId}",
                "parts": [
                  "shop",
                  "v2",
                  "products",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "productId": "id",
                  },
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "load",
          },
          "patch": {
            "name": "patch",
            "points": [
              {
                "args": {
                  "params": [
                    {
                      "example": 22,
                      "kind": "param",
                      "name": "id",
                      "orig": "product_id",
                      "reqd": True,
                      "type": "`$INTEGER`",
                      "active": True,
                    },
                  ],
                },
                "method": "PATCH",
                "orig": "/shop/v2/products/{productId}",
                "parts": [
                  "shop",
                  "v2",
                  "products",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "productId": "id",
                  },
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "patch",
          },
          "update": {
            "name": "update",
            "points": [
              {
                "args": {
                  "params": [
                    {
                      "example": 22,
                      "kind": "param",
                      "name": "id",
                      "orig": "product_id",
                      "reqd": True,
                      "type": "`$INTEGER`",
                      "active": True,
                    },
                  ],
                },
                "method": "PUT",
                "orig": "/shop/v2/products/{productId}",
                "parts": [
                  "shop",
                  "v2",
                  "products",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "productId": "id",
                  },
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "update",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
