package = "voxgig-sdk-rest-api-beispiele"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/rest-api-beispiele-sdk.git"
}
description = {
  summary = "RestApiBeispiele SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["rest-api-beispiele_sdk"] = "rest-api-beispiele_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
