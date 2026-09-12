import { RestApiBeispieleEntityBase } from '../RestApiBeispieleEntityBase';
import type { RestApiBeispieleSDK } from '../RestApiBeispieleSDK';
import type { Control } from '../types';
import type { Delete, DeleteRemoveMatch } from '../RestApiBeispieleTypes';
declare class DeleteEntity extends RestApiBeispieleEntityBase<Delete> {
    constructor(client: RestApiBeispieleSDK, entopts: any);
    make(this: DeleteEntity): DeleteEntity;
    remove(this: any, reqmatch?: DeleteRemoveMatch, ctrl?: Control): Promise<DeleteEntity>;
}
export { DeleteEntity };
