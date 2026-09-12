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
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
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
                  "args" => {
                    "params" => [
                      {
                        "example" => 22,
                        "kind" => "param",
                        "name" => "product_id",
                        "orig" => "product_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/shop/v2/products/{productId}",
                  "rename" => {
                    "param" => {
                      "productId" => "product_id",
                    },
                  },
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
                  "select" => {
                    "exist" => [
                      "product_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "shop",
                    "v2",
                    "products",
                    "{product_id}",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "product",
              ],
            ],
          },
        },
        "product" => {
          "fields" => [
            {
              "name" => "id",
              "short" => "Eindeutige ID des Produkts",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "name",
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
              "type" => "`$STRING`",
            },
            {
              "format" => "double",
              "name" => "price",
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
              "type" => "`$NUMBER`",
            },
            {
              "name" => "self_link",
              "short" => "Selbstreferenz-Link zur Ressource",
              "type" => "`$STRING`",
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
                  "args" => {},
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
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "shop",
                    "v2",
                    "products",
                  ],
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => 22,
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "product_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/shop/v2/products/{productId}",
                  "rename" => {
                    "param" => {
                      "productId" => "id",
                    },
                  },
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
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "shop",
                    "v2",
                    "products",
                    "{id}",
                  ],
                },
              ],
            },
            "patch" => {
              "input" => "data",
              "name" => "patch",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => 22,
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "product_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/shop/v2/products/{productId}",
                  "rename" => {
                    "param" => {
                      "productId" => "id",
                    },
                  },
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
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "shop",
                    "v2",
                    "products",
                    "{id}",
                  ],
                },
              ],
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => 22,
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "product_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PUT",
                  "orig" => "/shop/v2/products/{productId}",
                  "rename" => {
                    "param" => {
                      "productId" => "id",
                    },
                  },
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
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "shop",
                    "v2",
                    "products",
                    "{id}",
                  ],
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
