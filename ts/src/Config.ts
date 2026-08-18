
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'RestApiBeispiele',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: "https://api.predic8.de",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      delete: {
      },

      product: {
      },

    }
  }


  entity = {
    "delete": {
      "fields": [],
      "name": "delete",
      "op": {
        "remove": {
          "input": "data",
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
                    "reqd": true,
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "DELETE",
              "orig": "/shop/v2/products/{productId}",
              "parts": [
                "shop",
                "v2",
                "products",
                "{product_id}"
              ],
              "rename": {
                "param": {
                  "productId": "product_id"
                }
              },
              "select": {
                "exist": [
                  "product_id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": [
          [
            "product"
          ]
        ]
      }
    },
    "product": {
      "fields": [
        {
          "name": "id",
          "type": "`$INTEGER`"
        },
        {
          "name": "name",
          "op": {
            "create": {
              "req": true,
              "type": "`$STRING`"
            },
            "update": {
              "req": true,
              "type": "`$STRING`"
            }
          },
          "type": "`$STRING`"
        },
        {
          "name": "price",
          "op": {
            "create": {
              "req": true,
              "type": "`$NUMBER`"
            },
            "update": {
              "req": true,
              "type": "`$NUMBER`"
            }
          },
          "type": "`$NUMBER`"
        },
        {
          "name": "self_link",
          "type": "`$STRING`"
        }
      ],
      "name": "product",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/shop/v2/products/",
              "parts": [
                "shop",
                "v2",
                "products"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
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
                    "reqd": true,
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/shop/v2/products/{productId}",
              "parts": [
                "shop",
                "v2",
                "products",
                "{id}"
              ],
              "rename": {
                "param": {
                  "productId": "id"
                }
              },
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "patch": {
          "input": "data",
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
                    "reqd": true,
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/shop/v2/products/{productId}",
              "parts": [
                "shop",
                "v2",
                "products",
                "{id}"
              ],
              "rename": {
                "param": {
                  "productId": "id"
                }
              },
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "update": {
          "input": "data",
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
                    "reqd": true,
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "PUT",
              "orig": "/shop/v2/products/{productId}",
              "parts": [
                "shop",
                "v2",
                "products",
                "{id}"
              ],
              "rename": {
                "param": {
                  "productId": "id"
                }
              },
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

