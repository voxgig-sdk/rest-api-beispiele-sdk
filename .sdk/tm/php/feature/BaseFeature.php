<?php
declare(strict_types=1);

// RestApiBeispiele SDK base feature

class RestApiBeispieleBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(RestApiBeispieleContext $ctx, array $options): void {}
    public function PostConstruct(RestApiBeispieleContext $ctx): void {}
    public function PostConstructEntity(RestApiBeispieleContext $ctx): void {}
    public function SetData(RestApiBeispieleContext $ctx): void {}
    public function GetData(RestApiBeispieleContext $ctx): void {}
    public function GetMatch(RestApiBeispieleContext $ctx): void {}
    public function SetMatch(RestApiBeispieleContext $ctx): void {}
    public function PrePoint(RestApiBeispieleContext $ctx): void {}
    public function PreSpec(RestApiBeispieleContext $ctx): void {}
    public function PreRequest(RestApiBeispieleContext $ctx): void {}
    public function PreResponse(RestApiBeispieleContext $ctx): void {}
    public function PreResult(RestApiBeispieleContext $ctx): void {}
    public function PreDone(RestApiBeispieleContext $ctx): void {}
    public function PreUnexpected(RestApiBeispieleContext $ctx): void {}
}
