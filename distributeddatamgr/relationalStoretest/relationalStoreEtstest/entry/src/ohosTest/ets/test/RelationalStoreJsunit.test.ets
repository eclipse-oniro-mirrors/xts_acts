/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import data_Rdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';


let context: common.UIAbilityContext;
let contextApplication;
const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG = {
  name: "rdbstore.db",
  securityLevel: data_Rdb.SecurityLevel.S1
};

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function relationalStoreTest() {
  describe('relationalStoreTest', function () {
    beforeAll(async function () {
      console.info(TAG + 'beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
      contextApplication = context.getApplicationContext();
    })

    beforeEach(function () {
      console.info(TAG + 'beforeEach');
    })

    afterEach(async function () {
      await data_Rdb.deleteRdbStore(context, "rdbstore.db");
      console.info(TAG + 'afterEach');
    })

    afterAll(async function () {
      console.info(TAG + 'afterAll');
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   testRdbStore0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_0900
     * @tc.desc   RelationalStore store getRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRdbStore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(TAG + "************* testRdbStore0001 start *************");
      await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (store) => {
        try {
          console.info(TAG + "getRdbStore done: " + store);
        } catch (e) {
          expect(null).assertFail();
        }
      }).catch((err) => {
        expect(null).assertFail();
      })
      done();
      console.info(TAG + "************* testRdbStore0001 end   *************");
    })

    /**
     * @tc.name   testRdbStore0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_1000
     * @tc.desc   RelationalStore store getRdbStore and create table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRdbStore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(TAG + "************* testRdbStore0002 start *************");
      let storePromise = data_Rdb.getRdbStore(context, STORE_CONFIG);
      await storePromise.then(async (store) => {
        try {
          console.info(TAG + "getRdbStore done: " + store);
          await store.executeSql(CREATE_TABLE_TEST);
        } catch (e) {
          expect(null).assertFail();
        }
      }).catch((err) => {
        expect(null).assertFail();
      })
      done();
      console.info(TAG + "************* testRdbStore0002 end   *************");
    })

    /**
     * @tc.name   testRdbStore0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_1100
     * @tc.desc   RelationalStore store getRdbStore with wrong path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0003 start *************");

      let storeConfig = {
        name: "/wrong/rdbstore.db",
        securityLevel: data_Rdb.SecurityLevel.S1
      };
      try {
        data_Rdb.getRdbStore(context, storeConfig).then(async (ret) => {
          console.info(TAG + "getRdbStore done" + ret);
          expect(null).assertFail();
        }).catch((err) => {
          console.info(TAG + "getRdbStore with wrong path");
        })
        expect(false).assertTrue();
      } catch (error) {
        console.info(TAG + `catch err: failed: err: code= ${error.code}, message = ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
        console.info(TAG + "************* testRdbStore0003 end   *************");
      }
    })

    /**
     * @tc.name   testRdbStore0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_1200
     * @tc.desc   RelationalStore store deleteRdbStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0004 start *************");
      try {
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        await store.executeSql(CREATE_TABLE_TEST);
        await data_Rdb.deleteRdbStore(context, "rdbstore.db");
      } catch (e) {
        expect(null).assertFail();
      }
      done();
      console.info(TAG + "************* testRdbStore0004 end   *************");
    })

    /**
     * @tc.name   testRdbStore0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_1300
     * @tc.desc   RelationalStore store deleteRdbStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0005 start *************");
      try {
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        console.info(TAG + "Get rdbstore success");
        await store.executeSql(CREATE_TABLE_TEST);
        await data_Rdb.deleteRdbStore(context, "rdbstore.db");
      } catch (e) {
        expect(null).assertFail();
      }
      done();
      console.info(TAG + "************* testRdbStore0005 end   *************");
    })

    /**
     * @tc.name   testRdbStore0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_1400
     * @tc.desc   RelationalStore store getRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0006 start *************");
      let rdbstore = null;
      try {
        const STORE_CONFIG = {
          name: "rdbstorecontext.db",
          securityLevel: data_Rdb.SecurityLevel.S1
        };
        rdbstore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        console.info(TAG + "Get rdbstore success");
        expect(rdbstore != null).assertTrue();
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name);
      } catch (err) {
        console.info(TAG + "Get rdbstore fail catch err: " + err);
        expect(null).assertFail();
      }
      rdbstore = null;
      done();
      console.info(TAG + "************* testRdbStore0006 end   *************");
    })

    /**
     * @tc.name   testRdbStore0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_1500
     * @tc.desc   RelationalStore store getRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0007 start *************");
      let rdbstore = null;
      try {
        const STORE_CONFIG = {
          name: "rdbstorecontext.db",
          securityLevel: data_Rdb.SecurityLevel.S1
        };
        rdbstore = await data_Rdb.getRdbStore(contextApplication, STORE_CONFIG);
        console.info(TAG + "Get rdbstore success");
        expect(rdbstore != null).assertTrue();
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name);
      } catch (err) {
        console.info(TAG + "Get rdbstore fail catch err: " + err);
        expect(null).assertFail();
      }
      rdbstore = null;
      done();
      console.info(TAG + "************* testRdbStore0007 end   *************");
    })

    /**
     * @tc.name   testRdbStore0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_1600
     * @tc.desc   RelationalStore store deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0008 start *************");
      data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, data) => {
        console.info(TAG + "getRdbStore finish");
        console.info(TAG + "getRdbStore success: " + data);
        expect(data != null).assertTrue();
        await data_Rdb.deleteRdbStore(contextApplication, STORE_CONFIG.name);
        done();
        console.info(TAG + "************* testRdbStore0008 end   *************");
      });
      await sleep(500);
    })

    /**
     * @tc.name   testRdbStore0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_1700
     * @tc.desc   RelationalStore store deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0009 start *************");
      data_Rdb.getRdbStore(contextApplication, STORE_CONFIG, async (err, data) => {
        console.info(TAG + "getRdbStore finish");
        console.info(TAG + "getRdbStore success: " + data);
        expect(data != null).assertTrue();
        await data_Rdb.deleteRdbStore(contextApplication, STORE_CONFIG.name);
        done();
        console.info(TAG + "************* testRdbStore0009 end   *************");
      })
      await sleep(500);
    })

    /**
     * @tc.name   testRdbStore0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_1800
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0010 start *************");
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);

      try {
        store.version = 5
        expect(5).assertEqual(store.version);
      } catch (err) {
        console.info("testRdbStore0010 failed: err: code=" + err.code + " message=" + err.message);
        expect(null).assertFail();
      }

      try {
        store.version = 2147483647
        expect(2147483647).assertEqual(store.version);
      } catch (err) {
        console.info(" testRdbStore0010 failed: err: code=" + err.code + " message=" + err.message);
        expect(null).assertFail();
      }

      await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name);
      done();
      console.info(TAG + "************* testRdbStore0010 end   *************");
    })

    /**
     * @tc.name   testRdbStore0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_1900
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0011 start *************");
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);

      try {
        store.version = -2147483648;
      } catch (err) {
        console.info("testRdbStore0011 failed1: err: code=" + err.code + " message=" + err.message);
        expect("401").assertEqual(err.code);
      }

      try {
        store.version = 2147483647000;
      } catch (err) {
        console.info("testRdbStore0011 failed2: err: code=" + err.code + " message=" + err.message);
        expect("401").assertEqual(err.code);
      }

      try {
        store.version = 0;
      } catch (err) {
        console.info("testRdbStore0011 failed3: err: code=" + err.code + " message=" + err.message);
        expect("401").assertEqual(err.code);
      }

      await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name);
      done();
      console.info(TAG + "************* testRdbStore0011 end   *************");
    })


    /**
     * @tc.name   testRdbStore0012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_2000
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testRdbStore0012 start *************");
      const STORE_CONFIGS1 = {
        name: "rdbstore12.db",
        securityLevel: data_Rdb.SecurityLevel.S1
      };
      const STORE_CONFIGS2 = {
        name: "rdbstore12.db",
        securityLevel: data_Rdb.SecurityLevel.S2
      };
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS1);
      console.info(`testRdbStore0012 S1 Get RdbStore successfully.`);
      try {
        let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS2);
        await promise.then(async (rdbStore) => {
          store = rdbStore;
          console.info(`testRdbStore0012 Get RdbStore successfully.`);
        }).catch((err) => {
          console.error(`testRdbStore0012 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      } catch (error) {
        console.error(`testRdbStore0012 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      await data_Rdb.deleteRdbStore(context, STORE_CONFIGS1.name);
      console.info(TAG + "************* testRdbStore0012 end   *************");
    })

    /**
     * @tc.name   testRdbStore0013
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_2100
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testRdbStore0013 start *************");
      const STORE_CONFIGS1 = {
        name: "rdbstore13.db",
        securityLevel: data_Rdb.SecurityLevel.S1
      };
      const STORE_CONFIGS3 = {
        name: "rdbstore13.db",
        securityLevel: data_Rdb.SecurityLevel.S3
      };
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS1);
      console.info(`testRdbStore0013 S1 Get RdbStore successfully.`);
      try {
        let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS3);
        await promise.then(async (rdbStore) => {
          store = rdbStore;
          console.info(`testRdbStore0013 Get RdbStore successfully.`);
        }).catch((err) => {
          console.error(`testRdbStore0013 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      } catch (error) {
        console.error(`testRdbStore0013 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      await data_Rdb.deleteRdbStore(context, STORE_CONFIGS1.name);
      console.info(TAG + "************* testRdbStore0013 end   *************");
    })

    /**
     * @tc.name   testRdbStore0014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_2200
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testRdbStore0014 start *************");
      const STORE_CONFIGS1 = {
        name: "rdbstore14.db",
        securityLevel: data_Rdb.SecurityLevel.S1
      };
      const STORE_CONFIGS4 = {
        name: "rdbstore14.db",
        securityLevel: data_Rdb.SecurityLevel.S4
      };
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS1);
      console.info(`testRdbStore0014 S1 Get RdbStore successfully.`);
      try {
        let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS4);
        await promise.then(async (rdbStore) => {
          store = rdbStore;
          console.info(`testRdbStore0014 Get RdbStore successfully.`);
        }).catch((err) => {
          console.error(`testRdbStore0014 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      } catch (error) {
        console.error(`testRdbStore0014 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      await data_Rdb.deleteRdbStore(context, STORE_CONFIGS1.name);
      console.info(TAG + "************* testRdbStore0014 end   *************");
    })

    /**
     * @tc.name   testRdbStore0015
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_2300
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testRdbStore0015 start *************");
      const STORE_CONFIGS2 = {
        name: "rdbstore15.db",
        securityLevel: data_Rdb.SecurityLevel.S2
      };
      const STORE_CONFIGS4 = {
        name: "rdbstore15.db",
        securityLevel: data_Rdb.SecurityLevel.S4
      };
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS2);
      console.info(`testRdbStore0015 S2 Get RdbStore successfully.`);
      try {
        let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS4);
        await promise.then(async (rdbStore) => {
          store = rdbStore;
          console.info(`testRdbStore0015 Get RdbStore successfully.`);
        }).catch((err) => {
          console.error(`testRdbStore0015 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      } catch (error) {
        console.error(`testRdbStore0015 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      await data_Rdb.deleteRdbStore(context, STORE_CONFIGS2.name);
      console.info(TAG + "************* testRdbStore0015 end   *************");
    })


    /**
     * @tc.name   testRdbStore0016
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_2400
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testRdbStore0016 start *************");
      const STORE_CONFIGS2 = {
        name: "rdbstore16.db",
        securityLevel: data_Rdb.SecurityLevel.S2
      };
      const STORE_CONFIGS3 = {
        name: "rdbstore16.db",
        securityLevel: data_Rdb.SecurityLevel.S3
      };
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS2);
      console.info(`testRdbStore0016 S2 Get RdbStore successfully.`);
      try {
        let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS3);
        await promise.then(async (rdbStore) => {
          store = rdbStore;
          console.info(`testRdbStore0016 Get RdbStore successfully.`);
        }).catch((err) => {
          console.error(`testRdbStore0016 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      } catch (error) {
        console.error(`testRdbStore0016 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      await data_Rdb.deleteRdbStore(context, STORE_CONFIGS2.name);
      console.info(TAG + "************* testRdbStore0016 end   *************");
    })


    /**
     * @tc.name   testRdbStore0017
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_2500
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testRdbStore0017 start *************");
      const STORE_CONFIGS1 = {
        name: "rdbstore17.db",
        securityLevel: data_Rdb.SecurityLevel.S1
      };
      const STORE_CONFIGS4 = {
        name: "rdbstore17.db",
        securityLevel: data_Rdb.SecurityLevel.S4
      };
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS4);
      console.info(`testRdbStore0017 S4 Get RdbStore successfully.`);
      try {
        let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS1);
        await promise.then(async (rdbStore) => {
          store = rdbStore;
          console.info(`testRdbStore0017 Get RdbStore successfully.`);
          expect().assertFail();
        }).catch((err) => {
          console.error(`testRdbStore0017 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800017);
        })
      } catch (error) {
        console.error(`testRdbStore0017 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      await data_Rdb.deleteRdbStore(context, STORE_CONFIGS1.name);
      console.info(TAG + "************* testRdbStore0017 end   *************");
    })


    /**
     * @tc.name   testRdbStore0018
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_2600
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testRdbStore0018 start *************");
      const STORE_CONFIGS3 = {
        name: "rdbstore18.db",
        securityLevel: data_Rdb.SecurityLevel.S3
      };
      const STORE_CONFIGS2 = {
        name: "rdbstore18.db",
        securityLevel: data_Rdb.SecurityLevel.S2
      };
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS3);
      console.info(`testRdbStore0018 S3 Get RdbStore successfully.`);
      try {
        let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS2);
        await promise.then(async (rdbStore) => {
          store = rdbStore;
          console.info(`testRdbStore0018 Get RdbStore successfully.`);
          expect().assertFail();
        }).catch((err) => {
          console.error(`testRdbStore0018 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800017);
        })
      } catch (error) {
        console.error(`testRdbStore0018 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      await data_Rdb.deleteRdbStore(context, STORE_CONFIGS2.name);
      console.info(TAG + "************* testRdbStore0018 end   *************");
    })

    /**
     * @tc.name   testRdbStore0019
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_2700
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testRdbStore0019 start *************");
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      console.info(`testRdbStore0019 S1 Get RdbStore successfully.`);
      try {
        let promise = data_Rdb.getRdbStore(context, STORE_CONFIG);
        await promise.then(async (rdbStore) => {
          store = rdbStore;
          console.info(`testRdbStore0019 Get RdbStore successfully.`);
          expect(rdbStore != null).assertTrue();
          await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name);
          console.error(`testRdbStore0019 Get RdbStore  deleteRdbStore`);
        }).catch((err) => {
          console.error(`testRdbStore0019 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      } catch (error) {
        console.error(`testRdbStore0019 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG + "************* testRdbStore0019 end   *************");
    })

    /**
     * @tc.name   testRdbStore0020
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_2800
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0020 start *************");
      const STORE_CONFIGS2 = {
        name: "rdbstore.db",
        securityLevel: data_Rdb.SecurityLevel.S2
      };
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS2);
      console.info(`testRdbStore0020 S2 Get RdbStore successfully.`);
      try {
        let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS2);
        await promise.then(async (rdbStore) => {
          store = rdbStore;
          console.info(`testRdbStore0020 Get RdbStore successfully.`);
          expect(rdbStore != null).assertTrue();
          await data_Rdb.deleteRdbStore(context, STORE_CONFIGS2.name);
          console.error(`testRdbStore0020 deleteRdbStore`);
          done();
        }).catch((err) => {
          console.error(`testRdbStore0020 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.error(`testRdbStore0020 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* testRdbStore0020 end   *************");
    })


    /**
     * @tc.name   testRdbStore0021
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_2900
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0021 start *************");
      const STORE_CONFIGS3 = {
        name: "rdbstore.db",
        securityLevel: data_Rdb.SecurityLevel.S3
      };
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS3);
      console.info(`testRdbStore0021 S3 Get RdbStore successfully.`);
      try {
        let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS3);
        await promise.then(async (rdbStore) => {
          store = rdbStore;
          console.info(`testRdbStore0021 Get RdbStore successfully.`);
          expect(rdbStore != null).assertTrue();
          await data_Rdb.deleteRdbStore(context, STORE_CONFIGS3.name);
          done();
        }).catch((err) => {
          console.error(`testRdbStore0021 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.error(`testRdbStore0021 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* testRdbStore0021 end   *************");
    })

    /**
     * @tc.name   testRdbStore0022
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_3000
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testRdbStore0022 start *************");
      const STORE_CONFIGS4 = {
        name: "rdbstore.db",
        securityLevel: data_Rdb.SecurityLevel.S4
      };
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS4);
      console.info(`testRdbStore0022 S4 Get RdbStore successfully.`);
      try {
        let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS4);
        await promise.then(async (rdbStore) => {
          store = rdbStore;
          console.info(`testRdbStore0022 Get RdbStore successfully.`);
          expect(rdbStore != null).assertTrue();
          await data_Rdb.deleteRdbStore(context, STORE_CONFIGS4.name);
          done();
        }).catch((err) => {
          console.error(`testRdbStore0022 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.error(`testRdbStore0022 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* testRdbStore0022 end   *************");
    })
    /**
     * @tc.name   testRdbStore0023
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionEtsAPITest_3100
     * @tc.desc   relational version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStore0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      console.info(TAG + "************* testRdbStore0023 start *************");
      const STORE_CONFIGS1:data_Rdb.StoreConfig = {
        name: "rdbstore17.db",
        securityLevel: data_Rdb.SecurityLevel.S1
      };
      const STORE_CONFIGS4:data_Rdb.StoreConfig = {
        name: "rdbstore17.db",
        securityLevel: data_Rdb.SecurityLevel.S4
      };
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS4);
      console.info(TAG+`testRdbStore0023 S4 Get RdbStore successfully.`);
      try {
        data_Rdb.getRdbStore(context, STORE_CONFIGS1,async(err,rdbstore)=>{
          if(err)
          {
            console.error(TAG + `testRdbStore0023 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
            await data_Rdb.deleteRdbStore(context, STORE_CONFIGS4.name);
            console.info(TAG +`deleteRdbStore successfully.`);
            expect(err.code == 14800017).assertTrue();
            done()
          }else{
            console.info(TAG +`testRdbStore0023 Get RdbStore successfully.`);
            await data_Rdb.deleteRdbStore(context, STORE_CONFIGS4.name);
            console.info(TAG +`deleteRdbStore successfully.`);
            expect().assertFail();
            done()
          }
        });
      } catch (error) {
        console.error(TAG + `testRdbStore0023 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
        await data_Rdb.deleteRdbStore(context, STORE_CONFIGS4.name);
        console.info(TAG +`deleteRdbStore successfully.`);
        expect().assertFail();
        done()
      }
      console.info(TAG + "************* testRdbStore0023 end   *************");
    })
    console.info(TAG + "*************Unit Test End*************");
  })
}
