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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import factory from '@ohos.data.distributedKVStore';
import common from "@ohos.app.ability.common";

const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'storeId';
let kvManager = null;
let kvStore = null;
const STORE_KEY = 'key_test_string';
const STORE_VALUE = 'value-test-string';
let kvStoreNew = null;
let context: common.UIAbilityContext;

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function kvManagerPromiseStageTest(){
  describe('kvManagerPromiseStageTest', function () {
    const options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.SINGLE_VERSION,
      schema: '',
      securityLevel: factory.SecurityLevel.S2,
    }

    beforeAll(async function (done) {
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      const config = {
        bundleName: TEST_BUNDLE_NAME,
        context: context
      }
      console.info('beforeAll');
      kvManager = factory.createKVManager(config)
      kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
        console.info("beforeAll getKVStore success");
        kvStoreNew = store;
      }).catch((err) => {
        console.info("beforeAll getKVStore err: "  + JSON.stringify(err));
      });
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
      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(async () => {
        console.info('afterEach closeKVStore success');
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('afterEach deleteKVStore success');
        }).catch((err) => {
          console.error('afterEach deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });
      }).catch((err) => {
        console.error('afterEach closeKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      kvStore = null;
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_1800
     * @tc.name   : testCreateValueObject001
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore001', 0, async function (done) {
      console.info('testKVManagerGetKVStore001');
      try {
        await kvManager.getKVStore(TEST_STORE_ID).then((store) => {
          console.info('testKVManagerGetKVStore001 getKVStore success');
          expect(store != null).assertTrue();
        }).catch((err) => {
          console.info('testKVManagerGetKVStore001 getKVStore err ' + err);
        });
        done();
      } catch (e) {
        console.info('testKVManagerGetKVStore001 getKVStore e ' + e);
        done();
      }
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_1900
     * @tc.name   : testKVManagerGetKVStore002
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 002
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore002', 0, async function (done) {
      console.info('testKVManagerGetKVStore002');
      try {
        await kvManager.getKVStore(options).then((store) => {
          console.info('testKVManagerGetKVStore002 getKVStore success');
          expect(store != null).assertTrue();
        }).catch((err) => {
          console.info('testKVManagerGetKVStore002 getKVStore err ' + err);
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore002 getKVStore e ' + e);
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_2000
     * @tc.name   : testKVManagerGetKVStore003
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 003
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore003', 0, async function (done) {
      console.info('testKVManagerGetKVStore003');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.SINGLE_VERSION,
        schema: '',
        securityLevel: factory.SecurityLevel.S1,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore003 getKVStore success');
        kvStore = store;
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore003 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        expect(err !=null ).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_2100
     * @tc.name   : testKVManagerGetKVStore004
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 004
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore004', 0, async function (done) {
      console.info('testKVManagerGetKVStore004');
      const optionsInfo = {
        createIfMissing: false,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.SINGLE_VERSION,
        schema: '',
        securityLevel: factory.SecurityLevel.S1,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore004 getKVStore success');
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore004 getKVStore err ' + err);
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_2200
     * @tc.name   : testKVManagerGetKVStore005
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 005
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore005', 0, async function (done) {
      console.info('testKVManagerGetKVStore005');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: true,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.SINGLE_VERSION,
        schema: '',
        securityLevel: factory.SecurityLevel.S2,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore005 getKVStore success');
        kvStore = store;
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore005 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_2300
     * @tc.name   : testKVManagerGetKVStore006
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 006
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore006', 0, async function (done) {
      console.info('testKVManagerGetKVStore006');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.SINGLE_VERSION,
        schema: '',
        securityLevel: factory.SecurityLevel.S3,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore006 getKVStore success');
        kvStore = store;
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore006 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_2400
     * @tc.name   : testKVManagerGetKVStore007
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 007
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore007', 0, async function (done) {
      console.info('testKVManagerGetKVStore006');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: true,
        autoSync: true,
        kvStoreType: factory.KVStoreType.SINGLE_VERSION,
        schema: '',
        securityLevel: factory.SecurityLevel.S4,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore007 getKVStore success');
        kvStore = store;
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore007 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_2500
     * @tc.name   : testKVManagerGetKVStore008
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 008
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore008', 0, async function (done) {
      console.info('testKVManagerGetKVStore008');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.SINGLE_VERSION,
        schema: '',
        securityLevel: factory.SecurityLevel.S1,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore008 getKVStore success' + store);
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore008 getKVStore err ' + err);
        expect(err !=null ).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_2600
     * @tc.name   : testKVManagerGetKVStore009
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 009
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore009', 0, async function (done) {
      console.info('testKVManagerGetKVStore009');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
        schema: '',
        securityLevel: factory.SecurityLevel.S1,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore009 getKVStore success' + store);
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore009 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_2700
     * @tc.name   : testKVManagerGetKVStore010
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 010
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore010', 0, async function (done) {
      console.info('testKVManagerGetKVStore010');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: false,
        kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
        schema: '',
        securityLevel: factory.SecurityLevel.S1,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore010 getKVStore success');
        kvStore = store;
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore010 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_2800
     * @tc.name   : testKVManagerGetKVStore011
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 011
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore011', 0, async function (done) {
      console.info('testKVManagerGetKVStore011');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
        schema: '',
        securityLevel: factory.SecurityLevel.S2,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore011 getKVStore success');
        kvStore = store;
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore011 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_2900
     * @tc.name   : testKVManagerGetKVStore012
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 012
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore012', 0, async function (done) {
      console.info('testKVManagerGetKVStore012');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
        schema: '',
        securityLevel: factory.SecurityLevel.S3,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore012 getKVStore success');
        kvStore = store;
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore012 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_3000
     * @tc.name   : testKVManagerGetKVStore013
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 013
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore013', 0, async function (done) {
      console.info('testKVManagerGetKVStore013');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
        schema: '',
        securityLevel: factory.SecurityLevel.S4,
      }
      try {
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
          console.info('testKVManagerGetKVStore013 getKVStore success');
        }).catch((err) => {
          console.info('testKVManagerGetKVStore013 getKVStore err ' + err);
          expect(err != null).assertTrue();
        });
      } catch (e) {
        console.info('testKVManagerGetKVStore013 getKVStore e ' + e);
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_3100
     * @tc.name   : testKVManagerGetKVStore014
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 014
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore014', 0, async function (done) {
      console.info('testKVManagerGetKVStore014');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.SINGLE_VERSION,
        schema: '',
        securityLevel: factory.SecurityLevel.S1,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore014 getKVStore success' + store);
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore014 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        expect(err.code == 401).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_3200
     * @tc.name   : testKVManagerGetKVStore015
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 015
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore015', 0, async function (done) {
      console.info('testKVManagerGetKVStore015');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.SINGLE_VERSION,
        schema: '',
        securityLevel: factory.SecurityLevel.S1,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore015 getKVStore success' + store);
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore015 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_3300
     * @tc.name   : testKVManagerGetKVStore016
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 016
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore016', 0, async function (done) {
      console.info('testKVManagerGetKVStore016');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.SINGLE_VERSION,
        schema: '',
        securityLevel: factory.SecurityLevel.S1,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore016 getKVStore success' + store);
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore016 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_3400
     * @tc.name   : testKVManagerGetKVStore017
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 017
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore017', 0, async function (done) {
      console.info('testKVManagerGetKVStore017');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
        schema: '',
        securityLevel: factory.SecurityLevel.S2,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore017 getKVStore success' + store);
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore017 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_3500
     * @tc.name   : testKVManagerGetKVStore018
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 018
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore018', 0, async function (done) {
      console.info('testKVManagerGetKVStore018');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
        schema: '',
        securityLevel: factory.SecurityLevel.S3,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore018 getKVStore success' + store);
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore018 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_3600
     * @tc.name   : testKVManagerGetKVStore019
     * @tc.desc   : Test Js Api KVManager.GetKVStore testcase 019
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetKVStore019', 0, async function (done) {
      console.info('testKVManagerGetKVStore019');
      const optionsInfo = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.SINGLE_VERSION,
        schema: '',
        securityLevel: factory.SecurityLevel.S4,
      }
      await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
        console.info('testKVManagerGetKVStore019 getKVStore success' + store);
        expect(store != null).assertTrue();
      }).catch((err) => {
        console.info('testKVManagerGetKVStore019 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_0400
     * @tc.name   : testKVManagerCloseKVStore001
     * @tc.desc   : Test Js Api KVManager.CloseKVStore testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerCloseKVStore001', 0, async function (done) {
      console.info('testKVManagerCloseKVStore004');
      await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
        kvStore = store;
        console.info('testKVManagerCloseKVStore001 getKVStore success');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
      });
      console.info('testKVManagerCloseKVStore001 closeKVStore redo.');
      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info('testKVManagerCloseKVStore001 closeKVStore twice ');
        expect(kvStore == null).assertTrue();
        done();
      }).catch((err) => {
        console.info('testKVManagerCloseKVStore001 closeKVStore twice err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_0900
     * @tc.name   : testKVManagerDeleteKVStore001
     * @tc.desc   : Test Js Api KVManager.DeleteKVStore testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerDeleteKVStore001', 0, async function (done) {
      console.info('testKVManagerDeleteKVStore001');
      await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info('testKVManagerDeleteKVStore001 deleteKVStore success');
      }).catch((err) => {
        console.info('testKVManagerDeleteKVStore001 deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_1400
     * @tc.name   : testKVManagerGetAllKVStoreId001
     * @tc.desc   : Test Js Api KVManager.GetAllKVStoreId testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetAllKVStoreId001', 0, async function (done) {
      console.info('testKVManagerGetAllKVStoreId001');
      await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then((data: string[]) => {
        console.info('testKVManagerGetAllKVStoreId001 getAllKVStoreId success');
        console.info('testKVManagerGetAllKVStoreId001 size = ' + data.length);
        expect(0).assertEqual(data.length);
      }).catch((err) => {
        console.info('testKVManagerGetAllKVStoreId001 getAllKVStoreId err ' + err);
        expect(err == null).assertFail();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_1500
     * @tc.name   : testKVManagerGetAllKVStoreId002
     * @tc.desc   : Test Js Api KVManager.GetAllKVStoreId testcase 002
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerGetAllKVStoreId002', 0, async function (done) {
      console.info('testKVManagerGetAllKVStoreId002');
      await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
        console.info('testKVManagerGetAllKVStoreId002 getKVStore success');
        kvStore = store;
        await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then((data) => {
          console.info('testKVManagerGetAllKVStoreId002 getAllKVStoreId success');
          console.info('testKVManagerGetAllKVStoreId002 size = ' + data.length);
          expect(1).assertEqual(data.length);
          console.info('testKVManagerGetAllKVStoreId002 data[0] = ' + data[0]);
          expect(TEST_STORE_ID).assertEqual(data[0]);
        }).catch((err) => {
          console.info('testKVManagerGetAllKVStoreId002 getAllKVStoreId err ' + err);
          expect(err != null).assertTrue();
        });
      }).catch((err) => {
        console.info('testKVManagerGetAllKVStoreId002 getKVStore err ' + err);
        expect(err != null).assertTrue();
      });
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_6100
     * @tc.name   : testKVManagerOn001
     * @tc.desc   : Test Js Api KVManager.On testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerOn001', 0, function (done) {
      console.info('testKVManagerOn001');
      let deathCallback = function () {
        console.info('death callback call');
      }
      try{
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
      }catch (e){
        console.info('testKVManagerOn001 err ' + e);
        expect(e != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_6100
     * @tc.name   : testKVManagerOn002
     * @tc.desc   : Test Js Api KVManager.On testcase 002
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerOn002', 0, function (done) {
      console.info('testKVManagerOn002');
      let deathCallback1 = function () {
        console.info('death callback call');
      }
      let deathCallback2 = function () {
        console.info('death callback call');
      }
      try{
        kvManager.on('distributedDataServiceDie', deathCallback1);
        kvManager.on('distributedDataServiceDie', deathCallback2);
        kvManager.off('distributedDataServiceDie', deathCallback1);
        kvManager.off('distributedDataServiceDie', deathCallback2);
      }catch (e){
        console.info('testKVManagerOn002 err ' + e);
        expect(e != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_6300
     * @tc.name   : testKVManagerOn003
     * @tc.desc   : Test Js Api KVManager.On testcase 003
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerOn003', 0, function (done) {
      console.info('testKVManagerOn003');
      let deathCallback = function () {
        console.info('death callback call');
      }
      try{
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
      }catch (e){
        console.info('testKVManagerOn003 err ' + e);
        expect(e != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_6300
     * @tc.name   : testKVManagerOff001
     * @tc.desc   : Test Js Api KVManager.Off testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerOff001', 0, function (done) {
      console.info('testKVManagerOff001');
      let deathCallback = function () {
        console.info('death callback call');
      }
      try{
        kvManager.off('distributedDataServiceDie', deathCallback);
      }catch (e){
        console.info('testKVManagerOff001 err ' + e);
        expect(e != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_5700
     * @tc.name   : testKVManagerOff002
     * @tc.desc   : Test Js Api KVManager.Off testcase 002
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerOff002', 0, function (done) {
      console.info('testKVManagerOff002');
      let deathCallback = function () {
        console.info('death callback call');
      }
      try{
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
      }catch (e){
        console.info('testKVManagerOff002 err ' + e);
        expect(e != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_5800
     * @tc.name   : testKVManagerOff003
     * @tc.desc   : Test Js Api KVManager.Off testcase 003
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerOff003', 0, function (done) {
      console.info('testKVManagerOff003');
      let deathCallback1 = function () {
        console.info('death callback call');
      }
      let deathCallback2 = function () {
        console.info('death callback call');
      }
      try{
        kvManager.on('distributedDataServiceDie', deathCallback1);
        kvManager.on('distributedDataServiceDie', deathCallback2);
        kvManager.off('distributedDataServiceDie', deathCallback1);
      }catch (e){
        console.info('testKVManagerOff003 err ' + e);
        expect(e != null).assertTrue();
      }

      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_5900
     * @tc.name   : testKVManagerOff004
     * @tc.desc   : Test Js Api KVManager.Off testcase 004
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerOff004', 0, function (done) {
      console.info('testKVManagerOff004');
      let deathCallback = function () {
        console.info('death callback call');
      }
      try{
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
      }catch (e){
        console.info('testKVManagerOff004 err ' + e);
        expect(e != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_6000
     * @tc.name   : testKVManagerOff005
     * @tc.desc   : Test Js Api KVManager.Off testcase 005
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVManagerOff005', 0, function (done) {
      console.info('testKVManagerOff001');
      let deathCallback = function () {
        console.info('death callback call');
      }
      try{
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie');
      }catch (e){
        console.info('testKVManagerOff005 err ' + e);
        expect(e != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_0200
     * @tc.name   : testKVStorePut001
     * @tc.desc   : Test Js Api KVManager.Put testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVStorePut001', 0, async function (done) {
      console.info('testKVStorePut001');
      try {
        await kvStoreNew.put(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info(`testKVStorePut001 Succeeded in putting data`);
        }).catch((err) => {
          console.error(`testKVStorePut001 Failed to put err :` + err);
          expect( err != null).assertTrue();
        });
      } catch (e) {
        console.info('testKVStorePut001 e ' + e);
        expect( e != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.number : SUB_DistributedData_KVStore_SDK_KVStoreEtsApiTest_0300
     * @tc.name   : testKVStoreDelete001
     * @tc.desc   : Test Js Api KVManager.Delete testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testEtsKVStoreDelete001', 0, async function (done) {
      console.info('testKVStoreDelete001');
      try {
        kvStoreNew.put(STORE_KEY, STORE_VALUE).then((data) => {
          console.info('testKVStoreDelete001 getKVStore success');
          kvStoreNew.delete(STORE_KEY).then(() => {
            console.info("testKVStoreDelete001 promise delete success");
          }).catch((err) => {
            console.info('testKVStoreDelete001 promise delete fail err' + err);
          });
        }).catch((err) => {
          console.info('testKVStoreDelete001 promise delete fail err' + err);
        });
        done();
      }catch (err) {
        console.info('testKVStoreDelete001 promise delete fail err' + err);
        expect( err != null).assertTrue();
        done();
      }
    })
  })
}