# RestApiBeispiele SDK configuration

module RestApiBeispieleConfig
  def self.make_config
    {
      "main" => {
        "name" => "RestApiBeispiele",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
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
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 22,
                        "kind" => "param",
                        "name" => "product_id",
                        "orig" => "product_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "DELETE",
                  "orig" => "/shop/v2/products/{productId}",
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
                  "select" => {
                    "exist" => [
                      "product_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "remove",
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
              "active" => true,
              "name" => "id",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 0,
            },
            {
              "active" => true,
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
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
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
              "req" => false,
              "type" => "`$NUMBER`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "self_link",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
          ],
          "name" => "product",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "method" => "POST",
                  "orig" => "/shop/v2/products/",
                  "parts" => [
                    "shop",
                    "v2",
                    "products",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 22,
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "product_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/shop/v2/products/{productId}",
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
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
            "patch" => {
              "input" => "data",
              "name" => "patch",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 22,
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "product_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "method" => "PATCH",
                  "orig" => "/shop/v2/products/{productId}",
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
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "patch",
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 22,
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "product_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "PUT",
                  "orig" => "/shop/v2/products/{productId}",
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
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "update",
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
