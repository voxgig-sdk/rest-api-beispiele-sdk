
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { RestApiBeispieleSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = RestApiBeispieleSDK.test()
    equal(testsdk instanceof RestApiBeispieleSDK, true,
      'RestApiBeispieleSDK.test() must return a client synchronously')
  })

})
