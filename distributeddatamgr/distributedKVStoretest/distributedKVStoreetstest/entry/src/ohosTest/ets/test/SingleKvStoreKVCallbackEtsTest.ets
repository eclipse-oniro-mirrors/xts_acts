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
import abilityFeatureAbility from '@ohos.ability.featureAbility'
import common from "@ohos.app.ability.common";

let context: common.UIAbilityContext;
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
const TEST_STORE_ID = 'storeId';
var kvManager = null;
var kvStore = null;
const USED_DEVICE_IDS =  ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
const UNUSED_DEVICE_IDS =  [];  /* add you test device-ids here */
var syncDeviceIds = USED_DEVICE_IDS.concat(UNUSED_DEVICE_IDS);

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function putBatchString(len, prefix) {
  let entries = [];
  for (var i = 0; i < len; i++) {
    var entry = {
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
export default function SingleKvStoreCallbackTest(){
  describe('SingleKvStoreCallbackTest', function () {
    const options = {
      createIfMissing : true,
      encrypt : false,
      backup : false,
      autoSync : true,
      kvStoreType : factory.KVStoreType.SINGLE_VERSION,
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
      try {
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info('afterEach closeKVStore success: err is: '+err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info('afterEach deleteKVStore success err is: '+err);
            done();
          });
        });
        kvStore = null;
      } catch (e) {
        console.error('afterEach closeKVStore err ' + `, error code is ${e.code}, message is ${e.message}`);
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0800
     * @tc.desc Test Js Api SingleKvStore.Put(String) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(String) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 0
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('SingleKvStorePutStringCallbackTest001');
      try {
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStorePutStringCallbackTest001 put success');
          } else {
            console.error('SingleKvStorePutStringCallbackTest001 put fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          }
          done();
        });
      }catch (e) {
        console.error('SingleKvStorePutStringCallbackTest001 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0700
     * @tc.desc Test Js Api SingleKvStore.Put(String) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(String) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutStringCallbackTest002');
      try {
        var str = '';
        for (var i = 0 ; i < 4095; i++) {
          str += 'x';
        }
        await kvStore.put(KEY_TEST_STRING_ELEMENT+'102', str, async function (err,data) {
          console.info('SingleKvStorePutStringCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_STRING_ELEMENT+'102', function (err,data) {
            console.info('SingleKvStorePutStringCallbackTest002 get success');
            expect(str == data).assertTrue();
            done();
          });
        });
      }catch (e) {
        console.error('SingleKvStorePutStringCallbackTest002 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0200
     * @tc.desc Test Js Api SingleKvStore.GetString() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetString() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetStringCallbackTest001');
      try{
        await kvStore.get(KEY_TEST_STRING_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreGetStringCallbackTest001 get success');
            expect(null).assertFail();
          } else {
            console.error('SingleKvStoreGetStringCallbackTest001 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(err.code == 15100004).assertTrue();
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreGetStringCallbackTest001 get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0900
     * @tc.desc Test Js Api SingleKvStore.GetString() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetString() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 0
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('SingleKvStoreGetStringCallbackTest002');
      try{
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err,data) {
          console.info('SingleKvStoreGetStringCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_STRING_ELEMENT, function (err,data) {
            console.info('SingleKvStoreGetStringCallbackTest002 get success');
            expect((err == undefined) && (VALUE_TEST_STRING_ELEMENT == data)).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SingleKvStoreGetStringCallbackTest002 get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0500
     * @tc.desc Test Js Api SingleKvStore.Put(Int) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Int) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutIntCallbackTest001');
      try {
        await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
          console.info('SingleKvStorePutIntCallbackTest001 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SingleKvStorePutIntCallbackTest001 get success');
            expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SingleKvStorePutIntCallbackTest001 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1000
     * @tc.desc Test Js Api SingleKvStore.Put(Int) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Int) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutIntCallbackTest002');
      try {
        var intValue = 987654321;
        await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
          console.info('SingleKvStorePutIntCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SingleKvStorePutIntCallbackTest002 get success');
            expect((err == undefined) && (intValue == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SingleKvStorePutIntCallbackTest002 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0400
     * @tc.desc Test Js Api SingleKvStore.Put(Int) testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Int) testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutIntCallbackTest003');
      try {
        var intValue = Number.MIN_VALUE;
        await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
          console.info('SingleKvStorePutIntCallbackTest003 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SingleKvStorePutIntCallbackTest003 get success');
            expect((err == undefined) && (intValue == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SingleKvStorePutIntCallbackTest003 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0300
     * @tc.desc Test Js Api SingleKvStore.Put(Int) testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Int) testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutIntCallbackTest004');
      try {
        var intValue = Number.MAX_VALUE;
        await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
          console.info('SingleKvStorePutIntCallbackTest004 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SingleKvStorePutIntCallbackTest004 get success');
            expect((err == undefined) && (intValue == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SingleKvStorePutIntCallbackTest004 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0600
     * @tc.desc Test Js Api SingleKvStore.GetInt() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetInt() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetIntCallbackTest001');
      try {
        await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
          console.info('SingleKvStoreGetIntCallbackTest001 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SingleKvStoreGetIntCallbackTest001 get success');
            expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SingleKvStoreGetIntCallbackTest001 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_0100
     * @tc.desc Test Js Api SingleKvStore.GetInt() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetInt() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetIntCallbackTest002');
      try {
        await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreGetIntCallbackTest002 get success');
            expect(null).assertFail();
          } else {
            console.error('SingleKvStoreGetIntCallbackTest002 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(err.code == 15100004).assertTrue();
          }
          done();
        })
      }catch(e) {
        console.error('SingleKvStoreGetIntCallbackTest002 put e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2000
     * @tc.desc Test Js Api SingleKvStore.Put(Bool) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Bool) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutBoolCallbackTest001');
      try {
        await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, function (err,data) {
          console.info('SingleKvStorePutBoolCallbackTest001 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SingleKvStorePutBoolCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1300
     * @tc.desc Test Js Api SingleKvStore.GetBool() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetBool() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetBoolCallbackTest001');
      try {
        await kvStore.get(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreGetBoolCallbackTest001 get success');
            expect(null).assertFail();
          } else {
            console.error('SingleKvStoreGetBoolCallbackTest001 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(err.code == 15100004).assertTrue();
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreGetBoolCallbackTest001 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2500
     * @tc.desc Test Js Api SingleKvStore.GetBool() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetBool() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetBoolCallbackTest002');
      try {
        await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, async function (err, data) {
          console.info('SingleKvStoreGetBoolCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
            console.info('SingleKvStoreGetBoolCallbackTest002 get success');
            expect((err == undefined) && (VALUE_TEST_BOOLEAN_ELEMENT == data)).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SingleKvStoreGetBoolCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2100
     * @tc.desc Test Js Api SingleKvStore.Put(Float) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Float) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUT_CALLBACK_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutFloatCallbackTest001');
      try {
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('SingleKvStorePutFloatCallbackTest001 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SingleKvStorePutFloatCallbackTest001 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2200
     * @tc.desc Test Js Api SingleKvStore.Put(Float) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Float) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutFloatCallbackTest002');
      try {
        var floatValue = 123456.654321;
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
          console.info('SingleKvStorePutFloatCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_FLOAT_ELEMENT, function (err, data) {
            console.info('SingleKvStorePutFloatCallbackTest002 get success');
            expect((err == undefined) && (floatValue == data)).assertTrue();
            done();
          })
          done();
        });
      }catch(e) {
        console.error('SingleKvStorePutFloatCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2400
     * @tc.desc Test Js Api SingleKvStore.Put(Float) testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Float) testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutFloatCallbackTest003');
      try {
        var floatValue = 123456.0;
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
          console.info('SingleKvStorePutFloatCallbackTest003 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_FLOAT_ELEMENT, function (err, data) {
            console.info('SingleKvStorePutFloatCallbackTest003 get success');
            expect((err == undefined) && (floatValue == data)).assertTrue();
            done();
          })
          done();
        });
      }catch(e) {
        console.error('SingleKvStorePutFloatCallbackTest003 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2300
     * @tc.desc Test Js Api SingleKvStore.Put(Float) testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Float) testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutFloatCallbackTest004');
      try {
        var floatValue = 123456.00;
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
          console.info('SingleKvStorePutFloatCallbackTest004 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_FLOAT_ELEMENT, function (err, data) {
            console.info('SingleKvStorePutFloatCallbackTest004 get success');
            expect((err == undefined) && (floatValue == data)).assertTrue();
            done();
          })
          done();
        });
      }catch(e) {
        console.error('SingleKvStorePutFloatCallbackTest004 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1400
     * @tc.desc Test Js Api SingleKvStore.GetFloat() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetFloat() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GET_CALLBACK_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetFloatCallbackTest001');
      try {
        await kvStore.get(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreGetFloatCallbackTest001 get success');
            expect(null).assertFail();
          } else {
            console.error('SingleKvStoreGetFloatCallbackTest001 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(err.code == 15100004).assertTrue();
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreGetFloatCallbackTest001 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1800
     * @tc.desc Test Js Api SingleKvStore.DeleteString() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.DeleteString() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreDeleteStringCallbackTest001');
      try {
        await kvStore.delete(KEY_TEST_STRING_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreDeleteStringCallbackTest001 delete success');
          } else {
            console.error('SingleKvStoreDeleteStringCallbackTest001 delete fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreDeleteStringCallbackTest001 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2900
     * @tc.desc Test Js Api SingleKvStore.DeleteString() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.DeleteString() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreDeleteStringCallbackTest002');
      try {
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err, data) {
          console.info('SingleKvStoreDeleteStringCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_STRING_ELEMENT, function (err,data) {
            console.info('SingleKvStoreDeleteStringCallbackTest002 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SingleKvStoreDeleteStringCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1700
     * @tc.desc Test Js Api SingleKvStore.DeleteInt() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.DeleteInt() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreDeleteIntCallbackTest001');
      try{
        await kvStore.delete(KEY_TEST_INT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreDeleteIntCallbackTest001 get success');
          } else {
            console.error('SingleKvStoreDeleteIntCallbackTest001 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreDeleteIntCallbackTest001 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2800
     * @tc.desc Test Js Api SingleKvStore.DeleteInt() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.DeleteInt() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreDeleteIntCallbackTest002');
      try{
        await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
          console.info('SingleKvStoreDeleteIntCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('SingleKvStoreDeleteIntCallbackTest002 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SingleKvStoreDeleteIntCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1600
     * @tc.desc Test Js Api SingleKvStore.DeleteFloat() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.DeleteFloat() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreDeleteFloatCallbackTest001');
      try{
        await kvStore.delete(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreDeleteFloatCallbackTest001 get success');
          } else {
            console.error('SingleKvStoreDeleteFloatCallbackTest001 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreDeleteFloatCallbackTest001 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2700
     * @tc.desc Test Js Api SingleKvStore.DeleteFloat() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.DeleteFloat() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreDeleteFloatCallbackTest002');
      try{
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, async function (err, data) {
          console.info('SingleKvStoreDeleteFloatCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
            console.info('SingleKvStoreDeleteFloatCallbackTest002 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SingleKvStoreDeleteFloatCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1500
     * @tc.desc Test Js Api SingleKvStore.DeleteBool() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.DeleteBool() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreDeleteBoolCallbackTest001');
      try{
        await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreDeleteBoolCallbackTest001 get success');
          } else {
            console.error('SingleKvStoreDeleteBoolCallbackTest001 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreDeleteBoolCallbackTest001 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_2600
     * @tc.desc Test Js Api SingleKvStore.DeleteBool() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.DeleteBool() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreDeleteBoolCallbackTest002');
      try{
        await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, async function (err, data) {
          console.info('SingleKvStoreDeleteBoolCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
            console.info('SingleKvStoreDeleteBoolCallbackTest002 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SingleKvStoreDeleteBoolCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1900
     * @tc.desc Test Js Api SingleKvStore.Delete() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Delete() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2700');
      try {
        await kvStore.delete(KEY_TEST_STRING_ELEMENT, function (err,data) {
          console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2700 delete err: ' + err);
          expect(err == undefined).assertTrue();
          console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2700 expect fin');
          done();
        });
      }catch(e) {
        console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2700 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1100
     * @tc.desc Test Js Api SingleKvStore.Delete() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Delete() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.log('SingleKvStoreDeletePredicatesCallbackTest002');
      try {
        await kvStore.put("name", "Bob", async function (err, data) {
          console.log('SingleKvStoreDeletePredicatesCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete("name", function (err,data) {
            console.log('SingleKvStoreDeletePredicatesCallbackTest002 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.error('SingleKvStoreDeletePredicatesCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_1200
     * @tc.desc Test Js Api SingleKvStore.Delete() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Delete() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2900');
      try {
        let arr = [null];
        await kvStore.put("name", "Bob", async function (err, data) {
          console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2900 put success');
          expect(err == undefined).assertTrue();
          console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2900 expect finash');
        })
        await kvStore.delete(arr, function (err,data) {
          console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2900 delete success: '+err);
        });
      } catch(e) {
        console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETE_CALLBACK_2900 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3300
     * @tc.desc Test Js Api SingleKvStore.OnChange() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.OnChange() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreOnChangeCallbackTest001');
      try {
        kvStore.on('dataChange', 0, function (data) {
          console.info('SingleKvStoreOnChangeCallbackTest001 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('SingleKvStoreOnChangeCallbackTest001 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreOnChangeCallbackTest001 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3400
     * @tc.desc Test Js Api SingleKvStore.OnChange() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.OnChange() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreOnChangeCallbackTest002');
      try {
        kvStore.on('dataChange', 1, function (data) {
          console.info('SingleKvStoreOnChangeCallbackTest002 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('SingleKvStoreOnChangeCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreOnChangeCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3500
     * @tc.desc Test Js Api SingleKvStore.OnChange() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.OnChange() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreOnChangeCallbackTest003');
      try {
        kvStore.on('dataChange', 2, function (data) {
          console.info('SingleKvStoreOnChangeCallbackTest003 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('SingleKvStoreOnChangeCallbackTest003 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreOnChangeCallbackTest003 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3000
     * @tc.desc Test Js Api SingleKvStore.OnSyncComplete() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.OnSyncComplete() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        kvStore.on('syncComplete', function (data) {
          console.info('SingleKvStoreOnSyncCompleteCallbackTest001 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test001', VALUE_TEST_SYNC_ELEMENT, function (err,data) {
          console.info('SingleKvStoreOnSyncCompleteCallbackTest001 put success');
          expect(err == undefined).assertTrue();
        });
        try {
          var mode = factory.SyncMode.PULL_ONLY;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore.sync(syncDeviceIds, mode, 10);
        } catch (e) {
          console.error('SingleKvStoreOnSyncCompleteCallbackTest001 sync no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
        }
      }catch(e) {
        console.error('SingleKvStoreOnSyncCompleteCallbackTest001 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3100
     * @tc.desc Test Js Api SingleKvStore.OnSyncComplete() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.OnSyncComplete() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        kvStore.on('syncComplete', function (data) {
          console.info('SingleKvStoreOnSyncCompleteCallbackTest002 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test002', VALUE_TEST_SYNC_ELEMENT, function (err,data) {
          console.info('SingleKvStoreOnSyncCompleteCallbackTest002 put success');
          expect(err == undefined).assertTrue();
        });
        try {
          var mode = factory.SyncMode.PUSH_ONLY;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore.sync(syncDeviceIds, mode, 10);
        } catch (e) {
          console.error('SingleKvStoreOnSyncCompleteCallbackTest002 sync no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
        }
      }catch(e) {
        console.error('SingleKvStoreOnSyncCompleteCallbackTest002 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3200
     * @tc.desc Test Js Api SingleKvStore.OnSyncComplete() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.OnSyncComplete() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ON_CALLBACK_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        kvStore.on('syncComplete', function (data) {
          console.info('SingleKvStoreOnSyncCompleteCallbackTest003 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'Sync1Test003', VALUE_TEST_SYNC_ELEMENT, function (err,data) {
          console.info('SingleKvStoreOnSyncCompleteCallbackTest003 put success');
          expect(err == undefined).assertTrue();
        });
        try {
          var mode = factory.SyncMode.PUSH_PULL;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore.sync(syncDeviceIds, mode, 10);
        } catch (e) {
          console.error('SingleKvStoreOnSyncCompleteCallbackTest003 sync no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
        }
      }catch(e) {
        console.error('SingleKvStoreOnSyncCompleteCallbackTest003 e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7500
     * @tc.desc Test Js Api SingleKvStore.SetSyncRange() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.SetSyncRange() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreSetSyncRangeCallbackTest001');
      try {
        var localLabels = ['A', 'B'];
        var remoteSupportLabels = ['C', 'D'];
        await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
          console.info('SingleKvStoreSetSyncRangeCallbackTest001 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreSetSyncRangeCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7600
     * @tc.desc Test Js Api SingleKvStore.SetSyncRange() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.SetSyncRange() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreSetSyncRangeCallbackTest002');
      try {
        var localLabels = ['A', 'B'];
        var remoteSupportLabels = ['B', 'C'];
        await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
          console.info('SingleKvStoreSetSyncRangeCallbackTest002 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreSetSyncRangeCallbackTest002 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7700
     * @tc.desc Test Js Api SingleKvStore.SetSyncRange() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.SetSyncRange() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreSetSyncRangeCallbackTest003');
      try {
        var localLabels = ['A', 'B'];
        var remoteSupportLabels = ['A', 'B'];
        await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
          console.info('SingleKvStoreSetSyncRangeCallbackTest003 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreSetSyncRangeCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5400
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutBatchEntryCallbackTest001');
      try {
        let entries = [];
        for (var i = 0; i < 10; i++) {
          var key = 'batch_test_string_key';
          var entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info('SingleKvStorePutBatchEntryCallbackTest001 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SingleKvStorePutBatchEntryCallbackTest001 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_string_key', function (err,entrys) {
            console.info('SingleKvStorePutBatchEntryCallbackTest001 getEntries success');
            console.info('SingleKvStorePutBatchEntryCallbackTest001 entrys.length: ' + entrys.length);
            console.info('SingleKvStorePutBatchEntryCallbackTest001 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 'batch_test_string_value').assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SingleKvStorePutBatchEntryCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5300
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutBatchEntryCallbackTest002');
      try {
        let entries = [];
        for (var i = 0; i < 10; i++) {
          var key = 'batch_test_number_key';
          var entry = {
            key : key + i,
            value : {
              type : factory.ValueType.INTEGER,
              value : 222
            }
          }
          entries.push(entry);
        }
        console.info('SingleKvStorePutBatchEntryCallbackTest002 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SingleKvStorePutBatchEntryCallbackTest002 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_number_key', function (err,entrys) {
            console.info('SingleKvStorePutBatchEntryCallbackTest002 getEntries success');
            console.info('SingleKvStorePutBatchEntryCallbackTest002 entrys.length: ' + entrys.length);
            console.info('SingleKvStorePutBatchEntryCallbackTest002 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 222).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SingleKvStorePutBatchEntryCallbackTest002 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5200
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutBatchEntryCallbackTest003');
      try {
        let entries = [];
        for (var i = 0; i < 10; i++) {
          var key = 'batch_test_number_key';
          var entry = {
            key : key + i,
            value : {
              type : factory.ValueType.FLOAT,
              value : 2.0
            }
          }
          entries.push(entry);
        }
        console.info('SingleKvStorePutBatchEntryCallbackTest003 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SingleKvStorePutBatchEntryCallbackTest003 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_number_key', function (err,entrys) {
            console.info('SingleKvStorePutBatchEntryCallbackTest003 getEntries success');
            console.info('SingleKvStorePutBatchEntryCallbackTest003 entrys.length: ' + entrys.length);
            console.info('SingleKvStorePutBatchEntryCallbackTest003 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 2.0).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SingleKvStorePutBatchEntryCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5100
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutBatchEntryCallbackTest004');
      try {
        let entries = [];
        for (var i = 0; i < 10; i++) {
          var key = 'batch_test_number_key';
          var entry = {
            key : key + i,
            value : {
              type : factory.ValueType.DOUBLE,
              value : 2.00
            }
          }
          entries.push(entry);
        }
        console.info('SingleKvStorePutBatchEntryCallbackTest004 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SingleKvStorePutBatchEntryCallbackTest004 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_number_key', function (err,entrys) {
            console.info('SingleKvStorePutBatchEntryCallbackTest004 getEntries success');
            console.info('SingleKvStorePutBatchEntryCallbackTest004 entrys.length: ' + entrys.length);
            console.info('SingleKvStorePutBatchEntryCallbackTest004 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 2.00).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SingleKvStorePutBatchEntryCallbackTest004 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4900
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 005
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutBatchEntryCallbackTest005');
      try {
        var bo = false;
        let entries = [];
        for (var i = 0; i < 10; i++) {
          var key = 'batch_test_bool_key';
          var entry = {
            key : key + i,
            value : {
              type : factory.ValueType.BOOLEAN,
              value : bo
            }
          }
          entries.push(entry);
        }
        console.info('SingleKvStorePutBatchEntryCallbackTest005 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SingleKvStorePutBatchEntryCallbackTest005 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_bool_key', function (err,entrys) {
            console.info('SingleKvStorePutBatchEntryCallbackTest005 getEntries success');
            console.info('SingleKvStorePutBatchEntryCallbackTest005 entrys.length: ' + entrys.length);
            console.info('SingleKvStorePutBatchEntryCallbackTest005 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == bo).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SingleKvStorePutBatchEntryCallbackTest005 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5000
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 006
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 006
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorePutBatchEntryCallbackTest006');
      try {
        var arr = new Uint8Array([21,31]);
        let entries = [];
        for (var i = 0; i < 10; i++) {
          var key = 'batch_test_bool_key';
          var entry = {
            key : key + i,
            value : {
              type : factory.ValueType.BYTE_ARRAY,
              value : arr
            }
          }
          entries.push(entry);
        }
        console.info('SingleKvStorePutBatchEntryCallbackTest006 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SingleKvStorePutBatchEntryCallbackTest006 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_bool_key', function (err,entrys) {
            console.info('SingleKvStorePutBatchEntryCallbackTest006 getEntries success');
            console.info('SingleKvStorePutBatchEntryCallbackTest006 entrys.length: ' + entrys.length);
            console.info('SingleKvStorePutBatchEntryCallbackTest006 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SingleKvStorePutBatchEntryCallbackTest006 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5600
     * @tc.desc Test Js Api SingleKvStore.DeleteBatch() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.DeleteBatch() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_CALLBACK_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreDeleteBatchCallbackTest001');
      try {
        let entries = [];
        let keys = [];
        for (var i = 0; i < 5; i++) {
          var key = 'batch_test_string_key';
          var entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
          keys.push(key + i);
        }
        console.info('SingleKvStoreDeleteBatchCallbackTest001 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SingleKvStoreDeleteBatchCallbackTest001 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.deleteBatch(keys, async function (err,data) {
            console.info('SingleKvStoreDeleteBatchCallbackTest001 deleteBatch success');
            expect(err == undefined).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SingleKvStoreDeleteBatchCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5700
     * @tc.desc Test Js Api SingleKvStore.DeleteBatch() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.DeleteBatch() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCH_CALLBACK_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreDeleteBatchCallbackTest002');
      try {
        let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
        await kvStore.deleteBatch(keys, function (err,data) {
          console.info('SingleKvStoreDeleteBatchCallbackTest002 deleteBatch success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreDeleteBatchCallbackTest002 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5500
     * @tc.desc Test Js Api SingleKvStore.DeleteBatch() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.DeleteBatch() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCH_CALLBACK_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreDeleteBatchCallbackTest003');
      try {
        let entries = [];
        for (var i = 0; i < 10; i++) {
          var key = 'batch_test_string_key';
          var entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info('SingleKvStoreDeleteBatchCallbackTest003 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SingleKvStoreDeleteBatchCallbackTest003 putBatch success');
          expect(err == undefined).assertTrue();
          let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
          await kvStore.deleteBatch(keys, async function (err,data) {
            console.info('SingleKvStoreDeleteBatchCallbackTest003 deleteBatch success');
            expect(err == undefined).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.error('SingleKvStoreDeleteBatchCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6100
     * @tc.desc Test Js Api SingleKvStore.startTransaction() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.startTransaction() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_TRANS_CALLBACK_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorestartTransactionCallbackTest001');
      try {
        var count = 0;
        kvStore.on('dataChange', 0, function (data) {
          console.info('SingleKvStorestartTransactionCallbackTest001 0' + data)
          count++;
        });
        await kvStore.startTransaction(async function (err,data) {
          console.info('SingleKvStorestartTransactionCallbackTest001 startTransaction success');
          expect(err == undefined).assertTrue();
          let entries = putBatchString(10, 'batch_test_string_key');
          console.info('SingleKvStorestartTransactionCallbackTest001 entries: ' + JSON.stringify(entries));
          await kvStore.putBatch(entries, async function (err,data) {
            console.info('SingleKvStorestartTransactionCallbackTest001 putBatch success');
            expect(err == undefined).assertTrue();
            let keys = Object.keys(entries).slice(5);
            await kvStore.deleteBatch(keys, async function (err,data) {
              console.info('SingleKvStorestartTransactionCallbackTest001 deleteBatch success');
              expect(err == undefined).assertTrue();
              await kvStore.commit(async function (err,data) {
                console.info('SingleKvStorestartTransactionCallbackTest001 commit success');
                expect(err == undefined).assertTrue();
                await sleep(500);
                expect(count == 1).assertTrue();
                done();
              });
            });
          });
        });
      }catch(e) {
        console.error('SingleKvStorestartTransactionCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6200
     * @tc.desc Test Js Api SingleKvStore.startTransaction() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.startTransaction() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_TRANS_CALLBACK_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorestartTransactionCallbackTest002');
      try {
        var count = 0;
        kvStore.on('dataChange', 0, function (data) {
          console.info('SingleKvStorestartTransactionCallbackTest002 0' + data)
          count++;
        });
        await kvStore.startTransaction(async function (err,data) {
          console.info('SingleKvStorestartTransactionCallbackTest002 startTransaction success');
          expect(err == undefined).assertTrue();
          let entries = putBatchString(10, 'batch_test_string_key');
          console.info('SingleKvStorestartTransactionCallbackTest002 entries: ' + JSON.stringify(entries));
          await kvStore.putBatch(entries, async function (err,data) {
            console.info('SingleKvStorestartTransactionCallbackTest002 putBatch success');
            expect(err == undefined).assertTrue();
            let keys = Object.keys(entries).slice(5);
            await kvStore.deleteBatch(keys, async function (err,data) {
              console.info('SingleKvStorestartTransactionCallbackTest002 deleteBatch success');
              expect(err == undefined).assertTrue();
              await kvStore.rollback(async function (err,data) {
                console.info('SingleKvStorestartTransactionCallbackTest002 rollback success');
                expect(err == undefined).assertTrue();
                await sleep(500);
                expect(count == 0).assertTrue();
                done();
              });
            });
          });
        });
      }catch(e) {
        console.error('SingleKvStorestartTransactionCallbackTest002 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5900
     * @tc.desc Test Js Api SingleKvStore.startTransaction() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.startTransaction() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_TRANS_CALLBACK_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorestartTransactionCallbackTest003');
      try {
        await kvStore.startTransaction(1, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStorestartTransactionCallbackTest003 startTransaction success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStorestartTransactionCallbackTest003 startTransaction fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStorestartTransactionCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6000
     * @tc.desc Test Js Api SingleKvStore.startTransaction() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.startTransaction() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_TRANS_CALLBACK_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorestartTransactionCallbackTest004');
      try {
        await kvStore.startTransaction('test_string', function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStorestartTransactionCallbackTest004 startTransaction success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStorestartTransactionCallbackTest004 startTransaction fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStorestartTransactionCallbackTest004 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_5800
     * @tc.desc Test Js Api SingleKvStore.startTransaction() testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.startTransaction() testcase 005
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_TRANS_CALLBACK_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStorestartTransactionCallbackTest005');
      try {
        await kvStore.startTransaction(2.000, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStorestartTransactionCallbackTest005 startTransaction success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStorestartTransactionCallbackTest005 startTransaction fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStorestartTransactionCallbackTest005 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7900
     * @tc.desc Test Js Api SingleKvStore.Commit() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Commit() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_CALLBACK_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreCommitCallbackTest001');
      try {
        await kvStore.commit(1, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreCommitCallbackTest001 commit success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreCommitCallbackTest001 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreCommitCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_8000
     * @tc.desc Test Js Api SingleKvStore.Commit() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Commit() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_CALLBACK_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreCommitCallbackTest002');
      try {
        await kvStore.commit('test_string', function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreCommitCallbackTest002 commit success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreCommitCallbackTest002 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreCommitCallbackTest002 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7800
     * @tc.desc Test Js Api SingleKvStore.Commit() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Commit() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_CALLBACK_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreCommitCallbackTest003');
      try {
        await kvStore.commit(2.000, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreCommitCallbackTest003 commit success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreCommitCallbackTest003 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreCommitCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_8200
     * @tc.desc Test Js Api SingleKvStore.Rollback() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Rollback() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ROLLBACK_CALLBACK_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreRollbackCallbackTest001');
      try {
        await kvStore.rollback(1, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreRollbackCallbackTest001 commit success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreRollbackCallbackTest001 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreRollbackCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_8300
     * @tc.desc Test Js Api SingleKvStore.Rollback() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Rollback() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ROLLBACK_CALLBACK_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreRollbackCallbackTest002');
      try {
        await kvStore.rollback('test_string', function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreRollbackCallbackTest002 commit success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreRollbackCallbackTest002 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreRollbackCallbackTest002 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_8100
     * @tc.desc Test Js Api SingleKvStore.Rollback() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Rollback() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ROLLBACK_CALLBACK_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreRollbackCallbackTest003');
      try {
        await kvStore.rollback(2.000, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreRollbackCallbackTest003 commit success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreRollbackCallbackTest003 commit fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreRollbackCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6800
     * @tc.desc Test Js Api SingleKvStore.EnableSync() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.EnableSync() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLE_CALLBACK_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreEnableSyncCallbackTest001');
      try {
        await kvStore.enableSync(true, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreEnableSyncCallbackTest001 enableSync success');
            expect(err == undefined).assertTrue();
          } else {
            console.info('SingleKvStoreEnableSyncCallbackTest001 enableSync fail');
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreEnableSyncCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6700
     * @tc.desc Test Js Api SingleKvStore.EnableSync() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.EnableSync() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLE_CALLBACK_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreEnableSyncCallbackTest002');
      try {
        await kvStore.enableSync(false, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreEnableSyncCallbackTest002 enableSync success');
            expect(err == undefined).assertTrue();
          } else {
            console.info('SingleKvStoreEnableSyncCallbackTest002 enableSync fail');
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreEnableSyncCallbackTest002 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6900
     * @tc.desc Test Js Api SingleKvStore.EnableSync() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.EnableSync() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLE_CALLBACK_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreEnableSyncCallbackTest003');
      try {
        await kvStore.enableSync(function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreEnableSyncCallbackTest003 enableSync success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreEnableSyncCallbackTest003 enableSync fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreEnableSyncCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7000
     * @tc.desc Test Js Api SingleKvStore.EnableSync() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.EnableSync() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLE_CALLBACK_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreEnableSyncCallbackTest004');
      try {
        await kvStore.enableSync(null, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreEnableSyncCallbackTest004 enableSync success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreEnableSyncCallbackTest004 enableSync fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreEnableSyncCallbackTest004 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6300
     * @tc.desc Test Js Api SingleKvStore.RemoveDeviceData() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.RemoveDeviceData() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVE_CALLBACK_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreRemoveDeviceDataCallbackTest001');
      try {
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err,data) {
          console.info('SingleKvStoreRemoveDeviceDataCallbackTest001 put success');
          expect(err == undefined).assertTrue();
          var deviceid = 'no_exist_device_id';
          await kvStore.removeDeviceData(deviceid, async function (err,data) {
            if (err == undefined) {
              console.info('SingleKvStoreRemoveDeviceDataCallbackTest001 removeDeviceData success');
              expect(null).assertFail();
              done();
            } else {
              console.info('SingleKvStoreRemoveDeviceDataCallbackTest001 removeDeviceData fail');
              await kvStore.get(KEY_TEST_STRING_ELEMENT, async function (err,data) {
                console.info('SingleKvStoreRemoveDeviceDataCallbackTest001 get success');
                expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
                done();
              });
            }
          });
        });
      }catch(e) {
        console.error('SingleKvStoreRemoveDeviceDataCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6400
     * @tc.desc Test Js Api SingleKvStore.RemoveDeviceData() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.RemoveDeviceData() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVE_CALLBACK_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreRemoveDeviceDataCallbackTest002');
      try {
        await kvStore.removeDeviceData(function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreRemoveDeviceDataCallbackTest002 removeDeviceData success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreRemoveDeviceDataCallbackTest002 removeDeviceData fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreRemoveDeviceDataCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6600
     * @tc.desc Test Js Api SingleKvStore.RemoveDeviceData() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.RemoveDeviceData() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVE_CALLBACK_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreRemoveDeviceDataCallbackTest003');
      try {
        await kvStore.removeDeviceData('', function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreRemoveDeviceDataCallbackTest003 removeDeviceData success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreRemoveDeviceDataCallbackTest003 removeDeviceData fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreRemoveDeviceDataCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_6500
     * @tc.desc Test Js Api SingleKvStore.RemoveDeviceData() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.RemoveDeviceData() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVE_CALLBACK_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreRemoveDeviceDataCallbackTest004');
      try {
        await kvStore.removeDeviceData(null, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreRemoveDeviceDataCallbackTest004 removeDeviceData success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreRemoveDeviceDataCallbackTest004 removeDeviceData fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreRemoveDeviceDataCallbackTest004 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7100
     * @tc.desc Test Js Api SingleKvStore.SetSyncParam() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.SetSyncParam() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreSetSyncParamCallbackTest001');
      try {
        var defaultAllowedDelayMs = 500;
        await kvStore.setSyncParam(defaultAllowedDelayMs, function (err,data) {
          console.info('SingleKvStoreSetSyncParamCallbackTest001 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreSetSyncParamCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7200
     * @tc.desc Test Js Api SingleKvStore.SetSyncParam() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.SetSyncParam() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreSetSyncParamCallbackTest002');
      try {
        await kvStore.setSyncParam(function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreSetSyncParamCallbackTest002 put success');
            expect(null).assertFail();
          } else {
            console.error('SingleKvStoreSetSyncParamCallbackTest002 put err' + `, error code is ${err.code}, message is ${err.message}`);
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreSetSyncParamCallbackTest002 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7300
     * @tc.desc Test Js Api SingleKvStore.SetSyncParam() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.SetSyncParam() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreSetSyncParamCallbackTest003');
      try {
        await kvStore.setSyncParam('', function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreSetSyncParamCallbackTest003 put success');
            expect(null).assertFail();
          } else {
            console.error('SingleKvStoreSetSyncParamCallbackTest003 put err' + `, error code is ${err.code}, message is ${err.message}`);
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreSetSyncParamCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_7400
     * @tc.desc Test Js Api SingleKvStore.SetSyncParam() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.SetSyncParam() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNC_CALLBACK_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreSetSyncParamCallbackTest004');
      try {
        await kvStore.setSyncParam(null, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreSetSyncParamCallbackTest004 put success');
            expect(null).assertFail();
          } else {
            console.error('SingleKvStoreSetSyncParamCallbackTest004 put err' + `, error code is ${err.code}, message is ${err.message}`);
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreSetSyncParamCallbackTest004 e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4300
     * @tc.desc Test Js Api SingleKvStore.GetSecurityLevel() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetSecurityLevel() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITY_CALLBACK_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetSecurityLevelCallbackTest001');
      try {
        await kvStore.getSecurityLevel(function (err,data) {
          console.info('SingleKvStoreGetSecurityLevelCallbackTest001 getSecurityLevel success: ' + data);
          console.info('SingleKvStoreGetSecurityLevelCallbackTest001 getSecurityLevel success: ' + factory.SecurityLevel.S2);
          expect(data == factory.SecurityLevel.S2).assertTrue();
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreGetSecurityLevelCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4500
     * @tc.desc Test Js Api SingleKvStore.GetSecurityLevel() testcase 002
     * @tc.type: FUNC
     * @tc.name  Test Js Api SingleKvStore.GetSecurityLevel() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITY_CALLBACK_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetSecurityLevelCallbackTest002');
      try {
        await kvStore.getSecurityLevel(1, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreGetSecurityLevelCallbackTest002 getSecurityLevel success');
            expect(null).assertFail();
          } else {
            console.error('SingleKvStoreGetSecurityLevelCallbackTest002 getSecurityLevel fail' + `, error code is ${err.code}, message is ${err.message}`);
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreGetSecurityLevelCallbackTest002 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4600
     * @tc.desc Test Js Api SingleKvStore.GetSecurityLevel() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetSecurityLevel() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITY_CALLBACK_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetSecurityLevelCallbackTest003');
      try {
        await kvStore.getSecurityLevel('test_string', function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreGetSecurityLevelCallbackTest003 getSecurityLevel success');
            expect(null).assertFail();
          } else {
            console.error('SingleKvStoreGetSecurityLevelCallbackTest003 getSecurityLevel fail' + `, error code is ${err.code}, message is ${err.message}`);
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreGetSecurityLevelCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4400
     * @tc.desc Test Js Api SingleKvStore.GetSecurityLevel() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetSecurityLevel() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITY_CALLBACK_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetSecurityLevelCallbackTest004');
      try {
        await kvStore.getSecurityLevel(2.00, function (err,data) {
          if (err == undefined) {
            console.info('SingleKvStoreGetSecurityLevelCallbackTest004 getSecurityLevel success');
            expect(null).assertFail();
          } else {
            console.error('SingleKvStoreGetSecurityLevelCallbackTest004 getSecurityLevel fail' + `, error code is ${err.code}, message is ${err.message}`);
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreGetSecurityLevelCallbackTest004 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4000
     * @tc.desc Test Js Api SingleKvStore.GetResultSet() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetResultSet() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULT_CALLBACK_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetResultSetCallbackTest001');
      try {
        let resultSet;
        let entries = [];
        for (var i = 0; i < 10; i++) {
          var key = 'batch_test_string_key';
          var entry = {
            key : key + i,
            value : {
              type : factory.ValueType.STRING,
              value : 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        await kvStore.putBatch(entries, async function (err, data) {
          console.info('SingleKvStoreGetResultSetCallbackTest001 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getResultSet('batch_test_string_key', async function (err, result) {
            console.info('SingleKvStoreGetResultSetCallbackTest001 getResultSet success');
            resultSet = result;
            expect(resultSet.getCount() == 10).assertTrue();
            await kvStore.closeResultSet(resultSet, function (err, data) {
              console.info('SingleKvStoreGetResultSetCallbackTest001 closeResultSet success');
              expect(err == undefined).assertTrue();
              done();
            })
          });
        });
      }catch(e) {
        console.error('SingleKvStoreGetResultSetCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4100
     * @tc.desc Test Js Api SingleKvStore.GetResultSet() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetResultSet() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULT_CALLBACK_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetResultSetCallbackTest002');
      try {
        let resultSet;
        await kvStore.getResultSet(function (err, result) {
          console.info('SingleKvStoreGetResultSetCallbackTest002 getResultSet success');
          expect(null).assertFail();
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreGetResultSetCallbackTest002 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4200
     * @tc.desc Test Js Api SingleKvStore.GetResultSet() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetResultSet() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULT_CALLBACK_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetResultSetCallbackTest003');
      try {
        let resultSet;
        await kvStore.getResultSet('test_key_string', 123, function (err, result) {
          console.info('SingleKvStoreGetResultSetCallbackTest003 getResultSet success: '+err);
          expect(err == undefined).assertTrue();
          kvStore.closeResultSet(result, function (err, data) {
            console.info('yltest1SingleKvStoreGetResultSetCallbackTest003 closeResultSet success');
            expect(err == undefined).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.error('SingleKvStoreGetResultSetCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4700
     * @tc.desc Test Js Api SingleKvStore.GetResultSet() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetResultSet() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULT_CALLBACK_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.log('SingleKvStoreGetResultSetPredicatesCallbackTest001');
      try {
        let resultSet;
        let query = new factory.Query();
        await kvStore.getResultSet(query).then((result) => {
          console.log('SingleKvStoreGetResultSetPredicatesCallbackTest001 getResultSet success');
          resultSet = result;
        }).catch((err) => {
          console.error('SingleKvStoreGetResultSetPredicatesCallbackTest001 getResultSet fail ' + err`, error code is ${err.code}, message is ${err.message}`);
          expect(err == undefined).assertTrue();
        });
        await kvStore.closeResultSet(resultSet, async function (err, data) {
          console.info('SingleKvStoreGetResultSetPredicatesCallbackTest001 closeResultSet success');
        })
      } catch(e) {
        console.error('SingleKvStoreGetResultSetPredicatesCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3800
     * @tc.desc Test Js Api SingleKvStore.CloseResultSet() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.CloseResultSet() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULT_CALLBACK_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreCloseResultSetCallbackTest001');
      try {
        console.info('SingleKvStoreCloseResultSetCallbackTest001 success');
        let resultSet = null;
        await kvStore.closeResultSet(resultSet, function (err, data) {
          if (err == undefined) {
            console.info('SingleKvStoreCloseResultSetCallbackTest001 closeResultSet success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreCloseResultSetCallbackTest001 closeResultSet fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreCloseResultSetCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3700
     * @tc.desc Test Js Api SingleKvStore.CloseResultSet() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.CloseResultSet() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULT_CALLBACK_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreCloseResultSetCallbackTest002');
      try {
        let resultSet = null;
        await kvStore.getResultSet('batch_test_string_key', async function(err, result) {
          console.info('SingleKvStoreCloseResultSetCallbackTest002 getResultSet success');
          resultSet = result;
          await kvStore.closeResultSet(resultSet, function (err, data) {
            if (err == undefined) {
              console.info('SingleKvStoreCloseResultSetCallbackTest002 closeResultSet success');
              expect(err == undefined).assertTrue();
            } else {
              console.info('SingleKvStoreCloseResultSetCallbackTest002 closeResultSet fail');
              expect(null).assertFail();
            }
            done();
          });
        });
      }catch(e) {
        console.error('SingleKvStoreCloseResultSetCallbackTest002 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3600
     * @tc.desc Test Js Api SingleKvStore.CloseResultSet() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.CloseResultSet() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULT_CALLBACK_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreCloseResultSetCallbackTest003');
      try {
        console.info('SingleKvStoreCloseResultSetCallbackTest003 success');
        await kvStore.closeResultSet(function (err, data) {
          if (err == undefined) {
            console.info('SingleKvStoreCloseResultSetCallbackTest003 closeResultSet success');
            expect(null).assertFail();
          } else {
            console.info('SingleKvStoreCloseResultSetCallbackTest003 closeResultSet fail');
          }
          done();
        });
      }catch(e) {
        console.error('SingleKvStoreCloseResultSetCallbackTest003 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_3900
     * @tc.desc Test Js Api SingleKvStore.CloseResultSet() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.CloseResultSet() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULT_CALLBACK_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreCloseResultSetCallbackTest004');

      try{
        kvStore.closeResultSet("",(err, data) => {
          console.info('SingleKvStoreCloseResultSetCallbackTest004 close result finish')
          expect(null).assertFail();
        })
      }catch(err){
        expect(err.code).assertEqual(401)
      }
      done();
    });




    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvCallbackEtsApiTest_4800
     * @tc.desc Test Js Api SingleKvStore.GetEntries() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetEntries() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETENTRIES_CALLBACK_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreGetEntriesCallbackTest001');
      try {
        var arr = new Uint8Array([21,31]);
        let entries = [];
        for (var i = 0; i < 10; i++) {
          var key = 'batch_test_bool_key';
          var entry = {
            key : key + i,
            value : {
              type : factory.ValueType.BYTE_ARRAY,
              value : arr
            }
          }
          entries.push(entry);
        }
        console.info('SingleKvStoreGetEntriesCallbackTest001 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('SingleKvStoreGetEntriesCallbackTest001 putBatch success');
          expect(err == undefined).assertTrue();
          var query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore.getEntries(query, function (err,entrys) {
            console.info('SingleKvStoreGetEntriesCallbackTest001 getEntries success');
            console.info('SingleKvStoreGetEntriesCallbackTest001 entrys.length: ' + entrys.length);
            console.info('SingleKvStoreGetEntriesCallbackTest001 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
            done();
          });
        });
        console.info('SingleKvStoreGetEntriesCallbackTest001 success');
      }catch(e) {
        console.error('SingleKvStoreGetEntriesCallbackTest001 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })
  })
}