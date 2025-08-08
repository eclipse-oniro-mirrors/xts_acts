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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import relationalStore from "@ohos.data.relationalStore";
import { ValuesBucket } from '@ohos.data.ValuesBucket';
import common from "@ohos.app.ability.common";

let context: common.UIAbilityContext;
const TAG = "[RDB_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbstoreTransactionTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};

let rdbStore = undefined;

export default function rdbstoreTransactionTest() {
  describe("rdbstoreTransactionTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async () => {
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
    });

    afterEach(async () => {
      console.info(TAG + "afterEach");
      await rdbStore.executeSql("DELETE FROM test");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "rdbstoreTransactionTest.db");
    });

    afterAll(async () => {
      console.info(TAG + "afterAll");
    });

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0100
     * @tc.name   : testRdbStoreTransaction001
     * @tc.desc   : RdbStore beginTransaction and commit test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreTransaction001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreTransaction001 start *************");
      await rdbStore.beginTransaction();
      const valueBucket: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      await rdbStore.insert("test", valueBucket);
      await rdbStore.commit();
      let predicates = new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates, ["name", "age"]);
      resultSet.goToFirstRow();
      const name = resultSet.getString(resultSet.getColumnIndex("name"));
      const age = resultSet.getLong(resultSet.getColumnIndex("age"));
      expect(name == "zhangsan").assertTrue();
      expect(age == 18).assertTrue();
      expect(1).assertEqual(resultSet.rowCount);
      resultSet.close();
      done();
      console.info(TAG + "************* testRdbStoreTransaction001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0110
     * @tc.name   : testRdbStoreTransaction002
     * @tc.desc   : RdbStore beginTransaction and commit test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreTransaction002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreTransaction002 start *************");
      await rdbStore.beginTransaction();
      const valueBucket1: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      await rdbStore.insert("test", valueBucket1);

      const valueBucket2: ValuesBucket = {
        name: "lisi",
        age: 23,
        salary: 200,
        blobType: new Uint8Array([1, 2, 3]),
      };
      await rdbStore.insert("test", valueBucket2);

      const valueBucket3: ValuesBucket = {
        name: "wangwu",
        age: 20,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      await rdbStore.insert("test", valueBucket3);

      await rdbStore.commit();
      let predicates = new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      resultSet.goToFirstRow();
      const name = resultSet.getString(resultSet.getColumnIndex("name"));
      const age = resultSet.getLong(resultSet.getColumnIndex("age"));
      expect(name == "zhangsan").assertTrue();
      expect(age == 18).assertTrue();
      expect(3).assertEqual(resultSet.rowCount);
      resultSet.close();
      done();
      console.info(TAG + "************* testRdbStoreTransaction002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0120
     * @tc.name   : testRdbStoreTransaction003
     * @tc.desc   : RdbStore beginTransaction and commit test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreTransaction003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreTransaction003 start *************");
      let predicates1 = new relationalStore.RdbPredicates("test");
      let resultSet1 = await rdbStore.query(predicates1);
      expect(0).assertEqual(resultSet1.rowCount);
      resultSet1.close();
      rdbStore.beginTransaction();
      const valueBucket: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      await rdbStore.insert("test", valueBucket);

      let predicates = new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(0).assertEqual(resultSet.rowCount);
      resultSet.close();
      done();
      console.info(TAG + "************* testRdbStoreTransaction003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0130
     * @tc.name   : testRdbStoreTransaction004
     * @tc.desc   : RdbStore beginTransaction and commit test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreTransaction004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreTransaction004 start *************");
      await rdbStore.beginTransaction();
      const valueBucket: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      await rdbStore.insert("test", valueBucket);

      await rdbStore.beginTransaction();
      const valueBucket2: ValuesBucket = {
        name: "lisi",
        age: 23,
        salary: 200,
        blobType: new Uint8Array([1, 2, 3]),
      };
      await rdbStore.insert("test", valueBucket2);

      await rdbStore.commit();

      await rdbStore.commit();

      let predicates = new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      resultSet.goToFirstRow();
      const name = resultSet.getString(resultSet.getColumnIndex("name"));
      const age = resultSet.getLong(resultSet.getColumnIndex("age"));
      expect(name == "zhangsan").assertTrue();
      expect(age == 18).assertTrue();
      expect(2).assertEqual(resultSet.rowCount);
      resultSet.close();
      done();
      console.info(TAG + "************* testRdbStoreTransaction004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0140
     * @tc.name   : testRdbStoreRollBack001
     * @tc.desc   : RdbStore rollBack test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreRollBack001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreRollBack001 start *************");
      await rdbStore.beginTransaction();
      const valueBucket1: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      await rdbStore.insert("test", valueBucket1);

      await rdbStore.beginTransaction();
      const valueBucket2: ValuesBucket = {
        name: "lisi",
        age: 23,
        salary: 200,
        blobType: new Uint8Array([1, 2, 3]),
      };
      await rdbStore.insert("test", valueBucket2);

      await rdbStore.rollBack();

      await rdbStore.commit();

      let predicates = new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      resultSet.goToFirstRow();
      const name = resultSet.getString(resultSet.getColumnIndex("name"));
      const age = resultSet.getLong(resultSet.getColumnIndex("age"));
      expect(name == "zhangsan").assertTrue();
      expect(age == 18).assertTrue();
      expect(1).assertEqual(resultSet.rowCount);
      resultSet.close();
      done();
      console.info(TAG + "************* testRdbStoreRollBack001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0150
     * @tc.name   : testRdbStoreRollBack002
     * @tc.desc   : RdbStore rollBack test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreRollBack002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreRollBack002 start *************");
      try {
        await rdbStore.beginTransaction();
        const valueBucket: ValuesBucket = {
          id: 1,
          name: "lisi",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        await rdbStore.insert("test", valueBucket);
        await rdbStore.insert("test", valueBucket);

        await rdbStore.commit();
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        await rdbStore.rollBack();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "testRdbStoreRollBack002 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      }
      console.info(TAG + "************* testRdbStoreRollBack002 end *************");
    });
  });
}
