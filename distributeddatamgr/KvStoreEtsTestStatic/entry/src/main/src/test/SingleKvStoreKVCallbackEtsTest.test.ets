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
} from '../../../hypium';
import factory from '@ohos.data.distributedKVStore'

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
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
const TEST_STORE_ID = 'storeId';
let kvManager: factory.KVManager | null = null;
let kvStore: factory.SingleKVStore | null = null;

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


export default function SingleKvStoreCallbackTest() {
  describe('SingleKvStoreCallbackTest', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.SINGLE_VERSION,
      securityLevel: factory.SecurityLevel.S2,
    }

    beforeAll(async (done: () => void) => {
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
      };

      console.info('beforeAll config:' + JSON.stringify(config));
      kvManager = factory.createKVManager(config)
      console.info('beforeAll end');
      done();
    })

    afterAll(async (done: () => void): Promise<void> => {
      console.info('afterAll');
      kvManager = null;
      kvStore = null;
      done();
    })

    beforeEach(async (done: () => void): Promise<void> => {
      console.info('beforeEach' + JSON.stringify(options));
      // await kvManager!.getKVStore(TEST_STORE_ID, options,  (err, store)=> {

      try {
        const store = await kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options);
        kvStore = store;
        console.info('beforeEach getKVStore success');
        done();
      } catch (err) {
        console.error('beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      }
    });

    afterEach(async (done: () => void) => {
      console.info('afterEach');
      if (!kvManager) {
        console.error('kvManager is null');
        expect(false).assertTrue();
      } 
      await (kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID) as Promise<void>).then(async () => {
        console.info('afterEach closeKVStore success');
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('afterEach deleteKVStore success');
          kvStore = null;
          done();
        }).catch((err) => {
          console.info('afterEach deleteKVStore err ' + err);
          done();
        });
      }).catch((err) => {
        console.info('afterEach closeKVStore err ' + err);
        done();
      });

    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0800
     * @tc.desc   Test Js Api SingleKvStore.Put(String) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutStringCallbackTest001');
        try {
          kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT,
            (err: Error | null, data: string[] | undefined) => {
              if (err == undefined) {
                console.info('SingleKvStorePutStringCallbackTest001 put success');
              } else {
                console.error('SingleKvStorePutStringCallbackTest001 put fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
              }
              done();
            });
        } catch (e) {
          console.error('SingleKvStorePutStringCallbackTest001 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0700
     * @tc.desc   Test Js Api SingleKvStore.Put(String) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutStringCallbackTest002');
        try {
          let str = '';
          for (let i = 0; i < 4095; i++) {
            str += 'x';
          }
          kvStore!.put(KEY_TEST_STRING_ELEMENT + '102', str,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStorePutStringCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_STRING_ELEMENT + '102',
                (err: Error | null,
                  data: boolean | string | Long | Double | Uint8Array | undefined): void => {
                  console.info('SingleKvStorePutStringCallbackTest002 get success');
                  expect(str == data).assertTrue();
                  done();
                });
            });
        } catch (e) {
          console.error('SingleKvStorePutStringCallbackTest002 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0200
     * @tc.desc   Test Js Api SingleKvStore.GetString() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreGetStringCallbackTest001');
        try {
          kvStore!.get(KEY_TEST_STRING_ELEMENT,
            (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
              if (err == undefined) {
                console.info('SingleKvStoreGetStringCallbackTest001 get success');
                expect(null).assertFail();
              } else {
                console.error('SingleKvStoreGetStringCallbackTest001 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
                expect(err.code == 15100004).assertTrue();
              }
              done();
            });
        } catch (e) {
          console.error('SingleKvStoreGetStringCallbackTest001 get e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0900
     * @tc.desc   Test Js Api SingleKvStore.GetString() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreGetStringCallbackTest002');
        try {
          kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT,
            async (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreGetStringCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_STRING_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info('SingleKvStoreGetStringCallbackTest002 get success');
                  expect((err == undefined) && (VALUE_TEST_STRING_ELEMENT == data)).assertTrue();
                  done();
                });
            })
        } catch (e) {
          console.error('SingleKvStoreGetStringCallbackTest002 get e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0500
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutIntCallbackTest001');
        try {
          kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStorePutIntCallbackTest001 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_INT_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info('SingleKvStorePutIntCallbackTest001 get success');
                  expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
                  done();
                })
            });
        } catch (e) {
          console.error('SingleKvStorePutIntCallbackTest001 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1000
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutIntCallbackTest002');
        try {
          let intValue = 987654321 as long;
          kvStore!.put(KEY_TEST_INT_ELEMENT, intValue,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStorePutIntCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_INT_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info('SingleKvStorePutIntCallbackTest002 get success');
                  expect((err == undefined) && (intValue == data)).assertTrue();
                  done();
                })
            });
        } catch (e) {
          console.error('SingleKvStorePutIntCallbackTest002 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0400
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutIntCallbackTest003');
        try {
          let intValue = Number.MIN_VALUE;
          kvStore!.put(KEY_TEST_INT_ELEMENT, intValue,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStorePutIntCallbackTest003 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_INT_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info('SingleKvStorePutIntCallbackTest003 get success');
                  expect((err == undefined) && (intValue == data)).assertTrue();
                  done();
                })
            });
        } catch (e) {
          console.error('SingleKvStorePutIntCallbackTest003 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0300
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutIntCallbackTest004');
        try {
          let intValue = Number.MAX_VALUE;
          kvStore!.put(KEY_TEST_INT_ELEMENT, intValue,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStorePutIntCallbackTest004 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_INT_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info('SingleKvStorePutIntCallbackTest004 get success');
                  expect((err == undefined) && (intValue == data)).assertTrue();
                  done();
                })
            });
        } catch (e) {
          console.error('SingleKvStorePutIntCallbackTest004 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0900
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0600
     * @tc.desc   Test Js Api SingleKvStore.GetInt() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreGetIntCallbackTest001');
        try {
          kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreGetIntCallbackTest001 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_INT_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info('SingleKvStoreGetIntCallbackTest001 get success');
                  expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
                  done();
                })
            });
        } catch (e) {
          console.error('SingleKvStoreGetIntCallbackTest001 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1000
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0100
     * @tc.desc   Test Js Api SingleKvStore.GetInt() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreGetIntCallbackTest002');
        try {
          kvStore!.get(KEY_TEST_INT_ELEMENT,
            (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
              if (err == undefined) {
                console.info('SingleKvStoreGetIntCallbackTest002 get success');
                expect(null).assertFail();
              } else {
                console.error('SingleKvStoreGetIntCallbackTest002 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
                expect(err.code == 15100004).assertTrue();
              }
              done();
            })
        } catch (e) {
          console.error('SingleKvStoreGetIntCallbackTest002 put e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_1100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2000
     * @tc.desc   Test Js Api SingleKvStore.Put(Bool) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutBoolCallbackTest001');
        try {
          kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStorePutBoolCallbackTest001 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SingleKvStorePutBoolCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1300
     * @tc.desc   Test Js Api SingleKvStore.GetBool() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreGetBoolCallbackTest001');
        try {
          kvStore!.get(KEY_TEST_INT_ELEMENT,
            (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
              if (err == undefined) {
                console.info('SingleKvStoreGetBoolCallbackTest001 get success');
                expect(null).assertFail();
              } else {
                console.error('SingleKvStoreGetBoolCallbackTest001 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
                expect(err.code == 15100004).assertTrue();
              }
              done();
            });
        } catch (e) {
          console.error('SingleKvStoreGetBoolCallbackTest001 e' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2500
     * @tc.desc   Test Js Api SingleKvStore.GetBool() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreGetBoolCallbackTest002');
        try {
          kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreGetBoolCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_BOOLEAN_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info('SingleKvStoreGetBoolCallbackTest002 get success');
                  console.error(`SingleKvStoreGetBoolCallbackTest002 VALUE_TEST_BOOLEAN_ELEMENT is ${VALUE_TEST_BOOLEAN_ELEMENT}`);
                  console.error(`SingleKvStoreGetBoolCallbackTest002 data is ${data}`);
                  expect((err == undefined) && (VALUE_TEST_BOOLEAN_ELEMENT == data)).assertTrue();
                  done();
                });
            })
        } catch (e) {
          console.error('SingleKvStoreGetBoolCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_1400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2100
     * @tc.desc   Test Js Api SingleKvStore.Put(Float) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutFloatCallbackTest001');
        try {
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStorePutFloatCallbackTest001 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SingleKvStorePutFloatCallbackTest001 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2200
     * @tc.desc   Test Js Api SingleKvStore.Put(Float) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutFloatCallbackTest002');
        try {
          let floatValue = 123456.654321;
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStorePutFloatCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_FLOAT_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info('SingleKvStorePutFloatCallbackTest002 get success');
                  expect((err == undefined) && (floatValue == data)).assertTrue();
                  done();
                })
            });
        } catch (e) {
          console.error('SingleKvStorePutFloatCallbackTest002 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2400
     * @tc.desc   Test Js Api SingleKvStore.Put(Float) testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutFloatCallbackTest003');
        try {
          let floatValue = 123456.0;
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStorePutFloatCallbackTest003 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_FLOAT_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info('SingleKvStorePutFloatCallbackTest003 get success');
                  expect((err == undefined) && (floatValue == data)).assertTrue();
                  done();
                })
            });
        } catch (e) {
          console.error('SingleKvStorePutFloatCallbackTest003 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2300
     * @tc.desc   Test Js Api SingleKvStore.Put(Float) testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutFloatCallbackTest004');
        try {
          let floatValue = 123456.00;
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStorePutFloatCallbackTest004 put success');
              expect(err == undefined).assertTrue();
              kvStore!.get(KEY_TEST_FLOAT_ELEMENT,
                (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
                  console.info('SingleKvStorePutFloatCallbackTest004 get success');
                  expect((err == undefined) && (floatValue == data)).assertTrue();
                  done();
                })
            });
        } catch (e) {
          console.error('SingleKvStorePutFloatCallbackTest004 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1400
     * @tc.desc   Test Js Api SingleKvStore.GetFloat() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreGetFloatCallbackTest001');
        try {
          kvStore!.get(KEY_TEST_FLOAT_ELEMENT,
            (err: Error | null, data: undefined | Boolean | String | Long | Double | Uint8Array): void => {
              if (err == undefined) {
                console.info('SingleKvStoreGetFloatCallbackTest001 get success');
                expect(null).assertFail();
              } else {
                console.error('SingleKvStoreGetFloatCallbackTest001 get fail' +
                  `, error code is ${err.code}, message is ${err.message}`);
                expect(err.code == 15100004).assertTrue();
              }
              done();
            });
        } catch (e) {
          console.error('SingleKvStoreGetFloatCallbackTest001 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_1900
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1800
     * @tc.desc   Test Js Api SingleKvStore.DeleteString() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreDeleteStringCallbackTest001');
        try {
          kvStore!.delete(KEY_TEST_STRING_ELEMENT, (err: Error | null, data: string[] | undefined): void => {
            if (err == undefined) {
              console.info('SingleKvStoreDeleteStringCallbackTest001 delete success');
            } else {
              console.error('SingleKvStoreDeleteStringCallbackTest001 delete fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SingleKvStoreDeleteStringCallbackTest001 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2000
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2900
     * @tc.desc   Test Js Api SingleKvStore.DeleteString() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreDeleteStringCallbackTest002');
        try {
          kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT,
            async (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreDeleteStringCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              kvStore!.delete(KEY_TEST_STRING_ELEMENT, (err: Error | null, data: string[] | undefined): void => {
                console.info('SingleKvStoreDeleteStringCallbackTest002 delete success');
                expect(err == undefined).assertTrue();
                done();
              });
            })
        } catch (e) {
          console.error('SingleKvStoreDeleteStringCallbackTest002 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1700
     * @tc.desc   Test Js Api SingleKvStore.DeleteInt() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreDeleteIntCallbackTest001');
        try {
          kvStore!.delete(KEY_TEST_INT_ELEMENT, (err: Error | null, data: string[] | undefined): void => {
            if (err == undefined) {
              console.info('SingleKvStoreDeleteIntCallbackTest001 get success');
            } else {
              console.error('SingleKvStoreDeleteIntCallbackTest001 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SingleKvStoreDeleteIntCallbackTest001 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2800
     * @tc.desc   Test Js Api SingleKvStore.DeleteInt() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreDeleteIntCallbackTest002');
        try {
          kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreDeleteIntCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              kvStore!.delete(KEY_TEST_INT_ELEMENT, (err: Error | null, data: string[] | undefined): void => {
                console.info('SingleKvStoreDeleteIntCallbackTest002 delete success');
                expect(err == undefined).assertTrue();
                done();
              });
            })
        } catch (e) {
          console.error('SingleKvStoreDeleteIntCallbackTest002 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1600
     * @tc.desc   Test Js Api SingleKvStore.DeleteFloat() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreDeleteFloatCallbackTest001');
        try {
          kvStore!.delete(KEY_TEST_FLOAT_ELEMENT, (err: Error | null, data: string[] | undefined): void => {
            if (err == undefined) {
              console.info('SingleKvStoreDeleteFloatCallbackTest001 get success');
            } else {
              console.error('SingleKvStoreDeleteFloatCallbackTest001 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SingleKvStoreDeleteFloatCallbackTest001 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2700
     * @tc.desc   Test Js Api SingleKvStore.DeleteFloat() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreDeleteFloatCallbackTest002');
        try {
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreDeleteFloatCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              kvStore!.delete(KEY_TEST_FLOAT_ELEMENT, (err: Error | null, data: string[] | undefined): void => {
                console.info('SingleKvStoreDeleteFloatCallbackTest002 delete success');
                expect(err == undefined).assertTrue();
                done();
              });
            })
        } catch (e) {
          console.error('SingleKvStoreDeleteFloatCallbackTest002 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1500
     * @tc.desc   Test Js Api SingleKvStore.DeleteBool() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreDeleteBoolCallbackTest001');
        try {
          kvStore!.delete(KEY_TEST_BOOLEAN_ELEMENT, (err: Error | null, data: string[] | undefined): void => {
            if (err == undefined) {
              console.info('SingleKvStoreDeleteBoolCallbackTest001 get success');
            } else {
              console.error('SingleKvStoreDeleteBoolCallbackTest001 get fail' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SingleKvStoreDeleteBoolCallbackTest001 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2600
     * @tc.desc   Test Js Api SingleKvStore.DeleteBool() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreDeleteBoolCallbackTest002');
        try {
          kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreDeleteBoolCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              kvStore!.delete(KEY_TEST_BOOLEAN_ELEMENT,
                (err: Error | null, data: string[] | undefined): void => {
                  console.info('SingleKvStoreDeleteBoolCallbackTest002 delete success');
                  expect(err == undefined).assertTrue();
                  done();
                });
            })
        } catch (e) {
          console.error('SingleKvStoreDeleteBoolCallbackTest002 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1900
     * @tc.desc   Test Js Api SingleKvStore.Delete() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2700');
        try {
          kvStore!.delete(KEY_TEST_STRING_ELEMENT, (err: Error | null, data: string[] | undefined): void => {
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2700 delete err: ' + err);
            expect(err == undefined).assertTrue();
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2700 expect fin');
            done();
          });
        } catch (e) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2700 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(e.code == 401).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1100
     * @tc.desc   Test Js Api SingleKvStore.Delete() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log('SingleKvStoreDeletePredicatesCallbackTest002');
        try {
          kvStore!.put("name", "Bob", async (err: Error | null, data: string[] | undefined): void => {
            console.log('SingleKvStoreDeletePredicatesCallbackTest002 put success');
            expect(err == undefined).assertTrue();
            kvStore!.delete("name", (err: Error | null, data: string[] | undefined): void => {
              console.log('SingleKvStoreDeletePredicatesCallbackTest002 delete success');
              expect(err == undefined).assertTrue();
              done();
            });
          })
        } catch (e) {
          console.error('SingleKvStoreDeletePredicatesCallbackTest002 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3000
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3300
     * @tc.desc   Test Js Api SingleKvStore.OnChange() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreOnChangeCallbackTest001');
        try {
          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
            console.info('SingleKvStoreOnChangeCallbackTest001 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreOnChangeCallbackTest001 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SingleKvStoreOnChangeCallbackTest001 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3400
     * @tc.desc   Test Js Api SingleKvStore.OnChange() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreOnChangeCallbackTest002');
        try {
          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE, (data) => {
            console.info('SingleKvStoreOnChangeCallbackTest002 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreOnChangeCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SingleKvStoreOnChangeCallbackTest002 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3500
     * @tc.desc   Test Js Api SingleKvStore.OnChange() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreOnChangeCallbackTest003');
        try {
          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE, (data) => {
            console.info('SingleKvStoreOnChangeCallbackTest003 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreOnChangeCallbackTest003 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SingleKvStoreOnChangeCallbackTest003 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3000
     * @tc.desc   Test Js Api SingleKvStore.OnSyncComplete() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info('SingleKvStoreOnSyncCompleteCallbackTest001 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test001', VALUE_TEST_SYNC_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreOnSyncCompleteCallbackTest001 put success');
              expect(err == undefined).assertTrue();
            });
          try {
            let mode = factory.SyncMode.PULL_ONLY;
            console.info('kvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(syncDeviceIds, mode, 10);
          } catch (e) {
            console.error('SingleKvStoreOnSyncCompleteCallbackTest001 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error('SingleKvStoreOnSyncCompleteCallbackTest001 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3100
     * @tc.desc   Test Js Api SingleKvStore.OnSyncComplete() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info('SingleKvStoreOnSyncCompleteCallbackTest002 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test002', VALUE_TEST_SYNC_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreOnSyncCompleteCallbackTest002 put success');
              expect(err == undefined).assertTrue();
            });
          try {
            let mode = factory.SyncMode.PUSH_ONLY;
            console.info('kvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(syncDeviceIds, mode, 10);
          } catch (e) {
            console.error('SingleKvStoreOnSyncCompleteCallbackTest002 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error('SingleKvStoreOnSyncCompleteCallbackTest002 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3200
     * @tc.desc   Test Js Api SingleKvStore.OnSyncComplete() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info('SingleKvStoreOnSyncCompleteCallbackTest003 dataChange');
            expect(data != null).assertTrue();
          });
          kvStore!.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test003', VALUE_TEST_SYNC_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreOnSyncCompleteCallbackTest003 put success');
              expect(err == undefined).assertTrue();
            });
          try {
            let mode = factory.SyncMode.PUSH_PULL;
            console.info('kvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(syncDeviceIds, mode, 10);
          } catch (e) {
            console.error('SingleKvStoreOnSyncCompleteCallbackTest003 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
          }
        } catch (e) {
          console.error('SingleKvStoreOnSyncCompleteCallbackTest003 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_3600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7500
     * @tc.desc   Test Js Api SingleKvStore.SetSyncRange() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreSetSyncRangeCallbackTest001');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['C', 'D'];
          kvStore!.setSyncRange(localLabels, remoteSupportLabels,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreSetSyncRangeCallbackTest001 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SingleKvStoreSetSyncRangeCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_3700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7600
     * @tc.desc   Test Js Api SingleKvStore.SetSyncRange() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreSetSyncRangeCallbackTest002');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['B', 'C'];
          kvStore!.setSyncRange(localLabels, remoteSupportLabels,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreSetSyncRangeCallbackTest002 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SingleKvStoreSetSyncRangeCallbackTest002 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_3800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7700
     * @tc.desc   Test Js Api SingleKvStore.SetSyncRange() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreSetSyncRangeCallbackTest003');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['A', 'B'];
          kvStore!.setSyncRange(localLabels, remoteSupportLabels,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreSetSyncRangeCallbackTest003 put success');
              expect(err == undefined).assertTrue();
              done();
            });
        } catch (e) {
          console.error('SingleKvStoreSetSyncRangeCallbackTest003 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_3900
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5400
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutBatchEntryCallbackTest001  start');
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
          console.info('SingleKvStorePutBatchEntryCallbackTest001 entries: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined): void => {
            console.info('SingleKvStorePutBatchEntryCallbackTest001 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries('batch_test_string_key', (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info('SingleKvStorePutBatchEntryCallbackTest001 getEntries success');
              console.info('SingleKvStorePutBatchEntryCallbackTest001 entrys.length: ' + entrys!.length);
              console.info('SingleKvStorePutBatchEntryCallbackTest001 entrys[0]: ' + JSON.stringify(entrys![0]));
              expect(entrys!.length == 10).assertTrue();
              expect(entrys![0].value.value == 'batch_test_string_value0').assertTrue();
              done();
            });
          });
        } catch (e) {
          console.error('SingleKvStorePutBatchEntryCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4000
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5300
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutBatchEntryCallbackTest002');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_number_key' + i,
              value: {
                type: factory.ValueType.LONG,
                value: 222 as long
              }
            });
          }
          console.info('SingleKvStorePutBatchEntryCallbackTest002 entries: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined): void => {
            console.info('SingleKvStorePutBatchEntryCallbackTest002 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries('batch_test_number_key', (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info('SingleKvStorePutBatchEntryCallbackTest002 getEntries success');
              console.info('SingleKvStorePutBatchEntryCallbackTest002 entrys.length: ' + entrys!.length);
              console.info('SingleKvStorePutBatchEntryCallbackTest002 entrys[0]: ' + JSON.stringify(entrys![0]));
              expect(entrys!.length == 10).assertTrue();
              expect(entrys![0].value.value == 222).assertTrue();
              done();
            });
          });
        } catch (e) {
          console.error('SingleKvStorePutBatchEntryCallbackTest002 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5200
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutBatchEntryCallbackTest003');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_number_key' + i,
              value: {
                type: factory.ValueType.DOUBLE,
                value: 2.0
              }
            });
          }
          console.info('SingleKvStorePutBatchEntryCallbackTest003 entries: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined) => {
            console.info('SingleKvStorePutBatchEntryCallbackTest003 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries('batch_test_number_key', (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info('SingleKvStorePutBatchEntryCallbackTest003 getEntries success');
              console.info('SingleKvStorePutBatchEntryCallbackTest003 entrys.length: ' + entrys!.length);
              console.info('SingleKvStorePutBatchEntryCallbackTest003 entrys[0]: ' + JSON.stringify(entrys![0]));
              expect(entrys!.length == 10).assertTrue();
              expect(entrys![0].value.value == 2.0).assertTrue();
              done();
            });
          });
        } catch (e) {
          console.error('SingleKvStorePutBatchEntryCallbackTest003 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5100
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutBatchEntryCallbackTest004');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_number_key' + i,
              value: {
                type: factory.ValueType.DOUBLE,
                value: 2.00
              }
            });
          }
          console.info('SingleKvStorePutBatchEntryCallbackTest004 entries: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined) => {
            console.info('SingleKvStorePutBatchEntryCallbackTest004 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries('batch_test_number_key', (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info('SingleKvStorePutBatchEntryCallbackTest004 getEntries success');
              console.info('SingleKvStorePutBatchEntryCallbackTest004 entrys.length: ' + entrys!.length);
              console.info('SingleKvStorePutBatchEntryCallbackTest004 entrys[0]: ' + JSON.stringify(entrys![0]));
              expect(entrys!.length == 10).assertTrue();
              expect(entrys![0].value.value == 2.00).assertTrue();
              done();
            });
          });
        } catch (e) {
          console.error('SingleKvStorePutBatchEntryCallbackTest004 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4900
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4300');
        try {
          let bo = false;
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_bool_key' + i,
              value: {
                type: factory.ValueType.BOOLEAN,
                value: bo
              }
            });
          }
          console.info('SingleKvStorePutBatchEntryCallbackTest005 entries: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined) => {
            console.info('SingleKvStorePutBatchEntryCallbackTest005 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries('batch_test_bool_key', (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info('SingleKvStorePutBatchEntryCallbackTest005 getEntries success');
              console.info('SingleKvStorePutBatchEntryCallbackTest005 entrys.length: ' + entrys!.length);
              console.info('SingleKvStorePutBatchEntryCallbackTest005 entrys[0]: ' + JSON.stringify(entrys![0]));
              expect(entrys!.length == 10).assertTrue();
              expect(entrys![0].value.value == bo).assertTrue();
              done();
            });
          });
        } catch (e) {
          console.error('SingleKvStorePutBatchEntryCallbackTest005 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5000
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorePutBatchEntryCallbackTest006');
        try {
          let arr = new Uint8Array([21, 31]);
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_bool_key' + i,
              value: {
                type: factory.ValueType.BYTE_ARRAY,
                value: arr
              }
            });
          }
          console.info('SingleKvStorePutBatchEntryCallbackTest006 entries: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined) => {
            console.info('SingleKvStorePutBatchEntryCallbackTest006 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries('batch_test_bool_key', (err: Error | null, entrys: factory.Entry[] | undefined) => {
              console.info('SingleKvStorePutBatchEntryCallbackTest006 getEntries success');
              console.info('SingleKvStorePutBatchEntryCallbackTest006 entrys.length: ' + entrys!.length);
              console.info('SingleKvStorePutBatchEntryCallbackTest006 entrys[0]: ' + JSON.stringify(entrys![0]));
              expect(entrys!.length == 10).assertTrue();
              expect(entrys![0].value.value.toString() == arr.toString()).assertTrue();
              done();
            });
          });
        } catch (e) {
          console.error('SingleKvStorePutBatchEntryCallbackTest006 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5600
     * @tc.desc   Test Js Api SingleKvStore.DeleteBatch() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreDeleteBatchCallbackTest001');
        try {
          let keys: string[] = [];
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_string_key';
            entries.push({
              key:key + i ,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
            keys.push(key + i);
          }
          console.info('SingleKvStoreDeleteBatchCallbackTest001 entries: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined) => {
            console.info('SingleKvStoreDeleteBatchCallbackTest001 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.deleteBatch(keys, (err: Error | null, data: string[] | undefined) => {
              console.info('SingleKvStoreDeleteBatchCallbackTest001 deleteBatch success');
              expect(err == undefined).assertTrue();
              done();
            });
          });
        } catch (e) {
          console.error('SingleKvStoreDeleteBatchCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCH_CALLBACK_4600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5700
     * @tc.desc   Test Js Api SingleKvStore.DeleteBatch() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCH_CALLBACK_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreDeleteBatchCallbackTest002');
        try {
          let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
          kvStore!.deleteBatch(keys, (err: Error | null, data: string[] | undefined) => {
            console.info('SingleKvStoreDeleteBatchCallbackTest002 deleteBatch success');
            expect(err == undefined).assertTrue();
            done();
          });
        } catch (e) {
          console.error('SingleKvStoreDeleteBatchCallbackTest002 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCH_CALLBACK_4700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5500
     * @tc.desc   Test Js Api SingleKvStore.DeleteBatch() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCH_CALLBACK_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreDeleteBatchCallbackTest003');
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
          console.info('SingleKvStoreDeleteBatchCallbackTest003 entries: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined) => {
            console.info('SingleKvStoreDeleteBatchCallbackTest003 putBatch success');
            expect(err == undefined).assertTrue();
            let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
            kvStore!.deleteBatch(keys, (err: Error | null, data: string[] | undefined) => {
              console.info('SingleKvStoreDeleteBatchCallbackTest003 deleteBatch success');
              expect(err == undefined).assertTrue();
              done();
            });
          });
        } catch (e) {
          console.error('SingleKvStoreDeleteBatchCallbackTest003 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_TRANS_CALLBACK_4800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6100
     * @tc.desc   Test Js Api SingleKvStore.startTransaction() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_TRANS_CALLBACK_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorestartTransactionCallbackTest001');
        try {
          let count = 0;
          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
            console.info('SingleKvStorestartTransactionCallbackTest001 0' + data)
            count++;
          });
          kvStore!.startTransaction((err: Error | null, data: string[] | undefined) => {
            console.info('SingleKvStorestartTransactionCallbackTest001 startTransaction success');
            expect(err == undefined).assertTrue();
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('SingleKvStorestartTransactionCallbackTest001 entries: ' + JSON.stringify(entries));
            kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined) => {
              console.info('SingleKvStorestartTransactionCallbackTest001 putBatch success');
              expect(err == undefined).assertTrue();
              let keys = Object.keys(entries).slice(5);
              kvStore!.deleteBatch(keys, (err: Error | null, data: string[] | undefined) => {
                console.info('SingleKvStorestartTransactionCallbackTest001 deleteBatch success');
                expect(err == undefined).assertTrue();
                kvStore!.commit((err: Error | null, data: string[] | undefined) => {
                  console.info('SingleKvStorestartTransactionCallbackTest001 commit success');
                  expect(err == undefined).assertTrue();
                  await sleep(500);
                  expect(count == 1).assertTrue();
                  done();
                });
              });
            });
          });
        } catch (e) {
          console.error('SingleKvStorestartTransactionCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_TRANS_CALLBACK_4900
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6200
     * @tc.desc   Test Js Api SingleKvStore.startTransaction() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_TRANS_CALLBACK_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStorestartTransactionCallbackTest002');
        try {
          let count = 0;

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
            console.info('SingleKvStorestartTransactionCallbackTest002 0' + data)
            count++;
          });
          kvStore!.startTransaction((err: Error | null, data: string[] | undefined) => {
            console.info('SingleKvStorestartTransactionCallbackTest002 startTransaction success');
            expect(err == undefined).assertTrue();
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('SingleKvStorestartTransactionCallbackTest002 entries: ' + JSON.stringify(entries));
            kvStore!.putBatch(entries, (err: Error | null, data: string[] | undefined) => {
              console.info('SingleKvStorestartTransactionCallbackTest002 putBatch success');
              expect(err == undefined).assertTrue();
              let keys = Object.keys(entries).slice(5);
              kvStore!.deleteBatch(keys, (err: Error | null, data: string[] | undefined) => {
                console.info('SingleKvStorestartTransactionCallbackTest002 deleteBatch success');
                expect(err == undefined).assertTrue();
                kvStore!.rollback((err: Error | null, data: string[] | undefined) => {
                  console.info('SingleKvStorestartTransactionCallbackTest002 rollback success');
                  expect(err == undefined).assertTrue();
                  await sleep(500);
                  expect(count == 0).assertTrue();
                  done();
                });
              });
            });
          });
        } catch (e) {
          console.error('SingleKvStorestartTransactionCallbackTest002 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ROLLBACK_CALLBACK_5600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_8200
     * @tc.desc   Test Js Api SingleKvStore.Rollback() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ROLLBACK_CALLBACK_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(' ');
        try {
          kvStore!.rollback((err: Error | null, data: string[] | undefined) => {
            if (err == undefined) {
              console.info('SingleKvStoreRollbackCallbackTest001 commit success');
              expect(null).assertFail();
            } else {
              console.info('SingleKvStoreRollbackCallbackTest001 commit fail');
            }
            done();
          });
        } catch (e) {
          console.error('SingleKvStoreRollbackCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ENABLE_CALLBACK_5900
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6800
     * @tc.desc   Test Js Api SingleKvStore.EnableSync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLE_CALLBACK_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreEnableSyncCallbackTest001');
        try {
          kvStore!.enableSync(true, (err: Error | null, data: string[] | undefined) => {
            if (err == undefined) {
              console.info('SingleKvStoreEnableSyncCallbackTest001 enableSync success');
              expect(err == undefined).assertTrue();
            } else {
              console.info('SingleKvStoreEnableSyncCallbackTest001 enableSync fail');
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SingleKvStoreEnableSyncCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ENABLE_CALLBACK_6000
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6700
     * @tc.desc   Test Js Api SingleKvStore.EnableSync() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLE_CALLBACK_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreEnableSyncCallbackTest002');
        try {
          kvStore!.enableSync(false, (err: Error | null, data: string[] | undefined) => {
            if (err == undefined) {
              console.info('SingleKvStoreEnableSyncCallbackTest002 enableSync success');
              expect(err == undefined).assertTrue();
            } else {
              console.info('SingleKvStoreEnableSyncCallbackTest002 enableSync fail');
              expect(null).assertFail();
            }
            done();
          });
        } catch (e) {
          console.error('SingleKvStoreEnableSyncCallbackTest002 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_REMOVE_CALLBACK_6300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6300
     * @tc.desc   Test Js Api SingleKvStore.RemoveDeviceData() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVE_CALLBACK_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreRemoveDeviceDataCallbackTest001');
        try {
          kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT,
            (err: Error | null, data: string[] | undefined): void => {
              console.info('SingleKvStoreRemoveDeviceDataCallbackTest001 put success');
              expect(err == undefined).assertTrue();
              let deviceid = 'no_exist_device_id';
              kvStore!.removeDeviceData(deviceid,
                (err: Error | null, data: string[] | undefined): void => {
                  if (err == undefined) {
                    console.info('SingleKvStoreRemoveDeviceDataCallbackTest001 removeDeviceData success');
                    expect(null).assertFail();
                    done();
                  } else {
                    console.info('SingleKvStoreRemoveDeviceDataCallbackTest001 removeDeviceData fail');
                    kvStore!.get(KEY_TEST_STRING_ELEMENT,
                      (err: Error | null, data: boolean | string | Long | Double | Uint8Array | undefined) => {
                        console.info('SingleKvStoreRemoveDeviceDataCallbackTest001 get success');
                        expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
                        done();
                      });
                  }
                });
            });
        } catch (e) {
          console.error('SingleKvStoreRemoveDeviceDataCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_REMOVE_CALLBACK_6500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6600
     * @tc.desc   Test Js Api SingleKvStore.RemoveDeviceData() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVE_CALLBACK_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreRemoveDeviceDataCallbackTest003');
        try {
          kvStore!.removeDeviceData('', (err: Error | null, data: string[] | undefined) => {
            if (err == undefined) {
              console.info('SingleKvStoreRemoveDeviceDataCallbackTest003 removeDeviceData success');
              expect(null).assertFail();
            } else {
              console.info('SingleKvStoreRemoveDeviceDataCallbackTest003 removeDeviceData fail');
            }
            done();
          });
        } catch (e) {
          console.error('SingleKvStoreRemoveDeviceDataCallbackTest003 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_6700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7100
     * @tc.desc   Test Js Api SingleKvStore.SetSyncParam() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreSetSyncParamCallbackTest001');
        try {
          let defaultAllowedDelayMs = 500;
          kvStore!.setSyncParam(defaultAllowedDelayMs, (err: Error | null, data: string[] | undefined) => {
            console.info('SingleKvStoreSetSyncParamCallbackTest001 put success');
            expect(err == undefined).assertTrue();
            done();
          });
        } catch (e) {
          console.error('SingleKvStoreSetSyncParamCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITY_CALLBACK_7100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4300
     * @tc.desc   Test Js Api SingleKvStore.GetSecurityLevel() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITY_CALLBACK_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreGetSecurityLevelCallbackTest001');
        try {
          kvStore!.getSecurityLevel((err: Error | null,
            data: factory.SecurityLevel | undefined) => {
            console.info('SingleKvStoreGetSecurityLevelCallbackTest001 getSecurityLevel success: ' + data);
            console.info('SingleKvStoreGetSecurityLevelCallbackTest001 getSecurityLevel success: ' +
            factory.SecurityLevel.S2);
            expect(data == factory.SecurityLevel.S2).assertTrue();
            done();
          });
        } catch (e) {
          console.error('SingleKvStoreGetSecurityLevelCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULT_CALLBACK_7500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4000
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULT_CALLBACK_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let resultSet: factory.KVStoreResultSet | undefined;
        console.info('SingleKvStoreGetResultSetCallbackTest001');
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
            console.info('SingleKvStoreGetResultSetCallbackTest001 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getResultSet('batch_test_string_key',
              (err: Error | null, result: factory.KVStoreResultSet | undefined) => {
                console.info('SingleKvStoreGetResultSetCallbackTest001 getResultSet success');
                resultSet = result as factory.KVStoreResultSet;
                expect(resultSet!.getCount() == 10).assertTrue();
                console.info('SingleKvStoreGetResultSetCallbackTest001 getCount() == 10');
                kvStore!.closeResultSet(resultSet!, (err, data) => {
                  console.info('SingleKvStoreGetResultSetCallbackTest001 closeResultSet success');
                  expect(err == undefined).assertTrue();
                  done();
                })
              });
          });
        } catch (e) {
          console.error('SingleKvStoreGetResultSetCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULT_CALLBACK_7800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4700
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULT_CALLBACK_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log('SingleKvStoreGetResultSetPredicatesCallbackTest001');
        try {
          let resultSet: factory.KVStoreResultSet | undefined;
          let query = new factory.Query();
          await kvStore!.getResultSet(query).then((result) => {
            console.log('SingleKvStoreGetResultSetPredicatesCallbackTest001 getResultSet success');
            resultSet = result as factory.KVStoreResultSet;
          }).catch((err: Error) => {
            console.error('SingleKvStoreGetResultSetPredicatesCallbackTest001 getResultSet fail ' + err +
              ', error code is ${err.code}, message is ${err.message}');
            expect(err == undefined).assertTrue();
          });
          kvStore!.closeResultSet(resultSet!, (err, data) => {
            console.info('SingleKvStoreGetResultSetPredicatesCallbackTest001 closeResultSet success');
            done();
          })
        } catch (e) {
          console.error('SingleKvStoreGetResultSetPredicatesCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULT_CALLBACK_8000
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3700
     * @tc.desc   Test Js Api SingleKvStore.CloseResultSet() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULT_CALLBACK_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let resultSet: factory.KVStoreResultSet | undefined;
        //(done: () => void) => {
        console.info('SingleKvStoreCloseResultSetCallbackTest002');
        try {
          kvStore!.getResultSet('batch_test_string_key',(err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
            console.info('SingleKvStoreCloseResultSetCallbackTest002 getResultSet success');
            resultSet = result as factory.KVStoreResultSet;
            kvStore!.closeResultSet(resultSet!, (err, data) => {
              if (err == undefined) {
                console.info('SingleKvStoreCloseResultSetCallbackTest002 closeResultSet success');
                expect(err == undefined).assertTrue();
                done();
              } else {
                console.info('SingleKvStoreCloseResultSetCallbackTest002 closeResultSet fail');
                expect(null).assertFail();
                done();
              }
            });
          });
        } catch (e) {
          console.error('SingleKvStoreCloseResultSetCallbackTest002 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETENTRIES_CALLBACK_8300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4800
     * @tc.desc   Test Js Api SingleKvStore.GetEntries() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETENTRIES_CALLBACK_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('SingleKvStoreGetEntriesCallbackTest001');
        try {
          let arr = new Uint8Array([21, 31]);
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'batch_test_bool_key' + i,
              value: {
                type: factory.ValueType.BYTE_ARRAY,
                value: arr
              }
            });
          }
          console.info('SingleKvStoreGetEntriesCallbackTest001 entries: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries,  (err: Error | null, data: string[] | undefined) => {
            console.info('SingleKvStoreGetEntriesCallbackTest001 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("batch_test");
            kvStore!.getEntries(query,  (err, entrys)=> {
              console.info('SingleKvStoreGetEntriesCallbackTest001 getEntries success');
              console.info('SingleKvStoreGetEntriesCallbackTest001 entrys.length: ' + entrys!.length);
              console.info('SingleKvStoreGetEntriesCallbackTest001 entrys[0]: ' + JSON.stringify(entrys![0]));
              expect(entrys!.length == 10).assertTrue();
              expect(entrys![0].value.value.toString() == arr.toString()).assertTrue();
              console.info('SingleKvStoreGetEntriesCallbackTest001 success');
              done();
            });
          });

        } catch (e) {
          console.error('SingleKvStoreGetEntriesCallbackTest001 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })
  })
}