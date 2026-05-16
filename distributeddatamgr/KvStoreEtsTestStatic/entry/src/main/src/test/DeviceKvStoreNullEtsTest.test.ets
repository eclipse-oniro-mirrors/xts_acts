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

let localDeviceId = '';
let entries: factory.Entry[] = [];

const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
const TEST_STORE_ID = 'storeId';
let kvManager: factory.KVManager | null = null;
let kvStore: factory.DeviceKVStore | null = null;
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

export default function DeviceKvStoreNullEtsTestStatic() {
  describe('DeviceKvStoreNullEtsTestStatic', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
      schema: undefined,
      securityLevel: factory.SecurityLevel.S1,
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
      let getDeviceId = new Promise<string>((resolve, reject) => {
        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
          console.info(TAG + 'beforeAll on data change: ' + JSON.stringify(data));
          console.info(TAG + 'beforeAll on data.deviceId=' + JSON.stringify(data.deviceId));
          resolve(data!.deviceId);
        });
        kvStore!.put("getDeviceId", "byPut").then((data) => {
          console.info(TAG + 'beforeAll put success');
          expect(data == undefined).assertTrue();
        });
        setTimeout(() => {
          reject(new Error('not resolved in 2 second, reject it.'));
        }, 2000);
      });
      
      // await getDeviceId.then((deviceId: string): Promise<void> => {
      //   console.info(TAG + 'beforeAll getDeviceId=' + JSON.stringify(deviceId));
      //   localDeviceId = deviceId;
      // }).catch((error: Error) => {
      //   console.error(TAG + 'beforeAll can NOT getDeviceId, fail: ' +
      //     `, error code is ${error.code}, message is ${error.message}`);
      //   expect(null).assertFail();
      // });

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
      await kvManager!.getKVStore<factory.DeviceKVStore>(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
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
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_GET_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_0100
     * @tc.desc   Test Js Api DeviceKVStore.GetString() testcase is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_GET_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'DeviceKVStoreGetStringCallbackTest001');
        try {
          kvStore!.get("",
            (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
              if (err == undefined) {
                console.info(TAG +'DeviceKVStoreGetStringCallbackTest001 get success');
                expect(null).assertFail();
              } else {
                console.error(TAG +'DeviceKVStoreGetStringCallbackTest001 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
                expect(401).assertEqual(err.code);
              }
              done();
            });
        } catch (e) {
          console.error(TAG +'DeviceKVStoreGetStringCallbackTest001 get e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_GET_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_0200
     * @tc.desc   Test Js Api DeviceKVStore.GetBool() testcase is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_GET_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('DeviceKVStoreGetBoolCallbackTest002');
        try {
          kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, true,
            (err: Error | null, data: string[] | undefined): void => {
              console.info(TAG +'DeviceKVStoreGetBoolCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_BOOLEAN_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info(TAG +'DeviceKVStoreGetBoolCallbackTest002 get success');
                  console.error(TAG +`DeviceKVStoreGetBoolCallbackTest002 data is ${data}`);
                  expect(true).assertEqual(data);
                  done();
                });
            })
        } catch (e) {
          console.error(TAG +'DeviceKVStoreGetBoolCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_GET_CALLBACK_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_0300
     * @tc.desc   Test Js Api DeviceKVStore.GetBool() testcase is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_GET_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DeviceKVStore_GET_CALLBACK_0300');
        try {
          kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, false,
            (err: Error | null, data: string[] | undefined): void => {
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_CALLBACK_0300 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_BOOLEAN_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_CALLBACK_0300 get success');
                  console.error(TAG +`SUB_DDM_DKV_DeviceKVStore_GET_CALLBACK_0300 data is ${data}`);
                  expect(false).assertEqual(data);
                  done();
                });
            })
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_CALLBACK_0300 e' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_GET_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_0400
     * @tc.desc   Test Js Api DeviceKVStoreRemoveDeviceData testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_GET_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_DeviceKVStore_GEY_PROMISE_0100');
        try {
          await kvStore!.get("").then((data: Uint8Array | string | Long | double | boolean | undefined) => {
            console.info(TAG +'test logSUB_DDM_DKV_DeviceKVStore_GET_PROMISE_0100 get success data:' + data);
            expect(null).assertFail();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_PROMISE_0100 get fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(401).assertEqual(err.code);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_0500
     * @tc.desc   Test Js Api DeviceKVStore.GetString() testcase is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0100');
        try {
          kvStore!.get("",KEY_TEST_STRING_ELEMENT,
            (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
              if (err == undefined) {
                console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0100 get success');
                expect(null).assertFail();
              } else {
                console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0100 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
                expect(15100004).assertEqual(err.code);
              }
              done();
            });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0100 get e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_0600
     * @tc.desc   Test Js Api DeviceKVStore deviceId is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0200');
        try {
          kvStore!.get("AA","",
            (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
              if (err == undefined) {
                console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0200 get success');
                expect(null).assertFail();
              } else {
                console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0200 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
                expect(401).assertEqual(err.code);
              }
              done();
            });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_CALLBACK_0200 get e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_0700
     * @tc.desc   Test Js Api DeviceKVStore get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info(TAG +'test SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0100');
        try {
          await kvStore!.get("",KEY_TEST_STRING_ELEMENT).then((data: Uint8Array | string | Long | double | boolean | undefined) => {
            console.info(TAG +'test SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0100 get success data:' + data);
            expect(null).assertFail();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0100 get fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(15100004).assertEqual(err.code);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_0800
     * @tc.desc   Test Js Api DeviceKVStore get 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info(TAG +'test SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0200');
        try {
          await kvStore!.get("AA","").then((data: Uint8Array | string | Long | double | boolean | undefined) => {
            console.info(TAG +'test SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0200 get success data:' + data);
            expect(null).assertFail();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0200 get fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(401).assertEqual(err.code);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_GET_deviceId_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })


    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_0900
     * @tc.desc   Test Js Api DeviceKVStore.getEntries is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0100');
        try {
          kvStore!.getEntries("", (err: Error | null, entrys: factory.Entry[] | undefined) => {
            if (err == undefined) {
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0100 get success');
              expect(null).assertFail();
            } else {
              console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0100 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(401).assertEqual(err.code);
            }
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_1000
     * @tc.desc   Test Js Api DeviceKVStore.getEntries retuenvalue is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0200');
        try {
          kvStore!.getEntries("test", (err: Error | null, entrys: factory.Entry[] | undefined) => {
            console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0200 entrys.length: ' + entrys!.length);
            expect(0).assertEqual(entrys!.length);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0300
     * @tc.number SUB_DistributedData_KVStore_SDK__DeviceKVStoreNullEtsTestStatic_1100
     * @tc.desc   Test Js Api DeviceKVStore.getEntries retuenvalue is not kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0300  start');
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
          console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0300: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined): void => {
            console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0300 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries('batch_test_string_key', (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0300 getEntries success');
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0300 entrys.length: ' + entrys!.length);
              expect(10).assertEqual(entrys!.length);
              done();
            });
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })


    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_promise_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_1200
     * @tc.desc   Test Js Api getEntries testcase 001 is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_DeviceKVStore_GEY_PROMISE_0100');
        try {
          kvStore!.getEntries("").then((entrys: factory.Entry[] | undefined) => {
            console.info(TAG +'test SUB_DDM_DKV_DeviceKVStore_getEntries_promise_0100 get success data:');
            expect(null).assertFail();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_promise_0100 get fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(401).assertEqual(err.code);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_promise_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_1300
     * @tc.desc   Test Js Api DeviceKVStore.getEntries is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0100');
        try {
          kvStore!.getEntries("",KEY_TEST_STRING_ELEMENT, (err: Error | null, entrys: factory.Entry[] | undefined) => {
            if (err == undefined) {
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0100 get success');
            } else {
              console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0100 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
        });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_1400
     * @tc.desc   Test Js Api DeviceKVStore.getEntries is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0200');
        try {
          kvStore!.getEntries("AAA","", (err: Error | null, entrys: factory.Entry[] | undefined) => {
            if (err == undefined) {
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0200 get success');
              expect(null).assertFail();
            } else {
              console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0200 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(401).assertEqual(err.code);
            }
            done();
        });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_1500
     * @tc.desc   Test Js Api DeviceKVStore.getEntries retuenvalue is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0300');
        try {
          kvStore!.getEntries("AAA","test", (err: Error | null, entrys: factory.Entry[] | undefined) => {
            console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0300 entrys.length: ' + entrys!.length);
            expect(0).assertEqual(entrys!.length);
            done();
        });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_1600
     * @tc.desc   Test Js Api DeviceKVStore.getEntries retuenvalue is not kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0400  start');
        let localDeviceId = '';
        let entries: factory.Entry[] = [];

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
          console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0400: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined): void => {
            console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0400 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries(localDeviceId,'batch_test_string_key', (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0400 getEntries success');
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0400 entrys.length: ' + entrys!.length);
              expect(10).assertEqual(entrys!.length);
              done();
            });
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0400 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })


    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_1700
     * @tc.desc   Test Js Api getEntries testcase 001 is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0100');
        try {
          kvStore!.getEntries("",KEY_TEST_STRING_ELEMENT).then((entrys: factory.Entry[] | undefined) => {
            console.info(TAG +'test SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0100 get success data:');
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0100 get fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_1800
     * @tc.desc   Test Js Api getEntries testcase 001 is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0200');
        try {
          kvStore!.getEntries(localDeviceId,"").then((entrys: factory.Entry[] | undefined) => {
            console.info(TAG +'test SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0200 get success data:');
            expect(null).assertFail();
            done();
          }).catch((err: Error) => {
            console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0200 get fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(401).assertEqual(err.code);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_promise_deviceId_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_1900
     * @tc.desc   Test Js Api DeviceKVStore.getEntries is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0100');
        try {
          let query = new factory.Query();
          query.deviceId(localDeviceId);
          query.prefixKey("batch_test");
          kvStore!.getEntries("",query, (err: Error | null, entrys: factory.Entry[] | undefined) => {
            if (err == undefined) {
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0100 get success');
            } else {
              console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0100 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
        });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_CALLBACK_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_2000
     * @tc.desc   Test Js Api DeviceKVStore.getEntries retuenvalue is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0200');
        try {
          kvStore!.getEntries(localDeviceId,"test", (err: Error | null, entrys: factory.Entry[] | undefined) => {
            console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0200 entrys.length: ' + entrys!.length);
            expect(0).assertEqual(entrys!.length);
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_2100
     * @tc.desc   Test Js Api DeviceKVStore.getEntries retuenvalue is not kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0300  start');
        let localDeviceId = '';
        let entries: factory.Entry[] = [];

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
          console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0300: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined): void => {
            console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0300 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.deviceId(localDeviceId);
            query.prefixKey("batch_test");
            kvStore!.getEntries(localDeviceId,'batch_test_string_key', (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0300 getEntries success');
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_query_CALLBACK_0300 entrys.length: ' + entrys!.length);
              expect(10).assertEqual(entrys!.length);
              done();
            });
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getEntries_deviceId_CALLBACK_0400 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_createKVManager_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_2200
     * @tc.desc   Test Js Api DeviceKVStore.createKVManager bundlename is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_createKVManager_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_createKVManager_0100');
        try {
          context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
          const config1 : factory.KVManagerConfig = {
            bundleName: "",
            context: context!
          };
          kvManager = factory.createKVManager(config1);
          console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_createKVManager_0100 createKVManager success');
          expect(null).assertFail();
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_createKVManager_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(401).assertEqual(e.code);
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_createKVManager_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_2300
     * @tc.desc   Test Js Api DeviceKVStore.createKVManager add retuen value assert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_createKVManager_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_createKVManager_0200');
        try {
          context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
          const config: factory.KVManagerConfig = {
            bundleName: TEST_BUNDLE_NAME,
            context: context!
          }
          kvManager = factory.createKVManager(config);
          console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_createKVManager_0200 createKVManager success');
          expect(kvManager!==undefined).assertTrue();
          done();
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_createKVManager_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getKVStore_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_2400
     * @tc.desc   Test Js Api DeviceKVStore.getKVStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getKVStore_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0100');
        try {
          const options: factory.Options = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
            schema: undefined,
            securityLevel: factory.SecurityLevel.S2,
          }
          kvManager!.getKVStore("", options, (err: Error | null, store: factory.DeviceKVStore | undefined) => {
            if (err == undefined) {
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0100 get success');
              expect(null).assertFail();
            } else {
              console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0100 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(401).assertEqual(err.code);
            }
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getKVStore_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_2500
     * @tc.desc   Test Js Api DeviceKVStore.getKVStore securityLevel is S1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getKVStore_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0200');
        try {
          const options: factory.Options = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
            schema: undefined,
            securityLevel: factory.SecurityLevel.S2,
          }
          kvManager!.getKVStore(TEST_STORE_ID, options, (err: Error | null, store: factory.DeviceKVStore | undefined) => {
            if (err == undefined) {
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0200 get success');
              expect(store!==undefined).assertTrue();
            } else {
              console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0200 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DeviceKVStore_getKVStore_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVStoreNullEtsTestStatic_2600
     * @tc.desc   Test Js Api DeviceKVStore.getKVStore securityLevel is S1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DeviceKVStore_getKVStore_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0300');
        try {
          const options: factory.Options = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
            schema: undefined,
            securityLevel: factory.SecurityLevel.S3,
          }
          kvManager!.getKVStore(TEST_STORE_ID, options, (err: Error | null, store: factory.DeviceKVStore | undefined) => {
            if (err == undefined) {
              console.info(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0300 get success');
              expect(store!==undefined).assertTrue();
            } else {
              console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0300 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error(TAG +'SUB_DDM_DKV_DeviceKVStore_getKVStore_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

 
  })
}