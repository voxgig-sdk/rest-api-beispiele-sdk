# RestApiBeispiele SDK feature factory

from restapibeispiele_sdk.feature.base_feature import RestApiBeispieleBaseFeature
from restapibeispiele_sdk.feature.ratelimit_feature import RestApiBeispieleRatelimitFeature
from restapibeispiele_sdk.feature.retry_feature import RestApiBeispieleRetryFeature
from restapibeispiele_sdk.feature.test_feature import RestApiBeispieleTestFeature
from restapibeispiele_sdk.feature.timeout_feature import RestApiBeispieleTimeoutFeature


_FEATURES = {
    "base": lambda: RestApiBeispieleBaseFeature(),
    "ratelimit": lambda: RestApiBeispieleRatelimitFeature(),
    "retry": lambda: RestApiBeispieleRetryFeature(),
    "test": lambda: RestApiBeispieleTestFeature(),
    "timeout": lambda: RestApiBeispieleTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
