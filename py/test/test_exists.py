# ProjectName SDK exists test

import pytest
from restapibeispiele_sdk import RestApiBeispieleSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = RestApiBeispieleSDK.test(None, None)
        assert testsdk is not None
