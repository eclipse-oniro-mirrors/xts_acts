/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import ddm from '@ohos.data.distributedKVStore';
import abilityFeatureAbility from '@ohos.ability.featureAbility'
import common from "@ohos.app.ability.common";

let context: common.UIAbilityContext;
const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore';
const TEST_STORE_ID = 'SchemaStoreId';

var kvManager = null;
var kvStore = null;

function putBatchString(len, prefix) {
  let entries = [];
  for (var i = 0; i < len; i++) {
    entries.push({
      key : prefix + i,
      value : {
        type : ddm.ValueType.STRING,
        value : '{"english":{"first":"leda' + i + '", "second":"yang"}}'
      }
    });
  }
  return entries;
}

async function testPutAndGet(kvManager, options) {
  try {
    await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
      console.info('testPutAndGet getKVStore success' + JSON.stringify(options));
      kvStore = store;
      expect(store != null).assertTrue();
    }).catch((err) => {
      console.info('testPutAndGet getKVStore fail ' + err);
      expect(null).assertFail();
    });
    var canGet = new Promise((resolve, reject) => {
      kvStore.on('dataChange', 0, function (data) {
        console.info('testPutAndGet resolve on data change: ' + JSON.stringify(data));
        resolve(data.deviceId);
      });
      let entries = putBatchString(10, 'test_key_');
      kvStore.putBatch(entries).then((data) => {
        console.info('testPutAndGet put success');
        expect(data == undefined).assertTrue();
      });
      setTimeout(() => {
        reject(new Error('not resolved in 2 second, reject it.'))
      }, 2000);
    });
    await canGet.then(async function(deviceId : string = '') {
      var query = new ddm.Query();
      query.prefixKey('test_key_');
      query.like('$.english.first', 'led%');
      if (options.kvStoreType == ddm.KVStoreType.DEVICE_COLLABORATION) {
        console.info('testPutAndGet deviceId = ' + deviceId);
        query.deviceId(deviceId);
      }
      await kvStore.getEntries(query).then((entries) => {
        console.info('testPutAndGet get success : ' + JSON.stringify(entries));
        expect(entries.length == 10).assertTrue();
      }).catch((err) => {
        console.info('testPutAndGet get fail ' + err);
        expect(null).assertFail();
      });
    }).catch((error) => {
      console.info('testPutAndGet canGet fail: ' + error);
      expect(null).assertFail();
    });
  } catch (e) {
    console.info('testPutAndGet get exception: ' + e);
    expect(null).assertFail();
  }
}
export default function schemaTest(){
  describe('schemaTest', function() {


    var options = {
      createIfMissing : true,
      encrypt : false,
      backup : false,
      autoSync : true,
      kvStoreType : ddm.KVStoreType.SINGLE_VERSION,
      schema : {},
      securityLevel : ddm.SecurityLevel.S1,
    }

    beforeAll(async function (done) {
      try {
        context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
        const config = {
          bundleName : TEST_BUNDLE_NAME,
          context: context,
        }
        console.info("beforeAll: createKVManager (single) with " + JSON.stringify(config));
        kvManager = ddm.createKVManager(config)
        done();
      } catch (e) {
        console.info("fail on exception: " + e);
        expect(null).assertFail();
      }

    })

    afterAll(async function (done) {
      console.info('afterAll');
      kvManager = null;
      kvStore = null;
      done();
    })

    beforeEach(async function (done) {
      console.info('beforeEach testcase will update options:' + JSON.stringify(options));
      done();
    })

    afterEach(async function (done) {
      console.info('afterEach');
      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(async () => {
        console.info('afterEach closeKVStore success');
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('afterEach deleteKVStore success');
        }).catch((err) => {
          console.info('afterEach deleteKVStore err ' + err);
        });
      }).catch((err) => {
        console.info('afterEach closeKVStore err ' + err);
      });
      kvStore = null;
      done();
    })

    /**
     * @tc.name SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0100
     * @tc.desc  Test Js Api Schema.ToJsonString() testcase 001
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0100
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let first = new ddm.FieldNode('first');
        first.type = ddm.ValueType.STRING;
        first.nullable = false;
        first.default = 'first name';

        let second = new ddm.FieldNode('second');
        second.type = ddm.ValueType.STRING;
        second.nullable = false;
        second.default = 'second name';

        let english = new ddm.FieldNode('english');
        english.type = ddm.ValueType.STRING;
        english.appendChild(first);
        english.appendChild(second);

        let schema = new ddm.Schema();
        schema.root.appendChild(english);
        schema.indexes = ['$.english.first', '$.english.second'];
      } catch (e) {
        console.info("schema fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0200
     * @tc.desc  Test Js Api Schema.ToJsonString() testcase 002
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0200
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let first = new ddm.FieldNode('first');
        first.type = ddm.ValueType.STRING;
        first.nullable = false;
        first.default = 'first name';

        let second = new ddm.FieldNode('second');
        second.type = ddm.ValueType.STRING;
        second.nullable = false;
        second.default = 'second name';

        let english = new ddm.FieldNode('english');
        english.type = ddm.ValueType.STRING;
        english.appendChild(first);
        english.appendChild(second);

        let schema = new ddm.Schema();
        schema.root.appendChild(english);
        schema.indexes = ['$.english.first', '$.english.second'];
        options.kvStoreType = ddm.KVStoreType.SINGLE_VERSION;
        options.schema = schema;
        await testPutAndGet(kvManager, options);
        console.info("schematestPutAndGet done");
      } catch (e) {
        console.info("schema fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300
     * @tc.desc  Test Js Api Schema.ToJsonString() testcase 003
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0300
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let name = new ddm.FieldNode('name');
        name.type = ddm.ValueType.INTEGER;
        name.nullable = false;
        name.default = '0';

        let schema = new ddm.Schema();
        schema.root.appendChild(name);
        schema.indexes = ['$.name'];
        schema.mode = 1;
        options.kvStoreType = ddm.KVStoreType.SINGLE_VERSION;
        options.schema = schema;
        await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 getKVStore success' + JSON.stringify(options));
          kvStore = store;
          expect(store != null).assertTrue();
          await kvStore.put("test_key_1", '{"name":1}');
          await kvStore.put("test_key_2", '{"name":2}');
          await kvStore.put("test_key_3", '{"name":3}');
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 Put success');
        });
        console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 start Query ...');
        var query = new ddm.Query();
        query.prefixKey('test_key_');
        query.notEqualTo("$.name", 3);
        await kvStore.getEntries(query).then((entries) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 get success : ' + JSON.stringify(entries));
          expect(entries.length == 2).assertTrue();
        }).catch((err) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 get fail ' + err);
          expect(null).assertFail();
        });
      } catch (e) {
        console.info("SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400
     * @tc.desc  Test Js Api Schema.ToJsonString() testcase 004
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0400
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */

    it('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let name = new ddm.FieldNode('name');
        name.type = ddm.ValueType.FLOAT;
        name.nullable = true;
        name.default = '3.14';

        let schema = new ddm.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = ddm.KVStoreType.SINGLE_VERSION;
        options.schema = schema;
        await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 getKVStore success' + JSON.stringify(options));
          kvStore = store;
          expect(store != null).assertTrue();
          await kvStore.put("test_key_1", '{"name":1.5}');
          await kvStore.put("test_key_2", '{"name":2.5}');
          await kvStore.put("test_key_3", '{}');
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 Put success');
        });
        console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 start Query ...');
        await kvStore.getEntries('test_key_').then((entries) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 get success : ' + JSON.stringify(entries));
          expect(entries.length == 3).assertTrue();
        }).catch((err) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 get fail ' + err);
          expect(null).assertFail();
        });
      } catch (e) {
        console.info("SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })



    /**
     * @tc.name SUB_DDM_DKV_SCHEMA_ROOT_0100
     * @tc.desc  Test Js Api Schema.root testcase 001
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0500
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SCHEMA_ROOT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let english = new ddm.FieldNode('english');
        english.type = ddm.ValueType.STRING;

        let schema = new ddm.Schema();
        expect(schema.root instanceof ddm.FieldNode).assertTrue();
      } catch (e) {
        console.info("schema fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name SUB_DDM_DKV_SCHEMA_INDEXES_0100
     * @tc.desc  Test Js Api Schema.indexes testcase 001
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0600
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SCHEMA_INDEXES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {

        let schema = new ddm.Schema();
        schema.indexes = ['$.english.first', '$.english.second'];
        expect(schema.indexes[0] === '$.english.first' && schema.indexes[1] === '$.english.second').assertTrue();
      } catch (e) {
        console.info("schema fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name SUB_DDM_DKV_SCHEMA_MODE_0100
     * @tc.desc  Test Js Api Schema.mode testcase 001
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0700
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SCHEMA_MODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {

        let schema = new ddm.Schema();
        schema.mode = 1;
        console.info("schema mode = "+schema.mode)
        expect(schema.mode === 1).assertTrue();
      } catch (e) {
        console.info("schema fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name SUB_DDM_DKV_SCHEMA_MODE_0200
     * @tc.desc  Test Js Api Schema.mode testcase 002
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0800
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SCHEMA_MODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {

        let schema = new ddm.Schema();
        schema.mode = 0;
        console.info("schema mode = "+schema.mode)
        expect(schema.mode === 0).assertTrue();
      } catch (e) {
        console.info("schema fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name SUB_DDM_DKV_SCHEMA_SKIP_0100
     * @tc.desc  Test Js Api Schema.skip testcase 001
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0900
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SCHEMA_SKIP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {

        let schema = new ddm.Schema();
        schema.skip = 0;
        expect(schema.skip === 0).assertTrue();
      } catch (e) {
        console.info("schema fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })
  })
}