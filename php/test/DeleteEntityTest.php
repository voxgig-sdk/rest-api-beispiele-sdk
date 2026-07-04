<?php
declare(strict_types=1);

// Delete entity test

require_once __DIR__ . '/../restapibeispiele_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class DeleteEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = RestApiBeispieleSDK::test(null, null);
        $ent = $testsdk->Delete(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = delete_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["remove"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "delete." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set RESTAPIBEISPIELE_TEST_DELETE_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // Bootstrap entity data from existing test data.
        $delete_ref01_data_raw = Vs::items(Helpers::to_map(
            Vs::getpath($setup["data"], "existing.delete")));
        $delete_ref01_data = null;
        if (count($delete_ref01_data_raw) > 0) {
            $delete_ref01_data = Helpers::to_map($delete_ref01_data_raw[0][1]);
        }

        // REMOVE
        $delete_ref01_ent = $client->Delete(null);
        $delete_ref01_match_rm0 = [
            "id" => $delete_ref01_data["id"],
        ];
        $delete_ref01_ent->remove($delete_ref01_match_rm0, null);

    }
}

function delete_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/delete/DeleteTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = RestApiBeispieleSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["delete01", "delete02", "delete03", "product01", "product02", "product03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("RESTAPIBEISPIELE_TEST_DELETE_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "RESTAPIBEISPIELE_TEST_DELETE_ENTID" => $idmap,
        "RESTAPIBEISPIELE_TEST_LIVE" => "FALSE",
        "RESTAPIBEISPIELE_TEST_EXPLAIN" => "FALSE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["RESTAPIBEISPIELE_TEST_DELETE_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["RESTAPIBEISPIELE_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
            ],
            $extra ?? [],
        ]);
        $client = new RestApiBeispieleSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["RESTAPIBEISPIELE_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["RESTAPIBEISPIELE_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
