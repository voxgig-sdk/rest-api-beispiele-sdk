import { Context } from './Context';
declare class RestApiBeispieleError extends Error {
    isRestApiBeispieleError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { RestApiBeispieleError };
