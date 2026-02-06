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

const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'storeId';
const STORE_KEY = 'key_test_string';
const STORE_VALUE = 'value-test-string';
let kvManager = null;
let kvStore = null;
let context: common.UIAbilityContext;

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function kvManagerCallbackStageTest(){
  describe('kvManagerCallbackStageTest', function () {
    const options = {
      createIfMissing : true,
      encrypt : false,
      backup : false,
      autoSync : true,
      kvStoreType : factory.KVStoreType.SINGLE_VERSION,
      securityLevel : factory.SecurityLevel.S1,
    }

    beforeAll(async function (done) {
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      const config = {
        bundleName : TEST_BUNDLE_NAME,
        context: context
      }
      console.info('beforeAll config:'+ JSON.stringify(config));
      kvManager = factory.createKVManager(config);
      console.info('beforeAll end');
      done();
    })

    afterAll(async function (done) {
      console.info('afterAll');
      await sleep(500);
      done();
    })

    beforeEach(async function (done) {
      console.info('beforeEach');
      done();
    })

    afterEach(async function (done) {
      console.info('afterEach');
      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function () {
        console.info('afterEach closeKVStore success');
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function () {
          console.info('afterEach deleteKVStore success');
          done();
        });
      });
      kvStore = null;
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_4600
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testEtsKVManagerGetKVStore101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('testKVManagerGetKVStore101');
      try {
        await kvManager.getKVStore(TEST_STORE_ID).then((store) => {
          console.info('testKVManagerGetKVStore101 getKVStore success');
          expect(store != null).assertTrue();
        }).catch((err) => {
          console.info('testKVManagerGetKVStore101 getKVStore err ' + err);
        });
        done();
      } catch (e) {
        console.info('testKVManagerGetKVStore101 getKVStore e ' + e);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_3800
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testEtsKVManagerGetKVStore102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('testKVManagerGetKVStore102');
      try {
        await kvManager.getKVStore(options, function (err, store) {
          if (err == undefined) {
            console.info('testKVManagerGetKVStore102 getKVStore success');
          } else {
            console.info('testKVManagerGetKVStore102 getKVStore fail');
          }
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore102 getKVStore e ' + e);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_3900
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore103');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
        schema : '',
        securityLevel : factory.SecurityLevel.S1,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          if (err) {
            console.error(`testKVManagerGetKVStore103 Failed to get KVStore.code is ${err.code},message is ${err.message}`);
            expect(err != null).assertTrue();
          }
          console.info("testKVManagerGetKVStore103 Succeeded in getting KVStore");
          kvStore = store;
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore103 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_4000
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore104');
      const optionsInfo = {
        createIfMissing : false,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
        schema : '',
        securityLevel : factory.SecurityLevel.S1
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          if (err == undefined) {
            console.info('testKVManagerGetKVStore104 getKVStore success');
          } else {
            console.info('testKVManagerGetKVStore104 getKVStore fail');
          }
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore104 getKVStore e ' + e);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_4100
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 105
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore105');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : true,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
        schema : '',
        securityLevel : factory.SecurityLevel.S1,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore105 getKVStore success');
          expect((err == undefined) && (store != null)).assertTrue();
          kvStore = store;
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore105 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_4200
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 106
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore106');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
        schema : '',
        securityLevel : factory.SecurityLevel.S2,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore106 getKVStore success');
          expect((err == undefined) && (store != null)).assertTrue();
          kvStore = store;
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore106 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_4300
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 107
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore107');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : true,
        autoSync : true,
        kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
        schema : '',
        securityLevel : factory.SecurityLevel.S3,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore107 getKVStore success');
          expect((err == undefined) && (store != null)).assertTrue();
          kvStore = store;
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore107 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_4400
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 108
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore108');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
        schema : '',
        securityLevel : factory.SecurityLevel.S4,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore108 getKVStore success');
          expect((err == undefined) && (store != null)).assertTrue();
          kvStore = store;
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore108 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_4500
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 109
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore109');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S1,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore109 getKVStore success');
          expect((err == undefined) && (store != null)).assertTrue();
          kvStore = store;
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore109 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_3700
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 110
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore110');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : false,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S1,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore110 getKVStore success');
          expect((err == undefined) && (store != null)).assertTrue();
          kvStore = store;
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore110 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_4700
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 111
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore111');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S1,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore111 getKVStore success');
          expect((err == undefined) && (store != null)).assertTrue();
          kvStore = store;
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore111 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_4800
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 112
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore112');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S2,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore112 getKVStore success');
          expect((err == undefined) && (store != null)).assertTrue();
          kvStore = store;
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore112 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_4900
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 113
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore113');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S3,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          if (err == undefined) {
            console.info('testKVManagerGetKVStore113 getKVStore success');
            expect((err == undefined) && (store != null)).assertTrue();
          } else {
            console.info('testKVManagerGetKVStore113 getKVStore fail');
          }
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore113 getKVStore e ' + e);
		    expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_5000
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 114
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore114');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S4,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore114 getKVStore success');
          expect((err == undefined) && (store != null)).assertTrue();
          kvStore = store;
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore114 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_5100
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 115
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore115');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S2,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore115 getKVStore success');
          expect((err === undefined) && (store !== undefined)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore115 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_5200
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 116
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore116');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S1,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore116 getKVStore success');
          expect((err === undefined) && (store !== undefined)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore116 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_5300
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 117
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore117');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S1,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore117 getKVStore success');
          expect((err === undefined) && (store !== undefined)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore117 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_5400
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 118
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore118');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S2,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore118 getKVStore success');
          expect((err === undefined) && (store !== undefined)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore118 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_5500
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 119
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore119');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S3,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore119 getKVStore success');
          expect((err === undefined) && (store !== undefined)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore119 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_6400
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 120
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetKVStore120');
      const optionsInfo = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S4,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
          console.info('testKVManagerGetKVStore120 getKVStore success');
          expect((err === undefined) && (store !== undefined)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore119 getKVStore e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_0500
     * @tc.name [JS-API8]KVManager.CloseKVStore.
     * @tc.desc Test Js Api KVManager.CloseKVStore testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerCloseKVStore101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerCloseKVStore101');
      try {
        await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
          console.info('testKVManagerCloseKVStore101 getKVStore success');
          kvStore = store;
          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, function (err, data) {
            console.info('testKVManagerCloseKVStore101 closeKVStore success');
            expect((err == undefined) && (data == undefined)).assertTrue();
            done();
          });
        });
      } catch (e) {
        console.info('testKVManagerCloseKVStore101 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_0600
     * @tc.name [JS-API8]KVManager.CloseKVStore.
     * @tc.desc Test Js Api KVManager.CloseKVStore testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerCloseKVStore102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerCloseKVStore102');
      try {
        await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
          console.info('testKVManagerCloseKVStore102 getKVStore success');
          kvStore = store;
          try {
            await kvManager.closeKVStore(TEST_BUNDLE_NAME, function (err, data) {
              if (err == undefined) {
                console.info('testKVManagerCloseKVStore102 closeKVStore success');
              } else {
                console.info('testKVManagerCloseKVStore102 closeKVStore fail');
              }
              done();
            });
          } catch (e) {
            console.info('testKVManagerCloseKVStore102 closeKVStore e ' + e);
            expect(e != null).assertTrue();
            done();
          }
        });
      } catch (ee) {
        console.info('testKVManagerCloseKVStore102 getKVStore ee ' + ee);
        expect(ee != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_0700
     * @tc.name [JS-API8]KVManager.CloseKVStore.
     * @tc.desc Test Js Api KVManager.CloseKVStore testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerCloseKVStore103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerCloseKVStore103');
      try {
        await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
          console.info('testKVManagerCloseKVStore103 getKVStore success');
          kvStore = store;
          try {
            await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
              console.info('testKVManagerCloseKVStore103 closeKVStore success');
            });
            done();
          } catch (e) {
            console.info('testKVManagerCloseKVStore103 closeKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
            done();
          }
        });
      } catch (ee) {
        console.info('testKVManagerCloseKVStore103 getKVStore ee ' + `, error code is ${ee.code}, message is ${ee.message}`);
        expect(ee.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_0800
     * @tc.name [JS-API8]KVManager.CloseKVStore.
     * @tc.desc Test Js Api KVManager.CloseKVStore testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerCloseKVStore104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerCloseKVStore104');
      try {
        await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
          console.info('testKVManagerCloseKVStore104 getKVStore success');
          kvStore = store;
          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore);
        });
        console.info('testKVManagerCloseKVStore104 closeKVStore redo.');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, function (err, data) {
          console.info('testKVManagerCloseKVStore104 closeKVStore twice ' + err);
        });
        done();
      } catch (e) {
        console.info('testKVManagerCloseKVStore104 closeKVStore twice e ' + e);
        expect(e != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_1100
     * @tc.name [JS-API8]KVManager.DeleteKVStore.
     * @tc.desc Test Js Api KVManager.DeleteKVStore testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerDeleteKVStore101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerDeleteKVStore101');
      try {
        await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
          console.info('testKVManagerDeleteKVStore101 getKVStore success');
          kvStore = store;
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info('testKVManagerDeleteKVStore101 deleteKVStore success');
            expect((err == undefined) && (data == undefined)).assertTrue();
            done();
          });
        });
      } catch (e) {
        console.info('testKVManagerDeleteKVStore101 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_1200
     * @tc.name [JS-API8]KVManager.DeleteKVStore.
     * @tc.desc Test Js Api KVManager.DeleteKVStore testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerDeleteKVStore102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerDeleteKVStore102');
      try {
        await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
          console.info('testKVManagerDeleteKVStore102 getKVStore success');
          kvStore = store;
          try {
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, function (err, data) {
              if (err == undefined) {
                console.info('testKVManagerDeleteKVStore102 deleteKVStore success');
              } else {
                console.info('testKVManagerDeleteKVStore102 deleteKVStore fail');
              }
              done();
            });
          } catch (e) {
            console.info('testKVManagerDeleteKVStore102 deleteKVStore e ' + e);
            expect(e != null).assertTrue();
            done();
          }
        });
      } catch (ee) {
        console.info('testKVManagerDeleteKVStore102 getKVStore ee ' + ee);
        expect(ee != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_1300
     * @tc.name [JS-API8]KVManager.DeleteKVStore.
     * @tc.desc Test Js Api KVManager.DeleteKVStore testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerDeleteKVStore103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerDeleteKVStore103');
      try {
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
          if (err == undefined){
            console.info('testKVManagerDeleteKVStore103 deleteKVStore success');
          } else {
            console.info('testKVManagerDeleteKVStore103 deleteKVStore fail');
          }
          done();
        });
      } catch (e) {
        console.info('testKVManagerDeleteKVStore103 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_1600
     * @tc.name [JS-API8]KVManager.GetAllKVStoreId.
     * @tc.desc Test Js Api KVManager.GetAllKVStoreId testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetAllKVStoreId101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetAllKVStoreId101');
      try {
        await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME, function (err, data: string[]) {
          console.info('testKVManagerGetAllKVStoreId101 getAllKVStoreId success');
          console.info('testKVManagerGetAllKVStoreId101 size = ' + data.length);
          expect(0).assertEqual(data.length)
          done();
        });
      } catch (e) {
        console.info('testKVManagerGetAllKVStoreId101 e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_1700
     * @tc.name [JS-API8]KVManager.GetAllKVStoreId.
     * @tc.desc Test Js Api KVManager.GetAllKVStoreId testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetAllKVStoreId102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVManagerGetAllKVStoreId102');
      try {
        await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
          console.info('testKVManagerGetAllKVStoreId102 getKVStore success');
          try {
            await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then((data: string[]) => {
              console.info('testKVManagerGetAllKVStoreId102 Succeeded in getting AllKVStoreId');
              console.info(`testKVManagerGetAllKVStoreId102 size = ${data.length}`);
              console.info('testKVManagerGetAllKVStoreId102 data[0] = ' + data[0]);
              expect(TEST_STORE_ID).assertEqual(data[0]);
            }).catch((err) => {
              console.error(`testKVManagerGetAllKVStoreId102 Failed to get AllKVStoreId.code is ${err.code},message is ${err.message}`);
            });
            done();
          } catch (e) {
            console.info('testKVManagerGetAllKVStoreId102 getAllKVStoreId e ' + e);
            expect(e != null).assertTrue();
            done();
          }
        });
      } catch (ee) {
        console.info('testKVManagerGetAllKVStoreId102 getKVStore ee ' + ee);
        expect(ee != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_0100
     * @tc.name [JS-API8]KVStore.Put
     * @tc.desc Test Js Api KVManager.Put testcase 100
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVStorePut100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testKVStorePut100');
      try {
        await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
          console.info('testKVStorePut100 getKVStore success');
          kvStore = store;
          await kvStore.put(STORE_KEY, STORE_VALUE, function (err, data) {
            if (err != undefined){
              console.info('testKVStorePut100 put callback fail');
            } else {
              console.info('testKVStorePut100 put callback success');
            }
            done();
          });
        });
        done();
      } catch (e) {
        console.info('testKVStorePut100 callback e ' + e);
        expect(e != null).assertTrue();
        done();
      }
    })
  })
}