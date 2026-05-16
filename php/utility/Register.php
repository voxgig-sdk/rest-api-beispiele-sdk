<?php
declare(strict_types=1);

// RestApiBeispiele SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

RestApiBeispieleUtility::setRegistrar(function (RestApiBeispieleUtility $u): void {
    $u->clean = [RestApiBeispieleClean::class, 'call'];
    $u->done = [RestApiBeispieleDone::class, 'call'];
    $u->make_error = [RestApiBeispieleMakeError::class, 'call'];
    $u->feature_add = [RestApiBeispieleFeatureAdd::class, 'call'];
    $u->feature_hook = [RestApiBeispieleFeatureHook::class, 'call'];
    $u->feature_init = [RestApiBeispieleFeatureInit::class, 'call'];
    $u->fetcher = [RestApiBeispieleFetcher::class, 'call'];
    $u->make_fetch_def = [RestApiBeispieleMakeFetchDef::class, 'call'];
    $u->make_context = [RestApiBeispieleMakeContext::class, 'call'];
    $u->make_options = [RestApiBeispieleMakeOptions::class, 'call'];
    $u->make_request = [RestApiBeispieleMakeRequest::class, 'call'];
    $u->make_response = [RestApiBeispieleMakeResponse::class, 'call'];
    $u->make_result = [RestApiBeispieleMakeResult::class, 'call'];
    $u->make_point = [RestApiBeispieleMakePoint::class, 'call'];
    $u->make_spec = [RestApiBeispieleMakeSpec::class, 'call'];
    $u->make_url = [RestApiBeispieleMakeUrl::class, 'call'];
    $u->param = [RestApiBeispieleParam::class, 'call'];
    $u->prepare_auth = [RestApiBeispielePrepareAuth::class, 'call'];
    $u->prepare_body = [RestApiBeispielePrepareBody::class, 'call'];
    $u->prepare_headers = [RestApiBeispielePrepareHeaders::class, 'call'];
    $u->prepare_method = [RestApiBeispielePrepareMethod::class, 'call'];
    $u->prepare_params = [RestApiBeispielePrepareParams::class, 'call'];
    $u->prepare_path = [RestApiBeispielePreparePath::class, 'call'];
    $u->prepare_query = [RestApiBeispielePrepareQuery::class, 'call'];
    $u->result_basic = [RestApiBeispieleResultBasic::class, 'call'];
    $u->result_body = [RestApiBeispieleResultBody::class, 'call'];
    $u->result_headers = [RestApiBeispieleResultHeaders::class, 'call'];
    $u->transform_request = [RestApiBeispieleTransformRequest::class, 'call'];
    $u->transform_response = [RestApiBeispieleTransformResponse::class, 'call'];
});
