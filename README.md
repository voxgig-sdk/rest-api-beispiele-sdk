# RestApiBeispiele SDK

Practice REST verbs against a public Shop API designed for POST, PUT, PATCH, and DELETE experiments

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About REST API Beispiele

REST API Beispiele is a learning sandbox published by [predic8](https://api.predic8.de) under the path `/shop/v2/`. It exists so developers can try out REST operations against a real, publicly reachable service rather than mocking one locally.

The predic8 description invites users to "manipulate the resources using the POST, PUT and DELETE methods", and the catalogue listing on [freepublicapis.com](https://freepublicapis.com/rest-api-beispiele) highlights the same focus on POST, PUT, and PATCH calls. The example domain is a small product shop: create a product with a name and price, update it, then delete it.

What you get from the API:
- A writable product resource collection mounted at `/shop/v2/products/`
- Concrete examples of `POST` (insert), `PUT` (replace), `PATCH` (partial update), and `DELETE` (remove) against the same resource
- A stable target for tutorials, workshop exercises, and HTTP-client smoke tests

Operational notes: the service is reported as having no required authentication, and the freepublicapis catalogue notes that CORS is disabled, so browser-based clients may need a proxy. Because the data store is shared and writable, anything you create is visible to other learners and may be reset.

## Try it

**TypeScript**
```bash
npm install rest-api-beispiele
```

**Python**
```bash
pip install rest-api-beispiele-sdk
```

**PHP**
```bash
composer require voxgig/rest-api-beispiele-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/rest-api-beispiele-sdk/go
```

**Ruby**
```bash
gem install rest-api-beispiele-sdk
```

**Lua**
```bash
luarocks install rest-api-beispiele-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { RestApiBeispieleSDK } from 'rest-api-beispiele'

const client = new RestApiBeispieleSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o rest-api-beispiele-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "rest-api-beispiele": {
      "command": "/abs/path/to/rest-api-beispiele-mcp"
    }
  }
}
```

## Entities

The API exposes 2 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **Delete** | Grouping for delete-style operations demonstrated against shop resources, illustrating how `DELETE` removes an item from the collection. | `/shop/v2/products/{productId}` |
| **Product** | A shop product resource (name, price) exposed under `/shop/v2/products/` — the main target for POST/PUT/PATCH/DELETE practice. | `/shop/v2/products/` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from restapibeispiele_sdk import RestApiBeispieleSDK

client = RestApiBeispieleSDK({})

```

### PHP

```php
<?php
require_once 'restapibeispiele_sdk.php';

$client = new RestApiBeispieleSDK([]);

```

### Golang

```go
import sdk "github.com/voxgig-sdk/rest-api-beispiele-sdk/go"

client := sdk.NewRestApiBeispieleSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "RestApiBeispiele_sdk"

client = RestApiBeispieleSDK.new({})

```

### Lua

```lua
local sdk = require("rest-api-beispiele_sdk")

local client = sdk.new({})

```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = RestApiBeispieleSDK.test()
const result = await client.Delete().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = RestApiBeispieleSDK.test(None, None)
result, err = client.Delete(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = RestApiBeispieleSDK::test(null, null);
[$result, $err] = $client->Delete(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Delete(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = RestApiBeispieleSDK.test(nil, nil)
result, err = client.Delete(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Delete(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the REST API Beispiele

- Upstream: [https://api.predic8.de](https://api.predic8.de)

---

Generated from the REST API Beispiele OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
