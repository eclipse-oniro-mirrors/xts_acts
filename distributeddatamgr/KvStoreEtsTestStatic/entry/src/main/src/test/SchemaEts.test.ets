/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium";
import ddm from '@ohos.data.distributedKVStore';
import common from "@ohos.app.ability.common";

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
const TEST_STORE_ID = 'SchemaStoreId';
const domain = 0xFF00;
const tag = "TestTag";
let kvManager: ddm.KVManager | null = null;
let kvStore: ddm.SingleKVStore | null = null;
let context: common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function putBatchString(len: number, prefix: string) {
  let entries: ddm.Entry[] = [];
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

async function testPutAndGet(kvManager: ddm.KVManager | null, options: ddm.Options): Promise<void> {
  try {

    await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: ddm.SingleKVStore) => {

      console.info('testPutAndGet getKVStore success' + JSON.stringify(options));
      kvStore = store;
      expect(store != null).assertTrue();
    }).catch((err: Error) => {
      console.info('testPutAndGet getKVStore fail ' + err);
      expect(null).assertFail();
    });

    let canGet = new Promise<string>((resolve, reject) => {
      if (!kvStore) {
        console.error('kvStore is not initialized');
        expect(null).assertFail();
      }

      kvStore!.onDataChange(ddm.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
        console.info('testPutAndGet resolve on data change: ' + JSON.stringify(data));
        resolve(data.deviceId);
      });
      let entries = putBatchString(10, 'test_key_');

      kvStore!.putBatch(entries).then((data) => {
        console.info('testPutAndGet put success');
        expect(data == undefined).assertTrue();
      });
      setTimeout(() => {
        reject(new Error('not resolved in 2 second, reject it.'))
      }, 2000);
    });

    await canGet.then(async (deviceId : string) => {
      let query = new ddm.Query();
      query.prefixKey('test_key_');
      query.like('$.english.first', 'led%');
      if (options.kvStoreType == ddm.KVStoreType.DEVICE_COLLABORATION) {
        console.info('testPutAndGet deviceId = ' + deviceId);
        query.deviceId(deviceId);
      }
      if (!kvStore) {
        console.error('kvStore is not initialized');
        expect(null).assertFail();
      }

      await kvStore!.getEntries(query).then((entries: ddm.Entry[]) => {
        console.info('testPutAndGet get success : ' + JSON.stringify(entries));
        console.info('testPutAndGet get success : ' + JSON.stringify(entries?.length));
        expect(entries.length == 10).assertTrue();
      }).catch((err: Error) => {
        console.info('testPutAndGet get fail ' + err);
        expect(null).assertFail();
      });
    }).catch((error: Error) => {
      console.info('testPutAndGet canGet fail: ' + error);
      expect(null).assertFail();
    });
  } catch (e) {
    console.info('testPutAndGet get exception: ' + e);
    expect(null).assertFail();
  }
}
export default function schemaTest(){
  describe('schemaTest', () => {


    let options: ddm.Options = {
      createIfMissing : true,
      encrypt : false,
      backup : false,
      autoSync : true,
      kvStoreType : ddm.KVStoreType.SINGLE_VERSION,
      schema : {},
      securityLevel : ddm.SecurityLevel.S1,
    }

    beforeAll(async (done: () => void) => {
      try {
        try {
          hilog.info(domain, tag, '%{public}s', '================ beforeAll start==========');
          await Utils.msSleep(2000)
          // abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")
          await abilityDelegator.startAbility({
            bundleName: 'com.example.kvstoreetstest.static',
            abilityName: 'EntryAbility'
          });
          await Utils.msSleep(8000)
          context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
        } catch (e) {
          hilog.info(domain, tag, '%{public}s', "============beforeAll context e: " + e);
          hilog.info(domain, tag, '%{public}s', '================ beforeAll context end==========');
        }

        const config: ddm.KVManagerConfig = {
          bundleName : TEST_BUNDLE_NAME,
          context: context!,
        }
        console.info(`beforeAll: createKVManager (single) with ${config}`);
        kvManager = ddm.createKVManager(config)
        done();
      } catch (e) {
        console.info("fail on exception: " + e);
        expect(null).assertFail();
        done();
      }

    })

    afterAll(async (done: () => void) => {
      console.info('afterAll');
      kvManager = null;
      kvStore = null;
      done();
    })

    beforeEach(async (done: () => void) => {
      console.info('beforeEach testcase will update options:' + JSON.stringify(options));
      done();
    })

    afterEach(async (done: () => void) => {
      console.info('afterEach');
      if (!kvManager) {
        console.error('kvManager is not initialized');
        expect(null).assertFail();
        done();
      }

      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
        console.info('afterEach closeKVStore success');
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('afterEach deleteKVStore success');
          kvStore = null;
          done();
        }).catch((err: Error) => {

          console.error('beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
      }).catch((err: Error) => {
        console.error('beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });

    })

    /**
     * @tc.name   SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0100
     * @tc.desc   Test Js Api Schema.ToJsonString() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        let first = new ddm.FieldNode('first');
        first.type = ddm.ValueType.STRING;
        first.nullable = false;
        first.defaultValue = 'first name';

        let second = new ddm.FieldNode('second');
        second.type = ddm.ValueType.STRING;
        second.nullable = false;
        second.defaultValue = 'second name';

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
     * @tc.name   SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0200
     * @tc.desc   Test Js Api Schema.ToJsonString() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        let first = new ddm.FieldNode('first');
        first.type = ddm.ValueType.STRING;
        first.nullable = false;
        first.defaultValue = 'first name';

        let second = new ddm.FieldNode('second');
        second.type = ddm.ValueType.STRING;
        second.nullable = false;
        second.defaultValue = 'second name';

        let english = new ddm.FieldNode('english');
        english.type = ddm.ValueType.STRING;
        english.appendChild(first);
        english.appendChild(second);

        let schema = new ddm.Schema();
        schema.root.appendChild(english);
        schema.indexes = ['$.english.first', '$.english.second'];
        options.kvStoreType = ddm.KVStoreType.SINGLE_VERSION;
        options.schema = schema;
        if (!kvManager) {
          console.error('kvManager is not initialized');
          expect(null).assertFail();
        }
        await testPutAndGet(kvManager, options);
        console.info("schematestPutAndGet done");
      } catch (e) {
        console.info("schema fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0300
     * @tc.desc   Test Js Api Schema.ToJsonString() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        let name = new ddm.FieldNode('name');
        name.type = ddm.ValueType.LONG;
        name.nullable = false;
        name.defaultValue = '0';

        let schema = new ddm.Schema();
        schema.root.appendChild(name);
        schema.indexes = ['$.name'];
        schema.mode = 1;
        options.kvStoreType = ddm.KVStoreType.SINGLE_VERSION;
        options.schema = schema;
        if (!kvManager) {
          console.error('kvManager is not initialized');

        }

        await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: ddm.SingleKVStore) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 getKVStore success' + JSON.stringify(options));
          kvStore = store;
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":1}');
          await kvStore!.put("test_key_2", '{"name":2}');
          await kvStore!.put("test_key_3", '{"name":3}');
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 Put success');
        });
        console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 start Query ...');
        let query = new ddm.Query();
        query.prefixKey('test_key_');
        query.notEqualTo("$.name", 3 as long);

        await kvStore!.getEntries(query).then((entries: ddm.Entry[]) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 get success : ' + JSON.stringify(entries));
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 get success : ' + JSON.stringify(entries?.length));
          expect(entries.length == 2).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 get fail ' + err);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.info("SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0300 fail on exception: " + e);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400
     * @tc.number SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400
     * @tc.desc   SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) : Promise<void> => {
      try {
        let name = new ddm.FieldNode('name');

        name.type = ddm.ValueType.DOUBLE;
        name.nullable = true;
        name.defaultValue = '3.14';

        let schema = new ddm.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = ddm.KVStoreType.SINGLE_VERSION;
        options.schema = schema;
        if (!kvManager) {
          console.error('kvManager is not initialized');
          expect(null).assertFail();
        }

        await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: ddm.SingleKVStore) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 getKVStore success' + JSON.stringify(options));
          kvStore = store;
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":1.5}');
          await kvStore!.put("test_key_2", '{"name":2.5}');
          await kvStore!.put("test_key_3", '{}');
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 Put success');
        });
        console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 start Query ...');

        await kvStore!.getEntries('test_key_').then((entries: ddm.Entry[]) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 get success : ' + JSON.stringify(entries));
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 get success : ' + JSON.stringify(entries?.length));
          expect(entries.length == 3).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info('SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 get fail ' + err);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.info("SUB_DDM_DKV_SCHEMA_TOJSONSTRING_0400 fail on exception: " + e);
        expect(null).assertFail();
        done();
      }

    })



    /**
     * @tc.name   SUB_DDM_DKV_SCHEMA_ROOT_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0500
     * @tc.desc   Test Js Api Schema.root testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SCHEMA_ROOT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
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
     * @tc.name   SUB_DDM_DKV_SCHEMA_INDEXES_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0600
     * @tc.desc   Test Js Api Schema.indexes testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SCHEMA_INDEXES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
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
     * @tc.name   SUB_DDM_DKV_SCHEMA_MODE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0700
     * @tc.desc   Test Js Api Schema.mode testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SCHEMA_MODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
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
     * @tc.name   SUB_DDM_DKV_SCHEMA_MODE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0800
     * @tc.desc   Test Js Api Schema.mode testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SCHEMA_MODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
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
     * @tc.name   SUB_DDM_DKV_SCHEMA_SKIP_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSchemaEtsApiTest_0900
     * @tc.desc   Test Js Api Schema.skip testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SCHEMA_SKIP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
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