import { DeleteEntity } from './entity/DeleteEntity';
import { ProductEntity } from './entity/ProductEntity';
export type * from './RestApiBeispieleTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { RestApiBeispieleEntityBase } from './RestApiBeispieleEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
type DirectResult = {
    ok: false;
    err: any;
    status?: undefined;
    headers?: undefined;
    data?: undefined;
} | {
    ok: boolean;
    status: number;
    headers: any;
    data: any;
    err?: any;
};
declare class RestApiBeispieleSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<DirectResult>;
    _rawRequest(fetchargs?: any): Promise<DirectResult>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Delete(entopts?: Record<string, any>): DeleteEntity;
    Product(entopts?: Record<string, any>): ProductEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): RestApiBeispieleSDK;
    tester(testopts?: any, sdkopts?: any): RestApiBeispieleSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof RestApiBeispieleSDK;
export { stdutil, config, BaseFeature, RestApiBeispieleEntityBase, RestApiBeispieleSDK, SDK, };
export type { DirectResult };
