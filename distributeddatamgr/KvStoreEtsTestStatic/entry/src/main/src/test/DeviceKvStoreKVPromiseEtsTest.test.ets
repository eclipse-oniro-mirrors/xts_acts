/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import factory from '@ohos.data.distributedKVStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
const domain = 0xFF00;
const tag = "TestTag";
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_SYNC_ELEMENT = 'key_test_sync';

const VALUE_TEST_INT_ELEMENT = 123 as long;
const VALUE_TEST_FLOAT_ELEMENT = 321.12;
const VALUE_TEST_BOOLEAN_ELEMENT = true;
const VALUE_TEST_STRING_ELEMENT = 'value-string-001';
const VALUE_TEST_SYNC_ELEMENT = 'value-string-001';

const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
const TEST_STORE_ID = 'dstoreId';
let kvManager: factory.KVManager|null = null;
let kvStore: factory.DeviceKVStore | null = null;
let localDeviceId = '';
const USED_DEVICE_IDS =  ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
const UNUSED_DEVICE_IDS: string[] =  [];  /* add you test device-ids here */
let syncDeviceIds = USED_DEVICE_IDS.concat(UNUSED_DEVICE_IDS);
let context: common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function sleep(count:int) : Promise<int> {
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
      key : prefix + i,
      value : {
        type : factory.ValueType.STRING,
        value : 'batch_test_string_value'
      }
    }
    entries.push(entry);
  }
  return entries;
}
export default function deviceKvStorePromiseTest(){
  describe('deviceKvStorePromiseTest', () => {
    const options: factory.Options = {
      createIfMissing : true,
      encrypt : false,
      backup : false,
      autoSync : true,
      kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
      schema : undefined,
      securityLevel : factory.SecurityLevel.S2,
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
        hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============beforeAll context e: " + e);
        hilog.info(domain, tag, '%{public}s', '================ beforeAll context end==========');
      }

      const config: factory.KVManagerConfig = {
        bundleName : TEST_BUNDLE_NAME,
        context:context
      }
      console.info('beforeAll config:'+ JSON.stringify(config));
      kvManager = factory.createKVManager(config);
      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store : factory.DeviceKVStore) => {
        kvStore = store;
        console.info('beforeAll getKVStore for getDeviceId success');
      }).catch((err: Error) => {
        console.error('beforeAll getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      let getDeviceId = new Promise<string>((resolve, reject) => {
        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
          console.info('beforeAll on data change: ' + JSON.stringify(data));
          resolve(data.deviceId);
        });
        kvStore!.put("getDeviceId", "byPut").then((data) => {
          console.info('beforeAll put success');
          expect(data == undefined).assertTrue();
        });
        setTimeout(() => {
          reject(new Error('not resolved in 2 second, reject it.'))
        }, 2000);
      });
      await getDeviceId.then((deviceId: string) => {
        console.info('beforeAll getDeviceId ' + JSON.stringify(deviceId));
        localDeviceId = deviceId;
      }).catch((error: Error) => {
        console.error('beforeAll can NOT getDeviceId, fail: ' + `, error code is ${error.code}, message is ${error.message}`);
        expect(null).assertFail();
      });

      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
        console.info('beforeAll closeKVStore success');
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('beforeAll deleteKVStore success');
          kvStore = null;
          done();
        }).catch((err: Error) => {
          console.info('beforeAll deleteKVStore err ' + err);
          done();
        });
      }).catch((err: Error) => {
        console.info('beforeAll closeKVStore err ' + err);
        done();
      });

    })

    afterAll(async (done: () => void) => {
      console.info('afterAll');
      kvManager = null;
      kvStore = null;
      done();
    })

    beforeEach(async (done: () => void) => {
      console.info('beforeEach' + JSON.stringify(options));
      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store : factory.DeviceKVStore) => {
        kvStore = store;
        console.info('beforeEach getKVStore success');
        done();
      }).catch((err: Error) => {
        console.error('beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });

    })

    afterEach(async (done: () => void) => {
      console.info('afterEach');
      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
        console.info('afterEach closeKVStore success');
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('afterEach deleteKVStore success');
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
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_1400
     * @tc.desc   Test Ets Api DeviceKvStore.Put(String) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0200');
      try {
        await kvStore!.put(KEY_TEST_STRING_ELEMENT, '').then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0200 put success');
          expect(data == undefined).assertTrue();
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0200 put error' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_1100
     * @tc.desc   Test Ets Api DeviceKvStore.Put(String) testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0300');
      try {
        await kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0300 put success');
          expect(data == undefined).assertTrue();
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0300 put error' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_1200
     * @tc.desc   Test Ets Api DeviceKvStore.Put(String) testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400');
      try {
        let str = '';
        for (let i = 0 ; i < 4095; i++) {
          str += 'x';
        }
        await kvStore!.put(KEY_TEST_STRING_ELEMENT, str).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400 get success data ' + data);
            expect(str == data).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400 put error' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DEVICEKVSTORE_PUTSTRING_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_1700
     * @tc.desc   Test Ets Api DeviceKvStore.Get(String) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100');
      try {
        await kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100 get success');
            expect(VALUE_TEST_STRING_ELEMENT == data).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100 put error' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_1800
     * @tc.desc   Test Ets Api DeviceKvStore.Get(String) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0200');
      try {
        await kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0200 get success');
          expect(null).assertFail();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0200 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0200 get e ' + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_0700
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Int) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0100');
      try {
        await kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_0800
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Int) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200');
      try {
        let intValue = 987654321 as long;
        await kvStore!.put(KEY_TEST_INT_ELEMENT, intValue).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200 get success');
            expect(intValue == data).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_0900
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Int) testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300');
      try {
        let intValue = Number.MAX_VALUE;
        await kvStore!.put(KEY_TEST_INT_ELEMENT, intValue).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300 get success');
            expect(intValue == data).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_1000
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Int) testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400');
      try {
        let intValue = Number.MIN_VALUE;
        await kvStore!.put(KEY_TEST_INT_ELEMENT, intValue).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400 get success');
            expect(intValue == data).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_1600
     * @tc.desc   Test Ets Api DeviceKvStore.Get(Int) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100');
      try {
        await kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100 get success');
            expect(VALUE_TEST_INT_ELEMENT == data).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTBOOLEAN_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_0200
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Bool) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBOOLEAN_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBOOLEAN_PROMISE_0100');
      try {
        await kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBOOLEAN_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBOOLEAN_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBOOLEAN_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_1500
     * @tc.desc   Test Ets Api DeviceKvStore.Get(Bool) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100');
      try {
        let boolValue = false;
        await kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, boolValue).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100 get success');
            expect(boolValue == data).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTFLOAT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_0600
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Float) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTFLOAT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTFLOAT_PROMISE_0100');
      try {
        await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTFLOAT_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTFLOAT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTFLOAT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_0500
     * @tc.desc   Test Ets Api DeviceKvStore.Get(Float) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100');
      try {
        let floatValue = 123456.654321;
        await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100 get success');
            expect(floatValue == data).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_0300
     * @tc.desc   Test Ets Api DeviceKvStore.Get(Float) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200');
      try {
        let floatValue = 123456.0;
        await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200 get success');
            expect(floatValue == data).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_0400
     * @tc.desc   Test Ets Api DeviceKvStore.Get(Float) testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300');
      try {
        let floatValue = 123456.00;
        await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300 get success');
            expect(floatValue == data).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_6400
     * @tc.desc   Test Ets Api DeviceKvStore.DeleteString() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100');
      try {
        let str = 'this is a test string';
        await kvStore!.put(KEY_TEST_STRING_ELEMENT, str).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100 delete success');
            expect(data == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_6500
     * @tc.desc   Test Ets Api DeviceKvStore.DeleteString() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200');
      try {
        let str = '';
        for (let i = 0 ; i < 4096; i++) {
          str += 'x';
        }
        await kvStore!.put(KEY_TEST_STRING_ELEMENT, str).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200 delete success');
            expect(data == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_8300
     * @tc.desc   Test Ets Api DeviceKvStore.DeleteString() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0300');
      try {
        await kvStore!.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0300 delete success');
          expect(data == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0300 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_6300
     * @tc.desc   Test Ets Api DeviceKvStore.DeleteInt() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100');
      try {
        await kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.delete(KEY_TEST_INT_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100 delete success');
            expect(data == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_6200
     * @tc.desc   Test Ets Api DeviceKvStore.DeleteFloat() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100');
      try {
        await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.delete(KEY_TEST_FLOAT_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100 delete success');
            expect(data == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_6100
     * @tc.desc   Test Ets Api DeviceKvStore.DeleteBool() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100');
      try {
        await kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
          await kvStore!.delete(KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100 delete success');
            expect(data == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_1900
     * @tc.desc   Test Ets Api DevicekvStore!.onChange() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0100 0' + JSON.stringify(data))
          expect(data != null).assertTrue();
        });
        await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0100 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_2100
     * @tc.desc   Test Ets Api DevicekvStore!.onChange() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE, (data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0200 0' + JSON.stringify(data))
          expect(data != null).assertTrue();
        });
        await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0200 put success');
          expect(data == undefined).assertTrue();
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0200 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_2000
     * @tc.desc   Test Ets Api DevicekvStore!.onChange() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_ALL, (data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0300 0' + JSON.stringify(data))
          expect(data != null).assertTrue();
        });
        await kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0300 put success');
          expect(data == undefined).assertTrue();
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0300 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_3300
     * @tc.desc   Test Ets Api DevicekvStore!.onSyncComplete() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        kvStore!.onSyncComplete((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 0' + data)
          expect(data != null).assertTrue();
        });
        await kvStore!.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 put success');
          expect(data == undefined).assertTrue();
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 put failed:' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
        try {
          let mode = factory.SyncMode.PULL_ONLY;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore!.sync(syncDeviceIds, mode);
        } catch (e: Error) {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 sync no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
        }
      } catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_3500
     * @tc.desc   Test Ets Api DevicekvStore!.onSyncComplete() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        kvStore!.onSyncComplete((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 0' + data)
          expect(data != null).assertTrue();
        });
        await kvStore!.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 put success');
          expect(data == undefined).assertTrue();
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 put failed:' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
        try {
          let mode = factory.SyncMode.PUSH_ONLY;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore!.sync(syncDeviceIds, mode);
        } catch(error: Error) {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 no peer device :e:' + `, error code is ${error.code}, message is ${error.message}`);
        }
      } catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_3400
     * @tc.desc   Test Ets Api DevicekvStore!.onSyncComplete() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        kvStore!.onSyncComplete((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 0' + data)
          expect(data != null).assertTrue();
        });
        await kvStore!.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 put success');
          expect(data == undefined).assertTrue();
        }).catch((error: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 put failed:' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
        try {
          let mode = factory.SyncMode.PUSH_PULL;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore!.sync(syncDeviceIds, mode);
        } catch(error: Error) {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 no peer device :e:' + `, error code is ${error.code}, message is ${error.message}`);
        }
      } catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_5700
     * @tc.desc   Test Ets Api DevicekvStore!.offChange() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0100');
      try {
        let func = (data: factory.ChangeNotification) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0100 0' + data)
        };
        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func);
        kvStore!.offDataChange(func);
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_5300
     * @tc.desc   Test Ets Api DevicekvStore!.offChange() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0200');
      try {
        let func = (data: factory.ChangeNotification) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0200 0' + data)
        };
        let func1 = (data: factory.ChangeNotification) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0200 0' + data)
        };

        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func);

        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func1);
        kvStore!.offDataChange(func);
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_5500
     * @tc.desc   Test Ets Api DevicekvStore!.offChange() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0300');
      try {
        let func = (data: factory.ChangeNotification) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0300 0' + data)
        };
        let func1 = (data: factory.ChangeNotification) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0300 0' + data)
        };

        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func);

        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func1);
        kvStore!.offDataChange(func);
        kvStore!.offDataChange(func1);
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_5800
     * @tc.desc   Test Ets Api DevicekvStore!.offChange() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0400');
      try {
        let func = (data: factory.ChangeNotification) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0400 0' + data)
        };

        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func);
        kvStore!.offDataChange();
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_5900
     * @tc.desc   Test Ets Api DevicekvStore!.offSyncComplete() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100');
      try {
        let func = (data: Array<[string, int]>) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100 0' + data)
        };
        kvStore!.onSyncComplete(func);
        kvStore!.offSyncComplete(func);
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_5400
     * @tc.desc   Test Ets Api DevicekvStore!.offSyncComplete() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200');
      try {
        let func = (data: Array<[string, int]>) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 0' + data)
        };
        let func1 = (data: Array<[string, int]>) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 0' + data)
        };
        kvStore!.onSyncComplete(func);
        kvStore!.onSyncComplete(func1);
        kvStore!.offSyncComplete(func);
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_5600
     * @tc.desc   Test Ets Api DevicekvStore!.offSyncComplete() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300');
      try {
        let func = (data: Array<[string, int]>) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 0' + data)
        };
        let func1 = (data: Array<[string, int]>) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 0' + data)
        };
        kvStore!.onSyncComplete(func);
        kvStore!.onSyncComplete(func1);
        kvStore!.offSyncComplete(func);
        kvStore!.offSyncComplete(func1);
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_6000
     * @tc.desc   Test Ets Api DevicekvStore!.offSyncComplete() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400');
      try {
        let func = (data: Array<[string, int]>) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400 0' + data)
        };
        kvStore!.onSyncComplete(func);
        kvStore!.offSyncComplete();
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400 put e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_7600
     * @tc.desc   Test Ets Api DeviceKvStore.SetSyncRange() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0100');
      try {
        let localLabels = ['A', 'B'];
        let remoteSupportLabels = ['C', 'D'];
        await kvStore!.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0100 setSyncRange success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_7500
     * @tc.desc   Test Ets Api DeviceKvStore.SetSyncRange() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0200');
      try {
        let localLabels = ['A', 'B'];
        let remoteSupportLabels = ['B', 'C'];
        await kvStore!.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0200 setSyncRange success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0200 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_7400
     * @tc.desc   Test Ets Api DeviceKvStore.SetSyncRange() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0300');
      try {
        let localLabels = ['A', 'B'];
        let remoteSupportLabels = ['A', 'B'];
        await kvStore!.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0300 setSyncRange success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0300 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_4500
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Batch) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100');
      try {
        let entries = putBatchString(10, 'batch_test_string_key');
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 entries: ' + JSON.stringify(entries));
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore!.getEntries(localDeviceId, 'batch_test_string_key').then((entrys: factory.Entry[]|undefined) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 getEntries success');
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 entrys.length: ' + entrys!.length);
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 entrys[0]: ' + JSON.stringify(entrys![0]));
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 entrys[0].value: ' + JSON.stringify(entrys![0].value));
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 entrys[0].value.value: ' + entrys![0].value.value);
            expect(entrys!.length == 10).assertTrue();
            expect(entrys![0].value.value == 'batch_test_string_value').assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_4400
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Batch) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200');
      try {
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_number_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.LONG,
              value : 222 as long
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 entries: ' + JSON.stringify(entries));
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore!.getEntries(localDeviceId, 'batch_test_number_key').then((entrys: factory.Entry[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 getEntries success');
            expect(entrys!.length == 10).assertTrue();
            expect(entrys![0].value.value == 222).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_4300
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Batch) testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300');
      try {
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_number_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.DOUBLE,
              value : 2.0
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 entries: ' + JSON.stringify(entries));
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore!.getEntries(localDeviceId, 'batch_test_number_key').then((entrys: factory.Entry[]) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 getEntries success');
            expect(entrys!.length == 10).assertTrue();
            expect(entrys![0].value.value == 2.0).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_4200
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Batch) testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400');
      try {
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_number_key';
          let entry: factory.Entry  = {
            key : key + i,
            value : {
              type : factory.ValueType.DOUBLE,
              value : 2.00
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 entries: ' + JSON.stringify(entries));
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore!.getEntries(localDeviceId, 'batch_test_number_key').then((entrys: factory.Entry[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 getEntries success');
            expect(entrys!.length == 10).assertTrue();
            expect(entrys![0].value.value == 2.00).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_4100
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Batch) testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500');
      try {
        let bo = false;
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_bool_key';
          let entry: factory.Entry  = {
            key : key + i,
            value : {
              type : factory.ValueType.BOOLEAN,
              value : bo
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 entries: ' + JSON.stringify(entries));
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore!.getEntries(localDeviceId, 'batch_test_bool_key').then((entrys: factory.Entry[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 getEntries success');
            expect(entrys!.length == 10).assertTrue();
            expect(entrys![0].value.value == bo).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_4600
     * @tc.desc   Test Ets Api DeviceKvStore.Put(Batch) testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600');
      try {
        let arr = new Uint8Array([21,31]);
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_bool_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.BYTE_ARRAY,
              value : arr
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 entries: ' + JSON.stringify(entries));
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore!.getEntries(localDeviceId, 'batch_test_bool_key').then((entrys: factory.Entry[] | undefined) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 getEntries success');
            expect(entrys!.length == 10).assertTrue();
            expect(entrys![0].value.value.toString() == arr.toString()).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_5200
     * @tc.desc   Test Ets Api DeviceKvStore.DeleteBatch() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100');
      try {
        let entries: factory.Entry[] = [];

        let keys: string[] = [];
        for (let i = 0; i < 5; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
          keys.push(key + i);
        }
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 entries: ' + JSON.stringify(entries));
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore!.deleteBatch(keys).then((err) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 deleteBatch success');
            expect(err == undefined).assertTrue();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_5000
     * @tc.desc   Test Ets Api DeviceKvStore.DeleteBatch() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0200');
      try {
        let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
        await kvStore!.deleteBatch(keys).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0200 deleteBatch success');
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0200 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_5100
     * @tc.desc   Test Ets Api DeviceKvStore.DeleteBatch() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300');
      try {
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 entries: ' + JSON.stringify(entries));
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 putBatch success');
          expect(err == undefined).assertTrue();
          let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
          await kvStore!.deleteBatch(keys).then((err) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 deleteBatch success');
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_4000
     * @tc.desc   Test Ets Api DeviceKvStore.startTransaction() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100');
      try {
        let count = 0;

        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100' + JSON.stringify(data))
          count++;
        });
        await kvStore!.startTransaction().then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 startTransaction success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        let entries = putBatchString(10, 'batch_test_string_key');
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 entries: ' + JSON.stringify(entries));
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 putBatch success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        let keys = Object.keys(entries).slice(5);
        await kvStore!.deleteBatch(keys).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 deleteBatch success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        await kvStore!.commit().then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 commit success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 commit fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        await sleep(500);
        expect(count == 1).assertTrue();
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_3900
     * @tc.desc   Test Ets Api DeviceKvStore.startTransaction() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200');
      try {
        let count = 0;

        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200' + JSON.stringify(data))
          count++;
        });
        await kvStore!.startTransaction().then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 startTransaction success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        let entries = putBatchString(10, 'batch_test_string_key');
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 entries: ' + JSON.stringify(entries));
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 putBatch success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        let keys = Object.keys(entries).slice(5);
        await kvStore!.deleteBatch(keys).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 deleteBatch success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        await kvStore!.rollback().then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 rollback success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 rollback fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        await sleep(500);
        expect(count == 0).assertTrue();
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_7100
     * @tc.desc   Test Ets Api DeviceKvStore.EnableSync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0100');
      try {
        await kvStore!.enableSync(true).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0100 enableSync success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0100 enableSync fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_7000
     * @tc.desc   Test Ets Api DeviceKvStore.EnableSync() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0200');
      try {
        await kvStore!.enableSync(false).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0200 enableSync success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0200 enableSync fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_6700
     * @tc.desc   Test Ets Api DeviceKvStore.RemoveDeviceData() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100');
      try {
        await kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 put success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        let deviceid = 'no_exist_device_id';
        await kvStore!.removeDeviceData(deviceid).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 removeDeviceData success');
          expect(null).assertFail();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 removeDeviceData fail ' + `, error code is ${err.code}, message is ${err.message}`);
        });
        await kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 get success data:' + data);
          expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_6900
     * @tc.desc   Test Ets Api DeviceKvStore.RemoveDeviceData() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300');
      try {
        await kvStore!.removeDeviceData('').then((data) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 removeDeviceData success');
          expect(null).assertFail();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 removeDeviceData fail ' + `, error code is ${err.code}, message is ${err.message}`);
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_2600
     * @tc.desc   Test Ets Api DeviceKvStore.getResultSet() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100');
      try {
        let resultSet: factory.KVStoreResultSet | null = null;
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 putBatch success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        await kvStore!.getResultSet(localDeviceId, 'batch_test_string_key').then((result: factory.KVStoreResultSet) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet success');
          resultSet = result;
          expect(resultSet!.getCount() == 10).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        await kvStore!.closeResultSet(resultSet!).then((err: Error | undefined) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 closeResultSet success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_0100
     * @tc.desc   Test Ets Api DeviceKvStore.getResultSet() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200');
      try {
        let resultSet: factory.KVStoreResultSet | null = null;
        await kvStore!.getResultSet(localDeviceId, 'batch_test_string_key').then((result: factory.KVStoreResultSet) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200 getResultSet success');
          resultSet = result;
          expect(resultSet!.getCount() == 0).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        await kvStore!.closeResultSet(resultSet!).then((err: Error | undefined) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200 closeResultSet success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_2800
     * @tc.desc   Test Ets Api DeviceKvStore.getResultSet() testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500');
      try {
        let resultSet: factory.KVStoreResultSet | null = null;
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 putBatch success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        let query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getResultSet(localDeviceId, query).then((result: factory.KVStoreResultSet) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 getResultSet success');
          resultSet = result;
          expect(resultSet!.getCount() == 10).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        query.deviceId(localDeviceId);
        console.info("testDeviceKvStoreGetResultSet005 " + query.getSqlLike());
        await kvStore!.closeResultSet(resultSet!).then((err: Error | undefined) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 closeResultSet success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_2700
     * @tc.desc   Test Ets Api DeviceKvStore.getResultSet() testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600');
      try {
        let resultSet: factory.KVStoreResultSet | null = null;
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        await kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 putBatch success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        let query = new factory.Query();
        query.prefixKey("batch_test");
        console.info("testDeviceKvStoreGetResultSet006 " + query.getSqlLike());
        await kvStore!.getResultSet(query).then((result: factory.KVStoreResultSet) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 getResultSet success');
          resultSet = result;
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 getResultSet resultSet:'+resultSet!.getCount());
          expect(resultSet!.getCount() == 10).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        query.deviceId(localDeviceId);
        kvStore!.closeResultSet(resultSet!).then((err: Error | undefined) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 closeResultSet success err:' + err);
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_2900
     * @tc.desc   Test Ets Api DeviceKvStore.GetResultSet() testcase 007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700');
      try {
        let resultSet: factory.KVStoreResultSet | null = null;
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700 putBatch success');
          expect(err == undefined).assertTrue();
          let query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore!.getResultSet(localDeviceId, query).then((result: factory.KVStoreResultSet) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700 getResultSet success');
            resultSet = result;
            expect(resultSet!.getCount() == 10).assertTrue();
            kvStore!.closeResultSet(resultSet!).then(err => {
              console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700 closeResultSet success');
              expect(err == undefined).assertTrue();
              done();
            })
          });
        });
      } catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_2200
     * @tc.desc   Test Ets Api DeviceKvStore.CloseResultSet() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200');
      try {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 success');
        let resultSet: factory.KVStoreResultSet | null  = null;
        await kvStore!.getResultSet(localDeviceId, 'batch_test_string_key').then((result: factory.KVStoreResultSet) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 getResultSet success');
          resultSet = result;
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        kvStore!.closeResultSet(resultSet!).then((err: Error | undefined) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 closeResultSet success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_3200
     * @tc.desc   Test Ets Api DeviceKvStore.Get(ResultSize) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100');
      try {
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100 putBatch success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        let query = new factory.Query();
        query.prefixKey("batch_test");
        query.deviceId(localDeviceId);
        await kvStore!.getResultSize(query).then((resultSize) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100 getResultSet success resultSize:'+resultSize);
          expect(resultSize == 10).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_4700
     * @tc.desc   Test Ets Api DeviceKvStore.Get(ResultSize) testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200');
      try {
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200 putBatch success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        let query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getResultSize(localDeviceId, query).then((resultSize) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200 getResultSet success');
          expect(resultSize == 10).assertTrue();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_4900
     * @tc.desc   Test Ets Api DeviceKvStore.GetEntries() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100');
      try {
        let arr = new Uint8Array([21,31]);
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_bool_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.BYTE_ARRAY,
              value : arr
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 entries: ' + JSON.stringify(entries));
        kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 putBatch success');
          expect(err == undefined).assertTrue();
          let query = new factory.Query();
          query.deviceId(localDeviceId);
          query.prefixKey("batch_test");
          await kvStore!.getEntries(localDeviceId, query).then((entrys: factory.Entry[]) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 getEntries success');
            console.info(entrys.length);
            console.info(entrys![0].value.value.toString());
            expect(entrys.length == 10).assertTrue();
            expect(entrys![0].value.value.toString() == arr.toString()).assertTrue();

            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 success');
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_4800
     * @tc.desc   Test Ets Api DeviceKvStore.GetEntries() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200');
      try {
        let arr = new Uint8Array([21,31]);
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_bool_key';
          let entry: factory.Entry = {
            key : key + i,
            value : {
              type : factory.ValueType.BYTE_ARRAY,
              value : arr
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 entries: ' + JSON.stringify(entries));
        kvStore!.putBatch(entries).then((err) => {
          console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 putBatch success');
          expect(err == undefined).assertTrue();
          let query = new factory.Query();
          query.prefixKey("batch_test");
          query.deviceId(localDeviceId);
          kvStore!.getEntries(query).then((entrys: factory.Entry[]) => {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 getEntries success');
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();

            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 success');
            done();
          }).catch((err: Error) => {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      }catch(e: Error) {
        console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })
  })
}