/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import relationalStore from "@ohos.data.relationalStore";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let context: Context;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const TAG = "[RDB_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG = {
  name: "ExcuteSqlTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};
let rdbStore = undefined;

export default function rdbstoreStoreExcuteSqlTest() {
  describe("rdbstoreStoreExcuteSqlTest", function () {
    beforeAll(async function () {
      console.info(TAG + "beforeAll");
      let ability = await delegator.getCurrentTopAbility();
      context = ability.context;
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async function () {
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await rdbStore.executeSql("DELETE FROM test");
      console.info(TAG + "beforeEach");
      await createTest1();
      await createTest2();
      await createTest3();
    });

    afterEach(async function () {
      console.info(TAG + "afterEach");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "ExcuteSqlTest.db");
    });

    afterAll(async function () {
      console.info(TAG + "afterAll");
    });

    async function createTest1() {
      console.info(TAG + "createTest start");
      {
        const valueBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        await rdbStore.insert("test", valueBucket);
      }
    }

    async function createTest2() {
      console.info(TAG + "createTest start");
      {
        const valueBucket = {
          name: "lisi",
          age: 28,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        await rdbStore.insert("test", valueBucket);
      }
    }

    async function createTest3() {
      console.info(TAG + "createTest start");
      {
        const valueBucket = {
          name: "lisi2",
          age: 28,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        await rdbStore.insert("test", valueBucket);
      }
    }

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0640
     * @tc.name   : testRdbStoreExecuteSql001
     * @tc.desc   : RdbStore executeSql callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreExecuteSql001", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreExecuteSql001 start *************");
      rdbStore.executeSql("DELETE FROM test WHERE name = 'zhangsan'", async (err) => {
        if (err) {
          console.error(`ExecuteSql failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertFail();
          done();
        }
        console.info(`Delete table done.`);
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        expect(2).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      });
      console.info(TAG + "************* testRdbStoreExecuteSql001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0660    S
     * @tc.name   : testRdbStoreExecuteSql002
     * @tc.desc   : RdbStore executeSql callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreExecuteSql002", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreExecuteSql002 start *************");
      rdbStore.executeSql("DELETE FROM test WHERE age = ? OR age = ?", ["18", "28"], async (err) => {
        if (err) {
          console.error(`ExecuteSql failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertFail();
          done();
        }
        console.info(`Delete table done.`);
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      });
      console.info(TAG + "************* testRdbStoreExecuteSql002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0650
     * @tc.name   : testRdbStoreExecuteSql003
     * @tc.desc   : RdbStore executeSql promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreExecuteSql003", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreExecuteSql003 start *************");
      let promise = rdbStore.executeSql("DELETE FROM test WHERE name = 'zhangsan'");
      promise
        .then(async () => {
          console.info(`Delete table done.`);
          let resultSet = await rdbStore.querySql("SELECT * FROM test");
          expect(2).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        })
        .catch((err) => {
          console.error(`ExecuteSql failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertFail();
        });
      console.info(TAG + "************* testRdbStoreExecuteSql003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0670
     * @tc.name   : testRdbStoreExecuteSql004
     * @tc.desc   : RdbStore executeSql promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreExecuteSql004", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreExecuteSql004 start *************");
      let promise = rdbStore.executeSql("DELETE FROM test WHERE age = ? OR age = ?", ["18", "28"]);
      promise
        .then(async () => {
          console.info(`Delete table done.`);
          let resultSet = await rdbStore.querySql("SELECT * FROM test");
          expect(0).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        })
        .catch((err) => {
          console.error(`ExecuteSql failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertFail();
        });
      console.info(TAG + "************* testRdbStoreExecuteSql004 end *************");
    });
  });
}
