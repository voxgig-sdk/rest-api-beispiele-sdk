import { RestApiBeispieleEntityBase } from '../RestApiBeispieleEntityBase';
import type { RestApiBeispieleSDK } from '../RestApiBeispieleSDK';
import type { Control } from '../types';
import type { Product, ProductLoadMatch, ProductCreateData, ProductUpdateData } from '../RestApiBeispieleTypes';
declare class ProductEntity extends RestApiBeispieleEntityBase<Product> {
    constructor(client: RestApiBeispieleSDK, entopts: any);
    make(this: ProductEntity): ProductEntity;
    load(this: any, reqmatch?: ProductLoadMatch, ctrl?: Control): Promise<ProductEntity>;
    create(this: any, reqdata?: ProductCreateData, ctrl?: Control): Promise<ProductEntity>;
    update(this: any, reqdata?: ProductUpdateData, ctrl?: Control): Promise<ProductEntity>;
}
export { ProductEntity };
