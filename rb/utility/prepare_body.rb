# RestApiBeispiele SDK utility: prepare_body
require_relative 'media'
module RestApiBeispieleUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return RestApiBeispieleUtilities.raw_body(ctx.reqdata) if RestApiBeispieleUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
