# Product entity test

require "minitest/autorun"
require "json"
require_relative "../RestApiBeispiele_sdk"
require_relative "runner"

class ProductEntityTest < Minitest::Test
  # main.kit.test.live.strict is true (the default is true): a live
  # request that fails, or a live test missing an input it needs,
  # fails the test.
  # An account with no record for a test to read skips it either way.
  LIVE_STRICT = true

  def test_create_instance
    testsdk = RestApiBeispieleSDK.test(nil, nil)
    ent = testsdk.Product(nil)
    assert !ent.nil?
  end

  def test_validate
    cfg = RestApiBeispieleConfig.shared_config
    unless cfg["feature"].is_a?(Hash) && cfg["feature"].key?("validate")
      skip("feature not present in this SDK: validate")
    end
    client = RestApiBeispieleSDK.test(nil, { "feature" => { "validate" => { "active" => true } } })
    err = assert_raises(StandardError) do
      client.Product(nil).load({ "id" => "x" }, nil)
    end
    assert_equal "validate_failed", err.code
  end

  def test_basic_flow
    setup = product_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create", "update", "load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "product." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    client = setup[:client]

    # CREATE
    product_ref01_ent = client.Product(nil)
    product_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.product"), "product_ref01"))

    product_ref01_data_result = product_ref01_ent.create(product_ref01_data, nil)
    product_ref01_data = Helpers.to_map(product_ref01_data_result.respond_to?(:data_get) ? product_ref01_data_result.data_get : product_ref01_data_result)
    assert !product_ref01_data.nil?
    assert !product_ref01_data["id"].nil?

    # UPDATE
    product_ref01_data_up0_up = {
      "id" => product_ref01_data["id"],
    }

    product_ref01_markdef_up0_name = "name"
    product_ref01_markdef_up0_value = "Mark01-product_ref01_#{setup[:now]}"
    product_ref01_data_up0_up[product_ref01_markdef_up0_name] = product_ref01_markdef_up0_value

    product_ref01_resdata_up0_result = product_ref01_ent.update(product_ref01_data_up0_up, nil)
    product_ref01_resdata_up0 = Helpers.to_map(product_ref01_resdata_up0_result.respond_to?(:data_get) ? product_ref01_resdata_up0_result.data_get : product_ref01_resdata_up0_result)
    assert !product_ref01_resdata_up0.nil?
    assert_equal product_ref01_resdata_up0["id"], product_ref01_data_up0_up["id"]
    assert_equal product_ref01_resdata_up0[product_ref01_markdef_up0_name], product_ref01_markdef_up0_value

    # LOAD
    product_ref01_match_dt0 = {
      "id" => product_ref01_data["id"],
    }
    product_ref01_data_dt0_loaded = product_ref01_ent.load(product_ref01_match_dt0, nil)
    product_ref01_data_dt0_load_result = Helpers.to_map(product_ref01_data_dt0_loaded.respond_to?(:data_get) ? product_ref01_data_dt0_loaded.data_get : product_ref01_data_dt0_loaded)
    assert !product_ref01_data_dt0_load_result.nil?
    assert_equal product_ref01_data_dt0_load_result["id"], product_ref01_data["id"]

  end
end

def product_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "product", "ProductTestData.json")
  entity_data_source = File.read(entity_data_file, encoding: "UTF-8")
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = RestApiBeispieleSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["product01", "product02", "product03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Whether *_ENTID supplied the idmap, read before env_override consumes
  # it: without it, the ids a live flow binds are the fixture's synthetic ones.
  entid_env_raw = ENV["REST_API_BEISPIELE_TEST_PRODUCT_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "REST_API_BEISPIELE_TEST_PRODUCT_ENTID" => idmap,
    "REST_API_BEISPIELE_TEST_LIVE" => "FALSE",
    "REST_API_BEISPIELE_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["REST_API_BEISPIELE_TEST_PRODUCT_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["REST_API_BEISPIELE_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      # FIRST, so the generated fields below win: sdk-test-control.json's
      # test.client.options adds to the live client, it does not redirect it.
      Runner.live_client_options,
      {
      },
      extra || {},
    ])
    client = RestApiBeispieleSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["REST_API_BEISPIELE_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["REST_API_BEISPIELE_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
