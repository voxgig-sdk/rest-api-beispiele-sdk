package voxgigrestapibeispielesdk

import (
	"github.com/voxgig-sdk/rest-api-beispiele-sdk/go/core"
	"github.com/voxgig-sdk/rest-api-beispiele-sdk/go/entity"
	"github.com/voxgig-sdk/rest-api-beispiele-sdk/go/feature"
	_ "github.com/voxgig-sdk/rest-api-beispiele-sdk/go/utility"
)

// Type aliases preserve external API.
type RestApiBeispieleSDK = core.RestApiBeispieleSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type RestApiBeispieleEntity = core.RestApiBeispieleEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type RestApiBeispieleError = core.RestApiBeispieleError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewDeleteEntityFunc = func(client *core.RestApiBeispieleSDK, entopts map[string]any) core.RestApiBeispieleEntity {
		return entity.NewDeleteEntity(client, entopts)
	}
	core.NewProductEntityFunc = func(client *core.RestApiBeispieleSDK, entopts map[string]any) core.RestApiBeispieleEntity {
		return entity.NewProductEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewRestApiBeispieleSDK = core.NewRestApiBeispieleSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewRestApiBeispieleSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *RestApiBeispieleSDK  { return NewRestApiBeispieleSDK(nil) }
func Test() *RestApiBeispieleSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
