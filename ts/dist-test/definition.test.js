"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const node_test_1 = require("node:test");
const __1 = require("..");
const definition_runner_1 = require("./definition-runner");
const utility_1 = require("./utility");
// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN = [
    {
        "entity": "delete",
        "accessor": "Delete",
        "op": "remove",
        "method": "DELETE",
        "path": "/shop/v2/products/{productId}",
        "args": [
            {
                "name": "product_id",
                "wire": "productId",
                "value": 22
            }
        ],
        "select": {},
        "headers": [],
        "query": [],
        "auth": null,
        "status": 200,
        "sample": {
            "success": "Deleted"
        },
        "idField": "id"
    },
    {
        "entity": "product",
        "accessor": "Product",
        "op": "create",
        "method": "POST",
        "path": "/shop/v2/products/",
        "args": [],
        "select": {},
        "headers": [],
        "query": [],
        "auth": null,
        "status": 201,
        "sample": {
            "id": 22,
            "name": "Wild-berries",
            "price": 4.99,
            "self_link": "/shop/v2/products/22"
        },
        "idField": "id"
    },
    {
        "entity": "product",
        "accessor": "Product",
        "op": "load",
        "method": "GET",
        "path": "/shop/v2/products/{productId}",
        "args": [
            {
                "name": "id",
                "wire": "productId",
                "value": 22
            }
        ],
        "select": {},
        "headers": [],
        "query": [],
        "auth": null,
        "status": 200,
        "sample": {
            "id": 22,
            "name": "Wild-berries",
            "price": 4.99,
            "self_link": "/shop/v2/products/22"
        },
        "idField": "id"
    },
    {
        "entity": "product",
        "accessor": "Product",
        "op": "update",
        "method": "PUT",
        "path": "/shop/v2/products/{productId}",
        "args": [
            {
                "name": "id",
                "wire": "productId",
                "value": 22
            }
        ],
        "select": {},
        "headers": [],
        "query": [],
        "auth": null,
        "status": 200,
        "sample": {
            "id": 22,
            "name": "Wild-berries",
            "price": 2.99,
            "self_link": "/shop/v2/products/22"
        },
        "idField": "id"
    }
];
(0, node_test_1.describe)('definition', () => {
    for (const point of PLAN) {
        (0, node_test_1.test)(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
            const control = (0, utility_1.isControlSkipped)('entityOp', point.entity + '.' + point.op, 'definition');
            if (control.skip) {
                t.skip(control.reason || 'skipped via sdk-test-control.json');
                return;
            }
            await (0, definition_runner_1.runDefinitionPoint)(__1.SDK, point);
        });
    }
});
//# sourceMappingURL=definition.test.js.map