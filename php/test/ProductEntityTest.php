<?php
declare(strict_types=1);

// Product entity test

require_once __DIR__ . '/../restapibeispiele_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class ProductEntityTest extends TestCase
{
    // main.kit.test.live.strict is true (the default is true): a live
    // request that fails, or a live test missing an input it needs,
    // fails the test.
    // An account with no record for a test to read skips it either way.
    private const LIVE_STRICT = true;

    public function test_create_instance(): void
    {
        $testsdk = RestApiBeispieleSDK::test(null, null);
        $ent = $testsdk->Product(null);
        $this->assertNotNull($ent);
    }

    public function test_validate(): void
    {
        $cfg = RestApiBeispieleConfig::shared_config();
        if (!isset($cfg["feature"]["validate"])) {
            $this->markTestSkipped('feature not present in this SDK: validate');
        }
        $client = RestApiBeispieleSDK::test(null, ["feature" => ["validate" => ["active" => true]]]);
        $err = null;
        try {
            $client->Product(null)->load(["id" => 'x'], null);
        } catch (\Throwable $e) {
            $err = $e;
        }
        $this->assertSame('validate_failed', $err->sdk_code ?? null);
    }

    public function test_basic_flow(): void
    {
        $setup = product_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create", "update", "load"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "product." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        $client = $setup["client"];

        // CREATE
        $product_ref01_ent = $client->Product(null);
        $product_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.product"), "product_ref01"));

        $product_ref01_data_result = $product_ref01_ent->create($product_ref01_data, null);
        $product_ref01_data = Helpers::to_map(is_object($product_ref01_data_result) && method_exists($product_ref01_data_result, 'data_get') ? $product_ref01_data_result->data_get() : $product_ref01_data_result);
        $this->assertNotNull($product_ref01_data);
        $this->assertNotNull($product_ref01_data["id"]);

        // UPDATE
        $product_ref01_data_up0_up = [
            "id" => $product_ref01_data["id"],
        ];

        $product_ref01_markdef_up0_name = "name";
        $product_ref01_markdef_up0_value = "Mark01-product_ref01_" . $setup["now"];
        $product_ref01_data_up0_up[$product_ref01_markdef_up0_name] = $product_ref01_markdef_up0_value;

        $product_ref01_resdata_up0_result = $product_ref01_ent->update($product_ref01_data_up0_up, null);
        $product_ref01_resdata_up0 = Helpers::to_map(is_object($product_ref01_resdata_up0_result) && method_exists($product_ref01_resdata_up0_result, 'data_get') ? $product_ref01_resdata_up0_result->data_get() : $product_ref01_resdata_up0_result);
        $this->assertNotNull($product_ref01_resdata_up0);
        $this->assertEquals($product_ref01_resdata_up0["id"], $product_ref01_data_up0_up["id"]);
        $this->assertEquals($product_ref01_resdata_up0[$product_ref01_markdef_up0_name], $product_ref01_markdef_up0_value);

        // LOAD
        $product_ref01_match_dt0 = [
            "id" => $product_ref01_data["id"],
        ];
        $product_ref01_data_dt0_loaded = $product_ref01_ent->load($product_ref01_match_dt0, null);
        $product_ref01_data_dt0_load_result = Helpers::to_map(is_object($product_ref01_data_dt0_loaded) && method_exists($product_ref01_data_dt0_loaded, 'data_get') ? $product_ref01_data_dt0_loaded->data_get() : $product_ref01_data_dt0_loaded);
        $this->assertNotNull($product_ref01_data_dt0_load_result);
        $this->assertEquals($product_ref01_data_dt0_load_result["id"], $product_ref01_data["id"]);

    }
}

function product_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/product/ProductTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = RestApiBeispieleSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["product01", "product02", "product03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Whether *_ENTID supplied the idmap, read before env_override consumes
    // it: without it, the ids a live flow binds are the fixture's synthetic ones.
    $entid_env_raw = getenv("REST_API_BEISPIELE_TEST_PRODUCT_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "REST_API_BEISPIELE_TEST_PRODUCT_ENTID" => $idmap,
        "REST_API_BEISPIELE_TEST_LIVE" => "FALSE",
        "REST_API_BEISPIELE_TEST_EXPLAIN" => "FALSE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["REST_API_BEISPIELE_TEST_PRODUCT_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["REST_API_BEISPIELE_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            Runner::live_client_options(),
            [
            ],
            // ismap, not a plain "?? []" default: an empty PHP array is a
            // LIST, and a non-map later entry REPLACES the accumulated map in
            // merge - so the no-extras call discarded live_client_options()
            // and the apikey/server map above it.
            Vs::ismap($extra) ? $extra : new \stdClass(),
        ]);
        // "?? []" because merge legitimately answers with a stdClass when every
        // contributing entry is an EMPTY map - an SDK with no apikey and no
        // server variables generates an empty middle entry, so that is the
        // common case, not the edge one. to_map returns null for a non-array by
        // design, and the constructor takes a non-nullable array, so without the
        // fallback every such SDK died on "must be of type array, null given"
        // the moment live mode was switched on. Offline mode never reaches this
        // branch, which is why the offline suite stayed green.
        $client = new RestApiBeispieleSDK(Helpers::to_map($merged_opts) ?? []);
    }

    $live = $env["REST_API_BEISPIELE_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["REST_API_BEISPIELE_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
