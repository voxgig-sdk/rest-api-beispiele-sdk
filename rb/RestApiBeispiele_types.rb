# frozen_string_literal: true

# Typed models for the RestApiBeispiele SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Delete entity data model.
class Delete
end

# Request payload for Delete#remove.
#
# @!attribute [rw] product_id
#   @return [Integer]
DeleteRemoveMatch = Struct.new(
  :product_id,
  keyword_init: true
)

# Product entity data model.
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] price
#   @return [Float, nil]
#
# @!attribute [rw] self_link
#   @return [String, nil]
Product = Struct.new(
  :id,
  :name,
  :price,
  :self_link,
  keyword_init: true
)

# Request payload for Product#load.
#
# @!attribute [rw] id
#   @return [Integer]
ProductLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Match filter for Product#create (any subset of Product fields).
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] price
#   @return [Float, nil]
#
# @!attribute [rw] self_link
#   @return [String, nil]
ProductCreateData = Struct.new(
  :id,
  :name,
  :price,
  :self_link,
  keyword_init: true
)

# Request payload for Product#update.
#
# @!attribute [rw] id
#   @return [Integer]
ProductUpdateData = Struct.new(
  :id,
  keyword_init: true
)

