package = "voxgig-sdk-rest-api-beispiele"
version = "0.0.1-1"
source = {
  -- git+https (GitHub dropped git:// in 2022); pin the install to the release
  -- tag pushed by `make publish`, and point at the lua/ subdir of the monorepo.
  url = "git+https://github.com/voxgig-sdk/rest-api-beispiele-sdk.git",
  tag = "lua/v0.0.1",
  dir = "rest-api-beispiele-sdk/lua"
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
