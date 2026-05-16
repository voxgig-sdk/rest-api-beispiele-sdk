# RestApiBeispiele SDK utility: feature_add
module RestApiBeispieleUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
