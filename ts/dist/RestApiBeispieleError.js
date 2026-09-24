"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.RestApiBeispieleError = void 0;
class RestApiBeispieleError extends Error {
    isRestApiBeispieleError = true;
    sdk = 'RestApiBeispiele';
    code;
    ctx;
    status = -1;
    // `err.notFound` rather than a magic number at every call site.
    get notFound() { return 404 === this.status; }
    constructor(code, msg, ctx) {
        super(msg);
        this.code = code;
        this.ctx = ctx;
    }
}
exports.RestApiBeispieleError = RestApiBeispieleError;
//# sourceMappingURL=RestApiBeispieleError.js.map