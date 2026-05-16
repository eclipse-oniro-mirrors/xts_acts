/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../hypium';
import factory from '@ohos.data.distributedKVStore'
import common from "@ohos.app.ability.common";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';

const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_SYNC_ELEMENT = 'key_test_sync';

const VALUE_TEST_INT_ELEMENT = 123  as long;
const VALUE_TEST_FLOAT_ELEMENT = 321.12.toLong();
const VALUE_TEST_BOOLEAN_ELEMENT = true;
const VALUE_TEST_STRING_ELEMENT = 'value-string-001';
const VALUE_TEST_SYNC_ELEMENT = 'value-string-001';

const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
const TEST_STORE_ID = 'storeId';
let kvManager: factory.KVManager | null = null;
let kvStore: factory.SingleKVStore | null = null;
const USED_DEVICE_IDS = ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
const UNUSED_DEVICE_IDS: string[] = []; /* add you test device-ids here */
let syncDeviceIds: string[] = USED_DEVICE_IDS.concat(UNUSED_DEVICE_IDS);
let context: common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const TAG = "[Kv_Promise_Ets_TEST >>>>>> ]";

function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

function putBatchString(len: number, prefix: string) {
  let entries: factory.Entry[] = [];
  for (let i = 0; i < len; i++) {
    entries.push({
      key: prefix + i,
      value: {
        type: factory.ValueType.STRING,
        value: 'batch_test_string_value'
      }
    });
  }
  return entries;
}

export default function SingleKvStoreNullEtsTestStatic() {
  describe('SingleKvStoreNullEtsTestStatic', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.SINGLE_VERSION,
      schema: undefined,
      securityLevel: factory.SecurityLevel.S2,
    }

    beforeAll(async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")

      // await abilityDelegator.startAbility({
      //   bundleName: 'com.example.kvstoreetstest.static',
      //   abilityName: 'EntryAbility'
      // });
      await Utils.msSleep(8000)

      context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      const config: factory.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context!
      }
      console.info('test logbeforeAll config:' + JSON.stringify(config));
      kvManager = factory.createKVManager(config)
      console.info('test logbeforeAll end');
      done();
    })

    afterAll(async (done: () => void): Promise<void> => {
      console.info('test logafterAll');
      kvManager = null;
      kvStore = null;
      done();
    })

    beforeEach(async (done: () => void): Promise<void> => {
      await kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
        kvStore = store;
        console.info('test logbeforeEach getKVStore success');
        done();
      }).catch((err: Error) => {
        console.error('beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });

    })

    afterEach(async (done: () => void): Promise<void> => {
      console.info('test logafterEach');
      kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
        console.info('test logafterEach closeKVStore success');
        kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('test logafterEach deleteKVStore success');
          kvStore = null;
          done();
        }).catch((err: Error) => {
          console.error('afterEach deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
      }).catch((err: Error) => {
        console.error('afterEach closeKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });

    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_0100
     * @tc.desc   Test Js Api SingleKvStoreRemoveDeviceData is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200');
        try {
          await kvStore!.removeDeviceData('').then(() => {
            console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 removeDeviceData success');
            expect(null).assertFail();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 removeDeviceData fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(401).assertEqual(err.code);
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
      }
    )

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_0200
     * @tc.desc   Test Js Api SingleKvStore.GetString() testcase is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SingleKvStoreGetStringCallbackTest001');
        try {
          kvStore!.get("",
            (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
              if (err == undefined) {
                console.info(TAG +'SingleKvStoreGetStringCallbackTest001 get success');
                expect(null).assertFail();
              } else {
                console.error(TAG +'SingleKvStoreGetStringCallbackTest001 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
                expect(401).assertEqual(err.code);
              }
              done();
            });
        } catch (e) {
          console.error(TAG +'SingleKvStoreGetStringCallbackTest001 get e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_0300
     * @tc.desc   Test Js Api SingleKvStore.GetBool() testcase is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreGetBoolCallbackTest002');
        try {
          kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, true,
            (err: Error | null, data: string[] | undefined): void => {
              console.info(TAG +'SingleKvStoreGetBoolCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_BOOLEAN_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info(TAG +'SingleKvStoreGetBoolCallbackTest002 get success');
                  console.error(TAG +`SingleKvStoreGetBoolCallbackTest002 data is ${data}`);
                  expect(true).assertEqual(data);
                  done();
                });
            })
        } catch (e) {
          console.error(TAG +'SingleKvStoreGetBoolCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_0400
     * @tc.desc   Test Js Api SingleKvStore.GetBool() testcase is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0300');
        try {
          kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, false,
            (err: Error | null, data: string[] | undefined): void => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0300 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_BOOLEAN_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0300 get success');
                  console.error(TAG +`SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0300 data is ${data}`);
                  expect(false).assertEqual(data);
                  done();
                });
            })
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0300 e' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_0500
     * @tc.desc   Test Js Api SingleKvStoreRemoveDeviceData testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GEY_PROMISE_0100');
        try {
          await kvStore!.get("").then((data: Uint8Array | string | Long | double | boolean | undefined) => {
            console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_GET_PROMISE_0100 get success data:' + data);
            expect(null).assertFail();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GET_PROMISE_0100 get fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(401).assertEqual(err.code);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GET_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_0600
     * @tc.desc   Test Js Api SingleKvStore.getEntries is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0100');
        try {
            kvStore!.getEntries("", (err: Error | null, entrys: factory.Entry[] | undefined) => {
              if (err == undefined) {
                console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0100 get success');
                expect(null).assertFail();
              } else {
                console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0100 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
                expect(401).assertEqual(err.code);
              }
              done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_0700
     * @tc.desc   Test Js Api SingleKvStore.getEntries retuenvalue is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0200');
        try {
            kvStore!.getEntries("test", (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0200 entrys.length: ' + entrys!.length);
              expect(0).assertEqual(entrys!.length);
              done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0300
     * @tc.number SUB_DistributedData_KVStore_SDK__SingleKvStoreNullEtsTestStatic_0800
     * @tc.desc   Test Js Api SingleKvStore.getEntries retuenvalue is not kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0300  start');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_string_key';
            let value = 'batch_test_string_value';
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.STRING,
                value: value + i
              }
            });
          }
          console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0300: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined): void => {
            console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0300 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries('batch_test_string_key', (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0300 getEntries success');
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0300 entrys.length: ' + entrys!.length);
              expect(10).assertEqual(entrys!.length);
              done();
            });
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_CALLBACK_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_getEntries_promise_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_0900
     * @tc.desc   Test Js Api getEntries testcase 001 is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_getEntries_promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GEY_PROMISE_0100');
        try {
          kvStore!.getEntries("").then((entrys: factory.Entry[] | undefined) => {
            console.info(TAG +'test SUB_DDM_DKV_SINGLEKVSTORE_getEntries_promise_0100 get success data:');
            expect(null).assertFail();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_promise_0100 get fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(401).assertEqual(err.code);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_promise_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_1000
     * @tc.desc   Test Js Api SingleKvStore.getEntries value is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0100');
        try {
            let query = new factory.Query();
            query.prefixKey("batch_test");
            kvStore!.getEntries(query, (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0100 entrys.length: ' + entrys!.length);
              expect(0).assertEqual(entrys!.length);
              done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_1100
     * @tc.desc   Test Js Api SingleKvStore.getEntries retuenvalue is not kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0200  start');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_string_key';
            let value = 'batch_test_string_value';
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.STRING,
                value: value + i
              }
            });
          }
          console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0200: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined): void => {
            console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0200 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("batch_test");
            kvStore!.getEntries(query, (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0200 getEntries success');
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0200 entrys.length: ' + entrys!.length);
              expect(10).assertEqual(entrys!.length);
              done();
            });
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getEntries_query_CALLBACK_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_1200
     * @tc.desc   Test Js Api SingleKvStore.getResultSet is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.getResultSet("",(err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
            if (err == undefined) {
                console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0100 get success');
                expect(null).assertFail();
              } else {
                console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0100 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
                expect(401).assertEqual(err.code);
              }
              done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_1300
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase add return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let resultSet: factory.KVStoreResultSet | undefined;
        console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0200');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_string_key' + i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }

          kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
            console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0200 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getResultSet('batch_test_string_key',
              (err: Error | null, result: factory.KVStoreResultSet | undefined) => {
                console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0200 getResultSet success');
                resultSet = result as factory.KVStoreResultSet;
                expect(10).assertEqual(resultSet!.getCount());
                console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0200 getCount() == 10');
                kvStore!.closeResultSet(resultSet!, (err, data) => {
                  console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0200 closeResultSet success');
                  expect(err == undefined).assertTrue();
                  done();
                })
              });
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_CALLBACK_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_query_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_13001
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase add return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_query_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let resultSet: factory.KVStoreResultSet | undefined;
        console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_query_CALLBACK_0100');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_string_key' + i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }

          kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
            console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_query_CALLBACK_0100 putBatch success');
            expect(err == undefined).assertTrue();
            const query: factory.Query = new factory.Query();
            query.prefixKey("batch_test");
            kvStore!.getResultSet(query,
              (err: Error | null, result: factory.KVStoreResultSet | undefined) => {
                console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_query_CALLBACK_0100 getResultSet success');
                resultSet = result as factory.KVStoreResultSet;
                expect(10).assertEqual(resultSet!.getCount());
                console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_query_CALLBACK_0100 getCount() == 10');
                kvStore!.closeResultSet(resultSet!, (err, data) => {
                  console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_query_CALLBACK_0100 closeResultSet success');
                  expect(err == undefined).assertTrue();
                  done();
                })
              });
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_getResultSet_query_CALLBACK_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_1400
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100');
        try {
          let resultSet: factory.KVStoreResultSet | undefined;
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_string_key'
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }
          await kvStore!.putBatch(entries).then((err: Error | undefined) => {
            console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 putBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          await kvStore!.getResultSet('batch_test_string_key').then((result: factory.KVStoreResultSet) => {
            console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet success result:');
            resultSet = result;
            console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet success resultSet:'+resultSet!.getCount());
            expect(10).assertEqual(resultSet!.getCount());
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          kvStore!.closeResultSet(resultSet!).then((err: Error | undefined) => {
            console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 closeResultSet success   err:'+err);
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 closeResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_1500
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200');
        try {
          await kvStore!.getResultSet("").then((result: factory.KVStoreResultSet) => {
            expect(null).assertFail();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(401).assertEqual(err.code);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_callback_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_1600
     * @tc.desc   Test Js Api SingleKvStoreGetResultSize testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_callback_0100');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_string_key';
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }
          await kvStore!.putBatch(entries).then((err) => {
            console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_callback_0100 putBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_callback_0100 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });

          let query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore!.getResultSize(query,  (err: BusinessError|null, resultSize: int|undefined) : void =>  {
            console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_callback_0100 getResultSet success'+resultSize);
            expect(10).assertEqual(resultSize);
            done();
          })
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_callback_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_backup_callback_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_1700
     * @tc.desc   distributedKVStore backup "" callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_backup_callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_backup_callback_0100 start');
      try {
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.backup("", (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to backup.code is ${err.code},message is ${err.message}`);
            expect(401).assertEqual(err.code);
          }else{
            console.info(TAG + `Succeeded in backup`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_backup__PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_1800
     * @tc.desc   distributedKVStore backup "" promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_backup__PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'test SUB_DDM_DKV_SINGLEKVSTORE_backup__PROMISE_0200');
        try {
          kvStore!.backup("").then((): void => {
            expect(null).assertFail();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_backup__PROMISE_0200 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(401).assertEqual(err.code);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_backup__PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_restore_callback_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_1900
     * @tc.desc   distributedKVStore restore "" callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_restore_callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_restore_callback_0100 start');
      try {
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.restore("", (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to restore.code is ${err.code},message is ${err.message}`);
            expect(401).assertEqual(err.code);
          }else{
            console.info(TAG + `Succeeded in restore`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_restore__PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_2000
     * @tc.desc   distributedKVStore restore "" promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_restore__PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'test SUB_DDM_DKV_SINGLEKVSTORE_restore__PROMISE_0200');
        try {
          kvStore!.restore("").then((): void => {
            expect(null).assertFail();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_restore__PROMISE_0200 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(401).assertEqual(err.code);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_backup__PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_setSyncRange_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_2100
     * @tc.desc   Test Js Api SingleKvStore.SetSyncRange() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_setSyncRange_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_setSyncRange_CALLBACK_0100');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['C', 'D'];
          kvStore!.setSyncRange([], remoteSupportLabels,
            (err: Error | null, data: string[] | undefined): void => {
            if (err != undefined) {
              console.error(TAG + `Failed to restore.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
            }else{
              console.info(TAG + `Succeeded in setSyncRange`);
            }
              done();
            });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_setSyncRange_CALLBACK_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_setSyncRange_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_2200
     * @tc.desc   Test Js Api SingleKvStore.SetSyncRange() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_setSyncRange_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_setSyncRange_CALLBACK_0200');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['C', 'D'];
          kvStore!.setSyncRange(localLabels, [],
            (err: Error | null, data: string[] | undefined): void => {
            if (err != undefined) {
              console.error(TAG + `Failed to restore.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
            }else{
              console.info(TAG + `Succeeded in setSyncRange`);
            }
              done();
            });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_setSyncRange_CALLBACK_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_2300
     * @tc.desc   Test Js Api SingleKvStoreSetSyncRange testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['C', 'D'];
          await kvStore!.setSyncRange([], remoteSupportLabels).then((err) => {
            console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100 setSyncRange success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100  fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_2400
     * @tc.desc   Test Js Api SingleKvStoreSetSyncRange testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['C', 'D'];
          await kvStore!.setSyncRange(localLabels, []).then((err) => {
            console.info(TAG +'test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200 setSyncRange success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200  fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_sync_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_2500
     * @tc.desc   Test Js Api SingleKvStore.sync testcase 001 is []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_sync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_0100 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test001', VALUE_TEST_SYNC_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_syn_0100 put success');
              expect(err == undefined).assertTrue();
            });
          try {
            let mode = factory.SyncMode.PULL_ONLY;
            console.info(TAG +'kvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync([], mode, 10);
            console.info(TAG +'kvStore!.sync success ');
          } catch (e) {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_0100 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_0100 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_sync_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_2600
     * @tc.desc   Test Js Api SingleKvStore.sync testcase 001 is not []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_sync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_0200 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test001', VALUE_TEST_SYNC_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_0200 put success');
              expect(err == undefined).assertTrue();
            });
          try {
            let mode = factory.SyncMode.PULL_ONLY;
            console.info(TAG +'kvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(["AA","BB"], mode, 10);
            console.info(TAG +'kvStore!.sync success ');
          } catch (e) {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_0200 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_0200 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_2700
     * @tc.desc   Test Js Api SingleKvStore.SyncMode.PULL_ONLY;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0100 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test001', VALUE_TEST_SYNC_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0100 put success');
              expect(err == undefined).assertTrue();
            });
          try {
            const query: factory.Query = new factory.Query();
            query.prefixKey("batch_test");
            let mode = factory.SyncMode.PULL_ONLY;
            console.info(TAG +'kvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(syncDeviceIds, query, mode, 10);
          } catch (e) {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0100 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0100 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_2800
     * @tc.desc   Test Js Api SingleKvStore.SyncMode.PUSH_ONLY;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0200 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test002', VALUE_TEST_SYNC_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0200 put success');
              expect(err == undefined).assertTrue();
            });
          try {
            const query: factory.Query = new factory.Query();
            query.prefixKey("batch_test");
            let mode = factory.SyncMode.PUSH_ONLY;
            console.info(TAG +'kvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(syncDeviceIds, query, mode, 10);
          } catch (e) {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0200 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0200 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_2900
     * @tc.desc   Test Js Api SingleKvStore.SyncMode.PUSH_PULL;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0300 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test003', VALUE_TEST_SYNC_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0300 put success');
              expect(err == undefined).assertTrue();
            });
          try {
            const query: factory.Query = new factory.Query();
            query.prefixKey("batch_test");
            let mode = factory.SyncMode.PUSH_PULL;
            console.info(TAG +'kvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(syncDeviceIds, query, mode, 10);
          } catch (e) {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0300 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0300 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_3000
     * @tc.desc   Test Js Api SingleKvStore.sync_query is []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0400 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test003', VALUE_TEST_SYNC_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0400 put success');
              expect(err == undefined).assertTrue();
            });
          try {
            const query: factory.Query = new factory.Query();
            query.prefixKey("batch_test");
            let mode = factory.SyncMode.PUSH_PULL;
            console.info(TAG +'kvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync([], query, mode, 10);
          } catch (e) {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0400 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0400 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreNullEtsTestStatic_3100
     * @tc.desc   Test Js Api SingleKvStore.sync_query is not []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0500 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test003', VALUE_TEST_SYNC_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0500 put success');
              expect(err == undefined).assertTrue();
            });
          try {
            const query: factory.Query = new factory.Query();
            query.prefixKey("batch_test");
            let mode = factory.SyncMode.PUSH_PULL;
            console.info(TAG +'kvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(["AA","BB"], query, mode, 10);
          } catch (e) {
            console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0500 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_SINGLEKVSTORE_sync_query_0500 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })


 
  })
}