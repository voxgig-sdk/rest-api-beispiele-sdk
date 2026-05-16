<?php
declare(strict_types=1);

// RestApiBeispiele SDK utility: prepare_body

class RestApiBeispielePrepareBody
{
    public static function call(RestApiBeispieleContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
