
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
import data_relationalStore from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from "@kit.BasicServicesKit";

const TAG = "[RELATIONAL_STORE_JSKITS_MEMORY_DB_TEST]"

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const STORE_CONFIG:data_relationalStore.StoreConfig = {
  name: "MemoryDbTest.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  persist: false,
}

let rdbStore:data_relationalStore.RdbStore | undefined | null


export default function MemoryDbEtsTest() {
  describe('MemoryDbEtsTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      await (rdbStore as data_relationalStore.RdbStore).executeSql(CREATE_TABLE_TEST, null);
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await (rdbStore as data_relationalStore.RdbStore).executeSql("DROP TABLE IF EXISTS test");
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      rdbStore = null;
      await data_relationalStore.deleteRdbStore(context, "MemoryDbTest.db");
    })


    /**
     * @tc.name testMemoryDbNotSupport0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_0100
     * @tc.desc not support test case of memory db
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbNotSupport0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testMemoryDbNotSupport0001 start *************");
      let predicates = new data_relationalStore.RdbPredicates("test");
      try {
        await (rdbStore as data_relationalStore.RdbStore).cleanDirtyData("test");
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log("cleanDirtyData catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual(801);
        done();
      }
    })


    /**
     * @tc.name testMemoryDbNotSupport0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_0200
     * @tc.desc not support test case of memory db
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbNotSupport0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await (rdbStore as data_relationalStore.RdbStore).backup("memoryBackup");
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log("backup catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect(err.code).assertEqual(801);
        done();
      }
    })


    /**
     * @tc.name testMemoryDbNotSupport0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_0300
     * @tc.desc not support test case of memory db
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbNotSupport0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await (rdbStore as data_relationalStore.RdbStore).restore("memoryBackup");
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log("restore catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect(err.code).assertEqual(801);
        done();
      }
    })


    /**
     * @tc.name testMemoryDbNotSupport0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_0400
     * @tc.desc not support test case of memory db
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbNotSupport0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await (rdbStore as data_relationalStore.RdbStore).setDistributedTables(["test"]);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log("setDistributedTables catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect(err.code).assertEqual(801);
        done();
      }
    })


    /**
     * @tc.name testMemoryDbNotSupport0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_0500
     * @tc.desc not support test case of memory db
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbNotSupport0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let predicates = new data_relationalStore.RdbPredicates("test");
      try {
        await (rdbStore as data_relationalStore.RdbStore).sync(data_relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log("sync catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect(err.code).assertEqual(801);
        done();
      }
    })


    /**
     * @tc.name testMemoryDbInsert100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_0600
     * @tc.desc not support test case of memory db
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbInsert0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testMemoryDbInsert0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      }
      {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      }
      {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 20,
          "salary": 100.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      }
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      let resultSet = await (rdbStore as data_relationalStore.RdbStore).query(predicates);
      try {
        console.log(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        console.log(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" +
          blobType);
        expect(1).assertEqual(id);
        expect("zhangsan").assertEqual(name);
        expect(18).assertEqual(age);
        expect(100.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        expect(false).assertEqual(resultSet.goToNextRow());
        done();
      } catch (err) {
        console.log("insert1 error " + err.code + err.message);
        expect().assertFail();
        done();
      }
      resultSet.close();
      console.log(TAG + "************* testMemoryDbInsert0100 end *************");
    })


    /**
     * @tc.name testMemoryDbInsert0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_0700
     * @tc.desc not support test case of memory db
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbInsert0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testMemoryDbInsert0200 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      };
      try {
        let ret = await (rdbStore as data_relationalStore.RdbStore).insert("wrong", valueBucket);
        console.log(TAG + "insert wrong success: " + ret);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log("testMemoryDbInsert0200 insert wrong catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual(14800021);
        done();
      }
      console.log(TAG + "************* testMemoryDbInsert0200 end   *************");
    })


    /**
     * @tc.name testMemoryDbInsertWithConflictResolution0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_0800
     * @tc.desc Insert data with ON_CONFLICT_ROLLBACK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbInsertWithConflictResolution0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testMemoryDbInsertWithConflictResolution0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "id": 1,
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test",
          valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
      }
      {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "id": 1,
          "name": "zhangsan",
          "age": 18,
          "salary": 200.5,
          "blobType": u8,
        };
        (rdbStore as data_relationalStore.RdbStore).beginTransaction();
        const valueBucketInsert:data_relationalStore.ValuesBucket = {
          "name": "wangwu",
          "age": 30,
          "salary": 400.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucketInsert);
        try {
          await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket,
            data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          expect(null).assertFail();
        } catch (err) {
          console.log("catch err: failed, err: code=" + err.code + " message=" + err.message);
          expect(14800032).assertEqual(err.code);
        }
      }
      {
        let predicates = await new data_relationalStore.RdbPredicates("test");
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).query(predicates);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      }
      console.log(TAG + "************* testMemoryDbInsertWithConflictResolution0001 end   *************");
    })


    /**
     * @tc.name testMemoryDbBatchInsert0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_0900
     * @tc.desc Normal test case of batchInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbBatchInsert0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testMemoryDbBatchInsert0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      };
      let valueBucketArray:data_relationalStore.ValuesBucket[] = new Array();
      for (let i = 0; i < 100; i++) {
        valueBucketArray.push(valueBucket);
      }
      await (rdbStore as data_relationalStore.RdbStore).batchInsert("test", valueBucketArray);
      let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      let count = resultSet.rowCount;
      expect(100).assertEqual(count);
      resultSet.close();
      console.log(TAG + "************* testMemoryDbBatchInsert0100 end *************");
    })


    /**
     * @tc.name testMemoryDbBatchInsertWithConflictResolution0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_1000
     * @tc.desc normal batch insert with conflict resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbBatchInsertWithConflictResolution0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testMemoryDbBatchInsertWithConflictResolution0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray:data_relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "testMemoryDbBatchInsertWithConflictResolution0100 batch num1 " + num);
        expect(2).assertEqual(num);
        num = await (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "testMemoryDbBatchInsertWithConflictResolution0100 batch num2 " + num);
        expect(2).assertEqual(num);
        num = await (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "testMemoryDbBatchInsertWithConflictResolution0100 batch num3 " + num);
        expect(2).assertEqual(num);
        num = await (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testMemoryDbBatchInsertWithConflictResolution0100 batch num4 " + num);
        expect(2).assertEqual(num);
        num = await (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "testMemoryDbBatchInsertWithConflictResolution0100 batch num5 " + num);
        expect(2).assertEqual(num);
        num = await (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + "testMemoryDbBatchInsertWithConflictResolution0100 batch num6 " + num);
        expect(2).assertEqual(num);
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("select * from test");
        console.log(TAG + "testMemoryDbBatchInsertWithConflictResolution0100 result count " + resultSet.rowCount);
        expect(12).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (e) {
        console.log(TAG + e + " code: " + e.code);
        expect(null).assertFail();
        console.log(TAG + "testMemoryDbBatchInsertWithConflictResolution0100 failed");
        done();
      }
      console.log(TAG + "************* testMemoryDbBatchInsertWithConflictResolution0100 end *************");
    })


    /**
     * @tc.name testMemoryDbExecute0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_1100
     * @tc.desc Execute sql: PRAGMA user_version,Check returned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbExecute0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testMemoryDbExecute0100 start *************");
      try {
        (rdbStore as data_relationalStore.RdbStore).version = 5;
        let ret = await (rdbStore as data_relationalStore.RdbStore).execute("PRAGMA user_version");
        expect(5).assertEqual(ret);
        done();
      } catch (err) {
        expect(null).assertFail();
        console.error(`get user_version failed, code:${err.code}, message: ${err.message}`);
        done();
      }
      console.info(TAG + "************* testMemoryDbExecute0100 end   *************");
    })


    /**
     * @tc.name testMemoryDbExecute0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_1200
     * @tc.desc Execute select sql,Check returned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbExecute0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testMemoryDbExecute0200 start *************");
      try {
        await (rdbStore as data_relationalStore.RdbStore).execute("SELECT * FROM test");
        expect(null).assertFail();
        done();
      } catch (err) {
        console.error(`execute select sql failed, code:${err.code}, message: ${err.message}`);
        expect(14800021).assertEqual(err.code);
        done();
      }
      console.info(TAG + "************* testMemoryDbExecute0003 end   *************");
    })


    /**
     * @tc.name testMemoryDbExecute0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_1300
     * @tc.desc Execute select sql,Check returned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbExecute0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testMemoryDbExecute0300 start *************");
      try {
        let ret = await (rdbStore as data_relationalStore.RdbStore).execute("INSERT INTO test(name, age, salary) VALUES ('tt', 28, 50000)");
        expect(1).assertEqual(ret);
        done();
      } catch (err) {
        console.error(`execute select sql failed, code:${err.code}, message: ${err.message}`);
        expect(null).assertFail();
        done();
      }
      console.info(TAG + "************* testMemoryDbExecute0300 end   *************");
    })


    /**
     * @tc.name testMemoryDbExecute0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_1400
     * @tc.desc Execute select sql,Check returned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbExecute0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testMemoryDbExecute0400 start *************");
      try {
        let ret = await (rdbStore as data_relationalStore.RdbStore).execute("INSERT INTO test(name, age, salary) VALUES (?, ?, ?)", ['tt', 28, 50000]);

        expect(1).assertEqual(ret);
        done();
      } catch (err) {
        console.error(`execute insert sql failed, code:${err.code}, message: ${err.message}`);
        expect(null).assertFail();
        done();
      }
      console.info(TAG + "************* testMemoryDbExecute0400 end   *************");
    })


    /**
     * @tc.name testMemoryDbExecute0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_1500
     * @tc.desc Execute select sql,Check returned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbExecute0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testMemoryDbExecute0500 start *************");
      try {
        let ret = await (rdbStore as data_relationalStore.RdbStore).execute("INSERT INTO test(name, age, salary) VALUES (?, ?, ?), (?, ? ,?)",
          ['tt', 28, 50000, 'ttt', 278, 500800]);

        expect(2).assertEqual(ret);
        ret = await (rdbStore as data_relationalStore.RdbStore).execute("UPDATE test SET name='dd' WHERE id = 1");
        expect(1).assertEqual(ret);
        done();
      } catch (err) {
        console.error(`execute update sql failed, code:${err.code}, message: ${err.message}`);
        expect(null).assertFail();
        done();
      }
      console.info(TAG + "************* testMemoryDbExecute0500 end   *************");
    })


    /**
     * @tc.name testMemoryDbExecute0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_1600
     * @tc.desc Execute select sql,Check returned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbExecute0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testMemoryDbExecute0600 start *************");
      try {
        let ret = await (rdbStore as data_relationalStore.RdbStore).execute("INSERT INTO test(name, age, salary) VALUES (?, ?, ?), (?, ? ,?)",
          ['tt', 28, 50000, 'ttt', 278, 500800]);

        expect(2).assertEqual(ret);
        ret = await (rdbStore as data_relationalStore.RdbStore).execute("DELETE FROM test");
        expect(2).assertEqual(ret);
        done();
      } catch (err) {
        console.error(`execute delete sql failed, code:${err.code}, message: ${err.message}`);
        expect(null).assertFail();
        done();
      }
      console.info(TAG + "************* testMemoryDbExecute0600 end   *************");
    })


    /**
     * @tc.name testMemoryDbUpdate0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_1700
     * @tc.desc Insert data,Update data,Query data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbUpdate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testMemoryDbUpdate0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let ret = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
        expect(1).assertEqual(ret);
      } catch (err) {
        console.log(TAG + `failed, err: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
      try {
        let u8 = new Uint8Array([4, 5, 6]);
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 20,
          "salary": 200.5,
          "blobType": u8,
        };
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        let ret = await (rdbStore as data_relationalStore.RdbStore).update(valueBucket, predicates);
        await expect(1).assertEqual(ret);
        await console.log(TAG + "update done: " + ret);
        predicates = new data_relationalStore.RdbPredicates("test");
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).query(predicates);
        try {
          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));
          expect(1).assertEqual(id);
          expect("lisi").assertEqual(name);
          expect(20).assertEqual(age);
          expect(200.5).assertEqual(salary);
          expect(4).assertEqual(blobType[0]);
          expect(5).assertEqual(blobType[1]);
          expect(6).assertEqual(blobType[2]);
          expect(false).assertEqual(resultSet.goToNextRow());
        } finally {
          resultSet.close();
        }
        done();
      } catch (err) {
        console.log(TAG + `failed, err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testMemoryDbUpdate0100 end   *************");
    })


    /**
     * @tc.name testMemoryDbUpdate0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_1800
     * @tc.desc Insert data,Update data,Query data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbUpdate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testMemoryDbUpdate0200 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "xiaoming",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      } catch (err) {
        console.log(TAG + `insert failed, err: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
      try {
        let u8 = new Uint8Array([4, 5, 6]);
        let nameStr = "abcd" + "e".repeat(2000) + "./&*$!@()";
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": nameStr,
          "age": 20,
          "salary": 200.5,
          "blobType": u8,
        };
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "xiaoming");
        let ret = await (rdbStore as data_relationalStore.RdbStore).update(valueBucket, predicates);
        await expect(1).assertEqual(ret);
        await console.log(TAG + "update done: " + ret);
        predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("age", 20);
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).query(predicates);
        try {
          expect(true).assertEqual(resultSet.goToFirstRow());
          const name = await resultSet.getString(resultSet.getColumnIndex("name"));
          await expect(nameStr).assertEqual(name);
        } finally {
          resultSet.close();
        }
        done();
      } catch (err) {
        console.log(TAG + `failed, err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testMemoryDbUpdate0200 end   *************");
    })


    /**
     * @tc.name testMemoryDbDelete0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_1900
     * @tc.desc Insert data,Execute delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testMemoryDbDelete0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      }
      {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 28,
          "salary": 100.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      }
      {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 38,
          "salary": 100.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      }
      {
        let predicates = await new data_relationalStore.RdbPredicates("test");
        let deletePromise = (rdbStore as data_relationalStore.RdbStore).delete(predicates);
        deletePromise.then(async (ret) => {
          expect(3).assertEqual(ret);
          console.log(TAG + "Delete done: " + ret);
        }).catch((err:BusinessError) => {
          expect(null).assertFail();
        });
        await deletePromise;
      }
      done();
      console.log(TAG + "************* testMemoryDbDelete0100 end *************");
    })


    /**
     * @tc.name testMemoryDbDelete0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_2000
     * @tc.desc Configure predicates ("aaa id", 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbDelete0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testMemoryDbDelete0200 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      }
      {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 28,
          "salary": 100.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      }
      {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 38,
          "salary": 100.5,
          "blobType": u8,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      }
      {
        let predicates = await new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("aaa id", 1);
        try {
          let ret = (rdbStore as data_relationalStore.RdbStore).deleteSync(predicates);
          expect(null).assertFail();
        } catch (err) {
          console.log(TAG + "delete with wrong conditions");
        }
      }
      done();
      console.log(TAG + "************* testMemoryDbDelete0200 end *************");
    })


    /**
     * @tc.name testMemoryDbPluginLibs0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_2100
     * @tc.desc Test pluginLibs are empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbPluginLibs0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testMemoryDbPluginLibs0100 start *************");
      try {
        const testPluginLibsConfig:data_relationalStore.StoreConfig = {
          name: "testPluginLibs0001.db",
          securityLevel: data_relationalStore.SecurityLevel.S1,
          persist: false,
        };
        testPluginLibsConfig.pluginLibs = ["", ""];
        await data_relationalStore.getRdbStore(context, testPluginLibsConfig);
        done()
      } catch (err) {
        console.log("testMemoryDbPluginLibs0100 getRdbStore err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testMemoryDbPluginLibs0100 end   *************");
    })


    /**
     * @tc.name testMemoryDbTokenizer0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_2200
     * @tc.desc Test pluginLibs are empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbTokenizer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testMemoryDbTokenizer0100 start *************");
      try {
        const testPluginLibsConfig:data_relationalStore.StoreConfig = {
          name: "testMemoryDbTokenizer0100.db",
          securityLevel: data_relationalStore.SecurityLevel.S1,
          persist: false,
          tokenizer: data_relationalStore.Tokenizer.ICU_TOKENIZER
        };
        await data_relationalStore.getRdbStore(context, testPluginLibsConfig);
        done();
      } catch (e) {
        console.log("testMemoryDbTokenizer0100 getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testMemoryDbTokenizer0100 end   *************");
    })


    /**
     * @tc.name testMemoryDbTransaction0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_2300
     * @tc.desc Normal test case of transactions, insert a row of data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbTransaction0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testMemoryDbTransaction0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction({
        transactionType: data_relationalStore.TransactionType.DEFERRED
      });
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let num = await transaction.insertSync("test", valueBucket,
          data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(1).assertEqual(num);
        const updateValueBucket:data_relationalStore.ValuesBucket = {
          "name": "update",
          "age": 28,
          "salary": 25,
          "blobType": u8,
        };
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "lisi");
        num = await transaction.updateSync(updateValueBucket, predicates);
        expect(1).assertEqual(num);
        let deletePredicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "update");
        num = await transaction.deleteSync(deletePredicates);
        expect(1).assertEqual(num);
        let resultSet = await transaction.querySqlSync("select * from test");
        console.log(TAG + "testMemoryDbTransaction0001 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
        await transaction.commit();
        done();
      } catch (e) {
        await transaction.rollback();
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testMemoryDbTransaction0100 failed");
        done();
      }
      console.log(TAG + "************* testMemoryDbTransaction0100 end *************");
    })


    /**
     * @tc.name testMemoryDbTransactionIsolation0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_2400
     * @tc.desc testTransactionIsolation. DEFERRED and EXCLUSIVE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbTransactionIsolation0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testMemoryDbTransactionIsolation0100 start *************");
      let deferredTrans = await (rdbStore as data_relationalStore.RdbStore).createTransaction({
        transactionType: data_relationalStore.TransactionType.DEFERRED
      });
      try {
        let exclusiveTrans = await (rdbStore as data_relationalStore.RdbStore).createTransaction({
          transactionType: data_relationalStore.TransactionType.IMMEDIATE
        });
        try {
          const valueBucket:data_relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
          };
          let insertRow = await exclusiveTrans.insert("test", valueBucket);
          console.log(TAG + "testMemoryDbTransactionIsolation0100 exclusiveTrans.insert row " + insertRow);
          expect(1).assertEqual(insertRow);
          let resultSet = deferredTrans.querySqlSync("select * from test where name = ?", ["lisi"]);
          console.log(TAG +
            "testMemoryDbTransactionIsolation0100 deferredTrans querySqlSync before exclusiveTrans commit count " +
          resultSet.rowCount);
          expect(-1).assertEqual(resultSet.rowCount);
          resultSet.close();
          await exclusiveTrans.commit();
          resultSet = deferredTrans.querySqlSync("select * from test where name = ?", ["lisi"]);
          console.log(TAG +
            "testMemoryDbTransactionIsolation0100 deferredTrans querySqlSync after exclusiveTrans commit count " +
          resultSet.rowCount);
          expect(1).assertEqual(resultSet.rowCount);
          resultSet = (rdbStore as data_relationalStore.RdbStore).querySqlSync("select * from test where name = ?", ["lisi"]);
          console.log(TAG +
            "testMemoryDbTransactionIsolation0100 rdbStore querySqlSync after exclusiveTrans commit count " +
          resultSet.rowCount);
          expect(1).assertEqual(resultSet.rowCount);
          resultSet.close();
        } catch (e) {
          exclusiveTrans.rollback();
          console.log(TAG + e);
          expect(null).assertFail();
          console.log(TAG + "insert failed");
        }
        await deferredTrans.commit();
        done();
      } catch (e) {
        await deferredTrans.rollback();
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testMemoryDbTransactionIsolation0100 failed");
        done();
      }
      console.log(TAG + "************* testMemoryDbTransactionIsolation0100 end *************");
    })


    /**
     * @tc.name testMemoryDbTransactionIsolation0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_2500
     * @tc.desc testTransactionIsolation. IMMEDIATE and rdbStore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbTransactionIsolation0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testMemoryDbTransactionIsolation0200 start *************");
      let immediateTrans = await (rdbStore as data_relationalStore.RdbStore).createTransaction({
        transactionType: data_relationalStore.TransactionType.IMMEDIATE
      });
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
        };
        try {
          await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.log(TAG + "testMemoryDbTransactionIsolation0200 (rdbStore as data_relationalStore.RdbStore).insert success ");
          expect(null).assertFail();
        } catch (e) {
          console.log(TAG + e);
          expect(e.code).assertEqual(14800025);
          console.log(TAG + "insert failed");
        }
        let insertRow = await immediateTrans.insert("test", valueBucket);
        console.log(TAG + "testMemoryDbTransactionIsolation0200 immediateTrans.insert row " + insertRow);
        expect(insertRow).assertEqual(1);
        await immediateTrans.commit();
        let resultSet = (rdbStore as data_relationalStore.RdbStore).querySqlSync("select * from test where name = ?", ["lisi"]);
        console.log(TAG + "testMemoryDbTransactionIsolation0200 querySqlSync count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (e) {
        await immediateTrans.rollback();
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testMemoryDbTransactionIsolation0200 failed");
        done();
      }
      console.log(TAG + "************* testMemoryDbTransactionIsolation0200 end *************");
    })


    /**
     * @tc.name testMemoryDbTransactionIsolation0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_MemoryDbEtsTest_2600
     * @tc.desc testTransactionIsolation. DEFERRED and rdbStore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testMemoryDbTransactionIsolation0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testMemoryDbTransactionIsolation0300 start *************");
      let deferredTrans = await (rdbStore as data_relationalStore.RdbStore).createTransaction({
        transactionType: data_relationalStore.TransactionType.DEFERRED
      });
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
        await deferredTrans.insert("test", valueBucket);
        let resultSet = (rdbStore as data_relationalStore.RdbStore).querySqlSync("select * from test where name = ?", ["lisi"]);
        console.log(TAG + "testMemoryDbTransactionIsolation0300 (rdbStore as data_relationalStore.RdbStore).querySqlSync count " + resultSet.rowCount);

        expect(-1).assertEqual(resultSet.rowCount);
        try {
          await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.log(TAG + "testMemoryDbTransactionIsolation0300 insert success ");
          expect(null).assertFail();
        } catch (e) {
          console.log(TAG + e);
          expect(e.code).assertEqual(14800025);
          console.log(TAG + "insert failed");
        }
        resultSet = deferredTrans.querySqlSync("select * from test where name = ?", ["lisi"]);
        console.log(TAG + "testMemoryDbTransactionIsolation0300 deferredTrans.querySqlSync count " +
        resultSet.rowCount);
        expect(2).assertEqual(resultSet.rowCount);
        await deferredTrans.commit();
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
        resultSet = (rdbStore as data_relationalStore.RdbStore).querySqlSync("select * from test where name = ?", ["lisi"]);
        console.log(TAG + "testMemoryDbTransactionIsolation0300 querySqlSync after deferredTrans commit count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (e) {
        await deferredTrans.rollback();
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testMemoryDbTransactionIsolation0300 failed");
        done();
      }
      console.log(TAG + "************* testMemoryDbTransactionIsolation0300 end *************");
    })

  })
}