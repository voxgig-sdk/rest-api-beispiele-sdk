package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "RestApiBeispiele",
			"slug": "rest-api-beispiele",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://api.predic8.de",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"delete": map[string]any{},
				"product": map[string]any{},
			},
		},
		"entity": map[string]any{
			"delete": map[string]any{
				"fields": []any{},
				"name": "delete",
				"op": map[string]any{
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": 22,
											"kind": "param",
											"name": "product_id",
											"orig": "product_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "DELETE",
								"orig": "/shop/v2/products/{productId}",
								"parts": []any{
									"shop",
									"v2",
									"products",
									"{product_id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"productId": "product_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"product_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"product",
						},
					},
				},
			},
			"product": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"short": "Eindeutige ID des Produkts",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"req": true,
								"type": "`$STRING`",
							},
						},
						"short": "Name des Produkts",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "price",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$NUMBER`",
							},
							"update": map[string]any{
								"req": true,
								"type": "`$NUMBER`",
							},
						},
						"short": "Preis des Produkts",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "self_link",
						"short": "Selbstreferenz-Link zur Ressource",
						"type": "`$STRING`",
					},
				},
				"name": "product",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/shop/v2/products/",
								"parts": []any{
									"shop",
									"v2",
									"products",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": 22,
											"kind": "param",
											"name": "id",
											"orig": "product_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/shop/v2/products/{productId}",
								"parts": []any{
									"shop",
									"v2",
									"products",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"productId": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"patch": map[string]any{
						"input": "data",
						"name": "patch",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": 22,
											"kind": "param",
											"name": "id",
											"orig": "product_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/shop/v2/products/{productId}",
								"parts": []any{
									"shop",
									"v2",
									"products",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"productId": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"update": map[string]any{
						"input": "data",
						"name": "update",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": 22,
											"kind": "param",
											"name": "id",
											"orig": "product_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "PUT",
								"orig": "/shop/v2/products/{productId}",
								"parts": []any{
									"shop",
									"v2",
									"products",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"productId": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
