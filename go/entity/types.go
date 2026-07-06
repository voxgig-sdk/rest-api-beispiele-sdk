// Typed models for the RestApiBeispiele SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// Delete is the typed data model for the delete entity.
type Delete struct {
}

// DeleteRemoveMatch is the typed request payload for Delete.RemoveTyped.
type DeleteRemoveMatch struct {
	ProductId int `json:"product_id"`
}

// Product is the typed data model for the product entity.
type Product struct {
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
	Price *float64 `json:"price,omitempty"`
	SelfLink *string `json:"self_link,omitempty"`
}

// ProductLoadMatch is the typed request payload for Product.LoadTyped.
type ProductLoadMatch struct {
	Id int `json:"id"`
}

// ProductCreateData is the typed request payload for Product.CreateTyped.
type ProductCreateData struct {
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
	Price *float64 `json:"price,omitempty"`
	SelfLink *string `json:"self_link,omitempty"`
}

// ProductUpdateData is the typed request payload for Product.UpdateTyped.
type ProductUpdateData struct {
	Id int `json:"id"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
