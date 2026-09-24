# RestApiBeispiele SDK configuration

module RestApiBeispieleConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "RestApiBeispiele",
        "slug" => "rest-api-beispiele",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://api.predic8.de",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "delete" => {},
          "product" => {},
        },
      },
      "entity" => {
        "delete" => {
          "fields" => [],
          "name" => "delete",
          "op" => {
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/shop/v2/products/{productId}",
                  "segments" => [
                    {
                      "lit" => "shop",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "products",
                    },
                    {
                      "var" => "product_id",
                    },
                  ],
                  "parts" => [
                    "shop",
                    "v2",
                    "products",
                    "{product_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "productId" => "product_id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "product_id",
                        "orig" => "product_id",
                        "type" => "`$INTEGER`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => 22,
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "product_id",
                    ],
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "$.main.kit.entity.product",
              ],
            ],
          },
        },
        "product" => {
          "fields" => [
            {
              "name" => "id",
              "title" => "Id",
              "type" => "`$INTEGER`",
              "short" => "Eindeutige ID des Produkts",
            },
            {
              "name" => "name",
              "title" => "Name",
              "type" => "`$STRING`",
              "op" => {
                "create" => {
                  "req" => true,
                  "type" => "`$STRING`",
                },
                "update" => {
                  "req" => true,
                  "type" => "`$STRING`",
                },
              },
              "short" => "Name des Produkts",
            },
            {
              "name" => "price",
              "title" => "Price",
              "type" => "`$NUMBER`",
              "op" => {
                "create" => {
                  "req" => true,
                  "type" => "`$NUMBER`",
                },
                "update" => {
                  "req" => true,
                  "type" => "`$NUMBER`",
                },
              },
              "short" => "Preis des Produkts",
              "format" => "double",
            },
            {
              "name" => "self_link",
              "title" => "Self Link",
              "type" => "`$STRING`",
              "short" => "Selbstreferenz-Link zur Ressource",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "product",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/shop/v2/products/",
                  "segments" => [
                    {
                      "lit" => "shop",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "products",
                    },
                  ],
                  "parts" => [
                    "shop",
                    "v2",
                    "products",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {},
                  "select" => {},
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/shop/v2/products/{productId}",
                  "segments" => [
                    {
                      "lit" => "shop",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "products",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "parts" => [
                    "shop",
                    "v2",
                    "products",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "productId" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "id",
                        "orig" => "product_id",
                        "type" => "`$INTEGER`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => 22,
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                },
              ],
            },
            "patch" => {
              "input" => "data",
              "name" => "patch",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/shop/v2/products/{productId}",
                  "segments" => [
                    {
                      "lit" => "shop",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "products",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "parts" => [
                    "shop",
                    "v2",
                    "products",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "productId" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "id",
                        "orig" => "product_id",
                        "type" => "`$INTEGER`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => 22,
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                },
              ],
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "PUT",
                  "orig" => "/shop/v2/products/{productId}",
                  "segments" => [
                    {
                      "lit" => "shop",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "products",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "parts" => [
                    "shop",
                    "v2",
                    "products",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "productId" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "id",
                        "orig" => "product_id",
                        "type" => "`$INTEGER`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => 22,
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    RestApiBeispieleFeatures.make_feature(name)
  end
end
