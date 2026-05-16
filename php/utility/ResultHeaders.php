<?php
declare(strict_types=1);

// RestApiBeispiele SDK utility: result_headers

class RestApiBeispieleResultHeaders
{
    public static function call(RestApiBeispieleContext $ctx): ?RestApiBeispieleResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
