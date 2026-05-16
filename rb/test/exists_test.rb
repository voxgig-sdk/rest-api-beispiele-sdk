# RestApiBeispiele SDK exists test

require "minitest/autorun"
require_relative "../RestApiBeispiele_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = RestApiBeispieleSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
