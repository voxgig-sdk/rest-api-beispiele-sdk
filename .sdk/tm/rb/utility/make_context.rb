# RestApiBeispiele SDK utility: make_context
require_relative '../core/context'
module RestApiBeispieleUtilities
  MakeContext = ->(ctxmap, basectx) {
    RestApiBeispieleContext.new(ctxmap, basectx)
  }
end
