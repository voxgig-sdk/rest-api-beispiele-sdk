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
  summary = "Unofficial generated Lua SDK for the REST API Beispiele public API. Not affiliated with or endorsed by the upstream API provider.",
  homepage = "https://github.com/voxgig-sdk/rest-api-beispiele-sdk",
  issues_url = "https://github.com/voxgig-sdk/rest-api-beispiele-sdk/issues",
  license = "MIT",
  labels = { "voxgig", "sdk", "generated-sdk", "openapi", "api-client", "rest-api-beispiele" }
}
dependencies = {
  "lua >= 5.3",
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
