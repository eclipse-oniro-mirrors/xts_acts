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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import factory from '@ohos.data.distributedKVStore'
import common from "@ohos.app.ability.common";

const KEY_TEST_INT_ELEMENT = 'key_test_int_2';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float_2';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean_2';
const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
const KEY_TEST_SYNC_ELEMENT = 'key_test_sync';

const VALUE_TEST_INT_ELEMENT = 1234;
const VALUE_TEST_FLOAT_ELEMENT = 4321.12;
const VALUE_TEST_BOOLEAN_ELEMENT = true;
const VALUE_TEST_STRING_ELEMENT = 'value-string-002';
const VALUE_TEST_SYNC_ELEMENT = 'value-string-001';

const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore';
const TEST_STORE_ID = 'dstoreId';
let kvManager = null;
let kvStore = null;
let localDeviceId = null;
const USED_DEVICE_IDS =  ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
const UNUSED_DEVICE_IDS =  [];  /* add you test device-ids here */
let syncDeviceIds = USED_DEVICE_IDS.concat(UNUSED_DEVICE_IDS);
let context: common.UIAbilityContext;

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function putBatchString(len, prefix) {
  let entries = [];
  for (let i = 0; i < len; i++) {
    let entry = {
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
export default function deviceKvStoreCallbackTest(){
  describe('deviceKvStoreCallbackTest', function () {
    const options = {
      createIfMissing : true,
      encrypt : false,
      backup : false,
      autoSync : true,
      kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
      schema : '',
      securityLevel : factory.SecurityLevel.S2,
    }

    beforeAll(async function (done) {
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      const config = {
        bundleName : TEST_BUNDLE_NAME,
        context:context
      }
      console.info('beforeAll config:'+ JSON.stringify(config));
      kvManager = factory.createKVManager(config)
      await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
        kvStore = store;
        console.info('beforeAll getKVStore for getDeviceId success');
      }).catch((err) => {
        console.error('beforeAll getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      let getDeviceId = new Promise((resolve, reject) => {
        kvStore.on('dataChange', 0, function (data) {
          console.info('beforeAll on data change: ' + JSON.stringify(data));
          resolve(data.deviceId);
        });
        kvStore.put("getDeviceId", "byPut").then((data) => {
          console.info('beforeAll put success');
          expect(data == undefined).assertTrue();
        });
        setTimeout(() => {
          reject(new Error('not resolved in 2 second, reject it.'))
        }, 2000);
      });
      await getDeviceId.then(function(deviceId) {
        console.info('beforeAll getDeviceId ' + JSON.stringify(deviceId));
        localDeviceId = deviceId;
      }).catch((error) => {
        console.error('beforeAll can NOT getDeviceId, fail: ' + `, error code is ${error.code}, message is ${error.message}`);
        expect(null).assertFail();
      });
      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore);
      await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
      kvStore = null;
      console.info('beforeAll end');
      done();
    })

    afterAll(async function (done) {
      console.info('afterAll');
      kvManager = null;
      kvStore = null;
      done();
    })

    beforeEach(async function (done) {
      console.info('beforeEach' + JSON.stringify(options));
      await kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
        kvStore = store;
        console.info('beforeEach getKVStore success');
        done();
      });
    })

    afterEach(async function (done) {
      console.info('afterEach');
      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, async function (err, data) {
        console.info('afterEach closeKVStore success');
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
          console.info('afterEach deleteKVStore success');
          done();
        });
      });
      kvStore = null;
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1100
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(String) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0100');
      try {
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0100 put success');
          } else {
            console.error('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0100 put fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          }
          done();
        });
      }catch (e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0100 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1200
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(String) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0200');
      try {
        let str = '';
        for (let i = 0 ; i < 4095; i++) {
          str += 'x';
        }
        await kvStore.put(KEY_TEST_STRING_ELEMENT+'102', str, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0200 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT+'102', function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0200 get success');
            expect(str == data).assertTrue();
            done();
          });
        });
      }catch (e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTSTRING_0200 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2900
     * @tc.desc Test Js Api DeviceKvStore.Get(String) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(String) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0100');
      try{
        await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0100 get success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0100 get fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0100 get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2800
     * @tc.desc Test Js Api DeviceKvStore.Get(String) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(String) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0200');
      try{
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0200 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT, function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0200 get success');
            expect((err == undefined) && (VALUE_TEST_STRING_ELEMENT == data)).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETSTRING_0200 get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0700
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Int) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTINT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0100');
      try {
        await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0100 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0100 get success');
            expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTINT_0100 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0800
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Int) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTINT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0200');
      try {
        let intValue = 987654321;
        await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0200 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0200 get success');
            expect((err == undefined) && (intValue == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTINT_0200 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1000
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Int) testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTINT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0300');
      try {
        let intValue = Number.MIN_VALUE;
        await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0300 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0300 get success');
            expect((err == undefined) && (intValue == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTINT_0300 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0900
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Int) testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTINT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0400');
      try {
        let intValue = Number.MAX_VALUE;
        await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0400 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTINT_0400 get success');
            expect((err == undefined) && (intValue == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTINT_0400 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1400
     * @tc.desc Test Js Api DeviceKvStore.Get(Int) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(Int) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETINT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0100');
      try {
        await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0100 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0100 get success');
            expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETINT_0100 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1600
     * @tc.desc Test Js Api DeviceKvStore.Get(Int) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(Int) testcase 00
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETINT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0200');
      try {
        await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0200 get success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETINT_0200 get fail');
          }
          done();
        })
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETINT_0200 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0200
     * @tc.desc Test Js Api DeviceKvStore.Put(Bool) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Bool) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBOOLEAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTBOOLEAN_0100');
      try {
        await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBOOLEAN_0100 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTBOOLEAN_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1500
     * @tc.desc Test Js Api DeviceKvStore.Get(Bool) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(Bool) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0100');
      try {
        await kvStore.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0100 get success');
            expect(null).assertFail();
          } else {
            console.error('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0100 get fail' + `, error code is ${err.code}, message is ${err.message}`);
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0100 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1300
     * @tc.desc Test Js Api DeviceKvStore.Get(Bool) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(Bool) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0200');
      try {
        await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, async function (err, data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0200 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0200 get success');
            expect((err == undefined) && (VALUE_TEST_BOOLEAN_ELEMENT == data)).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETBOOLEAN_0200 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0300
     * @tc.desc Test Js Api DeviceKvStore.Put(Float) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Float) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0100');
      try {
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0100 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0100 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0600
     * @tc.desc Test Js Api DeviceKvStore.Put(Float) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Float) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0200');
      try {
        let floatValue = 123456.654321;
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0200 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err, data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0200 get success');
            expect((err == undefined) && (floatValue == data)).assertTrue();
            done();
          })
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0200 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0400
     * @tc.desc Test Js Api DeviceKvStore.Put(Float) testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Float) testcase 00
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0300');
      try {
        let floatValue = 123456.0;
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0300 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err, data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0300 get success');
            expect((err == undefined) && (floatValue == data)).assertTrue();
            done();
          })
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0300 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0500
     * @tc.desc Test Js Api DeviceKvStore.Put(Float) testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Float) testcase 00
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0400');
      try {
        let floatValue = 123456.00;
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0400 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err, data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0400 get success');
            expect((err == undefined) && (floatValue == data)).assertTrue();
            done();
          })
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTFLOAT_0400 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2700
     * @tc.desc Test Js Api DeviceKvStore.Get(Float) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(Float) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETFLOAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETFLOAT_0100');
      try {
        await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETFLOAT_0100 get success');
            expect(null).assertFail();
          } else {
            console.error('SUB_DDM_DKV_DEVICESTORE_GETFLOAT_0100 get fail' + `, error code is ${err.code}, message is ${err.message}`);
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETFLOAT_0100 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6000
     * @tc.desc Test Js Api DeviceKvStore.9.DeleteString() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.DeleteString() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0100');
      try {
        await kvStore.delete(KEY_TEST_STRING_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0100 delete success');
          } else {
            console.error('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0100 delete fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0100 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6100
     * @tc.desc Test Js Api DeviceKvStore.9.DeleteString() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.DeleteString() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0200');
      try {
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err, data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0200 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_STRING_ELEMENT, function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0200 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_DELETESTRING_0200 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5800
     * @tc.desc Test Js Api DeviceKvStore.9.DeleteInt() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.DeleteInt() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0100');
      try{
        await kvStore.delete(KEY_TEST_INT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0100 get success');
          } else {
            console.error('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0100 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0100 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5900
     * @tc.desc Test Js Api DeviceKvStore.9.DeleteInt() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.DeleteInt() testcase 00
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0200');
      try{
        await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0200 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0200 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_DELETEINT_0200 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5600
     * @tc.desc Test Js Api DeviceKvStore.9.DeleteFloat() testcase 001
     * @tc.type: FUNC
     * @tc.name issueNumber
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0100');
      try{
        await kvStore.delete(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0100 get success');
          } else {
            console.error('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0100 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0100 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5700
     * @tc.desc Test Js Api DeviceKvStore.9.DeleteFloat() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.DeleteFloat() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0200');
      try{
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, async function (err, data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0200 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0200 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_DELETEFLOAT_0200 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5400
     * @tc.desc Test Js Api DeviceKvStore.9.DeleteBool() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.DeleteBool() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0100');
      try{
        await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0100 get success');
          } else {
            console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0100 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0100 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5500
     * @tc.desc Test Js Api DeviceKvStore.9.DeleteBool() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.DeleteBool() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0200');
      try{
        await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, async function (err, data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0200 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0200 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBOOLEAN_0200 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1900
     * @tc.desc Test Js Api DeviceKvStore.9.OnChange() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.OnChange() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0100');
      try {
        kvStore.on('dataChange', 0, function (data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0100 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0100 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0100 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2100
     * @tc.desc Test Js Api DeviceKvStore.9.OnChange() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.OnChange() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0200');
      try {
        kvStore.on('dataChange', 1, function (data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0200 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0200 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0200 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1700
     * @tc.desc Test Js Api DeviceKvStore.9.OnChange() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.OnChange() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0300');
      try {
        kvStore.on('dataChange', 2, function (data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0300 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0300 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ONCHANGE_0300 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2000
     * @tc.desc Test Js Api DeviceKvStore.9.OnSyncComplete() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.OnSyncComplete() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        kvStore.on('syncComplete', function (data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100 put success');
          expect(data == undefined).assertTrue();
        }).catch((error) => {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100 put failed:' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
        try {
          let mode = factory.SyncMode.PULL_ONLY;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore.sync(syncDeviceIds, mode);
        } catch(e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100 sync no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
        }
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0100 no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2200
     * @tc.desc Test Js Api DeviceKvStore.9.OnSyncComplete() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.OnSyncComplete() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        kvStore.on('syncComplete', function (data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200 put success');
          expect(data == undefined).assertTrue();
        }).catch((error) => {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200 put failed:' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
        try {
          let mode = factory.SyncMode.PUSH_ONLY;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore.sync(syncDeviceIds, mode);
        } catch(e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200 sync no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
        }
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0200 no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_1800
     * @tc.desc Test Js Api DeviceKvStore.9.OnSyncComplete() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.OnSyncComplete() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        kvStore.on('syncComplete', function (data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT).then((data) => {
          console.info('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300 put success');
          expect(data == undefined).assertTrue();
        }).catch((error) => {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300 put failed:' + `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
        });
        try {
          let mode = factory.SyncMode.PUSH_PULL;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore.sync(syncDeviceIds, mode);
        } catch(e) {
          console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300 sync no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
        }
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ONSYNCCOMPLETE_0300 no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7200
     * @tc.desc Test Js Api DeviceKvStore.9.SetSyncRange() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.SetSyncRange() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100');
      try {
        let localLabels = ['A', 'B'];
        let remoteSupportLabels = ['C', 'D'];
        await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7100
     * @tc.desc Test Js Api DeviceKvStore.9.SetSyncRange() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.SetSyncRange() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0200');
      try {
        let localLabels = ['A', 'B'];
        let remoteSupportLabels = ['B', 'C'];
        await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0200 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7000
     * @tc.desc Test Js Api DeviceKvStore.9.SetSyncRange() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.SetSyncRange() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0300');
      try {
        let localLabels = ['A', 'B'];
        let remoteSupportLabels = ['A', 'B'];
        await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0300 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_SETSYNCRANGE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4700
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100');
      try {
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries(localDeviceId, 'batch_test_string_key', function (err,entrys) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 getEntries success');
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 entrys.length: ' + entrys.length);
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 'batch_test_string_value').assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4600
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200');
      try {
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_number_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.INTEGER,
              value : 222
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries(localDeviceId, 'batch_test_number_key', function (err,entrys) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 getEntries success');
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 entrys.length: ' + entrys.length);
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 222).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4500
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300');
      try {
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_number_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.FLOAT,
              value : 2.0
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries(localDeviceId, 'batch_test_number_key', function (err,entrys) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 getEntries success');
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 entrys.length: ' + entrys.length);
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 2.0).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4400
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400');
      try {
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_number_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.DOUBLE,
              value : 2.00
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries(localDeviceId, 'batch_test_number_key', function (err,entrys) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 getEntries success');
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 entrys.length: ' + entrys.length);
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 2.00).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4300
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 005
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500');
      try {
        let bo = false;
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_bool_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.BOOLEAN,
              value : bo
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries(localDeviceId, 'batch_test_bool_key', function (err,entrys) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 getEntries success');
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 entrys.length: ' + entrys.length);
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == bo).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4800
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 006
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 006
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600');
      try {
        let arr = new Uint8Array([21,31]);
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_bool_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.BYTE_ARRAY,
              value : arr
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries(localDeviceId, 'batch_test_bool_key', function (err,entrys) {
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 getEntries success');
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 entrys.length: ' + entrys.length);
            console.info('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_PUTBATCH_0600 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5300
     * @tc.desc Test Js Api DeviceKvStore.9.DeleteBatch() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.DeleteBatch() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100');
      try {
        let entries = [];
        let keys = [];
        for (let i = 0; i < 5; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
          keys.push(key + i);
        }
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.deleteBatch(keys, async function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100 deleteBatch success');
            expect(err == undefined).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5100
     * @tc.desc Test Js Api DeviceKvStore.9.DeleteBatch() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.DeleteBatch() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0200');
      try {
        let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
        await kvStore.deleteBatch(keys, function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0200 deleteBatch success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5200
     * @tc.desc Test Js Api DeviceKvStore.9.DeleteBatch() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.DeleteBatch() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300');
      try {
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300 putBatch success');
          expect(err == undefined).assertTrue();
          let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
          await kvStore.deleteBatch(keys, async function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300 deleteBatch success');
            expect(err == undefined).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_DELETEBATCH_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4200
     * @tc.desc Test Js Api DeviceKvStore.9.startTransaction() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.startTransaction() testcase 00
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100');
      try {
        let count = 0;
        kvStore.on('dataChange', 0, function (data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 0' + data)
          count++;
        });
        await kvStore.startTransaction(async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 startTransaction success');
          expect(err == undefined).assertTrue();
          let entries = putBatchString(10, 'batch_test_string_key');
          console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 entries: ' + JSON.stringify(entries));
          await kvStore.putBatch(entries, async function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 putBatch success');
            expect(err == undefined).assertTrue();
            let keys = Object.keys(entries).slice(5);
            await kvStore.deleteBatch(keys, async function (err,data) {
              console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 deleteBatch success');
              expect(err == undefined).assertTrue();
              await kvStore.commit(async function (err,data) {
                console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 commit success');
                expect(err == undefined).assertTrue();
                await sleep(500);
                expect(count == 1).assertTrue();
                done();
              });
            });
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4100
     * @tc.desc Test Js Api DeviceKvStore.9.startTransaction() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.startTransaction() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200');
      try {
        let count = 0;
        kvStore.on('dataChange', 0, function (data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 0' + data)
          count++;
        });
        await kvStore.startTransaction(async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 startTransaction success');
          expect(err == undefined).assertTrue();
          let entries =  putBatchString(10, 'batch_test_string_key');
          console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 entries: ' + JSON.stringify(entries));
          await kvStore.putBatch(entries, async function (err,data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 putBatch success');
            expect(err == undefined).assertTrue();
            let keys = Object.keys(entries).slice(5);
            await kvStore.deleteBatch(keys, async function (err,data) {
              console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 deleteBatch success');
              expect(err == undefined).assertTrue();
              await kvStore.rollback(async function (err,data) {
                console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 rollback success');
                expect(err == undefined).assertTrue();
                await sleep(500);
                expect(count == 0).assertTrue();
                done();
              });
            });
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4000
     * @tc.desc Test Js Api DeviceKvStore.9.startTransaction() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.startTransaction() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0300');
      try {
        await kvStore.startTransaction(1, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0300 startTransaction success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0300 startTransaction fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3900
     * @tc.desc Test Js Api DeviceKvStore.9.startTransaction() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.startTransaction() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0400');
      try {
        await kvStore.startTransaction('test_string', function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0400 startTransaction success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0400 startTransaction fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3800
     * @tc.desc Test Js Api DeviceKvStore.9.startTransaction() testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.startTransaction() testcase 005
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0500');
      try {
        await kvStore.startTransaction(2.000, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0500 startTransaction success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0500 startTransaction fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_STARTTRANSACTION_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7700
     * @tc.desc Test Js Api DeviceKvStore.9.Commit() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.Commit() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_COMMIT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_COMMIT_0100');
      try {
        await kvStore.commit(1, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_COMMIT_0100 commit success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_COMMIT_0100 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_COMMIT_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7800
     * @tc.desc Test Js Api DeviceKvStore.9.Commit() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.Commit() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_COMMIT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_COMMIT_0200');
      try {
        await kvStore.commit('test_string', function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_COMMIT_0200 commit success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_COMMIT_0200 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_COMMIT_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7600
     * @tc.desc Test Js Api DeviceKvStore.9.Commit() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.Commit() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_COMMIT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_COMMIT_0300');
      try {
        await kvStore.commit(2.000, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_COMMIT_0300 commit success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_COMMIT_0300 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_COMMIT_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7400
     * @tc.desc Test Js Api DeviceKvStore.9.Rollback() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.Rollback() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0100');
      try {
        await kvStore.rollback(1, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0100 commit success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0100 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7500
     * @tc.desc Test Js Api DeviceKvStore.9.Rollback() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.Rollback() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0200');
      try {
        await kvStore.rollback('test_string', function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0200 commit success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0200 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_7300
     * @tc.desc Test Js Api DeviceKvStore.9.Rollback() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.Rollback() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0300');
      try {
        await kvStore.rollback(2.000, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0300 commit success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0300 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ROLLBACK_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6700
     * @tc.desc Test Js Api DeviceKvStore.9.EnableSync() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.EnableSync() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0100');
      try {
        await kvStore.enableSync(true, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0100 enableSync success');
            expect(err == undefined).assertTrue();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0100 enableSync fail');
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6600
     * @tc.desc Test Js Api DeviceKvStore.9.EnableSync() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.EnableSync() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0200');
      try {
        await kvStore.enableSync(false, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0200 enableSync success');
            expect(err == undefined).assertTrue();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0200 enableSync fail');
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6800
     * @tc.desc Test Js Api DeviceKvStore.9.EnableSync() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.EnableSync() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0300');
      try {
        await kvStore.enableSync(function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0300 enableSync success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0300 enableSync fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6900
     * @tc.desc Test Js Api DeviceKvStore.9.EnableSync() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.EnableSync() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0400');
      try {
        await kvStore.enableSync(null, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0400 enableSync success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0400 enableSync fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_ENABLESYNC_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6200
     * @tc.desc Test Js Api DeviceKvStore.9.RemoveDeviceData() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.RemoveDeviceData() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100');
      try {
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100 put success');
          expect(err == undefined).assertTrue();
          let deviceid = 'no_exist_device_id';
          await kvStore.removeDeviceData(deviceid, async function (err,data) {
            if (err == undefined) {
              console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100 removeDeviceData success');
              expect(null).assertFail();
              done();
            } else {
              console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100 removeDeviceData fail');
              await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT, async function (err,data) {
                console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100 get success');
                expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
                done();
              });
            }
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6300
     * @tc.desc Test Js Api DeviceKvStore.9.RemoveDeviceData() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.RemoveDeviceData() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0200');
      try {
        await kvStore.removeDeviceData(function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0200 removeDeviceData success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0200 removeDeviceData fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6500
     * @tc.desc Test Js Api DeviceKvStore.9.RemoveDeviceData() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.RemoveDeviceData() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0300');
      try {
        await kvStore.removeDeviceData('', function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0300 removeDeviceData success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0300 removeDeviceData fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_6400
     * @tc.desc Test Js Api DeviceKvStore.9.RemoveDeviceData() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.RemoveDeviceData() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0400');
      try {
        await kvStore.removeDeviceData(null, function (err,data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0400 removeDeviceData success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0400 removeDeviceData fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_REMOVEDEVICEDATA_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3000
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.GetResultSet() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100');
      try {
        let resultSet;
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        await kvStore.putBatch(entries, async function (err, data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getResultSet(localDeviceId, 'batch_test_string_key', async function (err, result) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100 getResultSet success');
            resultSet = result;
            expect(resultSet.getCount() == 10).assertTrue();
            await kvStore.closeResultSet(resultSet, function (err, data) {
              console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100 closeResultSet success');
              expect(err == undefined).assertTrue();
              done();
            })
          });
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_0100
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.GetResultSet() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0200');
      try {
        let resultSet;
        await kvStore.getResultSet(localDeviceId, 'batch_test_string_key', async function (err, result) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0200 getResultSet success');
          resultSet = result;
          expect(resultSet.getCount() == 0).assertTrue();
          await kvStore.closeResultSet(resultSet, function (err, data) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0200 closeResultSet success');
            expect(err == undefined).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3400
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.GetResultSet() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0300');
      try {
        let resultSet;
        await kvStore.getResultSet(function (err, result) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0300 getResultSet success');
          expect(err != undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3500
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.GetResultSet() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0400');
      try {
        let resultSet;
        await kvStore.getResultSet('test_key_string', 123, function (err, result) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0400 getResultSet success');
          expect(err != undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3200
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.GetResultSet() testcase 005
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500');
      try {
        let resultSet;
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        await kvStore.putBatch(entries, async function (err, data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500 putBatch success');
          expect(err == undefined).assertTrue();
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore.getResultSet(localDeviceId, query, async function (err, result) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500 getResultSet success');
            resultSet = result;
            expect(resultSet.getCount() == 10).assertTrue();
            await kvStore.closeResultSet(resultSet, function (err, data) {
              console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500 closeResultSet success');
              expect(err == undefined).assertTrue();
              done();
            })
          });
        });
      } catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3100
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 006
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.GetResultSet() testcase 006
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600');
      try {
        let resultSet;
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        await kvStore.putBatch(entries, async function (err, data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600 putBatch success');
          expect(err == undefined).assertTrue();
          let query = new factory.Query();
          query.prefixKey("batch_test");
          query.deviceId(localDeviceId);
          await kvStore.getResultSet(query, async function (err, result) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600 getResultSet success');
            resultSet = result;
            expect(resultSet.getCount() == 10).assertTrue();
            await kvStore.closeResultSet(resultSet, function (err, data) {
              console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600 closeResultSet success');
              expect(err == undefined).assertTrue();
              done();
            })
          });
        });
      } catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0600 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3300
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 007
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.GetResultSet() testcase 007
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700');
      try {
        let resultSet;
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        await kvStore.putBatch(entries, async function (err, data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700 putBatch success');
          expect(err == undefined).assertTrue();
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore.getResultSet(localDeviceId, query, async function (err, result) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700 getResultSet success');
            resultSet = result;
            expect(resultSet.getCount() == 10).assertTrue();
            await kvStore.closeResultSet(resultSet, function (err, data) {
              console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700 closeResultSet success');
              expect(err == undefined).assertTrue();
              done();
            })
          });
        });
      } catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSET_0700 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2400
     * @tc.desc Test Js Api DeviceKvStore.9.CloseResultSet() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.CloseResultSet() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0100');
      try {
        console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0100 success');
        let resultSet = null;
        await kvStore.closeResultSet(resultSet, function (err, data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0100 closeResultSet success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0100 closeResultSet fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2600
     * @tc.desc Test Js Api DeviceKvStore.9.CloseResultSet() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.CloseResultSet() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0200');
      try {
        let resultSet = null;
        await kvStore.getResultSet(localDeviceId, 'batch_test_string_key', async function(err, result) {
          console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0200 getResultSet success');
          resultSet = result;
          await kvStore.closeResultSet(resultSet, function (err, data) {
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
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2300
     * @tc.desc Test Js Api DeviceKvStore.9.CloseResultSet() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.CloseResultSet() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0300');
      try {
        console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0300 success');
        await kvStore.closeResultSet(function (err, data) {
          if (err == undefined) {
            console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0300 closeResultSet success');
            expect(null).assertFail();
          } else {
            console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0300 closeResultSet fail');
          }
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_2500
     * @tc.desc Test Js Api DeviceKvStore.9.CloseResultSet() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.9.CloseResultSet() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0400 start');
      let errorInfo = undefined;
      try {
        kvStore.closeResultSet(1, function(err, data){
          if(err != null){
            console.error('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0400 e ' + `, error code is ${err.code}, message is ${err.message}`)
          }else{
            console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0400 success(callback)');
            expect(null).assertFail();
          }
        })
        console.info('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0400 success');
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_CLOSERESULTSET_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        errorInfo = e
        expect(e.code).assertEqual(401);
      }
      expect(errorInfo != undefined).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3700
     * @tc.desc Test Js Api DeviceKvStore.Get(ResultSize) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(ResultSize) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0100');
      try {
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        await kvStore.putBatch(entries, async function (err, data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0100 putBatch success');
          expect(err == undefined).assertTrue();
          let query = new factory.Query();
          query.prefixKey("batch_test");
          query.deviceId(localDeviceId);
          await kvStore.getResultSize(query, async function (err, resultSize) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0100 getResultSet success');
            expect(resultSize == 10).assertTrue();
            done();
          });
        });
      } catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_3600
     * @tc.desc Test Js Api DeviceKvStore.Get(ResultSize) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(ResultSize) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0200');
      try {
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        await kvStore.putBatch(entries, async function (err, data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0200 putBatch success');
          expect(err == undefined).assertTrue();
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore.getResultSize(localDeviceId, query, async function (err, resultSize) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0200 getResultSet success');
            expect(resultSize == 10).assertTrue();
            done();
          });
        });
      } catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETRESULTSIZE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_5000
     * @tc.desc Test Js Api DeviceKvStore.GetEntries() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.GetEntries() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100');
      try {
        let arr = new Uint8Array([21,31]);
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_bool_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.BYTE_ARRAY,
              value : arr
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 putBatch success');
          expect(err == undefined).assertTrue();
          let query = new factory.Query();
          query.deviceId(localDeviceId);
          query.prefixKey("batch_test");
          await kvStore.getEntries(localDeviceId, query, function (err,entrys) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 getEntries success');
            console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 entrys.length: ' + entrys.length);
            console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
            done();
          });
        });
        console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 success');
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_4900
     * @tc.desc Test Js Api DeviceKvStore.GetEntries() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.GetEntries() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200');
      try {
        let arr = new Uint8Array([21,31]);
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_bool_key';
          let entry = {
            key : key + i,
            value : {
              type : factory.ValueType.BYTE_ARRAY,
              value : arr
            }
          }
          entries.push(entry);
        }
        console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 putBatch success');
          expect(err == undefined).assertTrue();
          let query = new factory.Query();
          query.prefixKey("batch_test");
          query.deviceId(localDeviceId);
          await kvStore.getEntries(query, function (err,entrys) {
            console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 getEntries success');
            console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 entrys.length: ' + entrys.length);
            console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
            done();
          });
        });
        console.info('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 success');
      }catch(e) {
        console.error('SUB_DDM_DKV_DEVICESTORE_GETENTRIES_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })
  })
}