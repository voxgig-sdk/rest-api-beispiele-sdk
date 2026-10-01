-- RestApiBeispiele SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "RestApiBeispiele",
      slug = "rest-api-beispiele",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["ratelimit"] = {
        ["options"] = {
          ["active"] = false,
          ["burst"] = 5,
          ["rate"] = 5,
        },
        ["optspec"] = {
          ["now"] = "`$FUNCTION`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["retry"] = {
        ["options"] = {
          ["active"] = false,
          ["factor"] = 2,
          ["maxDelay"] = 2000,
          ["minDelay"] = 50,
          ["retries"] = 2,
          ["statuses"] = {
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          },
        },
        ["optspec"] = {
          ["jitter"] = "`$BOOLEAN`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["optspec"] = {
          ["entity"] = "`$MAP`",
          ["net"] = "`$MAP`",
        },
        ["strict"] = false,
        ["transport"] = "base",
      },
      ["timeout"] = {
        ["options"] = {
          ["active"] = false,
          ["ms"] = 30000,
        },
        ["optspec"] = {
          ["clearTimer"] = "`$FUNCTION`",
          ["setTimer"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
    },
    options = {
      base = "https://api.predic8.de",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["delete"] = {},
        ["product"] = {},
      },
    },
    entity = {
      ["delete"] = {
        ["fields"] = {},
        ["name"] = "delete",
        ["op"] = {
          ["remove"] = {
            ["input"] = "data",
            ["name"] = "remove",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "DELETE",
                ["orig"] = "/shop/v2/products/{productId}",
                ["segments"] = {
                  {
                    ["lit"] = "shop",
                  },
                  {
                    ["lit"] = "v2",
                  },
                  {
                    ["lit"] = "products",
                  },
                  {
                    ["var"] = "product_id",
                  },
                },
                ["parts"] = {
                  "shop",
                  "v2",
                  "products",
                  "{product_id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["productId"] = "product_id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {
                  ["params"] = {
                    {
                      ["name"] = "product_id",
                      ["orig"] = "productId",
                      ["type"] = "`$INTEGER`",
                      ["kind"] = "param",
                      ["reqd"] = true,
                      ["example"] = 22,
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "product_id",
                  },
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {
            {
              "$.main.kit.entity.product",
            },
          },
        },
      },
      ["product"] = {
        ["fields"] = {
          {
            ["name"] = "id",
            ["title"] = "Id",
            ["type"] = "`$INTEGER`",
            ["short"] = "Eindeutige ID des Produkts",
          },
          {
            ["name"] = "name",
            ["title"] = "Name",
            ["type"] = "`$STRING`",
            ["op"] = {
              ["create"] = {
                ["req"] = true,
                ["type"] = "`$STRING`",
              },
              ["update"] = {
                ["req"] = true,
                ["type"] = "`$STRING`",
              },
            },
            ["short"] = "Name des Produkts",
          },
          {
            ["name"] = "price",
            ["title"] = "Price",
            ["type"] = "`$NUMBER`",
            ["op"] = {
              ["create"] = {
                ["req"] = true,
                ["type"] = "`$NUMBER`",
              },
              ["update"] = {
                ["req"] = true,
                ["type"] = "`$NUMBER`",
              },
            },
            ["short"] = "Preis des Produkts",
            ["format"] = "double",
          },
          {
            ["name"] = "self_link",
            ["title"] = "Self Link",
            ["type"] = "`$STRING`",
            ["short"] = "Selbstreferenz-Link zur Ressource",
          },
        },
        ["id"] = {
          ["field"] = "id",
          ["name"] = "id",
        },
        ["name"] = "product",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "POST",
                ["orig"] = "/shop/v2/products/",
                ["segments"] = {
                  {
                    ["lit"] = "shop",
                  },
                  {
                    ["lit"] = "v2",
                  },
                  {
                    ["lit"] = "products",
                  },
                },
                ["parts"] = {
                  "shop",
                  "v2",
                  "products",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {},
                ["select"] = {},
              },
            },
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/shop/v2/products/{productId}",
                ["segments"] = {
                  {
                    ["lit"] = "shop",
                  },
                  {
                    ["lit"] = "v2",
                  },
                  {
                    ["lit"] = "products",
                  },
                  {
                    ["var"] = "id",
                  },
                },
                ["parts"] = {
                  "shop",
                  "v2",
                  "products",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["productId"] = "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {
                  ["params"] = {
                    {
                      ["name"] = "id",
                      ["orig"] = "productId",
                      ["type"] = "`$INTEGER`",
                      ["kind"] = "param",
                      ["reqd"] = true,
                      ["example"] = 22,
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
              },
            },
          },
          ["patch"] = {
            ["input"] = "data",
            ["name"] = "patch",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "PATCH",
                ["orig"] = "/shop/v2/products/{productId}",
                ["segments"] = {
                  {
                    ["lit"] = "shop",
                  },
                  {
                    ["lit"] = "v2",
                  },
                  {
                    ["lit"] = "products",
                  },
                  {
                    ["var"] = "id",
                  },
                },
                ["parts"] = {
                  "shop",
                  "v2",
                  "products",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["productId"] = "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {
                  ["params"] = {
                    {
                      ["name"] = "id",
                      ["orig"] = "productId",
                      ["type"] = "`$INTEGER`",
                      ["kind"] = "param",
                      ["reqd"] = true,
                      ["example"] = 22,
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
              },
            },
          },
          ["update"] = {
            ["input"] = "data",
            ["name"] = "update",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "PUT",
                ["orig"] = "/shop/v2/products/{productId}",
                ["segments"] = {
                  {
                    ["lit"] = "shop",
                  },
                  {
                    ["lit"] = "v2",
                  },
                  {
                    ["lit"] = "products",
                  },
                  {
                    ["var"] = "id",
                  },
                },
                ["parts"] = {
                  "shop",
                  "v2",
                  "products",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["productId"] = "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {
                  ["params"] = {
                    {
                      ["name"] = "id",
                      ["orig"] = "productId",
                      ["type"] = "`$INTEGER`",
                      ["kind"] = "param",
                      ["reqd"] = true,
                      ["example"] = 22,
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
