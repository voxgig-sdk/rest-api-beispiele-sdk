# RestApiBeispiele SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module RestApiBeispieleFeatures
  def self.make_feature(name)
    case name
    when "base"
      RestApiBeispieleBaseFeature.new
    when "test"
      RestApiBeispieleTestFeature.new
    else
      RestApiBeispieleBaseFeature.new
    end
  end
end
