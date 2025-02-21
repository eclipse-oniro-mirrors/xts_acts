/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT UNIQUE, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const STORE_CONFIG = {
  name: "UpdataTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};

let rdbStore = undefined;

export default function rdbStoreUpdateTest() {
  describe("rdbStoreUpdateTest", function () {
    beforeAll(async function () {
      console.info(TAG + "beforeAll");
      let ability = await delegator.getCurrentTopAbility();
      context = ability.context;
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async function () {
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await createTest();
    });

    afterEach(async function () {
      console.info(TAG + "afterEach");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "UpdataTest.db");
    });

    afterAll(async function () {
      console.info(TAG + "afterAll");
    });

    async function createTest() {
      console.info(TAG + "createTest start");
      {
        var u8 = new Uint8Array([1, 2, 3]);
        const valueBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: u8,
        };
        await rdbStore.insert("test", valueBucket);
      }
    }

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1240
     * @tc.name   : testRdbStoreUpdate001
     * @tc.desc   : RdbStore update callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate001", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate001 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([4, 5, 6]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertTrue();
            return;
          }
          try {
            console.info(`Updated row count: ${rows}`);
            let resultSet = await rdbStore.query(predicates);
            console.info(TAG + "resultSet query done");
            expect(true).assertEqual(resultSet.goToFirstRow());
            const id = resultSet.getLong(resultSet.getColumnIndex("id"));
            const name = resultSet.getString(resultSet.getColumnIndex("name"));
            const age = resultSet.getLong(resultSet.getColumnIndex("age"));
            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
            expect(1).assertEqual(id);
            expect("lisi").assertEqual(name);
            expect(20).assertEqual(age);
            expect(200.5).assertEqual(salary);
            expect(4).assertEqual(blobType[0]);
            expect(5).assertEqual(blobType[1]);
            expect(6).assertEqual(blobType[2]);
            resultSet.close();
            done();
          } catch (e) {
            console.info("update error " + e);
            expect(!e).assertTrue();
          }
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1270
     * @tc.name   : testRdbStoreUpdate002
     * @tc.desc   : RdbStore update callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate002", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate002 start *************");
      try {
        const emptyBucket = {};
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(emptyBucket, predicates, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000).assertTrue();
            console.info(TAG + "update with wrong valueBucket");
            done();
            return;
          }
          console.info(`Updated row count: ${rows}`);
          expect(rows > 0).assertFail();
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1290
     * @tc.name   : testRdbStoreUpdate003
     * @tc.desc   : RdbStore update callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate003", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate003 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        await predicates.equalTo("aaa", "null");
        rdbStore.update(valueBucket, predicates, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000).assertTrue();
            console.info(TAG + "update with wrong condition");
            done();
            return;
          }
          console.info(`Updated row count: ${rows}`);
          expect(rows > 0).assertFail();
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1210
     * @tc.name   : testRdbStoreUpdate004
     * @tc.desc   : RdbStore update callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate004", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate004 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
          wrongColumn: 100.5,
        };

        let predicates = new relationalStore.RdbPredicates("wrongTable");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000).assertTrue();
            console.info(TAG + "update with wrong table name");
            done();
            return;
          }
          console.info(`Updated row count: ${rows}`);
          expect(rows > 0).assertFail();
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1250
     * @tc.name   : testRdbStoreUpdate005
     * @tc.desc   : RdbStore update callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate005", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate005 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
          wrongColumn: 100.5,
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000).assertTrue();
            console.info(TAG + "update with wrong column name");
            done();
            return;
          }
          console.info(`Updated row count: ${rows}`);
          expect(rows > 0).assertFail();
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      done();
      console.info(TAG + "************* testRdbStoreUpdate005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1230
     * @tc.name   : testRdbStoreUpdate006
     * @tc.desc   : RdbStore update promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate006", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate006 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        await rdbStore.update(valueBucket, predicates);
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(1).assertEqual(id);
        expect("lisi").assertEqual(name);
        expect(20).assertEqual(age);
        expect(200.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1280
     * @tc.name   : testRdbStoreUpdate007
     * @tc.desc   : RdbStore update promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate007", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate007 start *************");
      try {
        const emptyBucket = {};

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        let promise = rdbStore.update(emptyBucket, predicates);
        promise
          .then(async (rows) => {
            console.info(`Updated row count: ${rows}`);
            expect(rows > 0).assertFalse();
          })
          .catch((err) => {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000).assertTrue();
            console.info(TAG + "update with wrong valueBucket");
            done();
          });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1300
     * @tc.name   : testRdbStoreUpdate008
     * @tc.desc   : RdbStore update promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate008", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate008 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        await predicates.equalTo("aaa", "null");
        let promise = rdbStore.update(valueBucket, predicates);
        promise
          .then(async (rows) => {
            console.info(`Updated row count: ${rows}`);
            expect(rows > 0).assertFalse();
          })
          .catch((err) => {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000).assertTrue();
            console.info(TAG + "update with wrong condition");
            done();
          });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1220
     * @tc.name   : testRdbStoreUpdate009
     * @tc.desc   : RdbStore update promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate009", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate009 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
          wrongColumn: 100.5,
        };

        let predicates = new relationalStore.RdbPredicates("wrongTable");
        predicates.equalTo("id", "1");
        let promise = rdbStore.update(valueBucket, predicates);
        promise
          .then(async (rows) => {
            console.info(`Updated row count: ${rows}`);
            expect(rows > 0).assertTrue();
          })
          .catch((err) => {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000).assertTrue();
            console.info(TAG + "update with null table name");
            done();
          });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate009 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1260
     * @tc.name   : testRdbStoreUpdate010
     * @tc.desc   : RdbStore update promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate010", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate010 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
          wrongColumn: 100.5,
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        let promise = rdbStore.update(valueBucket, predicates);
        promise
          .then(async (rows) => {
            console.info(`Updated row count: ${rows}`);
            expect(rows > 0).assertTrue();
          })
          .catch((err) => {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000).assertTrue();
            console.info(TAG + "update with wrong column name");
            done();
          });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate010 end *************");
    });

    /**
     * @tc.number :  SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1120
     * @tc.name   : testRdbStoreUpdate011
     * @tc.desc   : RdbStore update callback with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate011", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate011 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([4, 5, 6]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_FAIL, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            return;
          }
          try {
            console.info(`Updated row count: ${rows}`);
            let resultSet = await rdbStore.query(predicates);
            console.info(TAG + "resultSet query done");
            expect(true).assertEqual(resultSet.goToFirstRow());
            const id = resultSet.getLong(resultSet.getColumnIndex("id"));
            const name = resultSet.getString(resultSet.getColumnIndex("name"));
            const age = resultSet.getLong(resultSet.getColumnIndex("age"));
            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
            expect(1).assertEqual(id);
            expect("lisi").assertEqual(name);
            expect(20).assertEqual(age);
            expect(200.5).assertEqual(salary);
            expect(4).assertEqual(blobType[0]);
            expect(5).assertEqual(blobType[1]);
            expect(6).assertEqual(blobType[2]);
            resultSet.close();
            done();
          } catch (e) {
            console.info("update error " + e);
            expect(!e).assertTrue();
          }
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate011 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1110
     * @tc.name   : testRdbStoreUpdate012
     * @tc.desc   : RdbStore update promise with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate012", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate012 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        await rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(1).assertEqual(id);
        expect("lisi").assertEqual(name);
        expect(20).assertEqual(age);
        expect(200.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate012 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1160
     * @tc.name   : testRdbStoreUpdate013
     * @tc.desc   : RdbStore update callback with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate013", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate013 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([4, 5, 6]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_NONE, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertTrue();
            return;
          }
          try {
            console.info(`Updated row count: ${rows}`);
            let resultSet = await rdbStore.query(predicates);
            console.info(TAG + "resultSet query done");
            expect(true).assertEqual(resultSet.goToFirstRow());
            const id = resultSet.getLong(resultSet.getColumnIndex("id"));
            const name = resultSet.getString(resultSet.getColumnIndex("name"));
            const age = resultSet.getLong(resultSet.getColumnIndex("age"));
            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
            expect(1).assertEqual(id);
            expect("lisi").assertEqual(name);
            expect(20).assertEqual(age);
            expect(200.5).assertEqual(salary);
            expect(4).assertEqual(blobType[0]);
            expect(5).assertEqual(blobType[1]);
            expect(6).assertEqual(blobType[2]);
            resultSet.close();
            done();
          } catch (e) {
            console.info("update error " + e);
            expect(!e).assertTrue();
          }
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate013 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1150
     * @tc.name   : testRdbStoreUpdate014
     * @tc.desc   : RdbStore update promise with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate014", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate014 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        await rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(1).assertEqual(id);
        expect("lisi").assertEqual(name);
        expect(20).assertEqual(age);
        expect(200.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate014 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1200
     * @tc.name   : testRdbStoreUpdate015
     * @tc.desc   : RdbStore update callback with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate015", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate015 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([4, 5, 6]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK, async (err, rows) => {
          console.info(TAG + "************* testRdbStoreUpdate015 11111111 *************" + err);
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertTrue();
            return;
          }
          try {
            console.info(`Updated row count: ${rows}`);
            let resultSet = await rdbStore.query(predicates);
            console.info(TAG + "resultSet query done");
            expect(true).assertEqual(resultSet.goToFirstRow());
            const id = resultSet.getLong(resultSet.getColumnIndex("id"));
            const name = resultSet.getString(resultSet.getColumnIndex("name"));
            const age = resultSet.getLong(resultSet.getColumnIndex("age"));
            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
            expect(1).assertEqual(id);
            expect("zhangsan").assertEqual(name);
            expect(20).assertEqual(age);
            expect(200.5).assertEqual(salary);
            expect(4).assertEqual(blobType[0]);
            expect(5).assertEqual(blobType[1]);
            expect(6).assertEqual(blobType[2]);
            resultSet.close();
            done();
            console.info(TAG + "************* testRdbStoreUpdate015 end *************");
          } catch (e) {
            console.info("update error " + e);
            expect(!e).assertTrue();
          }
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1190
     * @tc.name   : testRdbStoreUpdate016
     * @tc.desc   : RdbStore update promise with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate016", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate016 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        await rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(1).assertEqual(id);
        expect("lisi").assertEqual(name);
        expect(20).assertEqual(age);
        expect(200.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate014 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1100
     * @tc.name   : testRdbStoreUpdate017
     * @tc.desc   : RdbStore update callback with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate017", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate017 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([4, 5, 6]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ABORT, async (err, rows) => {
          console.info(TAG + "************* testRdbStoreUpdate017 11111111 *************" + err);
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertTrue();
            return;
          }
          try {
            console.info(`Updated row count: ${rows}`);
            let resultSet = await rdbStore.query(predicates);
            console.info(TAG + "resultSet query done");
            expect(true).assertEqual(resultSet.goToFirstRow());
            const id = resultSet.getLong(resultSet.getColumnIndex("id"));
            const name = resultSet.getString(resultSet.getColumnIndex("name"));
            const age = resultSet.getLong(resultSet.getColumnIndex("age"));
            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
            expect(1).assertEqual(id);
            expect("zhangsan").assertEqual(name);
            expect(20).assertEqual(age);
            expect(200.5).assertEqual(salary);
            expect(4).assertEqual(blobType[0]);
            expect(5).assertEqual(blobType[1]);
            expect(6).assertEqual(blobType[2]);
            resultSet.close();
            done();
            console.info(TAG + "************* testRdbStoreUpdate017 end *************");
          } catch (e) {
            console.info("update error " + e);
            expect(!e).assertTrue();
          }
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1090
     * @tc.name   : testRdbStoreUpdate018
     * @tc.desc   : RdbStore update promise with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate018", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate018 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        await rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(1).assertEqual(id);
        expect("lisi").assertEqual(name);
        expect(20).assertEqual(age);
        expect(200.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate018 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1140
     * @tc.name   : testRdbStoreUpdate019
     * @tc.desc   : RdbStore update callback with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate019", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate019 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([4, 5, 6]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE, async (err, rows) => {
          console.info(TAG + "************* testRdbStoreUpdate019 11111111 *************" + err);
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertTrue();
            return;
          }
          try {
            console.info(`Updated row count: ${rows}`);
            let resultSet = await rdbStore.query(predicates);
            console.info(TAG + "resultSet query done");
            expect(true).assertEqual(resultSet.goToFirstRow());
            const id = resultSet.getLong(resultSet.getColumnIndex("id"));
            const name = resultSet.getString(resultSet.getColumnIndex("name"));
            const age = resultSet.getLong(resultSet.getColumnIndex("age"));
            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
            expect(1).assertEqual(id);
            expect("zhangsan").assertEqual(name);
            expect(20).assertEqual(age);
            expect(200.5).assertEqual(salary);
            expect(4).assertEqual(blobType[0]);
            expect(5).assertEqual(blobType[1]);
            expect(6).assertEqual(blobType[2]);
            resultSet.close();
            done();
            console.info(TAG + "************* testRdbStoreUpdate019 end *************");
          } catch (e) {
            console.info("update error " + e);
            expect(!e).assertTrue();
          }
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1130
     * @tc.name   : testRdbStoreUpdate020
     * @tc.desc   : RdbStore update promise with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate020", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate020 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        await rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(1).assertEqual(id);
        expect("lisi").assertEqual(name);
        expect(20).assertEqual(age);
        expect(200.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate020 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1180
     * @tc.name   : testRdbStoreUpdate021
     * @tc.desc   : RdbStore update callback with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate021", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate021 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([4, 5, 6]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, async (err, rows) => {
          console.info(TAG + "************* testRdbStoreUpdate021 11111111 *************" + err);
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertTrue();
            return;
          }
          try {
            console.info(`Updated row count: ${rows}`);
            let resultSet = await rdbStore.query(predicates);
            console.info(TAG + "resultSet query done");
            expect(true).assertEqual(resultSet.goToFirstRow());
            const id = resultSet.getLong(resultSet.getColumnIndex("id"));
            const name = resultSet.getString(resultSet.getColumnIndex("name"));
            const age = resultSet.getLong(resultSet.getColumnIndex("age"));
            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
            expect(1).assertEqual(id);
            expect("zhangsan").assertEqual(name);
            expect(20).assertEqual(age);
            expect(200.5).assertEqual(salary);
            expect(4).assertEqual(blobType[0]);
            expect(5).assertEqual(blobType[1]);
            expect(6).assertEqual(blobType[2]);
            resultSet.close();
            done();
            console.info(TAG + "************* testRdbStoreUpdate021 end *************");
          } catch (e) {
            console.info("update error " + e);
            expect(!e).assertTrue();
          }
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1170
     * @tc.name   : testRdbStoreUpdate022
     * @tc.desc   : RdbStore update promise with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate022", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate022 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        await rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(1).assertEqual(id);
        expect("lisi").assertEqual(name);
        expect(20).assertEqual(age);
        expect(200.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate022 end *************");
    });
  });
}
