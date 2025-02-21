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
import { ValuesBucket } from '@ohos.data.ValuesBucket';
import { BusinessError } from '@ohos.base';
import common from "@ohos.app.ability.common";

let context: common.UIAbilityContext;
const TAG = "[RDB_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "InsertTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};

let rdbStore = undefined;
let resultSet: ESObject = undefined;

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function InsertTest() {
  describe("InsertTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async () => {
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.log("InsertTestrdbStore" + rdbStore);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
    });

    afterEach(async () => {
      console.info(TAG + "afterEach");
      await rdbStore.executeSql("DELETE FROM test");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "InsertTest.db").then(() => {
        sleep(2);
      });
    });

    afterAll(async () => {
      console.info(TAG + "afterAll");
    });

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1320
     * @tc.name   : testRdbStoreVersion001
     * @tc.desc   : RdbStore version test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("testRdbStoreVersion001", 0, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreVersion001 start *************");
      rdbStore.version = 3;
      expect(3).assertEqual(rdbStore.version);
      done();
      console.log(TAG + "************* testRdbStoreVersion001 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1310
     * @tc.name   : testRdbStoreVersionError001
     * @tc.desc   : RdbStore version Error test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("testRdbStoreVersionError001", 0, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreVersionError001 start *************");
      try {
        rdbStore.version = -1;
        console.log("testRdbStoreVersionError001 rdbStore.version ======== " + rdbStore.version);
        expect().assertFail();
      } catch (err) {
        console.info("testRdbStoreVersionError001 err:" + JSON.stringify(err));
        expect(err.code == 401).assertTrue();
        done();
      }
      console.log(TAG + "************* testRdbStoreVersionError001 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0890
     * @tc.name   : testRdbStoreInsert001
     * @tc.desc   : RdbStore insert callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsert001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsert001 start *************");
      try {
        const valueBucket: ValuesBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        rdbStore.insert("test", valueBucket, async (err, rowId) => {
          if (err) {
            console.error(`Insert is failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertTrue();
            done();
          }
          try {
            console.info(`Insert is successful, rowId = ${rowId}`);
            let predicates = new relationalStore.RdbPredicates("test");
            predicates.equalTo("name", "zhangsan");
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
            expect(18).assertEqual(age);
            expect(100.5).assertEqual(salary);
            expect(1).assertEqual(blobType[0]);
            expect(2).assertEqual(blobType[1]);
            expect(3).assertEqual(blobType[2]);
            resultSet.close();
            done();
          } catch (e) {
            console.info("Insert error " + e);
            expect(e !== null).assertFalse();
          }
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("Insert error " + e);
        expect(e !== null).assertFalse();
      }

      console.info(TAG + "************* testRdbStoreInsert001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0840
     * @tc.name   : testRdbStoreInsertError0011
     * @tc.desc   : RdbStore insert error callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsertError0011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsertError0011 start *************");
      const valueBucket: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      rdbStore.insert("test1", valueBucket, async (err, rowId) => {
        if (err) {
          console.error(`testRdbStoreInsertError0011:Insert is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code == 14800021).assertTrue();
          done();
          return;
        }
        expect(!err).assertFail();
        console.info(TAG + "************* testRdbStoreInsertError0011 end *************");
      });
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0800
     * @tc.name   : testRdbStoreInsertError0012
     * @tc.desc   : RdbStore insert error callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsertError0012", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsertError0012 start *************");
      const valueBucket: ValuesBucket = {
        name: "zhangsan",
        age2: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      rdbStore.insert("test", valueBucket, async (err, rowId) => {
        if (err) {
          console.error(`testRdbStoreInsertError0012:Insert is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code == 14800021).assertTrue();
          done();
          return;
        }
        expect(!err).assertFail();
        console.info(TAG + "************* testRdbStoreInsertError0012 end *************");
      });
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0880
     * @tc.name   : testRdbStoreInsert002
     * @tc.desc   : RdbStore insert promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsert002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsert002 start *************");
      try {
        const valueBucket: ValuesBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        await rdbStore.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
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
        expect(18).assertEqual(age);
        expect(100.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("Insert error " + e);
        expect(e !== null).assertFalse();
      }
      console.info(TAG + "************* testRdbStoreInsert002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0850
     * @tc.name   : testRdbStoreInsertError0021
     * @tc.desc   : RdbStore insert promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsertError0021", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsertError0021 start *************");

      const valueBucket: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      let promise = rdbStore.insert("test1", valueBucket);
      promise.then((num) => {
        expect(num).assertEqual(0);
        done();
      }).catch((err: BusinessError) => {
        console.error(`testRdbStoreInsertError0021:Insert is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code == 14800021).assertTrue();
        done();
      });
      console.info(TAG + "************* testRdbStoreInsertError0021 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0810
     * @tc.name   : testRdbStoreInsertError0022
     * @tc.desc   : RdbStore insert promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsertError0022", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsertError0022 start *************");

      const valueBucket: ValuesBucket = {
        name: "zhangsan",
        age1: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      let promise = rdbStore.insert("test1", valueBucket);
      promise.then((num) => {
        expect(num).assertEqual(0);
        done();
      }).catch((err: BusinessError) => {
        console.error(`testRdbStoreInsertError0022:Insert is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code == 14800021).assertTrue();
        done();
      });
      console.info(TAG + "************* testRdbStoreInsertError0022 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0910
     * @tc.name   : testRdbStoreInsert003
     * @tc.desc   : RdbStore insert callback with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsert003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsert003 start *************");
      try {
        const valueBucket: ValuesBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        rdbStore.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK, async (err, rowId) => {
          if (err) {
            console.error(`Insert is failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertFail();
            done();
          }
          try {
            console.info(`Insert is successful, rowId = ${rowId}`);
            let predicates = new relationalStore.RdbPredicates("test");
            predicates.equalTo("name", "zhangsan");
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
            expect(18).assertEqual(age);
            expect(100.5).assertEqual(salary);
            expect(1).assertEqual(blobType[0]);
            expect(2).assertEqual(blobType[1]);
            expect(3).assertEqual(blobType[2]);
            resultSet.close();
            done();
          } catch (e) {
            console.info("Insert error " + e);
            expect(e !== null).assertFalse();
          }
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("Insert error " + e);
        expect(e !== null).assertFalse();
      }

      console.info(TAG + "************* testRdbStoreInsert003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0870
     * @tc.name   : testRdbStoreInsertError0031
     * @tc.desc   : RdbStore insert error callback with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsertError0031", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsertError0031 start *************");

      const valueBucket: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      rdbStore.insert("test1", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK, async (err, rowId) => {
        if (err) {
          console.error(`testRdbStoreInsertError0031:Insert is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code == 14800021).assertTrue();
          done();
          return;
        }
        expect(!err).assertFail();
        console.info(TAG + "************* testRdbStoreInsertError0031 end *************");
      });
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0830
     * @tc.name   : testRdbStoreInsertError0032
     * @tc.desc   : RdbStore insert error callback with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsertError0032", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsertError0032 start *************");

      const valueBucket: ValuesBucket = {
        name: "zhangsan",
        age1: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      rdbStore.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK, async (err, rowId) => {
        if (err) {
          console.error(`testRdbStoreInsertError0032:Insert is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code == 14800021).assertTrue();
          done();
          return;
        }
        expect(!err).assertFail();
        console.info(TAG + "************* testRdbStoreInsertError0032 end *************");
      });
    });


    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0900
     * @tc.name   : testRdbStoreInsert004
     * @tc.desc   : RdbStore insert promise with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsert004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsert004 start *************");
      try {
        const valueBucket: ValuesBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        await rdbStore.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
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
        expect(18).assertEqual(age);
        expect(100.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("Insert error " + e);
        expect(e !== null).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreInsert004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0860
     * @tc.name   : testRdbStoreInsertError0041
     * @tc.desc   : RdbStore insert promise with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsertError0041", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsertError0041 start *************");

      const valueBucket: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      let promise = rdbStore.insert("test1", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
      promise.then((num) => {
        expect(num).assertEqual(0);
        done();
      }).catch((err: BusinessError) => {
        console.error(`testRdbStoreInsertError0041:Insert is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code == 14800021).assertTrue();
        done();
      });

      console.info(TAG + "************* testRdbStoreInsertError0041 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0820
     * @tc.name   : testRdbStoreInsertError0042
     * @tc.desc   : RdbStore insert promise with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsertError0042", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreInsertError0042 start *************");

      const valueBucket: ValuesBucket = {
        name: "zhangsan",
        age1: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      let promise = rdbStore.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
      promise.then((num) => {
        expect(num).assertEqual(0);
        done();
      }).catch((err: BusinessError) => {
        console.error(`testRdbStoreInsertError0042:Insert is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code == 14800021).assertTrue();
        done();
      });
      console.info(TAG + "************* testRdbStoreInsertError0042 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0390
     * @tc.name   : testRdbStoreBatchInsert001
     * @tc.desc   : RdbStore batchInsert callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBatchInsert001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBatchInsert001 start *************");
      try {
        const valueBucket1: ValuesBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBucket2: ValuesBucket = {
          name: "lisi",
          age: 23,
          salary: 200,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBucket3: ValuesBucket = {
          name: "wangwu",
          age: 20,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];
        rdbStore.batchInsert("test", valueBuckets, async (err, insertNum) => {
          if (err) {
            console.error(`batchInsert is failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertTrue();
            done();
          }
          try {
            console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
            let predicates = new relationalStore.RdbPredicates("test");
            predicates.equalTo("name", "zhangsan");
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
            expect(18).assertEqual(age);
            expect(100.5).assertEqual(salary);
            expect(1).assertEqual(blobType[0]);
            expect(2).assertEqual(blobType[1]);
            expect(3).assertEqual(blobType[2]);
            resultSet.close();
            done();
          } catch (e) {
            console.info("Insert error " + e);
            expect(e !== null).assertFalse();
          }
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("BatchInsert error " + e);
        expect(e !== null).assertFalse();
      }
      console.info(TAG + "************* testRdbStoreBatchInsert001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0350
     * @tc.name   : testRdbStoreBatchInsertError0011
     * @tc.desc   : RdbStore batchInsert callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBatchInsertError0011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBatchInsertError0011 start *************");
      const valueBucket1: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket2: ValuesBucket = {
        name: "lisi",
        age: 23,
        salary: 200,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket3: ValuesBucket = {
        name: "wangwu",
        age: 20,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];

      rdbStore.batchInsert("test1", valueBuckets, async (err, insertNum) => {
        if (err) {
          console.error(`testRdbStoreBatchInsertError0011 batchInsert is failed, code is ${err.code},message is ${err.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`testRdbStoreBatchInsertError0011 batchInsert `);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      });
      console.info(TAG + "************* testRdbStoreBatchInsertError0011 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0420
     * @tc.name   : testRdbStoreBatchInsertError0012
     * @tc.desc   : RdbStore batchInsert callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBatchInsertError0012", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBatchInsertError0012 start *************");
      const valueBucket1: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket2: ValuesBucket = {
        name: "lisi",
        age: 23,
        salary: 200,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket3: ValuesBucket = {
        name: "wangwu",
        age1: 20,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];
      rdbStore.batchInsert("test", valueBuckets, async (err, insertNum) => {
        if (err) {
          console.error(`testRdbStoreBatchInsertError0012 batchInsert is failed, code is ${err.code},message is ${err.message}`);
          expect(false).assertFail();
          done();
        }
        console.error(`testRdbStoreBatchInsertError0012 batchInsert `);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      });
      console.info(TAG + "************* testRdbStoreBatchInsertError0012 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0430
     * @tc.name   : testRdbStoreBatchInsertError0013
     * @tc.desc   : RdbStore batchInsert callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBatchInsertError0013", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBatchInsertError0013 start *************");
      const valueBucket1: ValuesBucket = {
        name: "zhangsan",
        age1: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket2: ValuesBucket = {
        name: "lisi",
        age1: 23,
        salary: 200,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket3: ValuesBucket = {
        name: "wangwu",
        age1: 20,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];
      rdbStore.batchInsert("test", valueBuckets, async (err, insertNum) => {
        if (err) {
          console.error(`testRdbStoreBatchInsertError0013 batchInsert is failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertFail();
          done();
        }
        console.error(`testRdbStoreBatchInsertError0013 batchInsert `);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      });
      console.info(TAG + "************* testRdbStoreBatchInsertError0013 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0360
     * @tc.name   : testRdbStoreBatchInsertError0014
     * @tc.desc   : RdbStore batchInsert callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBatchInsertError0014", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBatchInsertError0014 start *************");
      const valueBucket1: ValuesBucket = {
        name: "zhangsan",
        age1: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket2: ValuesBucket = {
        name: "lisi",
        age1: 23,
        salary: 200,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket3: ValuesBucket = {
        name: "wangwu",
        age1: 20,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];
      try {
        rdbStore.batchInsert(null, valueBuckets, async (err, insertNum) => {
          expect(!err).assertFail();
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info(TAG + "************* testRdbStoreBatchInsertError0014 *************");
        expect('401').assertEqual(e.code);
        done();
      }

      console.info(TAG + "************* testRdbStoreBatchInsertError0014 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0400
     * @tc.name   : testRdbStoreBatchInsertError0015
     * @tc.desc   : RdbStore batchInsert callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBatchInsertError0015", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBatchInsertError0015 start *************");
      const valueBucket1: ValuesBucket = {
        name: "zhangsan",
        age: 'abc',
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket2: ValuesBucket = {
        name: "lisi",
        age1: 23,
        salary: 200,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket3: ValuesBucket = {
        name: "wangwu",
        age1: 20,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];
      rdbStore.batchInsert("test", valueBuckets, async (err, insertNum) => {
        if (err) {
          console.error(`testRdbStoreBatchInsertError0015 batchInsert is failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertFail();
          done();
        }
        console.error(`testRdbStoreBatchInsertError0015 batchInsert `);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      });
      console.info(TAG + "************* testRdbStoreBatchInsertError0015 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0380
     * @tc.name   : testRdbStoreBatchInsert002
     * @tc.desc   : RdbStore batchInsert promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBatchInsert002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBatchInsert002 start *************");
      try {
        const valueBucket1: ValuesBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBucket2: ValuesBucket = {
          name: "lisi",
          age: 23,
          salary: 200,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBucket3: ValuesBucket = {
          name: "wangwu",
          age: 20,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];
        await rdbStore.batchInsert("test", valueBuckets);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "lisi");
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary);
        expect(2).assertEqual(id);
        expect("lisi").assertEqual(name);
        expect(23).assertEqual(age);
        expect(200).assertEqual(salary);
        resultSet.close();
        done();
      } catch (e) {
        console.info("BatchInsert error " + e);
        expect(e !== null).assertFalse();
      }
      console.info(TAG + "************* testRdbStoreBatchInsert002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0340
     * @tc.name   : testRdbStoreBatchInsertError0021
     * @tc.desc   : RdbStore batchInsert promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBatchInsertError0021", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBatchInsertError0021 start *************");
      const valueBucket1: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket2: ValuesBucket = {
        name: "lisi",
        age: 23,
        salary: 200,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket3: ValuesBucket = {
        name: "wangwu",
        age: 20,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];
      let promise = rdbStore.batchInsert("test1", valueBuckets);
      promise.then(async () => {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "lisi");
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      }).catch((err: BusinessError) => {
        console.error(`testRdbStoreBatchInsertError0021:Insert is failed, code is ${err.code},message is ${err.message}`);
        expect(!err).assertFail();
        done();
      });

      console.info(TAG + "************* testRdbStoreBatchInsertError0021 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0410
     * @tc.name   : testRdbStoreBatchInsertError0022
     * @tc.desc   : RdbStore batchInsert promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBatchInsertError0022", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBatchInsertError0022 start *************");
      const valueBucket1: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket2: ValuesBucket = {
        name: "lisi",
        age: 23,
        salary: 200,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket3: ValuesBucket = {
        name: "wangwu",
        age1: 20,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];
      let promise = rdbStore.batchInsert("test", valueBuckets);
      promise.then(async () => {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "lisi");
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      }).catch((err: BusinessError) => {
        console.error(`testRdbStoreBatchInsertError0022:Insert is failed, code is ${err.code},message is ${err.message}`);
        expect(!err).assertFail();
        done();
      });
      console.info(TAG + "************* testRdbStoreBatchInsertError0022 end *************");
    });

  });
}
