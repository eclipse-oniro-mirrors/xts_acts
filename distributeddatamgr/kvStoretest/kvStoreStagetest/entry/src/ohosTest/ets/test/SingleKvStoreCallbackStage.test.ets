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
import factory from '@ohos.data.distributedKVStore';
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

const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'storeId';
let kvManager = null;
let kvStore = null;
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

export default function singleKvStoreCallbackStageTest(){
  describe('singleKvStoreCallbackStageTest', function () {
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
        bundleName: TEST_BUNDLE_NAME,
        context: context
      }
      console.info('beforeAll config:' + JSON.stringify(config));
      kvManager = factory.createKVManager(config);
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
      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
        console.info('afterEach closeKVStore success');
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
          console.info('afterEach deleteKVStore success');
          done();
        });
      });
      kvStore = null;
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1560
     * @tc.name   : testSingleKvStorePutString101
     * @tc.desc   : Test Js Api SingleKvStore.Put(String) testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutString101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutString101');
      try {
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStorePutString101 put success');
          } else {
            console.info('testSingleKvStorePutString101 put fail' + err);
            expect(null).assertFail();
          }
          done();
        });
      }catch (e) {
        console.info('testSingleKvStorePutString101 put e' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1570
     * @tc.name   : testSingleKvStorePutString102
     * @tc.desc   : Test Js Api SingleKvStore.Put(String) testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutString102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutString102');
      try {
        let str = '';
        for (let i = 0 ; i < 4095; i++) {
          str += 'x';
        }
        await kvStore.put(KEY_TEST_STRING_ELEMENT+'102', str, async function (err,data) {
          console.info('testSingleKvStorePutString102 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_STRING_ELEMENT+'102', function (err,data) {
            console.info('testSingleKvStorePutString102 get success');
            expect(str == data).assertTrue();
            done();
          });
        });
      }catch (e) {
        console.info('testSingleKvStorePutString102 put e' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1330
     * @tc.name   : testSingleKvStoreGetString101
     * @tc.desc   : Test Js Api SingleKvStore.GetString() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetString101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetString101');
      try{
        await kvStore.get(KEY_TEST_STRING_ELEMENT + "notin", function (err,data) {
          console.info('testSingleKvStoreGetString101 get Failed err.code' + err.code + "err.message" + err.message);
          expect(err.code === 15100004).assertTrue();
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreGetString101 get e' + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1340
     * @tc.name   : testSingleKvStoreGetString102
     * @tc.desc   : Test Js Api SingleKvStore.GetString() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetString102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetString102');
      try{
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err,data) {
          console.info('testSingleKvStoreGetString102 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_STRING_ELEMENT, function (err,data) {
            console.info('testSingleKvStoreGetString102 get success');
            expect((err == undefined) && (VALUE_TEST_STRING_ELEMENT == data)).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.info('testSingleKvStoreGetString102 get e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1520
     * @tc.name   : testSingleKvStorePutInt101
     * @tc.desc   : Test Js Api SingleKvStore.Put(Int) testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutInt101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutInt101');
      try {
        await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
          console.info('testSingleKvStorePutInt101 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('testSingleKvStorePutInt101 get success');
            expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.info('testSingleKvStorePutInt101 put e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1530
     * @tc.name   : testSingleKvStorePutInt102
     * @tc.desc   : Test Js Api SingleKvStore.Put(Int) testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutInt102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutInt102');
      try {
        let intValue = 987654321;
        await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
          console.info('testSingleKvStorePutInt102 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('testSingleKvStorePutInt102 get success');
            expect((err == undefined) && (intValue == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.info('testSingleKvStorePutInt102 put e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1540
     * @tc.name   : testSingleKvStorePutInt103
     * @tc.desc   : Test Js Api SingleKvStore.Put(Int) testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutInt103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutInt103');
      try {
        let intValue = Number.MIN_VALUE;
        await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
          console.info('testSingleKvStorePutInt103 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('testSingleKvStorePutInt103 get success');
            expect((err == undefined) && (intValue == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.info('testSingleKvStorePutInt103 put e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1550
     * @tc.name   : testSingleKvStorePutInt104
     * @tc.desc   : Test Js Api SingleKvStore.Put(Int) testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutInt104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutInt104');
      try {
        let intValue = Number.MAX_VALUE;
        await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
          console.info('testSingleKvStorePutInt104 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('testSingleKvStorePutInt104 get success');
            expect((err == undefined) && (intValue == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.info('testSingleKvStorePutInt104 put e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1200
     * @tc.name   : testSingleKvStoreGetInt101
     * @tc.desc   : Test Js Api SingleKvStore.GetInt() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetInt101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetInt101');
      try {
        await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
          console.info('testSingleKvStoreGetInt101 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('testSingleKvStoreGetInt101 get success');
            expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.info('testSingleKvStoreGetInt101 put e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1210
     * @tc.name   : testSingleKvStoreGetInt102
     * @tc.desc   : Test Js Api SingleKvStore.GetInt() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetInt102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetInt102');
      try {
        await kvStore.get(KEY_TEST_INT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreGetInt102 get success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreGetInt102 get fail');
          }
          done();
        })
      }catch(e) {
        console.info('testSingleKvStoreGetInt102 put e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1470
     * @tc.name   : testSingleKvStorePutBool101
     * @tc.desc   : Test Js Api SingleKvStore.Put(Bool) testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutBool101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutBool101');
      try {
        await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, function (err,data) {
          console.info('testSingleKvStorePutBool101 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.info('testSingleKvStorePutBool101 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1150
     * @tc.name   : testSingleKvStoreGetBool101
     * @tc.desc   : Test Js Api SingleKvStore.GetBool() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetBool101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetBool101');
      try {
        await kvStore.get(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreGetBool101 get success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreGetBool101 get fail' + err);
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreGetBool101 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1150
     * @tc.name   : testSingleKvStoreGetBool102
     * @tc.desc   : Test Js Api SingleKvStore.GetBool() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetBool102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetBool102');
      try {
        await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, async function (err, data) {
          console.info('testSingleKvStoreGetBool102 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
            console.info('testSingleKvStoreGetBool102 get success');
            expect((err == undefined) && (VALUE_TEST_BOOLEAN_ELEMENT == data)).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.info('testSingleKvStoreGetBool102 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1480
     * @tc.name   : testSingleKvStorePutFloat101
     * @tc.desc   : Test Js Api SingleKvStore.Put(Float) testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutFloat101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutFloat101');
      try {
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('testSingleKvStorePutFloat101 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.info('testSingleKvStorePutFloat101 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1490
     * @tc.name   : testSingleKvStorePutFloat102
     * @tc.desc   : Test Js Api SingleKvStore.Put(Float) testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutFloat102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutFloat102');
      try {
        let floatValue = 123456.654321;
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
          console.info('testSingleKvStorePutFloat102 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_FLOAT_ELEMENT, function (err, data) {
            console.info('testSingleKvStorePutFloat102 get success');
            expect((err == undefined) && (floatValue == data)).assertTrue();
            done();
          })
          done();
        });
      }catch(e) {
        console.info('testSingleKvStorePutFloat102 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1500
     * @tc.name   : testSingleKvStorePutFloat103
     * @tc.desc   : Test Js Api SingleKvStore.Put(Float) testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutFloat103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutFloat103');
      try {
        let floatValue = 123456.0;
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
          console.info('testSingleKvStorePutFloat103 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_FLOAT_ELEMENT, function (err, data) {
            console.info('testSingleKvStorePutFloat103 get success');
            expect((err == undefined) && (floatValue == data)).assertTrue();
            done();
          })
          done();
        });
      }catch(e) {
        console.info('testSingleKvStorePutFloat103 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1510
     * @tc.name   : testSingleKvStorePutFloat104
     * @tc.desc   : Test Js Api SingleKvStore.Put(Float) testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutFloat104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutFloat104');
      try {
        let floatValue = 123456.00;
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
          console.info('testSingleKvStorePutFloat104 put success');
          expect(err == undefined).assertTrue();
          await kvStore.get(KEY_TEST_FLOAT_ELEMENT, function (err, data) {
            console.info('testSingleKvStorePutFloat104 get success');
            expect((err == undefined) && (floatValue == data)).assertTrue();
            done();
          })
          done();
        });
      }catch(e) {
        console.info('testSingleKvStorePutFloat104 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1190
     * @tc.name   : testSingleKvStoreGetFloat101
     * @tc.desc   : Test Js Api SingleKvStore.GetFloat() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetFloat101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetFloat101');
      try {
        await kvStore.get(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreGetFloat101 get success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreGetFloat101 get fail' + err);
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreGetFloat101 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1090
     * @tc.name   : testSingleKvStoreDeleteString101
     * @tc.desc   : Test Js Api SingleKvStore.DeleteString() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreDeleteString101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreDeleteString101');
      try {
        await kvStore.delete(KEY_TEST_STRING_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreDeleteString101 delete success');
          } else {
            console.info('testSingleKvStoreDeleteString101 delete fail' + err);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreDeleteString101 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1100
     * @tc.name   : testSingleKvStoreDeleteString102
     * @tc.desc   : Test Js Api SingleKvStore.DeleteString() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreDeleteString102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreDeleteString102');
      try {
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err, data) {
          console.info('testSingleKvStoreDeleteString102 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_STRING_ELEMENT, function (err,data) {
            console.info('testSingleKvStoreDeleteString102 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.info('testSingleKvStoreDeleteString102 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1070
     * @tc.name   : testSingleKvStoreDeleteInt101
     * @tc.desc   : Test Js Api SingleKvStore.DeleteInt() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreDeleteInt101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreDeleteInt101');
      try{
        await kvStore.delete(KEY_TEST_INT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreDeleteInt101 get success');
          } else {
            console.info('testSingleKvStoreDeleteInt101 get fail' + err);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreDeleteInt101 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1080
     * @tc.name   : testSingleKvStoreDeleteInt102
     * @tc.desc   : Test Js Api SingleKvStore.DeleteInt() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreDeleteInt102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreDeleteInt102');
      try{
        await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
          console.info('testSingleKvStoreDeleteInt102 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_INT_ELEMENT, function (err,data) {
            console.info('testSingleKvStoreDeleteInt102 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.info('testSingleKvStoreDeleteInt102 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1050
     * @tc.name   : testSingleKvStoreDeleteFloat101
     * @tc.desc   : Test Js Api SingleKvStore.DeleteFloat() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreDeleteFloat101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreDeleteFloat101');
      try{
        await kvStore.delete(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreDeleteFloat101 get success');
          } else {
            console.info('testSingleKvStoreDeleteFloat101 get fail' + err);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreDeleteFloat101 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1060
     * @tc.name   : testSingleKvStoreDeleteFloat102
     * @tc.desc   : Test Js Api SingleKvStore.DeleteFloat() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreDeleteFloat102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreDeleteFloat102');
      try{
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, async function (err, data) {
          console.info('testSingleKvStoreDeleteFloat102 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
            console.info('testSingleKvStoreDeleteFloat102 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.info('testSingleKvStoreDeleteFloat102 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1030
     * @tc.name   : testSingleKvStoreDeleteBool101
     * @tc.desc   : Test Js Api SingleKvStore.DeleteBool() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreDeleteBool101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreDeleteBool101');
      try{
        await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreDeleteBool101 get success');
          } else {
            console.info('testSingleKvStoreDeleteBool101 get fail' + err);
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreDeleteBool101 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1040
     * @tc.name   : testSingleKvStoreDeleteBool102
     * @tc.desc   : Test Js Api SingleKvStore.DeleteBool() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreDeleteBool102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreDeleteBool102');
      try{
        await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, async function (err, data) {
          console.info('testSingleKvStoreDeleteBool102 put success');
          expect(err == undefined).assertTrue();
          await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
            console.info('testSingleKvStoreDeleteBool102 delete success');
            expect(err == undefined).assertTrue();
            done();
          });
        })
      }catch(e) {
        console.info('testSingleKvStoreDeleteBool102 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1350
     * @tc.name   : testSingleKvStoreOnChange101
     * @tc.desc   : Test Js Api SingleKvStore.OnChange() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreOnChange101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreOnChange101');
      try {
        kvStore.on('dataChange', 0, function (data) {
          console.info('testSingleKvStoreOnChange101 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('testSingleKvStoreOnChange101 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreOnChange101 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1360
     * @tc.name   : testSingleKvStoreOnChange102
     * @tc.desc   : Test Js Api SingleKvStore.OnChange() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreOnChange102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreOnChange102');
      try {
        kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, function (data) {
          console.info('testSingleKvStoreOnChange102 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('testSingleKvStoreOnChange102 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreOnChange102 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1370
     * @tc.name   : testSingleKvStoreOnChange103
     * @tc.desc   : Test Js Api SingleKvStore.OnChange() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreOnChange103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreOnChange103');
      try {
        kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, function (data) {
          console.info('testSingleKvStoreOnChange103 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
          console.info('testSingleKvStoreOnChange103 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreOnChange103 e' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1380
     * @tc.name   : testSingleKvStoreOnSyncComplete101
     * @tc.desc   : Test Js Api SingleKvStore.OnSyncComplete() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreOnSyncComplete101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        kvStore.on('syncComplete', function (data) {
          console.info('testSingleKvStoreOnSyncComplete101 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT, function (err,data) {
          console.info('testSingleKvStoreOnSyncComplete101 put success');
          expect(err == undefined).assertTrue();
        });
        try {
          let mode = factory.SyncMode.PULL_ONLY;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore.sync(syncDeviceIds, mode, 10);
        } catch (e) {
          console.info('testSingleKvStoreOnSyncComplete101 sync no peer device :e:' + e);
        }
      }catch(e) {
        console.info('testSingleKvStoreOnSyncComplete101 e' + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1390
     * @tc.name   : testSingleKvStoreOnSyncComplete102
     * @tc.desc   : Test Js Api SingleKvStore.OnSyncComplete() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreOnSyncComplete102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        kvStore.on('syncComplete', function (data) {
          console.info('testSingleKvStoreOnSyncComplete102 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync102', VALUE_TEST_SYNC_ELEMENT, function (err,data) {
          console.info('testSingleKvStoreOnSyncComplete102 put success');
          expect(err == undefined).assertTrue();
        });
        try {
          let mode = factory.SyncMode.PUSH_ONLY;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore.sync(syncDeviceIds, mode, 10);
        } catch (e) {
          console.info('testSingleKvStoreOnSyncComplete102 sync no peer device :e:' + e);
        }
      }catch(e) {
        console.info('testSingleKvStoreOnSyncComplete102 e' + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1400
     * @tc.name   : testSingleKvStoreOnSyncComplete103
     * @tc.desc   : Test Js Api SingleKvStore.OnSyncComplete() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreOnSyncComplete103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        kvStore.on('syncComplete', function (data) {
          console.info('testSingleKvStoreOnSyncComplete103 dataChange');
          expect(data != null).assertTrue();
        });
        await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync103', VALUE_TEST_SYNC_ELEMENT, function (err,data) {
          console.info('testSingleKvStoreOnSyncComplete103 put success');
          expect(err == undefined).assertTrue();
        });
        try {
          let mode = factory.SyncMode.PUSH_PULL;
          console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
          kvStore.sync(syncDeviceIds, mode, 10);
        } catch (e) {
          console.info('testSingleKvStoreOnSyncComplete103 sync no peer device :e:' + e);
        }
      }catch(e) {
        console.info('testSingleKvStoreOnSyncComplete103 e' + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1690
     * @tc.name   : testSingleKvStoreSetSyncRange101
     * @tc.desc   : Test Js Api SingleKvStore.SetSyncRange() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreSetSyncRange101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreSetSyncRange101');
      try {
        let localLabels = ['A', 'B'];
        let remoteSupportLabels = ['C', 'D'];
        await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err) {
          if (err != undefined){
            console.error(`testSingleKvStoreSetSyncRange101 Failed to set syncRange.code is ${err.code},message is ${err.message}`);
          }
          console.info('testSingleKvStoreSetSyncRange101 put success');
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreSetSyncRange101 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1700
     * @tc.name   : testSingleKvStoreSetSyncRange102
     * @tc.desc   : Test Js Api SingleKvStore.SetSyncRange() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreSetSyncRange102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreSetSyncRange102');
      try {
        let localLabels = ['A', 'B'];
        let remoteSupportLabels = ['B', 'C'];
        await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
          console.info('testSingleKvStoreSetSyncRange102 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreSetSyncRange102 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1710
     * @tc.name   : testSingleKvStoreSetSyncRange103
     * @tc.desc   : Test Js Api SingleKvStore.SetSyncRange() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreSetSyncRange103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreSetSyncRange103');
      try {
        let localLabels = ['A', 'B'];
        let remoteSupportLabels = ['A', 'B'];
        await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
          console.info('testSingleKvStoreSetSyncRange103 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreSetSyncRange103 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1410
     * @tc.name   : testSingleKvStorePutBatch101
     * @tc.desc   : Test Js Api SingleKvStore.PutBatch() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutBatch101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutBatch101');
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
        console.info('testSingleKvStorePutBatch101 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('testSingleKvStorePutBatch101 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_string_key', function (err,entrys) {
            console.info('testSingleKvStorePutBatch101 getEntries success');
            console.info('testSingleKvStorePutBatch101 entrys.length: ' + entrys.length);
            console.info('testSingleKvStorePutBatch101 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 'batch_test_string_value').assertTrue();
            done();
          });
        });
      }catch(e) {
        console.info('testSingleKvStorePutBatch101 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1420
     * @tc.name   : testSingleKvStorePutBatch102
     * @tc.desc   : Test Js Api SingleKvStore.PutBatch() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutBatch102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutBatch102');
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
        console.info('testSingleKvStorePutBatch102 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('testSingleKvStorePutBatch102 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_number_key', function (err,entrys) {
            console.info('testSingleKvStorePutBatch102 getEntries success');
            console.info('testSingleKvStorePutBatch102 entrys.length: ' + entrys.length);
            console.info('testSingleKvStorePutBatch102 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 222).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.info('testSingleKvStorePutBatch102 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1430
     * @tc.name   : testSingleKvStorePutBatch103
     * @tc.desc   : Test Js Api SingleKvStore.PutBatch() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutBatch103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutBatch103');
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
        console.info('testSingleKvStorePutBatch103 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('testSingleKvStorePutBatch103 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_number_key', function (err,entrys) {
            console.info('testSingleKvStorePutBatch103 getEntries success');
            console.info('testSingleKvStorePutBatch103 entrys.length: ' + entrys.length);
            console.info('testSingleKvStorePutBatch103 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 2.0).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.info('testSingleKvStorePutBatch103 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1440
     * @tc.name   : testSingleKvStorePutBatch104
     * @tc.desc   : Test Js Api SingleKvStore.PutBatch() testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutBatch104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutBatch104');
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
        console.info('testSingleKvStorePutBatch104 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('testSingleKvStorePutBatch104 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_number_key', function (err,entrys) {
            console.info('testSingleKvStorePutBatch104 getEntries success');
            console.info('testSingleKvStorePutBatch104 entrys.length: ' + entrys.length);
            console.info('testSingleKvStorePutBatch104 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == 2.00).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.info('testSingleKvStorePutBatch104 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1450
     * @tc.name   : testSingleKvStorePutBatch105
     * @tc.desc   : Test Js Api SingleKvStore.PutBatch() testcase 105
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutBatch105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutBatch105');
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
        console.info('testSingleKvStorePutBatch105 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('testSingleKvStorePutBatch105 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_bool_key', function (err,entrys) {
            console.info('testSingleKvStorePutBatch105 getEntries success');
            console.info('testSingleKvStorePutBatch105 entrys.length: ' + entrys.length);
            console.info('testSingleKvStorePutBatch105 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value == bo).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.info('testSingleKvStorePutBatch105 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1460
     * @tc.name   : testSingleKvStorePutBatch106
     * @tc.desc   : Test Js Api SingleKvStore.PutBatch() testcase 106
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorePutBatch106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorePutBatch106');
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
        console.info('testSingleKvStorePutBatch106 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('testSingleKvStorePutBatch106 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getEntries('batch_test_bool_key', function (err,entrys) {
            console.info('testSingleKvStorePutBatch106 getEntries success');
            console.info('testSingleKvStorePutBatch106 entrys.length: ' + entrys.length);
            console.info('testSingleKvStorePutBatch106 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.info('testSingleKvStorePutBatch106 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1000
     * @tc.name   : testSingleKvStoreDeleteBatch101
     * @tc.desc   : Test Js Api SingleKvStore.DeleteBatch() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreDeleteBatch101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreDeleteBatch101');
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
        console.info('testSingleKvStoreDeleteBatch101 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('testSingleKvStoreDeleteBatch101 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.deleteBatch(keys, async function (err,data) {
            console.info('testSingleKvStoreDeleteBatch101 deleteBatch success');
            expect(err == undefined).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.info('testSingleKvStoreDeleteBatch101 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1010
     * @tc.name   : testSingleKvStoreDeleteBatch102
     * @tc.desc   : Test Js Api SingleKvStore.DeleteBatch() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreDeleteBatch102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreDeleteBatch102');
      try {
        let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
        await kvStore.deleteBatch(keys, function (err,data) {
          console.info('testSingleKvStoreDeleteBatch102 deleteBatch success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreDeleteBatch102 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1020
     * @tc.name   : testSingleKvStoreDeleteBatch103
     * @tc.desc   : Test Js Api SingleKvStore.DeleteBatch() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreDeleteBatch103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreDeleteBatch103');
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
        console.info('testSingleKvStoreDeleteBatch103 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('testSingleKvStoreDeleteBatch103 putBatch success');
          expect(err == undefined).assertTrue();
          let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
          await kvStore.deleteBatch(keys, async function (err,data) {
            console.info('testSingleKvStoreDeleteBatch103 deleteBatch success');
            expect(err == undefined).assertTrue();
            done();
          });
        });
      }catch(e) {
        console.info('testSingleKvStoreDeleteBatch103 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1720
     * @tc.name   : testSingleKvStorestartTransaction101
     * @tc.desc   : Test Js Api SingleKvStore.startTransaction() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorestartTransaction101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorestartTransaction101');
      try {
        let count = 0;
        kvStore.on('dataChange', 0, function (data) {
          console.info('testSingleKvStorestartTransaction101 0' + data)
          count++;
        });
        await kvStore.startTransaction(async function (err,data) {
          console.info('testSingleKvStorestartTransaction101 startTransaction success');
          expect(err == undefined).assertTrue();
          let entries = putBatchString(10, 'batch_test_string_key');
          console.info('testSingleKvStorestartTransaction101 entries: ' + JSON.stringify(entries));
          await kvStore.putBatch(entries, async function (err,data) {
            console.info('testSingleKvStorestartTransaction101 putBatch success');
            expect(err == undefined).assertTrue();
            let keys = Object.keys(entries).slice(5); //delete 5 beginnings
            await kvStore.deleteBatch(keys, async function (err,data) {
              console.info('testSingleKvStorestartTransaction101 deleteBatch success');
              expect(err == undefined).assertTrue();
              await kvStore.commit(async function (err,data) {
                console.info('testSingleKvStorestartTransaction101 commit success');
                expect(err == undefined).assertTrue();
                await sleep(500);
                expect(count == 1).assertTrue();
                done();
              });
            });
          });
        });
      }catch(e) {
        console.info('testSingleKvStorestartTransaction101 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1730
     * @tc.name   : testSingleKvStorestartTransaction102
     * @tc.desc   : Test Js Api SingleKvStore.startTransaction() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorestartTransaction102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorestartTransaction102');
      try {
        let count = 0;
        kvStore.on('dataChange', 0, function (data) {
          console.info('testSingleKvStorestartTransaction102 0' + data)
          count++;
        });
        await kvStore.startTransaction(async function (err,data) {
          console.info('testSingleKvStorestartTransaction102 startTransaction success');
          expect(err == undefined).assertTrue();
          let entries = putBatchString(10, 'batch_test_string_key');
          console.info('testSingleKvStorestartTransaction102 entries: ' + JSON.stringify(entries));
          await kvStore.putBatch(entries, async function (err,data) {
            console.info('testSingleKvStorestartTransaction102 putBatch success');
            expect(err == undefined).assertTrue();
            let keys = Object.keys(entries).slice(5); //delete 5 beginnings
            await kvStore.deleteBatch(keys, async function (err,data) {
              console.info('testSingleKvStorestartTransaction102 deleteBatch success');
              expect(err == undefined).assertTrue();
              await kvStore.rollback(async function (err,data) {
                console.info('testSingleKvStorestartTransaction102 rollback success');
                expect(err == undefined).assertTrue();
                await sleep(500);
                expect(count == 0).assertTrue();
                done();
              });
            });
          });
        });
      }catch(e) {
        console.info('testSingleKvStorestartTransaction102 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1740
     * @tc.name   : testSingleKvStorestartTransaction103
     * @tc.desc   : Test Js Api SingleKvStore.startTransaction() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorestartTransaction103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorestartTransaction103');
      try {
        await kvStore.startTransaction(1, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStorestartTransaction103 startTransaction success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStorestartTransaction103 startTransaction fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStorestartTransaction103 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1750
     * @tc.name   : testSingleKvStorestartTransaction104
     * @tc.desc   : Test Js Api SingleKvStore.startTransaction() testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorestartTransaction104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorestartTransaction104');
      try {
        await kvStore.startTransaction('test_string', function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStorestartTransaction104 startTransaction success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStorestartTransaction104 startTransaction fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStorestartTransaction104 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1760
     * @tc.name   : testSingleKvStorestartTransaction105
     * @tc.desc   : Test Js Api SingleKvStore.startTransaction() testcase 105
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStorestartTransaction105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStorestartTransaction105');
      try {
        await kvStore.startTransaction(2.000, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStorestartTransaction105 startTransaction success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStorestartTransaction105 startTransaction fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStorestartTransaction105 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0970
     * @tc.name   : testSingleKvStoreCommit101
     * @tc.desc   : Test Js Api SingleKvStore.Commit() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreCommit101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreCommit101');
      try {
        await kvStore.commit(1, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreCommit101 commit success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreCommit101 commit fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreCommit101 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0980
     * @tc.name   : testSingleKvStoreCommit102
     * @tc.desc   : Test Js Api SingleKvStore.Commit() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreCommit102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreCommit102');
      try {
        await kvStore.commit('test_string', function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreCommit102 commit success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreCommit102 commit fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreCommit102 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0990
     * @tc.name   : testSingleKvStoreCommit103
     * @tc.desc   : Test Js Api SingleKvStore.Commit() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreCommit103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreCommit103');
      try {
        await kvStore.commit(2.000, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreCommit103 commit success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreCommit103 commit fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreCommit103 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1620
     * @tc.name   : testSingleKvStoreRollback101
     * @tc.desc   : Test Js Api SingleKvStore.Rollback() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreRollback101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreRollback101');
      try {
        await kvStore.rollback(1, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreRollback101 commit success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreRollback101 commit fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreRollback101 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1630
     * @tc.name   : testSingleKvStoreRollback102
     * @tc.desc   : Test Js Api SingleKvStore.Rollback() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreRollback102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreRollback102');
      try {
        await kvStore.rollback('test_string', function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreRollback102 commit success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreRollback102 commit fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreRollback102 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1640
     * @tc.name   : testSingleKvStoreRollback103
     * @tc.desc   : Test Js Api SingleKvStore.Rollback() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreRollback103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreRollback103');
      try {
        await kvStore.rollback(2.000, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreRollback103 commit success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreRollback103 commit fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreRollback103 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1110
     * @tc.name   : testSingleKvStoreEnableSync101
     * @tc.desc   : Test Js Api SingleKvStore.EnableSync() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreEnableSync101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreEnableSync101');
      try {
        await kvStore.enableSync(true, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreEnableSync101 enableSync success');
            expect(err == undefined).assertTrue();
          } else {
            console.info('testSingleKvStoreEnableSync101 enableSync fail');
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreEnableSync101 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1120
     * @tc.name   : testSingleKvStoreEnableSync102
     * @tc.desc   : Test Js Api SingleKvStore.EnableSync() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreEnableSync102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreEnableSync102');
      try {
        await kvStore.enableSync(false, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreEnableSync102 enableSync success');
            expect(err == undefined).assertTrue();
          } else {
            console.info('testSingleKvStoreEnableSync102 enableSync fail');
            expect(null).assertFail();
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreEnableSync102 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1130
     * @tc.name   : testSingleKvStoreEnableSync103
     * @tc.desc   : Test Js Api SingleKvStore.EnableSync() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreEnableSync103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreEnableSync103');
      try {
        await kvStore.enableSync(function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreEnableSync103 enableSync success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreEnableSync103 enableSync fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreEnableSync103 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1140
     * @tc.name   : testSingleKvStorestartTransaction104
     * @tc.desc   : Test Js Api SingleKvStore.EnableSync() testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreEnableSync104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreEnableSync104');
      try {
        await kvStore.enableSync(null, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreEnableSync104 enableSync success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreEnableSync104 enableSync fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreEnableSync104 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0710
     * @tc.name   : testSingleKvStoreRemoveDeviceData101
     * @tc.desc   : Test Js Api SingleKvStore.RemoveDeviceData() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreRemoveDeviceData101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreRemoveDeviceData101');
      try {
        await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err,data) {
          console.info('testSingleKvStoreRemoveDeviceData101 put success');
          expect(err == undefined).assertTrue();
          let deviceid = 'no_exist_device_id';
          await kvStore.removeDeviceData(deviceid, async function (err,data) {
            if (err == undefined) {
              console.info('testSingleKvStoreRemoveDeviceData101 removeDeviceData success');
              expect(null).assertFail();
              done();
            } else {
              console.info('testSingleKvStoreRemoveDeviceData101 removeDeviceData fail');
              await kvStore.get(KEY_TEST_STRING_ELEMENT, async function (err,data) {
                console.info('testSingleKvStoreRemoveDeviceData101 get success');
                expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
                done();
              });
            }
          });
        });
      }catch(e) {
        console.info('testSingleKvStoreRemoveDeviceData101 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0720
     * @tc.name   : testSingleKvStoreRemoveDeviceData102
     * @tc.desc   : Test Js Api SingleKvStore.RemoveDeviceData() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreRemoveDeviceData102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreRemoveDeviceData102');
      try {
        await kvStore.removeDeviceData(function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreRemoveDeviceData102 removeDeviceData success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreRemoveDeviceData102 removeDeviceData fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreRemoveDeviceData101 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0730
     * @tc.name   : testSingleKvStoreRemoveDeviceData103
     * @tc.desc   : Test Js Api SingleKvStore.RemoveDeviceData() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreRemoveDeviceData103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreRemoveDeviceData103');
      try {
        await kvStore.removeDeviceData('', function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreRemoveDeviceData103 removeDeviceData success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreRemoveDeviceData103 removeDeviceData fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreRemoveDeviceData103 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0740
     * @tc.name   : testSingleKvStoreRemoveDeviceData104
     * @tc.desc   : Test Js Api SingleKvStore.RemoveDeviceData() testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreRemoveDeviceData104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreRemoveDeviceData104');
      try {
        await kvStore.removeDeviceData(null, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreRemoveDeviceData104 removeDeviceData success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreRemoveDeviceData104 removeDeviceData fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreRemoveDeviceData104 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0780
     * @tc.name   : testSingleKvStoreSetSyncParam101
     * @tc.desc   : Test Js Api SingleKvStore.SetSyncParam() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreSetSyncParam101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreSetSyncParam101');
      try {
        let defaultAllowedDelayMs = 500;
        await kvStore.setSyncParam(defaultAllowedDelayMs, function (err,data) {
          console.info('testSingleKvStoreSetSyncParam101 put success');
          expect(err == undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreSetSyncParam101 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0790
     * @tc.name   : testSingleKvStoreSetSyncParam102
     * @tc.desc   : Test Js Api SingleKvStore.SetSyncParam() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreSetSyncParam102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreSetSyncParam102');
      try {
        await kvStore.setSyncParam(function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreSetSyncParam102 put success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreSetSyncParam102 put err' + err);
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreSetSyncParam102 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0800
     * @tc.name   : testSingleKvStoreSetSyncParam103
     * @tc.desc   : Test Js Api SingleKvStore.SetSyncParam() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreSetSyncParam103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreSetSyncParam103');
      try {
        await kvStore.setSyncParam('', function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreSetSyncParam103 put success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreSetSyncParam103 put err' + err);
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreSetSyncParam103 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0810
     * @tc.name   : testSingleKvStoreSetSyncParam104
     * @tc.desc   : Test Js Api SingleKvStore.SetSyncParam() testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreSetSyncParam104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreSetSyncParam104');
      try {
        await kvStore.setSyncParam(null, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreSetSyncParam104 put success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreSetSyncParam104 put err' + err);
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreSetSyncParam104 e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1300
     * @tc.name   : testSingleKvStoreGetSecurityLevel102
     * @tc.desc   : Test Js Api SingleKvStore.GetSecurityLevel() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetSecurityLevel102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetSecurityLevel102');
      try {
        await kvStore.getSecurityLevel(1, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreGetSecurityLevel102 getSecurityLevel success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreGetSecurityLevel102 getSecurityLevel fail' + err);
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreGetSecurityLevel102 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1310
     * @tc.name   : testSingleKvStoreGetSecurityLevel103
     * @tc.desc   : Test Js Api SingleKvStore.GetSecurityLevel() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetSecurityLevel103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetSecurityLevel103');
      try {
        await kvStore.getSecurityLevel('test_string', function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreGetSecurityLevel103 getSecurityLevel success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreGetSecurityLevel103 getSecurityLevel fail' + err);
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreGetSecurityLevel103 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1320
     * @tc.name   : testSingleKvStoreGetSecurityLevel104
     * @tc.desc   : Test Js Api SingleKvStore.GetSecurityLevel() testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetSecurityLevel104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetSecurityLevel104');
      try {
        await kvStore.getSecurityLevel(2.00, function (err,data) {
          if (err == undefined) {
            console.info('testSingleKvStoreGetSecurityLevel104 getSecurityLevel success');
            expect(null).assertFail();
          } else {
            console.info('testSingleKvStoreGetSecurityLevel104 getSecurityLevel fail' + err);
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreGetSecurityLevel104 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1220
     * @tc.name   : testSingleKvStoreGetResultSet101
     * @tc.desc   : Test Js Api SingleKvStore.GetResultSet() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetResultSet101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetResultSet101');
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
          console.info('testSingleKvStoreGetResultSet101 putBatch success');
          expect(err == undefined).assertTrue();
          await kvStore.getResultSet('batch_test_string_key', async function (err, result) {
            console.info('testSingleKvStoreGetResultSet101 getResultSet success');
            resultSet = result;
            expect(resultSet.getCount() == 10).assertTrue();
            await kvStore.closeResultSet(resultSet, function (err, data) {
              console.info('testSingleKvStoreGetResultSet101 closeResultSet success');
              expect(err == undefined).assertTrue();
              done();
            })
          });
        });
      }catch(e) {
        console.info('testSingleKvStoreGetResultSet101 e ' + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1230
     * @tc.name   : testSingleKvStoreGetResultSet102
     * @tc.desc   : Test Js Api SingleKvStore.GetResultSet() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetResultSet102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetResultSet102');
      try {
        let resultSet;
        await kvStore.getResultSet('batch_test_string_key', async function (err, result) {
          console.info('testSingleKvStoreGetResultSet102 getResultSet success');
          resultSet = result;
          expect(resultSet.getCount() == 0).assertTrue();
          await kvStore.closeResultSet(resultSet, function (err, data) {
            console.info('testSingleKvStoreGetResultSet102 closeResultSet success');
            expect(err == undefined).assertTrue();
            done();
          })
        });
      }catch(e) {
        console.info('testSingleKvStoreGetResultSet102 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1240
     * @tc.name   : testSingleKvStorestartTransaction104
     * @tc.desc   : Test Js Api SingleKvStore.GetResultSet() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetResultSet103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetResultSet103');
      try {
        let resultSet;
        await kvStore.getResultSet(function (err, result) {
          console.info('testSingleKvStoreGetResultSet103 getResultSet success');
          expect(err != undefined).assertTrue();
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreGetResultSet103 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1250
     * @tc.name   : testSingleKvStorestartTransaction104
     * @tc.desc   : Test Js Api SingleKvStore.GetResultSet() testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetResultSet104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetResultSet104');
      try {
        await kvStore.getResultSet('test_key_string', 123, function (err, result) {
          console.info('testSingleKvStoreGetResultSet104 getResultSet success');
        });
        done();
      }catch(e) {
        console.info('testSingleKvStoreGetResultSet104 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1260
     * @tc.name   : testSingleKvStorestartTransaction104
     * @tc.desc   : Test Js Api SingleKvStore.GetResultSet() testcase 105
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetResultSet105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetResultSet105');
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
          console.info('testSingleKvStoreGetResultSet105 putBatch success');
          expect(err == undefined).assertTrue();
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore.getResultSet(query, async function (err, result) {
            console.info('testSingleKvStoreGetResultSet105 getResultSet success');
            resultSet = result;
            expect(resultSet.getCount() == 10).assertTrue();
            await kvStore.closeResultSet(resultSet, function (err, data) {
              console.info('testSingleKvStoreGetResultSet105 closeResultSet success');
              expect(err != undefined).assertFalse();
              done();
            })
          });
        });
      } catch(e) {
        console.info('testSingleKvStoreGetResultSet105 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1270
     * @tc.name   : testSingleKvStorestartTransaction104
     * @tc.desc   : Test Js Api SingleKvStore.GetResultSet() testcase 106
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetResultSet106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetResultSet106');
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
          console.info('testSingleKvStoreGetResultSet106 putBatch success');
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore.getResultSet(query, async function (err, result) {
            console.info('testSingleKvStoreGetResultSet106 getResultSet success');
            resultSet = result;
            expect(resultSet.getCount() == 10).assertTrue();
            await kvStore.closeResultSet(resultSet, function (err, data) {
              console.info('testSingleKvStoreGetResultSet106 closeResultSet success');
              expect(err != undefined).assertFalse();
              done();
            })
          });
        });
      } catch(e) {
        console.info('testSingleKvStoreGetResultSet106 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0930
     * @tc.name   : testSingleKvStorestartTransaction104
     * @tc.desc   : Test Js Api SingleKvStore.CloseResultSet() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreCloseResultSet101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreCloseResultSet101');
      try {
        console.info('testSingleKvStoreCloseResultSet101 success');
        let resultSet = null;
        await kvStore.closeResultSet(resultSet, function (err, data) {
          if (err == undefined) {
            console.info('testSingleKvStoreCloseResultSet101 closeResultSet success');
          } else {
            console.info('testSingleKvStoreCloseResultSet101 closeResultSet fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreCloseResultSet101 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0940
     * @tc.name   : testSingleKvStoreCloseResultSet102
     * @tc.desc   : Test Js Api SingleKvStore.CloseResultSet() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreCloseResultSet102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreCloseResultSet102');
      try {
        let resultSet = null;
        await kvStore.getResultSet('batch_test_string_key', async function(err, result) {
          console.info('testSingleKvStoreCloseResultSet102 getResultSet success');
          resultSet = result;
          await kvStore.closeResultSet(resultSet, function (err, data) {
            if (err == undefined) {
              console.info('testSingleKvStoreCloseResultSet102 closeResultSet success');
            } else {
              console.info('testSingleKvStoreCloseResultSet102 closeResultSet fail');
            }
            done();
          });
        });
      }catch(e) {
        console.info('testSingleKvStoreCloseResultSet102 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0950
     * @tc.name   : testSingleKvStoreCloseResultSet103
     * @tc.desc   : Test Js Api SingleKvStore.CloseResultSet() testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreCloseResultSet103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreCloseResultSet103');
      try {
        console.info('testSingleKvStoreCloseResultSet103 success');
        await kvStore.closeResultSet(function (err, data) {
          if (err == undefined) {
            console.info('testSingleKvStoreCloseResultSet103 closeResultSet success');
          } else {
            console.info('testSingleKvStoreCloseResultSet103 closeResultSet fail');
          }
          done();
        });
      }catch(e) {
        console.info('testSingleKvStoreCloseResultSet103 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_0960
     * @tc.name   : testSingleKvStoreCloseResultSet104
     * @tc.desc   : Test Js Api SingleKvStore.CloseResultSet() testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreCloseResultSet104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('SingleKvStoreCloseResultSetCallbackTest004');
      try{
        kvStore.closeResultSet("",(err, data) => {
          console.info(`SingleKvStoreCloseResultSetCallbackTest004 close result success`)
        })
      } catch(err){
        console.info(`SingleKvStoreCloseResultSetCallbackTest004 close result error, error is ${err}`)
        expect(err != null).assertTrue();
      }

      await sleep(500)
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1280
     * @tc.name   : testSingleKvStoreGetResultSize101
     * @tc.desc   : Test Js Api SingleKvStore.GetResultSize() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetResultSize101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetResultSize101');
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
          console.info('testSingleKvStoreGetResultSize101 putBatch success');
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore.getResultSize(query, async function (err, resultSize) {
            console.info('testSingleKvStoreGetResultSize101 getResultSet success');
            expect(resultSize == 10).assertTrue();
            done();
          });
        });
      } catch(e) {
        console.info('testSingleKvStoreGetResultSize101 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1290
     * @tc.name   : testSingleKvStoreGetResultSize102
     * @tc.desc   : Test Js Api SingleKvStore.GetResultSize() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetResultSize102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetResultSize102');
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
          console.info('testSingleKvStoreGetResultSize102 putBatch success');
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore.getResultSize(query, async function (err, resultSize) {
            console.info('testSingleKvStoreGetResultSize102 getResultSet success');
            expect(resultSize == 10).assertTrue();
            done();
          });
        });
      } catch(e) {
        console.info('testSingleKvStoreGetResultSize102 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1170
     * @tc.name   : testSingleKvStoreGetEntries101
     * @tc.desc   : Test Js Api SingleKvStore.GetEntries() testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetEntries101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetEntries101');
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
        console.info('testSingleKvStoreGetEntries101 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('testSingleKvStoreGetEntries101 putBatch success');
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore.getEntries(query, function (err,entrys) {
            console.info('testSingleKvStoreGetEntries101 getEntries success');
            console.info('testSingleKvStoreGetEntries101 entrys.length: ' + entrys.length);
            console.info('testSingleKvStoreGetEntries101 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
            done();
          });
        });
        console.info('testSingleKvStoreGetEntries101 success');
      }catch(e) {
        console.info('testSingleKvStoreGetEntries101 e ' + e);
        expect(e != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_SingleKvStoreEtsApiTest_1180
     * @tc.name   : testSingleKvStoreGetEntries102
     * @tc.desc   : Test Js Api SingleKvStore.GetEntries() testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsSingleKvStoreGetEntries102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testSingleKvStoreGetEntries102');
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
        console.info('testSingleKvStoreGetEntries102 entries: ' + JSON.stringify(entries));
        await kvStore.putBatch(entries, async function (err,data) {
          console.info('testSingleKvStoreGetEntries102 putBatch success');
          let query = new factory.Query();
          query.prefixKey("batch_test");
          await kvStore.getEntries(query, function (err,entrys) {
            console.info('testSingleKvStoreGetEntries102 getEntries success');
            console.info('testSingleKvStoreGetEntries102 entrys.length: ' + entrys.length);
            console.info('testSingleKvStoreGetEntries102 entrys[0]: ' + JSON.stringify(entrys[0]));
            expect(entrys.length == 10).assertTrue();
            expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
            done();
          });
        });
        console.info('testSingleKvStoreGetEntries101 success');
        console.info('testSingleKvStoreGetEntries102 success');
      }catch(e) {
        console.info('testSingleKvStoreGetEntries102 e ' + e);
        expect(e != null).assertTrue();
      }
      done();
    })
  })
}