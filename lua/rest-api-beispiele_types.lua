-- Typed models for the RestApiBeispiele SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Delete

---@class DeleteRemoveMatch
---@field product_id number

---@class Product
---@field id? number
---@field name? string
---@field price? number
---@field self_link? string

---@class ProductLoadMatch
---@field id number

---@class ProductCreateData

---@class ProductUpdateData
---@field id number

local M = {}

return M
