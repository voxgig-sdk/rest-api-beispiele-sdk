package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewDeleteEntityFunc func(client *RestApiBeispieleSDK, entopts map[string]any) RestApiBeispieleEntity

var NewProductEntityFunc func(client *RestApiBeispieleSDK, entopts map[string]any) RestApiBeispieleEntity

