package core

func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "RestApiBeispiele",
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
											"active": true,
										},
									},
								},
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
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "remove",
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
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 0,
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
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 1,
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
						"req": false,
						"type": "`$NUMBER`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "self_link",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 3,
					},
				},
				"name": "product",
				"op": map[string]any{
					"create": map[string]any{
						"name": "create",
						"points": []any{
							map[string]any{
								"method": "POST",
								"orig": "/shop/v2/products/",
								"parts": []any{
									"shop",
									"v2",
									"products",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "create",
					},
					"load": map[string]any{
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
											"active": true,
										},
									},
								},
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
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "load",
					},
					"patch": map[string]any{
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
											"active": true,
										},
									},
								},
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
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "patch",
					},
					"update": map[string]any{
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
											"active": true,
										},
									},
								},
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
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "update",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
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
