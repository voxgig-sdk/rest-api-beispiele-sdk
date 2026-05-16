-- ProjectName SDK configuration

local function make_config()
  return {
    main = {
      name = "RestApiBeispiele",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://api.predic8.de",
      auth = {
        prefix = "Bearer",
      },
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
            ["name"] = "remove",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = 22,
                      ["kind"] = "param",
                      ["name"] = "product_id",
                      ["orig"] = "product_id",
                      ["reqd"] = true,
                      ["type"] = "`$INTEGER`",
                      ["active"] = true,
                    },
                  },
                },
                ["method"] = "DELETE",
                ["orig"] = "/shop/v2/products/{productId}",
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
                ["select"] = {
                  ["exist"] = {
                    "product_id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "remove",
          },
        },
        ["relations"] = {
          ["ancestors"] = {
            {
              "product",
            },
          },
        },
      },
      ["product"] = {
        ["fields"] = {
          {
            ["name"] = "id",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "name",
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
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 1,
          },
          {
            ["name"] = "price",
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
            ["req"] = false,
            ["type"] = "`$NUMBER`",
            ["active"] = true,
            ["index$"] = 2,
          },
          {
            ["name"] = "self_link",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 3,
          },
        },
        ["name"] = "product",
        ["op"] = {
          ["create"] = {
            ["name"] = "create",
            ["points"] = {
              {
                ["method"] = "POST",
                ["orig"] = "/shop/v2/products/",
                ["parts"] = {
                  "shop",
                  "v2",
                  "products",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "create",
          },
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = 22,
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "product_id",
                      ["reqd"] = true,
                      ["type"] = "`$INTEGER`",
                      ["active"] = true,
                    },
                  },
                },
                ["method"] = "GET",
                ["orig"] = "/shop/v2/products/{productId}",
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
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "load",
          },
          ["patch"] = {
            ["name"] = "patch",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = 22,
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "product_id",
                      ["reqd"] = true,
                      ["type"] = "`$INTEGER`",
                      ["active"] = true,
                    },
                  },
                },
                ["method"] = "PATCH",
                ["orig"] = "/shop/v2/products/{productId}",
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
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "patch",
          },
          ["update"] = {
            ["name"] = "update",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = 22,
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "product_id",
                      ["reqd"] = true,
                      ["type"] = "`$INTEGER`",
                      ["active"] = true,
                    },
                  },
                },
                ["method"] = "PUT",
                ["orig"] = "/shop/v2/products/{productId}",
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
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "update",
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
