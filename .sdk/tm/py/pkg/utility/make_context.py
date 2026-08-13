# RestApiBeispiele SDK utility: make_context

from projectname_sdk.core.context import RestApiBeispieleContext


def make_context_util(ctxmap, basectx):
    return RestApiBeispieleContext(ctxmap, basectx)
