# RestApiBeispiele SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module RestApiBeispieleFeatures
  def self.make_feature(name)
    case name
    when "base"
      RestApiBeispieleBaseFeature.new
    when "ratelimit"
      RestApiBeispieleRatelimitFeature.new
    when "retry"
      RestApiBeispieleRetryFeature.new
    when "test"
      RestApiBeispieleTestFeature.new
    when "timeout"
      RestApiBeispieleTimeoutFeature.new
    else
      RestApiBeispieleBaseFeature.new
    end
  end
end
