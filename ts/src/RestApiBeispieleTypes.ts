// Typed models for the RestApiBeispiele SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Delete {
}

export interface DeleteRemoveMatch {
  product_id: number
}

export interface Product {
  id?: number
  name?: string
  price?: number
  self_link?: string
}

export interface ProductLoadMatch {
  id: number
}

export type ProductCreateData = Partial<Product>

export interface ProductUpdateData {
  id: number
}

