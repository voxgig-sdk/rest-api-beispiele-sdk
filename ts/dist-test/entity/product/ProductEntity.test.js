"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const node_path_1 = __importDefault(require("node:path"));
const Fs = __importStar(require("node:fs"));
const node_test_1 = require("node:test");
const node_assert_1 = __importDefault(require("node:assert"));
const live_runner_1 = require("../../live-runner");
const live_entity_1 = require("../../live-entity");
const __1 = require("../../..");
const utility_1 = require("../../utility");
(0, utility_1.loadEnvLocal)(__dirname + '/../../../.env.local');
(0, node_test_1.describe)('ProductEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when REST_API_BEISPIELE_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('REST_API_BEISPIELE_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.RestApiBeispieleSDK.test();
        const ent = testsdk.Product();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.REST_API_BEISPIELE_TEST_LIVE;
        for (const op of ['create', 'update', 'load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'product.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "id": { "a": true, "h": "Id", "n": "id", "r": false, "sh": "Eindeutige ID des Produkts", "t": "`$INTEGER`", "key$": "id", "index$": 0 }, "name": { "a": true, "h": "Name", "n": "name", "op": { "create": { "req": true, "type": "`$STRING`" }, "update": { "req": true, "type": "`$STRING`" } }, "r": false, "sh": "Name des Produkts", "t": "`$STRING`", "key$": "name", "index$": 1 }, "price": { "a": true, "fo": "double", "h": "Price", "n": "price", "op": { "create": { "req": true, "type": "`$NUMBER`" }, "update": { "req": true, "type": "`$NUMBER`" } }, "r": false, "sh": "Preis des Produkts", "t": "`$NUMBER`", "key$": "price", "index$": 2 }, "self_link": { "a": true, "h": "Self Link", "n": "self_link", "r": false, "sh": "Selbstreferenz-Link zur Ressource", "t": "`$STRING`", "key$": "self_link", "index$": 3 } }, "id": { "field": "id", "name": "id" }, "name": "product", "op": { "create": { "input": "data", "name": "create", "points": [{ "a": true, "co": { "id": "POST /shop/v2/products/", "source": "openapi3", "version": 2 }, "g": {}, "k": "http", "m": "POST", "o": "/shop/v2/products/", "q": {}, "r": {}, "s": [{ "lit": "shop" }, { "lit": "v2" }, { "lit": "products" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "create" }, "load": { "input": "data", "name": "load", "points": [{ "a": true, "co": { "id": "GET /shop/v2/products/{productId}", "source": "openapi3", "version": 2 }, "g": { "params": [{ "a": true, "ex": 22, "k": "param", "n": "id", "or": "productId", "r": true, "t": "`$INTEGER`", "index$": 0 }] }, "k": "http", "m": "GET", "o": "/shop/v2/products/{productId}", "q": { "exist": ["id"] }, "r": { "param": { "productId": "id" } }, "s": [{ "lit": "shop" }, { "lit": "v2" }, { "lit": "products" }, { "var": "id" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "load" }, "patch": { "input": "data", "name": "patch", "points": [{ "a": true, "co": { "id": "PATCH /shop/v2/products/{productId}", "source": "openapi3", "version": 2 }, "g": { "params": [{ "a": true, "ex": 22, "k": "param", "n": "id", "or": "productId", "r": true, "t": "`$INTEGER`", "index$": 0 }] }, "k": "http", "m": "PATCH", "o": "/shop/v2/products/{productId}", "q": { "exist": ["id"] }, "r": { "param": { "productId": "id" } }, "s": [{ "lit": "shop" }, { "lit": "v2" }, { "lit": "products" }, { "var": "id" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "patch" }, "update": { "input": "data", "name": "update", "points": [{ "a": true, "co": { "id": "PUT /shop/v2/products/{productId}", "source": "openapi3", "version": 2 }, "g": { "params": [{ "a": true, "ex": 22, "k": "param", "n": "id", "or": "productId", "r": true, "t": "`$INTEGER`", "index$": 0 }] }, "k": "http", "m": "PUT", "o": "/shop/v2/products/{productId}", "q": { "exist": ["id"] }, "r": { "param": { "productId": "id" } }, "s": [{ "lit": "shop" }, { "lit": "v2" }, { "lit": "products" }, { "var": "id" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "update" } }, "relations": { "ancestors": [] }, "key$": "product", "name__orig": "product", "Name": "Product", "name_": "product", "name-": "product", "NAME": "PRODUCT", "index$": 1 }, { "active": true, "entity": "product", "key$": "BasicProductFlow", "kind": "basic", "name": "BasicProductFlow", "param": {}, "step": [{ "a": true, "d": {}, "i": { "ref": "product_ref01" }, "m": {}, "o": "create", "s": [], "v": [], "index$": 0 }, { "a": true, "d": {}, "i": { "ref": "product_ref01", "srcdatavar": "product_ref01_data", "suffix": "_up0", "textfield": "name" }, "m": {}, "o": "update", "s": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-product_ref01" } }], "v": [], "index$": 1 }, { "a": true, "d": {}, "i": { "ref": "product_ref01", "srcdatavar": "product_ref01_data", "suffix": "_dt0" }, "m": { "id": "product01" }, "o": "load", "s": [], "v": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-product_ref01" } }], "index$": 2 }] }, 'Product', { "POST /shop/v2/products/": { "protocol": "http", "requestBody": { "required": true, "content": { "application/json": { "schema": { "type": "object", "required": ["name", "price"], "properties": { "name": { "type": "string", "description": "Name des Produkts", "example": "Wild-berries", "key$": "name" }, "price": { "type": "number", "format": "double", "description": "Preis des Produkts", "example": 4.99, "minimum": 0, "key$": "price" } }, "x-ref": "#/components/schemas/ProductInput", "index$": 1 }, "example": { "name": "Wild-berries", "price": 4.99 } } } }, "parameters": [] }, "GET /shop/v2/products/{productId}": { "protocol": "http", "parameters": [{ "name": "productId", "in": "path", "required": true, "description": "Die ID des Produkts", "schema": { "type": "integer", "example": 22 }, "index$": 0 }] }, "PATCH /shop/v2/products/{productId}": { "protocol": "http", "requestBody": { "required": true, "content": { "application/json": { "schema": { "type": "object", "properties": { "name": { "type": "string", "description": "Name des Produkts", "example": "Wild-berries", "key$": "name" }, "price": { "type": "number", "format": "double", "description": "Preis des Produkts", "example": 1.99, "minimum": 0, "key$": "price" } }, "description": "Objekt für partielle Aktualisierung. Nur die zu ändernden Felder müssen angegeben werden.", "x-ref": "#/components/schemas/ProductPatch", "index$": 1 }, "example": { "price": 1.99 } } } }, "parameters": [{ "name": "productId", "in": "path", "required": true, "description": "Die ID des Produkts", "schema": { "type": "integer", "example": 22 }, "index$": 0 }] }, "PUT /shop/v2/products/{productId}": { "protocol": "http", "requestBody": { "required": true, "content": { "application/json": { "schema": { "type": "object", "required": ["name", "price"], "properties": { "name": { "type": "string", "description": "Name des Produkts", "example": "Wild-berries", "key$": "name" }, "price": { "type": "number", "format": "double", "description": "Preis des Produkts", "example": 4.99, "minimum": 0, "key$": "price" } }, "x-ref": "#/components/schemas/ProductInput", "index$": 1 }, "example": { "name": "Wild-berries", "price": 2.99 } } } }, "parameters": [{ "name": "productId", "in": "path", "required": true, "description": "Die ID des Produkts", "schema": { "type": "integer", "example": 22 }, "index$": 0 }] } });
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const product_ref01_ent = client.Product();
        let product_ref01_data = setup.data.new.product['product_ref01'];
        product_ref01_data = (await product_ref01_ent.create(product_ref01_data)).data();
        (0, node_assert_1.default)(null != product_ref01_data.id);
        // UPDATE
        const product_ref01_data_up0 = {};
        product_ref01_data_up0.id = product_ref01_data.id;
        const product_ref01_markdef_up0 = { name: 'name', value: 'Mark01-product_ref01_' + setup.now };
        product_ref01_data_up0[product_ref01_markdef_up0.name] = product_ref01_markdef_up0.value;
        const product_ref01_resdata_up0 = (await product_ref01_ent.update(product_ref01_data_up0)).data();
        (0, node_assert_1.default)(product_ref01_resdata_up0.id === product_ref01_data_up0.id);
        (0, node_assert_1.default)(product_ref01_resdata_up0[product_ref01_markdef_up0.name] === product_ref01_markdef_up0.value);
        // LOAD
        const product_ref01_match_dt0 = {};
        product_ref01_match_dt0.id = product_ref01_data.id;
        const product_ref01_data_dt0 = (await product_ref01_ent.load(product_ref01_match_dt0)).data();
        (0, node_assert_1.default)(product_ref01_data_dt0.id === product_ref01_data.id);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/product/ProductTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.RestApiBeispieleSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['product01', 'product02', 'product03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'REST_API_BEISPIELE_TEST_PRODUCT_ENTID': idmap,
        'REST_API_BEISPIELE_TEST_LIVE': 'FALSE',
        'REST_API_BEISPIELE_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['REST_API_BEISPIELE_TEST_PRODUCT_ENTID'];
    const live = 'TRUE' === env.REST_API_BEISPIELE_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['REST_API_BEISPIELE_TEST_PRODUCT_ENTID'];
        idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {};
        if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
            throw new Error('Live ENTID must be a JSON object');
        }
        client = new __1.RestApiBeispieleSDK(merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            (0, utility_1.liveClientOptions)(),
            {},
            // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
            // last entry is undefined, and basicSetup is normally called with no
            // argument at all - so a bare 'extra' silently discarded the apikey
            // and server values above and handed the SDK undefined. Harmless
            // while there was nothing in that object; not harmless now.
            extra || {},
            { system: { fetch: transport.fetch } }
        ]));
    }
    const setup = {
        idmap,
        env,
        options,
        client,
        struct,
        data: entityData,
        explain: 'TRUE' === env.REST_API_BEISPIELE_TEST_EXPLAIN,
        live,
        transport,
        now: Date.now(),
    };
    return setup;
}
//# sourceMappingURL=ProductEntity.test.js.map