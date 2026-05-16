<?php
declare(strict_types=1);

// RestApiBeispiele SDK utility: result_body

class RestApiBeispieleResultBody
{
    public static function call(RestApiBeispieleContext $ctx): ?RestApiBeispieleResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
