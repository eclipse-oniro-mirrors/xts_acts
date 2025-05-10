/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import data_relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'

const TAG = "[RELATIONAL_STORE_TRANSACTION_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG:data_relationalStore.StoreConfig = {
  name: "TransactionTest.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let rdbStore: data_relationalStore.RdbStore | undefined | null ;

export default function relationalStoreBatchinsertTransactionTest() {
  describe('relationalStoreBatchinsertTransactionTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
    });
    beforeEach(async () => {
      await (rdbStore as data_relationalStore.RdbStore).executeSql(CREATE_TABLE_TEST);
      console.info(TAG + 'beforeEach');
    });
    afterEach(async () => {
      await (rdbStore as data_relationalStore.RdbStore).executeSql("DELETE FROM test");
      console.info(TAG + 'afterEach');
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      rdbStore = null;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
    });

    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_0100
     * @tc.desc RelationalStore InsertWithConflictResolution  with ON_CONFLICT_NONE test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0100 batch num1 " + num);
        expect(2).assertEqual(num);
        let resultSet = await transaction.querySql("select * from test")
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0100 result count " + resultSet.rowCount)
        expect(2).assertEqual(resultSet.rowCount);
        resultSet.close();
        await transaction.commit();
        done();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction.rollback()
        expect(null).assertFail()
        done();
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0100 failed");
      }
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_0200
     * @tc.desc RelationalStore InsertWithConflictResolution  with ON_CONFLICT_ROLLBACK test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0200 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0200 batch num1 " + num);
        expect(2).assertEqual(num);
        let resultSet = await transaction.querySql("select * from test")
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0200 result count " + resultSet.rowCount)
        expect(2).assertEqual(resultSet.rowCount);
        resultSet.close();
        await transaction.commit();
        done();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction.rollback()
        expect(null).assertFail()
        done();
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0100 failed");
      }
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_0300
     * @tc.desc RelationalStore InsertWithConflictResolution  with ON_CONFLICT_ROLLBACK test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0300 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0300 batch num1 " + num);
        expect(2).assertEqual(num);
        let resultSet = await transaction.querySql("select * from test")
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0300 result count " + resultSet.rowCount)
        expect(2).assertEqual(resultSet.rowCount);
        resultSet.close();
        await transaction.commit();
        done();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction.rollback()
        expect(null).assertFail()
        done();
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0300 failed");
      }
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_0400
     * @tc.desc RelationalStore InsertWithConflictResolution  with ON_CONFLICT_FAIL test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0300 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0400 batch num1 " + num);
        expect(2).assertEqual(num);
        let resultSet = await transaction.querySql("select * from test")
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0400 result count " + resultSet.rowCount)
        expect(2).assertEqual(resultSet.rowCount);
        resultSet.close();
        await transaction.commit();
        done();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction.rollback()
        expect(null).assertFail()
        done();
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0400 failed");
      }
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_0500
     * @tc.desc RelationalStore InsertWithConflictResolution  with ON_CONFLICT_IGNORE test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0500 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0500 batch num1 " + num);
        expect(2).assertEqual(num);
        let resultSet = await transaction.querySql("select * from test")
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0500 result count " + resultSet.rowCount)
        expect(2).assertEqual(resultSet.rowCount);
        resultSet.close();
        await transaction.commit();
        done();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction.rollback()
        expect(null).assertFail()
        done();
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0500 failed");
      }
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_0600
     * @tc.desc RelationalStore InsertWithConflictResolution  with ON_CONFLICT_REPLACE test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0500 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0500 batch num1 " + num);
        expect(2).assertEqual(num);
        let resultSet = await transaction.querySql("select * from test")
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0500 result count " + resultSet.rowCount)
        expect(2).assertEqual(resultSet.rowCount);
        resultSet.close();
        await transaction.commit();
        done();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction.rollback()
        expect(null).assertFail()
        done();
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0500 failed");
      }
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_0700
     * @tc.desc RelationalStore InsertWithConflictResolution  with SQLite: Abort due to constraint violation test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0700 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "id": 2,
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await transaction.insert("test", valueBucket);
        let valueBucketArray:data_relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 5; i++) {
          let vb:data_relationalStore.ValuesBucket = {
            "id": 2,
            "name": "zhangsan",
            "age": 19,
            "salary": 100.5,
            "blobType": u8,
          };
          vb.id = i;
          valueBucketArray.push(vb);
        }
        let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0700 failed num " + num);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.info(TAG, ` ON_CONFLICT_NONE failed, errCode:${err.code}, message:${err.message}`);
        expect(14800032).assertEqual(err.code);
        await transaction.rollback();
        done();
      }
      done();
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0700 end *************");
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction0800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_0800
     * @tc.desc InsertWithConflictResolution ON_CONFLICT_ABORT with SQLite: Abort due to constraint violation test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0800 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "id": 2,
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await transaction.insert("test", valueBucket);
        let valueBucketArray:data_relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 5; i++) {
          let vb:data_relationalStore.ValuesBucket = {
            "id": 2,
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          vb.id = i;
          valueBucketArray.push(vb);
        }
        let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0800 failed num " + num);
        expect(null).assertFail();
      } catch (err) {
        console.info(TAG, ` ON_CONFLICT_ABORT failed, errCode:${err.code}, message:${err.message}`);
        expect(14800032).assertEqual(err.code);
        await transaction.rollback();
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0800 success");
      }
      done();
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0800 end *************");
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction0900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_0900
     * @tc.desc InsertWithConflictResolution ON_CONFLICT_FAIL with SQLite: Abort due to constraint violation test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0900 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "id": 2,
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await transaction.insert("test", valueBucket);
        let valueBucketArray:data_relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 5; i++) {
          let vb:data_relationalStore.ValuesBucket = {
            "id": 2,
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          vb.id = i;
          valueBucketArray.push(vb);
        }
        let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0900 failed num " + num);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.info(TAG, ` ON_CONFLICT_FAIL failed, errCode:${err.code}, message:${err.message}`);
        expect(14800032).assertEqual(err.code);
        await transaction.rollback();
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0900 success");
        done();
      }
      done();
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0900 end *************");
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction1000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_1000
     * @tc.desc conflict insert with ON_CONFLICT_ROLLBACK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1000 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": null,
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let num = await transaction.insert("test", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction1000 fail num " + num);
        expect(null).assertFail();
      } catch (e) {
        console.log(TAG + e + " code: " + e.code);
        expect(e.code).assertEqual(14800032);
        done();
        try {
          await transaction.rollback();
          expect(null).assertFail();
          done();
        } catch (e) {
          console.log(TAG + e + " code: " + e.code);
          expect(e.code).assertEqual(14800021);
          done();
        }
      }
      done();
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1000 end *************");
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction1100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_1100
     * @tc.desc batch Insert With ConflictResolution with Invalid Args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG +
        "************* testbatchInsertWithConflictResolutionInTransaction1100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "bbb",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray:data_relationalStore.ValuesBucket[] = new Array();
        valueBucketArray.push(valueBucket);
        let num = await transaction.batchInsertWithConflictResolution(null, valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction1100 insert num " + num);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + " code: " + e.code);
        expect(String(e.code)).assertEqual(String(401));
        done();
      }
      await transaction.rollback();
      done();
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1100 end ***********");
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction1200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_1200
     * @tc.desc conflict insert with ON_CONFLICT_ROLLBACK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1200 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": null,
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray:data_relationalStore.ValuesBucket[] = new Array();
        valueBucketArray.push(valueBucket);
        let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction1200 insert num " + num);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + " code: " + e.code);
        expect(e.code).assertEqual(14800032);
        done();
        try {
          await transaction.rollback();
          expect(null).assertFail();
          done();
        } catch (e) {
          console.log(TAG + e + " code: " + e.code);
          expect(e.code).assertEqual(14800021);
          done();
        }
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction1200 success");
      }
      done();
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1200 end *************");
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction1300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_1300
     * @tc.desc conflict insert with ON_CONFLICT_ROLLBACK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1300 start *************");
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        let num = transaction.batchInsertWithConflictResolutionSync("table", undefined,
          data_relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction1300 insert num " + num);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + " code: " + e.code);
        expect(String(e.code)).assertEqual(String(401));
        done();
      }
      await transaction.rollback();
      done();
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1300 end *************");
    })


    /**
     * @tc.name testbatchInsertWithConflictResolutionInTransaction1400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertWithConflictResolutionTest_1400
     * @tc.desc conflict insert with ON_CONFLICT_ROLLBACK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testbatchInsertWithConflictResolutionInTransaction1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1400 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "aaa",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray:data_relationalStore.ValuesBucket[] = new Array();
        valueBucketArray.push(valueBucket);
        let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray, undefined);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction1400 insert num " + num);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + " code: " + e.code);
        expect(String(e.code)).assertEqual(String(401));
        done();
      }
      await transaction.rollback();
      done();
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1400 end *************");
    })

  })
}



