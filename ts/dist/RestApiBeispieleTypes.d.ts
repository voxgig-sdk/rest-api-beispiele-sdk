export interface Delete {
}
export interface DeleteRemoveMatch {
    product_id: number;
}
export interface Product {
    id?: number;
    name?: string;
    price?: number;
    self_link?: string;
}
export interface ProductLoadMatch {
    id: number;
}
export interface ProductCreateData {
    name: string;
    price: number;
}
export interface ProductUpdateData {
    id: number;
    name?: string;
    price?: number;
}
export interface ProductPatchData {
    id: number;
    name?: string;
    price?: number;
}
