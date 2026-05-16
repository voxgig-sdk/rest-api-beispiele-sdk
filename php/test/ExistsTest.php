<?php
declare(strict_types=1);

// RestApiBeispiele SDK exists test

require_once __DIR__ . '/../restapibeispiele_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = RestApiBeispieleSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
