package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewRatelimitFeatureFunc func() Feature

var NewRetryFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewTimeoutFeatureFunc func() Feature

var NewDeleteEntityFunc func(client *RestApiBeispieleSDK, entopts map[string]any) RestApiBeispieleEntity

var NewProductEntityFunc func(client *RestApiBeispieleSDK, entopts map[string]any) RestApiBeispieleEntity

