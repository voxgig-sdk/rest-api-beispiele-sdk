

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { RestApiBeispieleSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('DeleteEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when REST_API_BEISPIELE_TEST_LIVE=TRUE.
  afterEach(liveDelay('REST_API_BEISPIELE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = RestApiBeispieleSDK.test()
    const ent = testsdk.Delete()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.REST_API_BEISPIELE_TEST_LIVE
    for (const op of []) {
      if (!live && maybeSkipControl(t, 'entityOp', 'delete.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[],"name":"delete","op":{"remove":{"input":"data","name":"remove","points":[{"active":true,"args":{"params":[{"active":true,"example":22,"kind":"param","name":"product_id","orig":"product_id","reqd":true,"type":"`$INTEGER`","index$":0}]},"contract":{"id":"DELETE /shop/v2/products/{productId}","json":"{\"operationId\":\"deleteProduct\",\"parameters\":[{\"description\":\"Die ID des Produkts\",\"in\":\"path\",\"name\":\"productId\",\"required\":true,\"schema\":{\"example\":22,\"type\":\"integer\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"example\":{\"success\":\"Deleted\"},\"schema\":{\"properties\":{\"success\":{\"description\":\"Bestätigung der erfolgreichen Löschung\",\"example\":\"Deleted\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"OK - Produkt wurde erfolgreich gelöscht\"},\"404\":{\"description\":\"Not Found - Produkt nicht gefunden\"},\"500\":{\"description\":\"Internal Server Error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"DELETE","orig":"/shop/v2/products/{productId}","rename":{"param":{"productId":"product_id"}},"segments":[{"lit":"shop"},{"lit":"v2"},{"lit":"products"},{"var":"product_id"}],"select":{"exist":["product_id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[["product"]]},"key$":"delete","name__orig":"delete","Name":"Delete","name_":"delete","name-":"delete","NAME":"DELETE","index$":0}, {"active":true,"entity":"delete","key$":"BasicDeleteFlow","kind":"basic","name":"BasicDeleteFlow","param":{},"step":[]}, 'Delete')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let delete_ref01_data = Object.values(setup.data.existing.delete)[0] as any

  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/delete/DeleteTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = RestApiBeispieleSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['delete01','delete02','delete03','product01','product02','product03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'REST_API_BEISPIELE_TEST_DELETE_ENTID': idmap,
    'REST_API_BEISPIELE_TEST_LIVE': 'FALSE',
    'REST_API_BEISPIELE_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['REST_API_BEISPIELE_TEST_DELETE_ENTID']

  const live = 'TRUE' === env.REST_API_BEISPIELE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['REST_API_BEISPIELE_TEST_DELETE_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new RestApiBeispieleSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.REST_API_BEISPIELE_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
