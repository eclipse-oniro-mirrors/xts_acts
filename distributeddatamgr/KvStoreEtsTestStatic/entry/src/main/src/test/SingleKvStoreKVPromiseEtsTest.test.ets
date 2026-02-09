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

const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_SYNC_ELEMENT = 'key_test_sync';

const VALUE_TEST_INT_ELEMENT = 123  as long;
const VALUE_TEST_FLOAT_ELEMENT = 321.12  as long;
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

export default function SingleKvStorePromiseTest() {
  describe('SingleKvStorePromiseTest', () => {
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
        context: context
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
      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
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
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0970
     * @tc.desc   Test Js Api SingleKvStore.Put(String) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200');
        try {
          await kvStore!.put(KEY_TEST_STRING_ELEMENT, '').then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200 put success');
            expect(data == undefined).assertTrue();
            done();
          }).catch((error: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200 put error' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0960
     * @tc.desc   Test Js Api SingleKvStore.Put(String) testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300');
        try {
          await kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300 put success');
            expect(data == undefined).assertTrue();
            done();
          }).catch((error: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300 put error' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0980
     * @tc.desc   Test Js Api SingleKvStore.Put(String) testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400');
        try {
          let str = '';
          for (let i = 0; i < 4095; i++) {
            str += 'x';
          }
          await kvStore!.put(KEY_TEST_STRING_ELEMENT, str).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_STRING_ELEMENT).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400 get success data ' + data);
              expect(str == data).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((error: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400 put error' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0400
     * @tc.desc   Test Js Api SingleKvStoreGetString testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100');
        try {
          await kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_STRING_ELEMENT).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100 get success');
              expect(VALUE_TEST_STRING_ELEMENT == data).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((error: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100 put error' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0460
     * @tc.desc   Test Js Api SingleKvStoreGetString testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200');
        try {
          await kvStore!.get(KEY_TEST_STRING_ELEMENT).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200 get success1 ' + data);
            expect(null).assertFail();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200 get fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200 get e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0940
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100');
        try {
          await kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100 data == undefined');
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0880
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200');
        try {
          let intValue = 987654321  as long;
          await kvStore!.put(KEY_TEST_INT_ELEMENT, intValue).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 put success');
            expect(data == undefined).assertTrue();
            console.info(`SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 put intValue is ${intValue}`);
            console.info(`SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 put data is ${data}`);
            await kvStore!.get(KEY_TEST_INT_ELEMENT).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 get success');
              console.info(`SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 get intValue is ${intValue}`);
              console.info(`SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 get data is ${data}`);
              expect(intValue == data).assertTrue();
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 get intValue == data');
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0920
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300');
        try {
          let intValue = Number.MAX_VALUE  as long;
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 intValue ' + intValue);
          await kvStore!.put(KEY_TEST_INT_ELEMENT, intValue).then((data: string | boolean | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 put success');
            console.info(`SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 put intValue is ${intValue}`);
            console.info(`SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 put data is ${data}`);
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_INT_ELEMENT).then((data: string | boolean | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 get success, data ' + data);
              console.info(`SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 get intValue is ${intValue}`);
              expect(intValue == data).assertTrue();
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 get intValue == data');
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0930
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400');
        try {
          let intValue = Number.MIN_VALUE  as long;
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400 intValue ' + intValue);
          await kvStore!.put(KEY_TEST_INT_ELEMENT, intValue).then((data: string | boolean | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_INT_ELEMENT).then((data: string | boolean | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400 get success, data ' + data);
              expect(intValue == data).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })


    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0890
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0500');
        try {
          let intValue = Number.NaN as Double;
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0500 intValue ' + intValue);
          await kvStore!.put(KEY_TEST_INT_ELEMENT, intValue).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0500 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_INT_ELEMENT).then((data: Boolean|String|Long|Double|Uint8Array) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0500 get success, data ' + data);
              if (typeof data === 'number') {
                expect(Number.isNaN(data as number)).assertTrue();
              } else {
                expect(null).assertFail();
              }
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0500 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0500 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0500 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0900
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0600');
        try {
          let intValue = Number.NEGATIVE_INFINITY as long;
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0600 intValue ' + intValue);
          await kvStore!.put(KEY_TEST_INT_ELEMENT, intValue).then((data: string | boolean | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0600 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_INT_ELEMENT).then((data: string | boolean | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0600 get success, data ' + data);
              expect(intValue == data).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0600 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0600 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0600 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0910
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0700');
        try {
          let intValue = Number.POSITIVE_INFINITY as long;
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0700 intValue ' + intValue);
          await kvStore!.put(KEY_TEST_INT_ELEMENT, intValue).then((data: string | boolean | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0700 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_INT_ELEMENT).then((data: string | boolean | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0700 get success, data ' + data);
              expect(intValue == data).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0700 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0700 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0700 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0300
     * @tc.desc   Test Js Api SingleKvStoreGetInt testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100');
        try {
          await kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_INT_ELEMENT).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100 get success');
              expect(VALUE_TEST_INT_ELEMENT == data).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0860
     * @tc.desc   Test Js Api SingleKvStore.Put(Bool) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100');
        try {
          await kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0290
     * @tc.desc   Test Js Api SingleKvStoreGetBool testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSingleKvStoreGetBoolPromiseTest001');
        try {
          let boolValue = false;
          await kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, boolValue).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_BOOLEAN_ELEMENT).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100 get success');
              expect(boolValue == data).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0870
     * @tc.desc   Test Js Api SingleKvStore.Put(Float) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100');
        try {
          await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0850
     * @tc.desc   Test Js Api SingleKvStoreGetFloat testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100');
        try {
          let floatValue = 123456.654321;
          await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_FLOAT_ELEMENT).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100 get success');
              expect(floatValue == data).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0990
     * @tc.desc   Test Js Api SingleKvStoreGetFloat testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200');
        try {
          let floatValue = 123456.0;
          await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_FLOAT_ELEMENT).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200 get success');
              expect(floatValue == data).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_1000
     * @tc.desc   Test Js Api SingleKvStoreGetFloat testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300');
        try {
          let floatValue = 123456.00;
          await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.get(KEY_TEST_FLOAT_ELEMENT).then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300 get success');
              expect(floatValue == data).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0130
     * @tc.desc   Test Js Api SingleKvStoreDeleteString testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100');
        try {
          let str = 'this is a test string';
          await kvStore!.put(KEY_TEST_STRING_ELEMENT, str).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100 delete success');
              expect(data == undefined).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100 delete fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0090
     * @tc.desc   Test Js Api SingleKvStoreDeleteString testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200');
        try {
          let str = '';
          for (let i = 0; i < 4096; i++) {
            str += 'x';
          }
          await kvStore!.put(KEY_TEST_STRING_ELEMENT, str).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200 delete success');
              expect(data == undefined).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200 delete fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0080
     * @tc.desc   Test Js Api SingleKvStoreDeleteString testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300');
        try {
          await kvStore!.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300 delete success');
            expect(data == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300 delete fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0120
     * @tc.desc   Test Js Api SingleKvStoreDeleteInt testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100');
        try {
          await kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.delete(KEY_TEST_INT_ELEMENT).then((data) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100 delete success');
              expect(data == undefined).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100 delete fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0110
     * @tc.desc   Test Js Api SingleKvStoreDeleteFloat testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100');
        try {
          await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.delete(KEY_TEST_FLOAT_ELEMENT).then((data) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100 delete success');
              expect(data == undefined).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100 delete fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0100
     * @tc.desc   Test Js Api SingleKvStoreDeleteBool testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100');
        try {
          await kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.delete(KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100 delete success');
              expect(data == undefined).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100 delete fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0050
     * @tc.desc   Test Js Api SingleKvStore.Delete() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100');
        try {
          await kvStore!.delete("KEY_TEST_STRING_ELEMENTS").then((data) => {
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100 delete success');
            expect(data == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100 delete fail err ' + err);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0060
     * @tc.desc   Test Js Api SingleKvStore.Delete() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200');
        try {
          await kvStore!.put("name", "Bob").then((data) => {
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.delete("name").then((data) => {
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200 delete success');
              expect(data == undefined).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200 delete fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0070
     * @tc.desc   Test Js Api SingleKvStore.Delete() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300');
        try {
          await kvStore!.put("number", "123").then((data) => {
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300 put success');
            expect(data == undefined).assertTrue();
            await kvStore!.delete("number").then((data) => {
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300 delete success');
              expect(data == undefined).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300 delete fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0220
     * @tc.desc   Test Js Api SingleKvStoreOnChange testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL,
            (data: factory.ChangeNotification | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100 dataChange' + JSON.stringify(data!));
              expect(data != null).assertTrue();
            });
          await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
            done();
          }).catch((error: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100 put fail ' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0230
     * @tc.desc   Test Js Api SingleKvStoreOnChange testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            (ChangeNotification) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200 dataChange' + JSON.stringify(ChangeNotification!));
              expect(ChangeNotification != null).assertTrue();
            });
          await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200 put success');
            expect(data == undefined).assertTrue();
            done();
          }).catch((error: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200 put fail ' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0240
     * @tc.desc   Test Js Api SingleKvStoreOnChange testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_ALL,
            (data: factory.ChangeNotification | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300 dataChange' + JSON.stringify(data!));
              expect(data != null).assertTrue();
            });
          await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300 put success');
            expect(data == undefined).assertTrue();
            done();
          }).catch((error: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300 put fail ' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0160
     * @tc.desc   Test Js Api SingleKvStoreOnSyncComplete testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 0' + data)
            expect(data != null).assertTrue();
          });
          await kvStore!.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 put success');
            expect(data == undefined).assertTrue();
          }).catch((error: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 put fail ' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
          });
          try {
            let mode = factory.SyncMode.PULL_ONLY;
            console.info('test logkvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(syncDeviceIds, mode, 10);
          } catch (e: Error) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
          }
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0170
     * @tc.desc   Test Js Api SingleKvStoreOnSyncComplete testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 0' + data)
            expect(data != null).assertTrue();
          });
          await kvStore!.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 put success');
            expect(data == undefined).assertTrue();
          }).catch((error: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 put fail ' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
          });
          try {
            let mode = factory.SyncMode.PUSH_ONLY;
            console.info('test logkvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(syncDeviceIds, mode, 10);
          } catch (e: Error) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
          }
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0180
     * @tc.desc   Test Js Api SingleKvStoreOnSyncComplete testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          kvStore!.onSyncComplete((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 0' + data)
            expect(data != null).assertTrue();
          });
          await kvStore!.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 put success');
            expect(data == undefined).assertTrue();
          }).catch((error: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 put fail ' +
              `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
          });
          try {
            let mode = factory.SyncMode.PUSH_PULL;
            console.info('test logkvStore!.sync to ' + JSON.stringify(syncDeviceIds));
            kvStore!.sync(syncDeviceIds, mode, 10);
          } catch (e: Error) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 sync no peer device :e:' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
          }
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })


    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0610
     * @tc.desc   Test Js Api SingleKvStoreOffChange testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0100');
        try {
          let func = (data: factory.ChangeNotification) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0100 dataChange' + JSON.stringify(data!));
          };

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func);

          kvStore!.offDataChange(func);
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })


    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0140
     * @tc.desc   Test Js Api SingleKvStoreOffChange testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200');
        let ret = false;
        try {

          let func = (data: factory.ChangeNotification) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200 dataChange' + JSON.stringify(data!));
          };

          let func1 = (data: factory.ChangeNotification) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200 dataChange1' + JSON.stringify(data!));
          };

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func);

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func1);
          kvStore!.offDataChange(func);
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })


    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0150
     * @tc.desc   Test Js Api SingleKvStoreOffChange testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300');
        try {

          let func = (data: factory.ChangeNotification) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300 dataChange' + data)
          };

          let func1 = (data: factory.ChangeNotification) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300 dataChange1' + data)
          };

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func);

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func1);
          kvStore!.offDataChange(func);
          kvStore!.offDataChange(func1);
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0620
     * @tc.desc   Test Js Api SingleKvStoreOffChange testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0400');
        try {

          let func = (data: factory.ChangeNotification | null) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0400 dataChange' + JSON.stringify(data!));
          };

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func);
          kvStore!.offDataChange();
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0400 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0190
     * @tc.desc   Test Js Api SingleKvStoreOffSyncComplete testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100');
        try {

          let func = (data: Array<[string, int]>) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100 syncComplete' + data)
          };
          kvStore!.onSyncComplete(func);
          kvStore!.offSyncComplete(func);
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0200
     * @tc.desc   Test Js Api SingleKvStoreOffSyncComplete testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200');
        try {

          let func = (data: Array<[string, int]>) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 syncComplete' + data)
          };

          let func1 = (data: Array<[string, int]>) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 syncComplete1' + data)
          };
          kvStore!.onSyncComplete(func);
          kvStore!.onSyncComplete(func1);
          kvStore!.offSyncComplete(func);
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0210
     * @tc.desc   Test Js Api SingleKvStoreOffSyncComplete testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300');
        try {

          let func = (data: Array<[string, int]>) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 syncComplete' + data)
          };

          let func1 = (data: Array<[string, int]>) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 syncComplete1' + data)
          };
          kvStore!.onSyncComplete(func);
          kvStore!.onSyncComplete(func1);
          kvStore!.offSyncComplete(func);
          kvStore!.offSyncComplete(func1);
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0630
     * @tc.desc   Test Js Api SingleKvStoreOffSyncComplete testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400');
        try {
          let func = (data: Array<[string, int]>) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400 syncComplete' + data)
          };
          kvStore!.onSyncComplete(func);
          kvStore!.offSyncComplete();
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400 put e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0770
     * @tc.desc   Test Js Api SingleKvStoreSetSyncRange testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['C', 'D'];
          await kvStore!.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100 setSyncRange success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100  fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0780
     * @tc.desc   Test Js Api SingleKvStoreSetSyncRange testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['B', 'C'];
          kvStore!.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200 setSyncRange success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200 fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0760
     * @tc.desc   Test Js Api SingleKvStoreSetSyncRange testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300');
        try {
          let localLabels = ['A', 'B'];
          let remoteSupportLabels = ['A', 'B'];
          kvStore!.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300 setSyncRange success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300 fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0520
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100');
        try {
          let entries: factory.Entry[] = putBatchString(10, 'batch_test_string_key');
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 entries: ' + JSON.stringify(entries));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries('batch_test_string_key').then((entrys: factory.Entry[] | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 getEntries success');
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 ' + JSON.stringify(entries));
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 entrys.length: ' + entrys!.length);
              expect(entrys!.length == 10).assertTrue();
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 entrys!.length == 10');
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 entrys![0].value.value =' + entrys![0].value.value);
              expect(entrys![0].value.value == 'batch_test_string_value').assertTrue();
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 entrys0.value.value == batch_test_string_value');
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 getEntries fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0510
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200');
        try {
          let entries: factory.Entry[] = []
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_number_key';
            let entry: factory.Entry = {
              key: key + i,
              value: {
                type: factory.ValueType.LONG,
                value: 222 as long
              }
            } as factory.Entry;
            entries.push(entry);
          }
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 entries: ' + JSON.stringify(entries));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 putBatch success');
            expect(err == undefined).assertTrue();
            await kvStore!.getEntries('batch_test_number_key').then((entrys: factory.Entry[] | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 getEntries success');
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 entrys.length: ' + entrys!.length);
              expect(entrys!.length == 10).assertTrue();
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 entrys!.length == 10');
              expect(entrys![0].value.value == 222).assertTrue();
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 entrys![0].value.value == 222 ');
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 getEntries fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0500
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300');
        try {

          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_number_key';
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.DOUBLE,
                value : 2.0
              }
            });
          }
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 entries: ' + JSON.stringify(entries));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 putBatch success');
            expect(err == undefined).assertTrue();
            await kvStore!.getEntries('batch_test_number_key').then((entrys: factory.Entry[] | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 getEntries success');
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 entrys.length: ' + entrys!.length);
              expect(entrys!.length == 10).assertTrue();
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 entrys!.length == 10');
              expect(entrys![0].value.value == 2.0).assertTrue();
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 entrys![0].value.value == 2.0');
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 getEntries fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0490
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_number_key';
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.DOUBLE,
                value : 2.00
              }
            });
          }
          console.info('test SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 entries: ' + JSON.stringify(entries));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 putBatch success');
            expect(err == undefined).assertTrue();
            await kvStore!.getEntries('batch_test_number_key').then((entrys: factory.Entry[] | undefined) => {
              console.info('test SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 getEntries success');
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 entrys.length: ' + entrys!.length);
              expect(entrys!.length == 10).assertTrue();
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 entrys!.length == 10');
              expect(entrys![0].value.value == 2.00).assertTrue();
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 entrys![0].value.value == 2.00');
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 getEntries fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0470
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500');
        try {
          let bo = false;

          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_bool_key';
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.BOOLEAN,
                value: bo
              }
            });
          }
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 entries: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries('batch_test_bool_key').then((entrys: factory.Entry[] | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 getEntries success');
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 entrys.length: ' + entrys!.length);
              expect(entrys!.length == 10).assertTrue();
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 entrys!.length == 10');
              expect(entrys![0].value.value == bo).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 getEntries fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0480
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600');
        try {
          let arr = new Uint8Array([21, 31]);

          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_bool_key';
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.BYTE_ARRAY,
                value: arr
              }
            });
          }
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 entries: ' + JSON.stringify(entries));
          kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 putBatch success');
            expect(err == undefined).assertTrue();
            kvStore!.getEntries('batch_test_bool_key').then((entrys: factory.Entry[] | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 getEntries success');
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 entrys.length: ' + entrys!.length);
              expect(entrys!.length == 10).assertTrue();
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 entrys!.length == 10');
              expect(entrys![0].value.value.toString() == arr.toString()).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 getEntries fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0450
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100');
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
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 entries: ' + JSON.stringify(entries));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("batch_test_");
            kvStore!.getEntries(query).then((entrys: factory.Entry[] | undefined) => {
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 getEntries success');
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 entrys.length: ' + entrys!.length);
              expect(entrys!.length == 10).assertTrue();
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 entrys!.length == 10');
              done();
            });
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0440
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200');
        try {

          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'key_test_int' + i,
              value: {
                type: factory.ValueType.LONG,
                value: '123'
              }
            });
          }
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 entries: ' + JSON.stringify(entries));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("key_test_");
            await kvStore!.getEntries(query).then((entrys: factory.Entry[] | undefined) => {
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 getEntries success');
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 entrys.length: ' + entrys!.length);
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 entrys[0]: ' +
              JSON.stringify(entrys![0]));
              expect(entrys!.length == 10).assertTrue();
              done();
            }).catch((err: Error) => {
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 delete fail ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 delete fail ' + err);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0430
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'key_test_boolean';
            let entry: factory.Entry = {
              key: key + i,
              value: {
                type: factory.ValueType.BOOLEAN,
                value: 'true'
              }
            } as factory.Entry;
            entries.push(entry);
          }

          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 entries: ' +
          JSON.stringify(entries?.length));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("key_test_");
            await kvStore!.getEntries(query).then((entrys: factory.Entry[] | undefined) => {
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 getEntries success');
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 entrys.length: ' + entrys!.length);
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 entrys[0]: ' +
              JSON.stringify(entrys![0]));
              expect(entrys!.length == 10).assertTrue();
              done();
            });
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0410
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'key_test_float';
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.DOUBLE,
                value: '321.12'
              }
            });
          }
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 entries: ' +
          JSON.stringify(entries?.length));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("key_test_");
            await kvStore!.getEntries(query).then((entrys: factory.Entry[] | undefined) => {
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 getEntries success');
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 entrys.length: ' + entrys!.length);
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 entrys[0]: ' +
              JSON.stringify(entrys![0]));
              expect(entrys!.length == 10).assertTrue();
              done();
            });
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0420
     * @tc.desc   Test Js Api SingleKvStore.PutBatch() testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            entries.push({
              key: 'key_test_string' + i,
              value: {
                type: factory.ValueType.STRING,
                value: 'value-string-001'
              }
            });
          }
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 entries: ' +
          JSON.stringify(entries?.length));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 putBatch success');
            expect(err == undefined).assertTrue();
            let query = new factory.Query();
            query.prefixKey("key_test_");
            await kvStore!.getEntries(query).then((entrys: factory.Entry[] | undefined) => {
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 getEntries success');
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 entrys.length: ' + entrys!.length);
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 entrys[1]: ' +
              JSON.stringify(entrys![1]));
              expect(entrys!.length == 10).assertTrue();
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 entrys[0]: ' +
              JSON.stringify(entrys![0]));
              console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 entrys[0]: ' +
              JSON.stringify(entrys![0].value));
              expect(entrys![0].value.value == 'value-string-001').assertTrue();
              done();
            });
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0530
     * @tc.desc   Test Js Api SingleKvStoreDeleteBatch testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100');
        try {
          let entries: factory.Entry[] = [];
          let keys: string[] = [];
          for (let i = 0; i < 5; i++) {
            let key = 'batch_test_string_key';
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
            keys.push(key + i);
          }
          //console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 entries: ' + JSON.stringify(entries));
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 entries: ' +
          JSON.stringify(entries?.length));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 putBatch success');
            expect(err == undefined).assertTrue();
            await kvStore!.deleteBatch(keys).then((err) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 deleteBatch success');
              expect(err == undefined).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 deleteBatch fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0540
     * @tc.desc   Test Js Api SingleKvStoreDeleteBatch testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200');
        try {
          let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
          await kvStore!.deleteBatch(keys).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200 deleteBatch success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200 deleteBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0550
     * @tc.desc   Test Js Api SingleKvStoreDeleteBatch testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300');
        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 5; i++) {
            let key = 'batch_test_string_key';
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            });
          }

          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 entries: ' +
          JSON.stringify(entries?.length));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 putBatch success');
            expect(err == undefined).assertTrue();
            let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
            await kvStore!.deleteBatch(keys).then((err) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 deleteBatch success');
              expect(err == undefined).assertTrue();
              done();
            }).catch((err: Error) => {
              console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 deleteBatch fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0590
     * @tc.desc   Test Js Api SingleKvStorestartTransaction testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100');
        try {
          let count = 0;
          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_ALL,
            (data: factory.ChangeNotification | undefined) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 dataChange ' +
              JSON.stringify(data!));
              count++;
            });
          await kvStore!.startTransaction().then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 startTransaction success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 startTransaction fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          let entries: factory.Entry[] = putBatchString(10, 'batch_test_string_key');
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 entries: ' + JSON.stringify(entries));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 putBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          let keys = Object.keys(entries).slice(5);
          await kvStore!.deleteBatch(keys).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 deleteBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 deleteBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          await kvStore!.commit().then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 commit success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 commit fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          await sleep(500);
          expect(count == 1).assertTrue();
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0600
     * @tc.desc   Test Js Api SingleKvStorestartTransaction testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200');
        try {
          let count = 0;
          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL,
            (data: factory.ChangeNotification) => {
              console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 dataChange ' +
              JSON.stringify(data!));
              count++;
            });
          await kvStore!.startTransaction().then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 startTransaction success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error)=> {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 startTransaction fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          let entries: factory.Entry[] = putBatchString(10, 'batch_test_string_key');
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 entries: ' + JSON.stringify(entries));
          await kvStore!.putBatch(entries).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 putBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          let keys = Object.keys(entries).slice(5);
          await kvStore!.deleteBatch(keys).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 deleteBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 deleteBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          await kvStore!.rollback().then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 rollback success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 rollback fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          await sleep(500);
          expect(count == 0).assertTrue();
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
        done();
      })


    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_1010
     * @tc.desc   Test Js Api SingleKvStoreRollback testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300');
        try {
          await kvStore!.rollback().then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300 rollback success');
            expect(null).assertFail();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300 rollback fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0690
     * @tc.desc   Test Js Api SingleKvStoreEnableSync testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100');
        try {
          await kvStore!.enableSync(true).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100 enableSync success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100 enableSync fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0680
     * @tc.desc   Test Js Api SingleKvStoreEnableSync testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200');
        try {
          await kvStore!.enableSync(false).then((err) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200 enableSync success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200 enableSync fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0640
     * @tc.desc   Test Js Api SingleKvStoreRemoveDeviceData testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100');
        try {
          await kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((err: Error | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 put success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          let deviceid = 'no_exist_device_id';
          await kvStore!.removeDeviceData(deviceid).then(() => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 removeDeviceData success');
            expect(null).assertFail();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 removeDeviceData fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
          });
          await kvStore!.get(KEY_TEST_STRING_ELEMENT).then((data: Uint8Array | string | Long | double | boolean | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 get success data:' + data);
            expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 data == VALUE_TEST_STRING_ELEMENT');
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 get fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0650
     * @tc.desc   Test Js Api SingleKvStoreRemoveDeviceData testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200');
        try {
          await kvStore!.removeDeviceData('').then(() => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200 removeDeviceData success');
            expect(null).assertFail();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200 removeDeviceData fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
      }
    )

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0670
     * @tc.desc   Test Js Api SingleKvStoreRemoveDeviceData testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300');
        try {
          await kvStore!.removeDeviceData('').then(() => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 removeDeviceData success');
            expect(null).assertFail();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 removeDeviceData fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
      })


    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0660
     * @tc.desc   Test Js Api SingleKvStoreRemoveDeviceData testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400');
        try {
          await kvStore!.removeDeviceData('').then(() => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400 removeDeviceData success');
            expect(null).assertFail();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400 removeDeviceData fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0750
     * @tc.desc   Test Js Api SingleKvStoreSetSyncParam testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100');
        try {
          let defaultAllowedDelayMs = 500;
          await kvStore!.setSyncParam(defaultAllowedDelayMs).then((err: Error | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100 put success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100 put fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0340
     * @tc.desc   Test Js Api SingleKvStoreGetSecurityLevel testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100');
        try {
          await kvStore!.getSecurityLevel().then((data: factory.SecurityLevel) => {
            console.info(`SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100 getSecurityLevel success, result is ${data}, SecurityLevel is ${factory.SecurityLevel.S2}`);
            expect(data == factory.SecurityLevel.S2).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100 getSecurityLevel fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0020
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100');
        try {
          let resultSet: factory.KVStoreResultSet;
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
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 putBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          await kvStore!.getResultSet('batch_test_string_key').then((result: factory.KVStoreResultSet) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet success result:');
            resultSet = result;
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet success resultSet:'+resultSet!.getCount());
            expect(resultSet!.getCount() == 10).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          kvStore!.closeResultSet(resultSet).then((err: Error | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 closeResultSet success   err:'+err);
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 closeResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0040
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200');
        try {
          let resultSet: factory.KVStoreResultSet;
          await kvStore!.getResultSet('batch_test_string_key').then((result: factory.KVStoreResultSet) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 getResultSet success');
            resultSet = result;
            expect(resultSet!.getCount() == 0).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          kvStore!.closeResultSet(resultSet).then((err: Error | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 closeResultSet success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 closeResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0030
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400');
        try {
          let resultSet: factory.KVStoreResultSet;
          // kvStore!.getResultSet('test_key_string', 123).then((result) => {
          await kvStore!.getResultSet('test_key_string').then((result: factory.KVStoreResultSet) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400 getResultSet success');
            resultSet = result;
            expect(resultSet!.getCount() == 0).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          await kvStore!.closeResultSet(resultSet).then((err: Error | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400 closeResultSet success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400 closeResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }


      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0370
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500');
        try {
          let resultSet: factory.KVStoreResultSet;
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

          await kvStore!.putBatch(entries).then((err: Error | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 putBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore!.getResultSet(query).then((result: factory.KVStoreResultSet) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 getResultSet success');
            resultSet = result;
            expect(resultSet!.getCount() == 10).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          kvStore!.closeResultSet(resultSet).then((err: Error | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 closeResultSet success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 closeResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0380
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600');
        try {
          let resultSet: factory.KVStoreResultSet;
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
          await kvStore!.putBatch(entries).then((err: Error | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 putBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore!.getResultSet(query).then((result: factory.KVStoreResultSet) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 getResultSet success');
            resultSet = result;
            expect(resultSet!.getCount() == 10).assertTrue();
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 getCount() == 10');
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          kvStore!.closeResultSet(resultSet).then((err: Error | undefined) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 closeResultSet success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 closeResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0360
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700');
        try {
          let resultSet: factory.KVStoreResultSet;
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'name_';
            let value = 'Bob_';
            entries.push({
              key: key + i,
              value: {
                type: factory.ValueType.STRING,
                value: value + i
              }
            });
          }
          await kvStore!.putBatch(entries).then((err: Error | undefined) => {
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 putBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          let query = new factory.Query();
          query.prefixKey("name_");
          await kvStore!.getResultSet(query).then((result: factory.KVStoreResultSet) => {
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 getResultSet success');
            resultSet = result;
            expect(resultSet!.getCount() == 10).assertTrue();
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 getCount() == 10');
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          await kvStore!.closeResultSet(resultSet!).then((err: Error | undefined) => {
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 closeResultSet success');
            expect(err == undefined).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 closeResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0350
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800');
        try {
          let resultSet: factory.KVStoreResultSet;
          let query = new factory.Query();
          await kvStore!.getResultSet(query).then((result: factory.KVStoreResultSet) => {
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 getResultSet success');
            resultSet = result;
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 getResultSet resultSet:'+resultSet!.getCount());
            expect(resultSet!.getCount() == 0).assertTrue();
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 getCount() == 0');
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          await kvStore!.closeResultSet(resultSet!).then((err: Error | undefined) => {
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 closeResultSet success  err:'+err);
            expect(err == undefined).assertTrue();
            console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 err == undefined');
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 closeResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });

        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 e' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0390
     * @tc.desc   Test Js Api SingleKvStoreGetResultSize testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100');
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
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100 putBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100 putBatch fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore!.getResultSize(query).then((resultSize: int) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100 getResultSet success');
            expect(resultSize == 10).assertTrue();
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100 resultSize == 10');
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100 e ' +
            `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0790
     * @tc.desc   Test Js Api SingleKvStoreChangeNotification testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        let getInsertEntries: Promise<factory.Entry[]> = new Promise<factory.Entry[]>((resolve, reject) => {

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (ChangeNotification) => {
            resolve(ChangeNotification.insertEntries);
          });
          kvStore!.put("getInsertEntries", "byPut").then(() => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100 put success');
          });
        });
        getInsertEntries!.then((insertEntries: factory.Entry[] | undefined) => {
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100 getInsertEntries' +
          JSON.stringify(insertEntries));
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100 getInsertEntries key ' +
          insertEntries![0].key);
          expect(insertEntries![0].key == "getInsertEntries").assertTrue();
          done();
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100 can NOT getInsertEntries, fail:' +
            `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
          done();
        });

      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0810
     * @tc.desc   Test Js Api SingleKvStoreChangeNotification testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        kvStore!.put('getUpdateEntries', 'byPut1').then(() => {
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 put success');
        });
        await Utils.msSleep(3000);

        let getUpdateEntries: Promise<factory.Entry[]> = new Promise<factory.Entry[]>((resolve, reject) => {

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (ChangeNotification) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 update dataChange'+ChangeNotification);
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 update dataChange'+JSON.stringify(ChangeNotification));
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 update dataChange'+JSON.stringify(ChangeNotification.updateEntries));
            resolve(ChangeNotification.updateEntries);
          });
          kvStore!.put("getUpdateEntries", "byPut2").then(() => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 update success');
          });
        });
        getUpdateEntries!.then((updateEntries: factory.Entry[] | undefined) => {
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 getUpdateEntries' +
          JSON.stringify(updateEntries));
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 getUpdateEntries key ' +
          updateEntries![0].key);
          expect(updateEntries![0].key == "getUpdateEntries").assertTrue();
          done();
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 can NOT getUpdateEntries, fail:' +
            `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
          done();
        });

      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiTest_0800
     * @tc.desc   Test Js Api SingleKvStoreChangeNotification testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        kvStore!.put('deleteEntries', 'byPut').then(() => {
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 put success');
        });
        await Utils.msSleep(3000);

        let getdeleteEntries: Promise<factory.Entry[]> = new Promise<factory.Entry[]>((resolve, reject) => {

          kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (ChangeNotification) => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 delete dataChange'+ChangeNotification);
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 delete dataChange'+JSON.stringify(ChangeNotification));
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 delete dataChange'+JSON.stringify(ChangeNotification.deleteEntries));
            resolve(ChangeNotification.deleteEntries);
          });
          kvStore!.delete("deleteEntries").then(() => {
            console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 delete success');
          });
        });

        getdeleteEntries!.then((deleteEntries: factory.Entry[] | undefined) => {
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 deleteEntries key ');
          expect(deleteEntries![0].key == "deleteEntries").assertTrue();
          console.info('test logSUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 deleteEntries![0].key == deleteEntries');
          done();
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 can NOT getdeleteEntries, fail:' +
            `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
          done();
        });
      })
  })
}