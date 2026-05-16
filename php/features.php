<?php
declare(strict_types=1);

// RestApiBeispiele SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class RestApiBeispieleFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new RestApiBeispieleBaseFeature();
            case "test":
                return new RestApiBeispieleTestFeature();
            default:
                return new RestApiBeispieleBaseFeature();
        }
    }
}
