/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import ddm from '@ohos.data.distributedKVStore';
import common from "@ohos.app.ability.common";

const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'storeId';

let kvManager = null;
let kvStore = null;
let context: common.UIAbilityContext;

function putBatchString(len, prefix) {
  let entries = [];
  for (let i = 0; i < len; i++) {
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
    let canGet = new Promise((resolve, reject) => {
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
    await canGet.then(async function(deviceId:string) {
      let query = new ddm.Query();
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
  }
}

export default function schemaStageTest(){
  describe('schemaStageTest', function() {
    let options = {
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
          context: context
        }
        console.info("beforeAll: createKVManager (single) with " + JSON.stringify(options));
        kvManager =  ddm.createKVManager(config);
      } catch (e) {
        console.info("fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
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
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaEtsApiTest_2100
     * @tc.name [JS-API8]Schema.ToJsonString()
     * @tc.desc Test Js Api Schema.ToJsonString() testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsToJsonString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaEtsApiTest_2200
     * @tc.name [JS-API8]Schema.ToJsonString()
     * @tc.desc Test Js Api Schema.ToJsonString() testcase 002
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsToJsonString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
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
        options.kvStoreType = ddm.KVStoreType.DEVICE_COLLABORATION;
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
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaEtsApiTest_2300
     * @tc.name [JS-API8]Schema.ToJsonString()
     * @tc.desc Test Js Api Schema.ToJsonString() testcase 003
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsToJsonString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let name = new ddm.FieldNode('name');
        name.type = ddm.ValueType.INTEGER;
        name.nullable = false;
        name.default = '0';

        let schema = new ddm.Schema();
        schema.root.appendChild(name);
        schema.indexes = ['$.name'];
        schema.mode = 1; // STRICT
        options.kvStoreType = ddm.KVStoreType.SINGLE_VERSION;
        options.schema = schema;
        await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
          console.info('testToJsonString003 getKVStore success' + JSON.stringify(options));
          kvStore = store;
          expect(store != null).assertTrue();
          await kvStore.put("test_key_1", '{"name":1}');
          await kvStore.put("test_key_2", '{"name":2}');
          await kvStore.put("test_key_3", '{"name":3}');
          console.info('testToJsonString003 Put success');
        });
        console.info('testToJsonString003 start Query ...');
        let query = new ddm.Query();
        query.prefixKey('test_key_');
        query.notEqualTo("$.name", 3);
        await kvStore.getEntries(query).then((entries) => {
          console.info('testToJsonString003 get success : ' + JSON.stringify(entries));
          expect(entries.length == 2).assertTrue();
        }).catch((err) => {
          console.info('testToJsonString003 get fail ' + err);
          expect(null).assertFail();
        });
      } catch (e) {
        console.info("testToJsonString003 fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaEtsApiTest_2000
     * @tc.name [JS-API8]Schema.ToJsonString()
     * @tc.desc Test Js Api Schema.ToJsonString() testcase 004
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
      it('testEtsToJsonString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
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
            console.info('testToJsonString004 getKVStore success' + JSON.stringify(options));
            kvStore = store;
            expect(store != null).assertTrue();
            await kvStore.put("test_key_1", '{"name":1.5}');
            await kvStore.put("test_key_2", '{"name":2.5}');
            await kvStore.put("test_key_3", '{}');
            console.info('testToJsonString004 Put success');
          });
          console.info('testToJsonString004 start Query ...');
          await kvStore.getEntries('test_key_').then((entries) => {
            console.info('testToJsonString004 get success : ' + JSON.stringify(entries));
            expect(entries.length == 3).assertTrue();
          }).catch((err) => {
            console.info('testToJsonString004 get fail ' + err);
            expect(null).assertFail();
          });
        } catch (e) {
          console.info("testToJsonString004 fail on exception: " + e);
          expect(null).assertFail();
        }
        done();
      })
    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaEtsApiTest_1800
     * @tc.name [JS-API8]Schema.root
     * @tc.desc Test Js Api Schema.root testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsroot001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaEtsApiTest_1500
     * @tc.name [JS-API8]Schema.indexes
     * @tc.desc Test Js Api Schema.indexes testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsindexes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaEtsApiTest_1700
     * @tc.name [JS-API8]Schema.mode
     * @tc.desc Test Js Api Schema.mode testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsmode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaEtsApiTest_1600
     * @tc.name [JS-API8]Schema.mode
     * @tc.desc Test Js Api Schema.mode testcase 002
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsmode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaEtsApiTest_1900
     * @tc.name [JS-API8]Schema.skip
     * @tc.desc Test Js Api Schema.skip testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsskip001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
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
