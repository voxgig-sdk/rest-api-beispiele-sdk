<?php
declare(strict_types=1);

// Typed models for the RestApiBeispiele SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Delete entity data model. */
class Delete
{
}

/** Request payload for Delete#remove. */
class DeleteRemoveMatch
{
    public int $product_id;
}

/** Product entity data model. */
class Product
{
    public ?int $id = null;
    public ?string $name = null;
    public ?float $price = null;
    public ?string $self_link = null;
}

/** Request payload for Product#load. */
class ProductLoadMatch
{
    public int $id;
}

/** Request payload for Product#create. */
class ProductCreateData
{
    public ?int $id = null;
    public ?string $name = null;
    public ?float $price = null;
    public ?string $self_link = null;
}

/** Request payload for Product#update. */
class ProductUpdateData
{
    public int $id;
}

