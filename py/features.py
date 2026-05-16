# RestApiBeispiele SDK feature factory

from feature.base_feature import RestApiBeispieleBaseFeature
from feature.test_feature import RestApiBeispieleTestFeature


def _make_feature(name):
    features = {
        "base": lambda: RestApiBeispieleBaseFeature(),
        "test": lambda: RestApiBeispieleTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
