
import { BaseFeature } from './feature/base/BaseFeature'
import { RatelimitFeature } from './feature/ratelimit/RatelimitFeature'
import { RetryFeature } from './feature/retry/RetryFeature'
import { TestFeature } from './feature/test/TestFeature'
import { TimeoutFeature } from './feature/timeout/TimeoutFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   ratelimit: RatelimitFeature,
 retry: RetryFeature,
 test: TestFeature,
 timeout: TimeoutFeature,

}


const FEATURE_PLUGINS: Record<string, any[]> = {
  
}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'RestApiBeispiele',
        slug: "rest-api-beispiele",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     ratelimit:     {
      "options": {
        "active": false,
        "burst": 5,
        "rate": 5
      },
      "optspec": {
        "now": "`$FUNCTION`",
        "sleep": "`$FUNCTION`"
      },
      "strict": false,
      "transport": "wrap"
    },
 retry:     {
      "options": {
        "active": false,
        "factor": 2,
        "maxDelay": 2000,
        "minDelay": 50,
        "retries": 2,
        "statuses": [
          408,
          425,
          429,
          500,
          502,
          503,
          504
        ]
      },
      "optspec": {
        "jitter": "`$BOOLEAN`",
        "sleep": "`$FUNCTION`"
      },
      "strict": false,
      "transport": "wrap"
    },
 test:     {
      "options": {
        "active": false
      },
      "optspec": {
        "entity": "`$MAP`",
        "net": "`$MAP`"
      },
      "strict": false,
      "transport": "base"
    },
 timeout:     {
      "options": {
        "active": false,
        "ms": 30000
      },
      "optspec": {
        "clearTimer": "`$FUNCTION`",
        "setTimer": "`$FUNCTION`"
      },
      "strict": false,
      "transport": "wrap"
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
              "kind": "http",
              "method": "DELETE",
              "orig": "/shop/v2/products/{productId}",
              "segments": [
                {
                  "lit": "shop"
                },
                {
                  "lit": "v2"
                },
                {
                  "lit": "products"
                },
                {
                  "var": "product_id"
                }
              ],
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
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "args": {
                "params": [
                  {
                    "name": "product_id",
                    "orig": "product_id",
                    "type": "`$INTEGER`",
                    "kind": "param",
                    "reqd": true,
                    "example": 22
                  }
                ]
              },
              "select": {
                "exist": [
                  "product_id"
                ]
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": [
          [
            "$.main.kit.entity.product"
          ]
        ]
      }
    },
    "product": {
      "fields": [
        {
          "name": "id",
          "title": "Id",
          "type": "`$INTEGER`",
          "short": "Eindeutige ID des Produkts"
        },
        {
          "name": "name",
          "title": "Name",
          "type": "`$STRING`",
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
          "short": "Name des Produkts"
        },
        {
          "name": "price",
          "title": "Price",
          "type": "`$NUMBER`",
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
          "short": "Preis des Produkts",
          "format": "double"
        },
        {
          "name": "self_link",
          "title": "Self Link",
          "type": "`$STRING`",
          "short": "Selbstreferenz-Link zur Ressource"
        }
      ],
      "id": {
        "field": "id",
        "name": "id"
      },
      "name": "product",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "kind": "http",
              "method": "POST",
              "orig": "/shop/v2/products/",
              "segments": [
                {
                  "lit": "shop"
                },
                {
                  "lit": "v2"
                },
                {
                  "lit": "products"
                }
              ],
              "parts": [
                "shop",
                "v2",
                "products"
              ],
              "rename": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "args": {},
              "select": {}
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "kind": "http",
              "method": "GET",
              "orig": "/shop/v2/products/{productId}",
              "segments": [
                {
                  "lit": "shop"
                },
                {
                  "lit": "v2"
                },
                {
                  "lit": "products"
                },
                {
                  "var": "id"
                }
              ],
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
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "args": {
                "params": [
                  {
                    "name": "id",
                    "orig": "product_id",
                    "type": "`$INTEGER`",
                    "kind": "param",
                    "reqd": true,
                    "example": 22
                  }
                ]
              },
              "select": {
                "exist": [
                  "id"
                ]
              }
            }
          ]
        },
        "patch": {
          "input": "data",
          "name": "patch",
          "points": [
            {
              "kind": "http",
              "method": "PATCH",
              "orig": "/shop/v2/products/{productId}",
              "segments": [
                {
                  "lit": "shop"
                },
                {
                  "lit": "v2"
                },
                {
                  "lit": "products"
                },
                {
                  "var": "id"
                }
              ],
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
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "args": {
                "params": [
                  {
                    "name": "id",
                    "orig": "product_id",
                    "type": "`$INTEGER`",
                    "kind": "param",
                    "reqd": true,
                    "example": 22
                  }
                ]
              },
              "select": {
                "exist": [
                  "id"
                ]
              }
            }
          ]
        },
        "update": {
          "input": "data",
          "name": "update",
          "points": [
            {
              "kind": "http",
              "method": "PUT",
              "orig": "/shop/v2/products/{productId}",
              "segments": [
                {
                  "lit": "shop"
                },
                {
                  "lit": "v2"
                },
                {
                  "lit": "products"
                },
                {
                  "var": "id"
                }
              ],
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
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "args": {
                "params": [
                  {
                    "name": "id",
                    "orig": "product_id",
                    "type": "`$INTEGER`",
                    "kind": "param",
                    "reqd": true,
                    "example": 22
                  }
                ]
              },
              "select": {
                "exist": [
                  "id"
                ]
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
  config,
  FEATURE_PLUGINS,
}

