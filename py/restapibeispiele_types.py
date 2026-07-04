# Typed models for the RestApiBeispiele SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Delete:
    pass


@dataclass
class DeleteRemoveMatch:
    product_id: int


@dataclass
class Product:
    id: Optional[int] = None
    name: Optional[str] = None
    price: Optional[float] = None
    self_link: Optional[str] = None


@dataclass
class ProductLoadMatch:
    id: int


@dataclass
class ProductCreateData:
    id: Optional[int] = None
    name: Optional[str] = None
    price: Optional[float] = None
    self_link: Optional[str] = None


@dataclass
class ProductUpdateData:
    id: int

