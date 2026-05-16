<?php
declare(strict_types=1);

// RestApiBeispiele SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class RestApiBeispieleMakeContext
{
    public static function call(array $ctxmap, ?RestApiBeispieleContext $basectx): RestApiBeispieleContext
    {
        return new RestApiBeispieleContext($ctxmap, $basectx);
    }
}
