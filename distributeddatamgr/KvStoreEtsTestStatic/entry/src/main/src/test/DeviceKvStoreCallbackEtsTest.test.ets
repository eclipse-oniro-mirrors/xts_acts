/*
* Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
} from "../../../hypium/index";
import factory from '@ohos.data.distributedKVStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
const domain = 0xFF00;
const tag = "TestTag";
const KEY_TEST_INT_ELEMENT = 'key_test_int_2';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float_2';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean_2';
const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
const KEY_TEST_SYNC_ELEMENT = 'key_test_sync';

const VALUE_TEST_INT_ELEMENT = 1234 as long;
const VALUE_TEST_FLOAT_ELEMENT = 4321.12;
const VALUE_TEST_BOOLEAN_ELEMENT = true;
const VALUE_TEST_STRING_ELEMENT = 'value-string-002';
const VALUE_TEST_SYNC_ELEMENT = 'value-string-001';

const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
const TEST_STORE_ID = 'dstoreId';

let kvManager: factory.KVManager | null = null;
let kvStore: factory.DeviceKVStore | null = null;
let localDeviceId: string = '';
const USED_DEVICE_IDS = ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
const UNUSED_DEVICE_IDS: string[] = []; /* add you test device-ids here */
let syncDeviceIds = USED_DEVICE_IDS.concat(UNUSED_DEVICE_IDS);
let context: common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

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
    let entry: factory.Entry = {
      key: prefix + i,
      value: {
        type: factory.ValueType.STRING,
        value: 'batch_test_string_value'
      }
    }
    entries.push(entry);
  }
  return entries;
}

export default function deviceKvStoreCallbackTest() {
  describe('deviceKvStoreCallbackTest', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
      schema: undefined,
      securityLevel: factory.SecurityLevel.S2,
    }

    beforeAll(async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, '%{public}s', '================ beforeAll start==========');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")
        // await abilityDelegator.startAbility({
        //   bundleName: 'com.example.kvstoreetstest.static',
        //   abilityName: 'EntryAbility'
        // });
        await Utils.msSleep(8000)
        context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============beforeAll context e: " + e);
        hilog.info(domain, tag, '%{public}s', '================ beforeAll context end==========');
      }
      const config: factory.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context!
      }

      kvManager = factory.createKVManager(config)
      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
        kvStore = store;
        console.info('beforeAll getKVStore for getDeviceId success');
      }).catch((err:Error) => {
        console.error('beforeAll getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      let getDeviceId = new Promise<string>((resolve, reject) => {
        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data:factory.ChangeNotification|undefined) => {
          // console.info('beforeAll on data change: ' + JSON.stringify(data!));
          resolve(data!.deviceId);
        });
        kvStore!.put("getDeviceId", "byPut").then((data:factory.ChangeNotification|undefined) => {
          console.info('beforeAll put success');
          expect(data == undefined).assertTrue();
        });
        setTimeout(() => {
          reject(new Error('not resolved in 2 second, reject it.'))
        }, 2000);
      });

      await getDeviceId.then((deviceId: string) => {
        // console.info('beforeAll getDeviceId ' + JSON.stringify(deviceId));
        console.info('beforeAll getDeviceId ' );
        localDeviceId = deviceId;
      }).catch((error: Error) => {
        console.error('beforeAll can NOT getDeviceId, fail: ' +
          `, error code is ${error.code}, message is ${error.message}`);
        expect(null).assertFail();
      });

      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
        console.info('beforeAll closeKVStore success');
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('beforeAll deleteKVStore success');
          kvStore = null;
          done();
        }).catch((err:Error) => {
          console.info('beforeAll deleteKVStore err ' + err);
          done();
        });
      }).catch((err:Error) => {
        console.info('beforeAll closeKVStore err ' + err);
        done();
      });

    })

    afterAll(async (done: () => void): Promise<void> => {
      console.info('afterAll');
      kvManager = null;
      kvStore = null;
      done();
    })

    beforeEach(async (done: () => void): Promise<void> => {
      //console.info('beforeEach' + JSON.stringify(options));
      console.info('beforeEach kvManager.getKVStore start');
      kvManager!.getKVStore(TEST_STORE_ID, options, (err: Error | null, store: factory.DeviceKVStore | undefined) => {
        kvStore = store as factory.DeviceKVStore;
        console.info('beforeEach getKVStore success');
        done();
      });
    })

    afterEach(async (done: () => void): Promise<void> => {
      console.info('afterEach');
      try {
        kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, (err: Error | null, data: string[] | undefined) => {
          console.info('afterEach closeKVStore success: function err is: ' + err);
          kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, (err, data) => {
            console.info('afterEach deleteKVStore success: function err is: ' + err);
            kvStore = null;
            done();
          });
        });

      } catch (e) {
        console.error('afterEach closeKVStore err ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1100
     * @tc.desc   Test Js Api DeviceKvStore.Put(String) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0100');
        try {
          kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, (err, data) => {
            if (err == undefined) {
              console.info('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0100 put success');
            } else {
              console.error('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0100 put fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0100 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1200
     * @tc.desc   Test Js Api DeviceKvStore.Put(String) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0200');
        try {
          let str = '';
          for (let i = 0; i < 4095; i++) {
            str += 'x';
          }

          kvStore!.put(KEY_TEST_STRING_ELEMENT + '102', str,
            (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0200 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT + '102',
                (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                  console.info('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0200 get success');
                  expect(str == data).assertTrue();
                  done();
                });
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0200 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETSTRING_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2800
     * @tc.desc   Test Js Api DeviceKvStore.Get(String) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0200');
        try {
          kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT,
            (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0200 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT,
                (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                  console.info('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0200 get success');
                  expect((err == undefined) && (VALUE_TEST_STRING_ELEMENT == data)).assertTrue();
                  done();
                });
            })
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0200 get e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTINT_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0700
     * @tc.desc   Test Js Api DeviceKvStore.Put(Int) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTINT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0100');
        try {
          kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT,
            (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0100 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(localDeviceId, KEY_TEST_INT_ELEMENT,
                (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                  console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0100 get success');
                  expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
                  done();
                })
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTINT_0100 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTINT_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0800
     * @tc.desc   Test Js Api DeviceKvStore.Put(Int) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTINT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0200');
        try {
          let intValue = 987654321 as long;
          kvStore!.put(KEY_TEST_INT_ELEMENT, intValue, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0200 put success');
            expect(err == undefined).assertTrue();
            kvStore!.get(localDeviceId, KEY_TEST_INT_ELEMENT,
              (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0200 get success');
                expect((err == undefined) && (intValue == data)).assertTrue();
                done();
              })
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTINT_0200 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTINT_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1000
     * @tc.desc   Test Js Api DeviceKvStore.Put(Int) testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTINT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0300');
        try {
          let intValue = Number.MIN_VALUE;
          kvStore!.put(KEY_TEST_INT_ELEMENT, intValue, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0300 put success');
            expect(err == undefined).assertTrue();
            kvStore!.get(localDeviceId, KEY_TEST_INT_ELEMENT,
              (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0300 get success');
                expect((err == undefined) && (intValue == data)).assertTrue();
                done();
              })
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTINT_0300 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTINT_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0900
     * @tc.desc   Test Js Api DeviceKvStore.Put(Int) testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTINT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0400');
        try {
          let intValue = Number.MAX_VALUE;
          kvStore!.put(KEY_TEST_INT_ELEMENT, intValue, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0400 put success');
            expect(err == undefined).assertTrue();
            kvStore!.get(localDeviceId, KEY_TEST_INT_ELEMENT,
              (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0400 get success');
                expect((err == undefined) && (intValue == data)).assertTrue();
                done();
              })
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTINT_0400 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETINT_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1400
     * @tc.desc   Test Js Api DeviceKvStore.Get(Int) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETINT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0100');
        try {
          kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT,
            (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0100 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(localDeviceId, KEY_TEST_INT_ELEMENT,
                (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                  console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0100 get success');
                  expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
                  done();
                })
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETINT_0100 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETINT_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1600
     * @tc.desc   Test Js Api DeviceKvStore.Get(Int) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETINT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0200');
        try {
          kvStore!.get(localDeviceId, KEY_TEST_INT_ELEMENT,
            (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
              if (err == undefined) {
                console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0200 get success');
                expect(null).assertFail();
              } else {
                console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0200 get fail');
              }
              done();
            })
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETINT_0200 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTBOOLEAN_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0200
     * @tc.desc   Test Js Api DeviceKvStore.Put(Bool) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBOOLEAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBOOLEAN_0100');
        try {
          kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT,
            (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_PUTBOOLEAN_0100 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTBOOLEAN_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1500
     * @tc.desc   Test Js Api DeviceKvStore.Get(Bool) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0100');
        try {
          kvStore!.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT,
            (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
              if (err == undefined) {
                console.info('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0100 get success');
                expect(null).assertFail();
              } else {
                console.error('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0100 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
              }
              done();
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0100 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1300
     * @tc.desc   Test Js Api DeviceKvStore.Get(Bool) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0200');
        try {
          kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT,
            (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0200 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT,
                (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                  console.info('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0200 get success');
                  expect((err == undefined) && (VALUE_TEST_BOOLEAN_ELEMENT == data)).assertTrue();
                  done();
                });
            })
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0200 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0300
     * @tc.desc   Test Js Api DeviceKvStore.Put(Float) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0100');
        try {
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT,
            (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0100 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0100 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0600
     * @tc.desc   Test Js Api DeviceKvStore.Put(Float) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0200');
        try {
          let floatValue = 123456.654321;
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0200 put success');
            expect(err == undefined).assertTrue();
            kvStore!.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT,
              (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0200 get success');
                expect((err == undefined) && (floatValue == data)).assertTrue();
                done();
              })
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0200 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0400
     * @tc.desc   Test Js Api DeviceKvStore.Put(Float) testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0300');
        try {
          let floatValue = 123456.0;
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0300 put success');
            expect(err == undefined).assertTrue();
            kvStore!.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT,
              (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0300 get success');
                expect((err == undefined) && (floatValue == data)).assertTrue();
                done();
              })
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0300 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0500
     * @tc.desc   Test Js Api DeviceKvStore.Put(Float) testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0400');
        try {
          let floatValue = 123456.00;
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0400 put success');
            expect(err == undefined).assertTrue();
            kvStore!.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT,
              (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0400 get success');
                expect((err == undefined) && (floatValue == data)).assertTrue();
                done();
              })
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0400 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETFLOAT_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2700
     * @tc.desc   Test Js Api DeviceKvStore.Get(Float) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETFLOAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETFLOAT_0100');
        try {
          kvStore!.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT,
            (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
              if (err == undefined) {
                console.info('SUB_DDM_DKV_DEVICESTORE_GETFLOAT_0100 get success');
                expect(null).assertFail();
              } else {
                console.error('SUB_DDM_DKV_DEVICESTORE_GETFLOAT_0100 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
              }
              done();
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETFLOAT_0100 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6000
     * @tc.desc   Test Js Api DeviceKvStore.9.DeleteString() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0100');
        try {
          kvStore!.delete(KEY_TEST_STRING_ELEMENT, (err, data) => {
            if (err == undefined) {
              console.info('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0100 delete success');
            } else {
              console.error('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0100 delete fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0100 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6100
     * @tc.desc   Test Js Api DeviceKvStore.9.DeleteString() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0200');
        try {
          kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT,
            (err: BusinessError | null, data: string[] | undefined)
            => {
              console.info('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0200 put success');
              expect(err == undefined).assertTrue();
              kvStore!.delete(KEY_TEST_STRING_ELEMENT, (err, data) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0200 delete success');
                expect(err == undefined).assertTrue();
                done();
              });
            })
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0200 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_DELETEINT_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5800
     * @tc.desc   Test Js Api DeviceKvStore.9.DeleteInt() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0100');
        try {
          kvStore!.delete(KEY_TEST_INT_ELEMENT, (err: BusinessError | null, data: string[] | undefined) => {
            if (err == undefined) {
              console.info('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0100 get success');
            } else {
              console.error('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0100 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0100 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_DELETEINT_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5900
     * @tc.desc   Test Js Api DeviceKvStore.9.DeleteInt() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0200');
        try {
          kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT,
            (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0200 put success');
              expect(err == undefined).assertTrue();
              kvStore!.delete(KEY_TEST_INT_ELEMENT, (err: BusinessError | null, data: string[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0200 delete success');
                expect(err == undefined).assertTrue();
                done();
              });
            })
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0200 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5600
     * @tc.desc   Test Js Api DeviceKvStore.9.DeleteFloat() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0100');
        try {
          kvStore!.delete(KEY_TEST_FLOAT_ELEMENT, (err: BusinessError | null, data: string[] | undefined) => {
            if (err == undefined) {
              console.info('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0100 get success');
            } else {
              console.error('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0100 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0100 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5700
     * @tc.desc   Test Js Api DeviceKvStore.9.DeleteFloat() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0200');
        try {
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT,
            (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0200 put success');
              expect(err == undefined).assertTrue();
              kvStore!.delete(KEY_TEST_FLOAT_ELEMENT, (err: BusinessError | null, data: string[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0200 delete success');
                expect(err == undefined).assertTrue();
                done();
              });
            })
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0200 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5400
     * @tc.desc   Test Js Api DeviceKvStore.9.DeleteBool() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0100');
        try {
          //await kvStore!.delete(KEY_TEST_BOOLEAN_ELEMENT, (err, data) => {
          kvStore!.delete(KEY_TEST_BOOLEAN_ELEMENT, (err: BusinessError | null, data: string[] | undefined) => {
            if (err == undefined) {
              console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0100 get success');
            } else {
              console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0100 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0100 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5500
     * @tc.desc   Test Js Api DeviceKvStore.9.DeleteBool() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0200');
        try {
          //await kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, async (err, data) => {
          kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT,
            (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0200 put success');
              expect(err == undefined).assertTrue();
              kvStore!.delete(KEY_TEST_BOOLEAN_ELEMENT, (err: BusinessError | null, data: string[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0200 delete success');
                expect(err == undefined).assertTrue();
                done();
              });
            })
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0200 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1900
     * @tc.desc   Test Js Api DeviceKvStore.9.OnChange() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0100');
        try {
          // kvStore!.onDataChange(0, (data) => {
          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0100 dataChange');
            expect(data != null).assertTrue();
          });
          //await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, (err, data) => {
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT,
            (err, data) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0100 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0100 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2100
     * @tc.desc   Test Js Api DeviceKvStore.9.OnChange() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0200');
        try {
          // kvStore!.onDataChange(1, (data) => {
          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE, (data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0200 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT,
            (err, data) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0200 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0200 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1700
     * @tc.desc   Test Js Api DeviceKvStore.9.OnChange() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0300');
        try {
          // kvStore!.onDataChange(2, (data) => {
          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_ALL, (data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0300 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT,
            (err, data) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0300 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0300 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2000
     * @tc.desc   Test Js Api DeviceKvStore.9.OnSyncComplete() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100 dataChange');
            expect(data != null).assertTrue();
          });
          await kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100 put success');
            expect(data == undefined).assertTrue();
          }).catch((error:Error) => {
            console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100 put failed:' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
            done();
          });
          try {
            let mode = factory.SyncMode.PULL_ONLY;
            console.info('kvStore!.sync to ' + JSON.stringify(syncDeviceIds?.length));
            kvStore!.sync(syncDeviceIds, mode);
          } catch (e) {
            console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100 no peer device :e:' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2200
     * @tc.desc   Test Js Api DeviceKvStore.9.OnSyncComplete() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200 dataChange');
            expect(data != null).assertTrue();
          });
          await kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200 put success');
            expect(data == undefined).assertTrue();
          }).catch((error:Error) => {
            console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200 put failed:' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
          });
          try {
            let mode = factory.SyncMode.PUSH_ONLY;

            console.info('kvStore!.sync to ' + JSON.stringify(syncDeviceIds?.length));
            kvStore!.sync(syncDeviceIds, mode);
          } catch (e) {
            console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200 no peer device :e:' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1800
     * @tc.desc   Test Js Api DeviceKvStore.9.OnSyncComplete() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          //kvStore!.onSyncComplete((data) => {
          kvStore!.onSyncComplete((data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300 dataChange');
            expect(data != null).assertTrue();
          });
          await kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT).then((data:Error | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300 put success');
            expect(data == undefined).assertTrue();
          }).catch((error:Error | null) => {
            console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300 put failed:' +
              `, error code is ${error!.code}, message is ${error!.message}`);
            expect(null).assertFail();
          });
          try {
            let mode = factory.SyncMode.PUSH_PULL;
            //console.info('kvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(syncDeviceIds, mode);
          } catch (e) {
            console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300 no peer device :e:' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7200
     * @tc.desc   Test Js Api DeviceKvStore.9.SetSyncRange() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['C', 'D'];
          kvStore!.setSyncRange(localLabels, remoteSupportLabels,
            (err, data) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100 put success');
              console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100 put err:'+err?.code);
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7100
     * @tc.desc   Test Js Api DeviceKvStore.9.SetSyncRange() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0200');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['B', 'C'];
          kvStore!.setSyncRange(localLabels, remoteSupportLabels,
            (err, data) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0200 put success');
              console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100 put err:'+err?.code);
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7000
     * @tc.desc   Test Js Api DeviceKvStore.9.SetSyncRange() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0300');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['A', 'B'];
          kvStore!.setSyncRange(localLabels, remoteSupportLabels,
            (err, data) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0300 put success');
              console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100 put err:'+err?.code);
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4700
     * @tc.desc   Test Js Api DeviceKvStore.Put(Batch) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_string_key'+i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }
          //console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 entries: ' + JSON.stringify(entries));
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 entries: ' + JSON.stringify(entries!.length));
          kvStore!.putBatch(entries, (err, data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries(localDeviceId, 'batch_test_string_key',
              (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 getEntries success');
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 entrys.length: ' + entrys!.length);
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 entrys[0]: ' + JSON.stringify(entrys![0]));
                expect(entrys!.length == 10).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 entrys[0]:entrys.length == 10 ');
                expect(entrys![0].value.value == 'batch_test_string_value').assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 entrys[0]:entrys[0].value.value == batch_test_string_value ');
                done();
              });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4600
     * @tc.desc   Test Js Api DeviceKvStore.Put(Batch) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_number_key'+i,
              value: {
                type: factory.ValueType.LONG,
                value: 222 as long
              }
            });
          }
          //console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 entries: ' + JSON.stringify(entries));
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 entries: ' + JSON.stringify(entries!.length));
          kvStore!.putBatch(entries, (err, data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries(localDeviceId, 'batch_test_number_key',
              (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 getEntries success');
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 entrys.length: ' + entrys!.length);
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 entrys[0]: ' + JSON.stringify(entrys![0]));
                expect(entrys!.length == 10).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 entrys[0]: entrys.length == 10');
                expect(entrys![0].value.value == 222).assertTrue();
                done();
              });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4500
     * @tc.desc   Test Js Api DeviceKvStore.Put(Batch) testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_number_key'+i,
              value: {
                type: factory.ValueType.DOUBLE,
                value: 2.0
              }
            });
          }
          //console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 entries: ' + JSON.stringify(entries!));
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 entries: ' + JSON.stringify(entries?.length));

          kvStore!.putBatch(entries, (err, data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries(localDeviceId, 'batch_test_number_key',
              (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 getEntries success');
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 entrys.length: ' + entrys!.length);
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 entrys[0]: ' + JSON.stringify(entrys![0]));
                expect(entrys!.length == 10).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 entrys[0]: entrys.length == 10');
                expect(entrys![0].value.value == 2.0).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 entrys[0]: entrys[0].value.value == 2.0');
                done();
              });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4400
     * @tc.desc   Test Js Api DeviceKvStore.Put(Batch) testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_number_key'+i,
              value: {
                type: factory.ValueType.DOUBLE,
                value: 2.00
              }
            });
          }
          //console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 entries: ' + JSON.stringify(entries));
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 entries: ' + JSON.stringify(entries?.length));
          kvStore!.putBatch(entries, (err, data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries(localDeviceId, 'batch_test_number_key',
              (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 getEntries success');
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 entrys.length: ' + entrys!.length);
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 entrys[0]: ' + JSON.stringify(entrys![0]));
                expect(entrys!.length == 10).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 entrys[0]: entrys.length == 10');
                expect(entrys![0].value.value == 2.00).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 entrys[0]: entrys[0].value.value == 2.00');
                done();
              });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4300
     * @tc.desc   Test Js Api DeviceKvStore.Put(Batch) testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500');
        try {
          let bo = false;
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_bool_key'+i,
              value: {
                type: factory.ValueType.BOOLEAN,
                value: bo
              }
            });
          }
          //console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 entries: ' + JSON.stringify(entries));
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 entries: ' + JSON.stringify(entries?.length));
          kvStore!.putBatch(entries, (err, data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries(localDeviceId, 'batch_test_bool_key',
              (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 getEntries success');
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 entrys.length: ' + entrys!.length);
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 entrys[0]: ' + JSON.stringify(entrys![0]));
                expect(entrys!.length == 10).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 entrys[0]: entrys.length == 10');
                expect(entrys![0].value.value == bo).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 entrys[0]: entrys[0].value.value == bo');
                done();
              });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4800
     * @tc.desc   Test Js Api DeviceKvStore.Put(Batch) testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 start');
        try {
          let arr = new Uint8Array([21, 31]);
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_bool_key';
            let entry: factory.Entry = {
              key: key + i,
              value: {
                type: factory.ValueType.BYTE_ARRAY,
                value: arr
              }
            }
            entries.push(entry);
          }
          //console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 entries: ' + JSON.stringify(entries));
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 entries: ' + JSON.stringify(entries?.length));

          kvStore!.putBatch(entries, (err, data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 putBatch success err:'+err);
            expect(err == undefined).assertTrue();
            kvStore!.getEntries(localDeviceId, 'batch_test_bool_key',
              (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 getEntries success');
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 entrys.length: ' + entrys!.length);
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 entrys[0]: ' + JSON.stringify(entrys![0]));
                expect(entrys!.length == 10).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 entrys.length == 10');
                expect(entrys![0].value.value.toString() == arr.toString()).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 entrys[0].value.value == arr.toString()');
                done();
              });
          });
          done()
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5300
     * @tc.desc   Test Js Api DeviceKvStore.9.DeleteBatch() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100');
        try {
          let entries: factory.Entry[] = [];
          let keys: string[] = [];
          let key: string = 'batch_test_number_key'
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: key+i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
            keys.push(key + i);
          }
          //console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100 entries: ' + JSON.stringify(entries));
          console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100 entries: ' + JSON.stringify(entries?.length));

          kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.deleteBatch(keys, (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100 deleteBatch success');
              expect(err == undefined).assertTrue();
              done();
            });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5100
     * @tc.desc   Test Js Api DeviceKvStore.9.DeleteBatch() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0200');
        try {
          let keys: string[] = ['batch_test_string_key1', 'batch_test_string_key2'];
          kvStore!.deleteBatch(keys, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0200 deleteBatch success');
            expect(err == undefined).assertTrue();
            done();
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5200
     * @tc.desc   Test Js Api DeviceKvStore.9.DeleteBatch() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_number_key',
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }
          //console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300 entries: ' + JSON.stringify(entries));
          console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300 entries: ' + JSON.stringify(entries?.length));
          kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300 putBatch success');
            expect(err == undefined).assertTrue();
            let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
            kvStore!.deleteBatch(keys, (err, data) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300 deleteBatch success');
              expect(err == undefined).assertTrue();
              done();
            });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4200
     * @tc.desc   Test Js Api DeviceKvStore.9.startTransaction() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100');
        try {
          let count = 0;
          // kvStore!.onDataChange(0, (data) => {
          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 0' + data)
            count++;
          });
          kvStore!.startTransaction((err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 startTransaction success');
            expect(err == undefined).assertTrue();
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 entries: ' + JSON.stringify(entries!));
            kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 putBatch success');
              expect(err == undefined).assertTrue();
              let keys = Object.keys(entries).slice(5);
              kvStore!.deleteBatch(keys, (err: BusinessError | null, data: string[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 deleteBatch success');
                expect(err == undefined).assertTrue();
                kvStore!.commit((err: BusinessError | null, data: string[] | undefined) => {
                  console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 commit success');
                  expect(err == undefined).assertTrue();
                  await sleep(500);
                  expect(count == 1).assertTrue();
                  done();
                });
              });
            });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4100
     * @tc.desc   Test Js Api DeviceKvStore.9.startTransaction() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200');
        try {
          let count = 0;

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 0' + data)
            count++;
          });
          kvStore!.startTransaction((err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 startTransaction success');
            expect(err == undefined).assertTrue();
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 entries: ' + JSON.stringify(entries!));
            kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 putBatch success');
              expect(err == undefined).assertTrue();
              let keys = Object.keys(entries).slice(5);
              kvStore!.deleteBatch(keys, (err: BusinessError | null, data: string[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 deleteBatch success');
                expect(err == undefined).assertTrue();
                kvStore!.rollback((err: BusinessError | null, data: string[] | undefined) => {
                  console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 rollback success');
                  expect(err == undefined).assertTrue();
                  await sleep(500);
                  expect(count == 0).assertTrue();
                  done();
                });
              });
            });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6700
     * @tc.desc   Test Js Api DeviceKvStore.9.EnableSync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0100');
        try {
          kvStore!.enableSync(true, (err, data) => {
            if (err == undefined) {
              console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0100 enableSync success');
              expect(err == undefined).assertTrue();
            } else {
              console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0100 enableSync fail  err:'+err?.code);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6600
     * @tc.desc   Test Js Api DeviceKvStore.9.EnableSync() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0200');
        try {
          kvStore!.enableSync(false, (err, data) => {
            if (err == undefined) {
              console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0200 enableSync success');
              expect(err == undefined).assertTrue();
            } else {
              console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0200 enableSync fail err:'+err?.code);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6200
     * @tc.desc   Test Js Api DeviceKvStore.9.RemoveDeviceData() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100');
        try {
          kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT,
            (err: BusinessError | null, data: string[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100 put success');
              expect(err == undefined).assertTrue();
              let deviceid = 'no_exist_device_id';
              kvStore!.removeDeviceData(deviceid, (err: BusinessError | null, data: string[] | undefined) => {
                if (err == undefined) {
                  console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100 removeDeviceData success');
                  expect(null).assertFail();
                  done();
                } else {
                  console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100 removeDeviceData fail');
                  kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT,
                    (err: BusinessError | null,
                      data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                      console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100 get success');
                      expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
                      done();
                    });
                }
              });
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6500
     * @tc.desc   Test Js Api DeviceKvStore.9.RemoveDeviceData() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0300');
        try {
          kvStore!.removeDeviceData('', (err, data) => {
            if (err == undefined) {
              console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0300 removeDeviceData success');
              expect(null).assertFail();
            } else {
              console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0300 removeDeviceData fail');
            }
            done();
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3000
     * @tc.desc   Test Js Api DeviceKvStore.GetResultSet() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100');
        try {
          let resultSet: factory.KVStoreResultSet;
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_string_key'+i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }
          kvStore!.putBatch(entries, (err, data) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getResultSet(localDeviceId, 'batch_test_string_key',
              (err: BusinessError | null, resultSize: factory.KVStoreResultSet | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100 getResultSet success');
                resultSet = resultSize as factory.KVStoreResultSet;
                expect(resultSet.getCount() == 10).assertTrue();
                kvStore!.closeResultSet(resultSet, (err, data) => {
                  console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100 closeResultSet success');
                  expect(err == undefined).assertTrue();
                  done();
                })
              });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0100
     * @tc.desc   Test Js Api DeviceKvStore.GetResultSet() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0200');
        try {
          let resultSet: factory.KVStoreResultSet;
          kvStore!.getResultSet(localDeviceId, 'batch_test_string_key',
            (err: BusinessError | null, resultSize: factory.KVStoreResultSet | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0200 getResultSet success');
              resultSet = resultSize as factory.KVStoreResultSet;
              expect(resultSet.getCount() == 0).assertTrue();
              kvStore!.closeResultSet(resultSet, (err: BusinessError | null, data: string[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0200 closeResultSet success');
                expect(err == undefined).assertTrue();
                done();
              })
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3200
     * @tc.desc   Test Js Api DeviceKvStore.GetResultSet() testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500');
        try {
          let resultSet: factory.KVStoreResultSet;
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_string_key'+i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }
          kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("batch_test");
            kvStore!.getResultSet(localDeviceId, query,
              (err: BusinessError | null, resultSize: factory.KVStoreResultSet | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500 getResultSet success');
                resultSet = resultSize as factory.KVStoreResultSet;
                expect(resultSet.getCount() == 10).assertTrue();
                kvStore!.closeResultSet(resultSet, (err, data) => {
                  console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500 closeResultSet success');
                  expect(err == undefined).assertTrue();
                  done();
                })
              });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3100
     * @tc.desc   Test Js Api DeviceKvStore.GetResultSet() testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600');
        try {
          let resultSet: factory.KVStoreResultSet;
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_string_key'+i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }
          kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("batch_test");
            query.deviceId(localDeviceId);
            kvStore!.getResultSet(query,
              (err: BusinessError | null, resultSize: factory.KVStoreResultSet | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600 getResultSet success');
                resultSet = resultSize as factory.KVStoreResultSet;
                expect(resultSet.getCount() == 10).assertTrue();
                kvStore!.closeResultSet(resultSet, (err, data) => {
                  console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600 closeResultSet success');
                  expect(err == undefined).assertTrue();
                  done();
                })
              });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3300
     * @tc.desc   Test Js Api DeviceKvStore.GetResultSet() testcase 007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700');
        try {
          let resultSet: factory.KVStoreResultSet;
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_string_key'+i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }
          kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("batch_test");
            kvStore!.getResultSet(localDeviceId, query,
              (err: BusinessError | null, resultSize: factory.KVStoreResultSet | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700 getResultSet success');
                resultSet = resultSize as factory.KVStoreResultSet;
                expect(resultSet.getCount() == 10).assertTrue();
                kvStore!.closeResultSet(resultSet, (err: BusinessError | null, data) => {
                  console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700 closeResultSet success');
                  expect(err == undefined).assertTrue();
                  done();
                })
              });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2600
     * @tc.desc   Test Js Api DeviceKvStore.9.CloseResultSet() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0200');
        try {
          let resultSet: factory.KVStoreResultSet;
          //await kvStore!.getResultSet(localDeviceId, 'batch_test_string_key', async (err, result) => {
          kvStore!.getResultSet(localDeviceId, 'batch_test_string_key',
            (err: Error | null, result: factory.KVStoreResultSet | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0200 getResultSet success');
              resultSet = result as factory.KVStoreResultSet;

              kvStore!.closeResultSet(resultSet, (err ,data) => {
                if (err == undefined) {
                  console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0200 closeResultSet success');
                  expect(err == undefined).assertTrue();
                } else {
                  console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0200 closeResultSet fail');
                  expect(null).assertFail();
                }
                done();
              });
            });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3700
     * @tc.desc   Test Js Api DeviceKvStore.Get(ResultSize) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0100');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_string_key'+i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }
          kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0100 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("batch_test");
            query.deviceId(localDeviceId);
            kvStore!.getResultSize(query, (err: BusinessError | null, resultSize: int | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0100 getResultSet success');
              expect(resultSize == 10).assertTrue();
              done();
            });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3600
     * @tc.desc   Test Js Api DeviceKvStore.Get(ResultSize) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0200');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_string_key'+i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }
          kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0200 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("batch_test");
            kvStore!.getResultSize(localDeviceId, query,
              (err: BusinessError | null, resultSize: int | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0200 getResultSet success');
                expect(resultSize == 10).assertTrue();
                done();
              });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5000
     * @tc.desc   Test Js Api DeviceKvStore.GetEntries() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100');
        try {
          let arr = new Uint8Array([21, 31]);
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_bool_key'+i,
              value: {
                type: factory.ValueType.BYTE_ARRAY,
                value: arr
              }
            });
          }
          //console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 entries: ' + JSON.stringify(entries));
          console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 entries: ' + JSON.stringify(entries!.length));
          kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.deviceId(localDeviceId);
            query.prefixKey("batch_test");
            kvStore!.getEntries(localDeviceId, query,
              (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
                console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 getEntries success');
                console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 entrys.length: ' + entrys!.length);
                console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 entrys[0]: ' + JSON.stringify(entrys![0]));
                expect(entrys!.length == 10).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 entrys.length == 10');
                expect(entrys![0].value.value.toString() == arr.toString()).assertTrue();
                console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 entrys[0].value.value== arr.toString()');
                console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 success');
                done();
              });
          });

        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4900
     * @tc.desc   Test Js Api DeviceKvStore.GetEntries() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200');
        try {
          let arr = new Uint8Array([21, 31]);
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_bool_key'+i,
              value: {
                type: factory.ValueType.BYTE_ARRAY,
                value: arr
              }
            });
          }
          console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 entries: ' + JSON.stringify(entries?.length));
          kvStore!.putBatch(entries, (err: BusinessError | null, data: string[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("batch_test");
            query.deviceId(localDeviceId);
            kvStore!.getEntries(query, (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
              console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 getEntries success');
              console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 entrys.length: ' + entrys?.length);
              console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 entrys[0]: ' + JSON.stringify(entrys![0]));
              expect(entrys!.length == 10).assertTrue();
              console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 entrys!.length == 10');
              expect(entrys![0].value.value.toString() == arr.toString()).assertTrue();
              console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 entrys![0].value.value == arr.toString()');
              console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 success');
              done();
            });
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })
  })
}