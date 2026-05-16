# RestApiBeispiele SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

RestApiBeispieleUtility.registrar = ->(u) {
  u.clean = RestApiBeispieleUtilities::Clean
  u.done = RestApiBeispieleUtilities::Done
  u.make_error = RestApiBeispieleUtilities::MakeError
  u.feature_add = RestApiBeispieleUtilities::FeatureAdd
  u.feature_hook = RestApiBeispieleUtilities::FeatureHook
  u.feature_init = RestApiBeispieleUtilities::FeatureInit
  u.fetcher = RestApiBeispieleUtilities::Fetcher
  u.make_fetch_def = RestApiBeispieleUtilities::MakeFetchDef
  u.make_context = RestApiBeispieleUtilities::MakeContext
  u.make_options = RestApiBeispieleUtilities::MakeOptions
  u.make_request = RestApiBeispieleUtilities::MakeRequest
  u.make_response = RestApiBeispieleUtilities::MakeResponse
  u.make_result = RestApiBeispieleUtilities::MakeResult
  u.make_point = RestApiBeispieleUtilities::MakePoint
  u.make_spec = RestApiBeispieleUtilities::MakeSpec
  u.make_url = RestApiBeispieleUtilities::MakeUrl
  u.param = RestApiBeispieleUtilities::Param
  u.prepare_auth = RestApiBeispieleUtilities::PrepareAuth
  u.prepare_body = RestApiBeispieleUtilities::PrepareBody
  u.prepare_headers = RestApiBeispieleUtilities::PrepareHeaders
  u.prepare_method = RestApiBeispieleUtilities::PrepareMethod
  u.prepare_params = RestApiBeispieleUtilities::PrepareParams
  u.prepare_path = RestApiBeispieleUtilities::PreparePath
  u.prepare_query = RestApiBeispieleUtilities::PrepareQuery
  u.result_basic = RestApiBeispieleUtilities::ResultBasic
  u.result_body = RestApiBeispieleUtilities::ResultBody
  u.result_headers = RestApiBeispieleUtilities::ResultHeaders
  u.transform_request = RestApiBeispieleUtilities::TransformRequest
  u.transform_response = RestApiBeispieleUtilities::TransformResponse
}
