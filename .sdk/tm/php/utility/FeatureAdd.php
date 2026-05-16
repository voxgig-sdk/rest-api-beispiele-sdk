<?php
declare(strict_types=1);

// RestApiBeispiele SDK utility: feature_add

class RestApiBeispieleFeatureAdd
{
    public static function call(RestApiBeispieleContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
