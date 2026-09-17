
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


// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS: Record<string, any[]> = {
  
}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
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
              "rename": {
                "param": {
                  "productId": "product_id"
                }
              },
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
              "select": {
                "exist": [
                  "product_id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "parts": [
                "shop",
                "v2",
                "products",
                "{product_id}"
              ]
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
          "short": "Eindeutige ID des Produkts",
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
          "short": "Name des Produkts",
          "type": "`$STRING`"
        },
        {
          "format": "double",
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
          "short": "Preis des Produkts",
          "type": "`$NUMBER`"
        },
        {
          "name": "self_link",
          "short": "Selbstreferenz-Link zur Ressource",
          "type": "`$STRING`"
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
              "args": {},
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
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "parts": [
                "shop",
                "v2",
                "products"
              ]
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
              "rename": {
                "param": {
                  "productId": "id"
                }
              },
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
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "parts": [
                "shop",
                "v2",
                "products",
                "{id}"
              ]
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
              "rename": {
                "param": {
                  "productId": "id"
                }
              },
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
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "parts": [
                "shop",
                "v2",
                "products",
                "{id}"
              ]
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
              "rename": {
                "param": {
                  "productId": "id"
                }
              },
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
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "parts": [
                "shop",
                "v2",
                "products",
                "{id}"
              ]
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

