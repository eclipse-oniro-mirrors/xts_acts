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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import relationalStore from "@ohos.data.relationalStore"
import taskpool from '@ohos.taskpool';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "[RELATIONAL_STORE_JS_KITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "TransactionInsertTest.db",
  securityLevel: relationalStore.SecurityLevel.S3,
}



let options:relationalStore.TransactionOptions = {
  transactionType:relationalStore.TransactionType.DEFERRED
}

let options2:relationalStore.TransactionOptions = {
  transactionType:relationalStore.TransactionType.IMMEDIATE
}


let options3:relationalStore.TransactionOptions = {
  transactionType:relationalStore.TransactionType.EXCLUSIVE
}


let rdbStore: relationalStore.RdbStore;

@Concurrent
async function insertInThread(
  context: Context,
  options:relationalStore.TransactionOptions,
  insertCount = 1
) {
  const TAG = "[RELATIONAL_STORE_JS_KITS_TEST]"
  let rdbTrans: relationalStore.Transaction | undefined;
  try {
    const STORE_CONFIG: relationalStore.StoreConfig = {
      name: "TransactionInsertTest.db",
      securityLevel: relationalStore.SecurityLevel.S3,
    }

    console.log(TAG + 'insertInThread before getRdbStore');
    const rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
    console.log(TAG + 'insertInThread after getRdbStore');
    rdbTrans = await rdbStore.createTransaction();
    console.log(TAG + 'insertInThread after createTrans');

    const u8 = new Uint8Array([1, 2, 3]);
    const valueBuckets = new Array(insertCount).fill(0).map<relationalStore.ValuesBucket>(() => {
      return {
        "name": "lisi",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      };
    });
    const resultCount = await rdbTrans.batchInsert("test", valueBuckets);
    await rdbTrans.commit();
    console.log(TAG + 'insertInThread after commit');
    return resultCount;
  } catch (err) {
    if (rdbTrans) {
      rdbTrans.rollback();
    }
    console.error(TAG + "************* testRdbTransInsert error thread insert *************");
    console.error(TAG + JSON.stringify(err));
    return (err as BusinessError).code;
  }
}

@Concurrent
async function queryInThread(
  context: Context,
  options:relationalStore.TransactionOptions,
  querySql: string,
) {
  const TAG = "[RELATIONAL_STORE_JS_KITS_TEST]"
  let rdbTrans: relationalStore.Transaction | undefined;
  try {
    const STORE_CONFIG: relationalStore.StoreConfig = {
      name: "TransactionInsertTest.db",
      securityLevel: relationalStore.SecurityLevel.S3,
    }

    const rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
    rdbTrans = await rdbStore.createTransaction(options);

    const resultSet = await rdbTrans.querySql(querySql);
    const rowCount = resultSet.rowCount;

    await rdbTrans.commit();
    return rowCount;
  } catch (err) {
    if (rdbTrans) {
      rdbTrans.rollback();
    }
    console.error(TAG + "************* testRdbTransInsert error thread insert *************");
    console.error(TAG + JSON.stringify(err));
    return (err as BusinessError).code;
  }
}

export default function relationalStoreMultiTransTest() {
  describe('relationalStoreMultiTransTest', () => {

    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      return rdbStore.executeSql(CREATE_TABLE_TEST, null);
    })
    beforeEach(() => {
      console.info(TAG + 'beforeEach')
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach')
      await rdbStore.executeSql("DELETE FROM test");
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      await relationalStore.deleteRdbStore(context, "TransactionInsertTest.db");
    })






    /**
     * @tc.name   testRdbTransInsert0100
     * @tc.number testRdbTransInsert0100
     * @tc.desc   testRdbTransInsert0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsert0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0100 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0100 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0100 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransInsert0200
     * @tc.number testRdbTransInsert0200
     * @tc.desc   testRdbTransInsert0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsert0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0200 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0200 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0200 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransInsert0300
     * @tc.number testRdbTransInsert0300
     * @tc.desc   testRdbTransInsert0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsert0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0300 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0300 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0300 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransInsert0400
     * @tc.number testRdbTransInsert0400
     * @tc.desc   testRdbTransInsert0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsert0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0400 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0400 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0400 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransInsert0500
     * @tc.number testRdbTransInsert0500
     * @tc.desc   testRdbTransInsert0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsert0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0500 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0500 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0500 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransInsert0600
     * @tc.number testRdbTransInsert0600
     * @tc.desc   testRdbTransInsert0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsert0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0600 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0600 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0600 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransInsertSync0100
     * @tc.number testRdbTransInsertSync0100
     * @tc.desc   testRdbTransInsertSync0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsertSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0100 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0100 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0100 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransInsertSync0200
     * @tc.number testRdbTransInsertSync0200
     * @tc.desc   testRdbTransInsertSync0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsertSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0200 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0200 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0200 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransInsertSync0300
     * @tc.number testRdbTransInsertSync0300
     * @tc.desc   testRdbTransInsertSync0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsertSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0300 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0300 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0300 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransInsertSync0400
     * @tc.number testRdbTransInsertSync0400
     * @tc.desc   testRdbTransInsertSync0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsertSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0400 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0400 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0400 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransInsertSync0500
     * @tc.number testRdbTransInsertSync0500
     * @tc.desc   testRdbTransInsertSync0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsertSync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0500 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0500 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0500 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransInsertSync0600
     * @tc.number testRdbTransInsertSync0600
     * @tc.desc   testRdbTransInsertSync0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransInsertSync0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0600 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0600 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0600 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransBatchInsert0100
     * @tc.number testRdbTransBatchInsert0100
     * @tc.desc   testRdbTransBatchInsert0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsert0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0100 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0100 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0100 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransBatchInsert0200
     * @tc.number testRdbTransBatchInsert0200
     * @tc.desc   testRdbTransBatchInsert0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsert0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0200 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0200 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0200 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransBatchInsert0300
     * @tc.number testRdbTransBatchInsert0300
     * @tc.desc   testRdbTransBatchInsert0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsert0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0300 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0300 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0300 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransBatchInsert0400
     * @tc.number testRdbTransBatchInsert0400
     * @tc.desc   testRdbTransBatchInsert0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsert0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0400 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0400 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0400 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransBatchInsert0500
     * @tc.number testRdbTransBatchInsert0500
     * @tc.desc   testRdbTransBatchInsert0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsert0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0500 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0500 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0500 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransBatchInsert0600
     * @tc.number testRdbTransBatchInsert0600
     * @tc.desc   testRdbTransBatchInsert0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsert0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0600 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0600 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0600 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransBatchInsertSync0100
     * @tc.number testRdbTransBatchInsertSync0100
     * @tc.desc   testRdbTransBatchInsertSync0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsertSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0100 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0100 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0100 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransBatchInsertSync0200
     * @tc.number testRdbTransBatchInsertSync0200
     * @tc.desc   testRdbTransBatchInsertSync0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsertSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0200 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0200 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0200 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransBatchInsertSync0300
     * @tc.number testRdbTransBatchInsertSync0300
     * @tc.desc   testRdbTransBatchInsertSync0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsertSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0300 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0300 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0300 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransBatchInsertSync0400
     * @tc.number testRdbTransBatchInsertSync0400
     * @tc.desc   testRdbTransBatchInsertSync0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsertSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0400 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0400 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0400 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransBatchInsertSync0500
     * @tc.number testRdbTransBatchInsertSync0500
     * @tc.desc   testRdbTransBatchInsertSync0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsertSync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0500 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0500 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0500 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransBatchInsertSync0600
     * @tc.number testRdbTransBatchInsertSync0600
     * @tc.desc   testRdbTransBatchInsertSync0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransBatchInsertSync0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0600 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0600 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0600 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransUpdate0100
     * @tc.number testRdbTransUpdate0100
     * @tc.desc   testRdbTransUpdate0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0100 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0100 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0100 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransUpdate0200
     * @tc.number testRdbTransUpdate0200
     * @tc.desc   testRdbTransUpdate0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0200 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0200 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0200 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransUpdate0300
     * @tc.number testRdbTransUpdate0300
     * @tc.desc   testRdbTransUpdate0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdate0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0300 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0300 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0300 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransUpdate0400
     * @tc.number testRdbTransUpdate0400
     * @tc.desc   testRdbTransUpdate0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdate0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0400 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0400 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0400 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransUpdate0500
     * @tc.number testRdbTransUpdate0500
     * @tc.desc   testRdbTransUpdate0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdate0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0500 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0500 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0500 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransUpdate0600
     * @tc.number testRdbTransUpdate0600
     * @tc.desc   testRdbTransUpdate0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdate0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0600 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0600 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0600 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransUpdateSync0100
     * @tc.number testRdbTransUpdateSync0100
     * @tc.desc   testRdbTransUpdateSync0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdateSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0100 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0100 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0100 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransUpdateSync0200
     * @tc.number testRdbTransUpdateSync0200
     * @tc.desc   testRdbTransUpdateSync0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdateSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0200 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0200 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0200 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransUpdateSync0300
     * @tc.number testRdbTransUpdateSync0300
     * @tc.desc   testRdbTransUpdateSync0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdateSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0300 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0300 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0300 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransUpdateSync0400
     * @tc.number testRdbTransUpdateSync0400
     * @tc.desc   testRdbTransUpdateSync0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdateSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0400 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0400 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0400 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransUpdateSync0500
     * @tc.number testRdbTransUpdateSync0500
     * @tc.desc   testRdbTransUpdateSync0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdateSync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0500 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0500 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0500 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransUpdateSync0600
     * @tc.number testRdbTransUpdateSync0600
     * @tc.desc   testRdbTransUpdateSync0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransUpdateSync0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0600 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0600 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0600 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransDelete0100
     * @tc.number testRdbTransDelete0100
     * @tc.desc   testRdbTransDelete0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = await rdbTrans.delete(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0100 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0100 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0100 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransDelete0200
     * @tc.number testRdbTransDelete0200
     * @tc.desc   testRdbTransDelete0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDelete0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = await rdbTrans.delete(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0200 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0200 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0200 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransDelete0300
     * @tc.number testRdbTransDelete0300
     * @tc.desc   testRdbTransDelete0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDelete0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = await rdbTrans.delete(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0300 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0300 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0300 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransDelete0400
     * @tc.number testRdbTransDelete0400
     * @tc.desc   testRdbTransDelete0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDelete0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.delete(updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0400 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0400 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0400 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransDelete0500
     * @tc.number testRdbTransDelete0500
     * @tc.desc   testRdbTransDelete0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDelete0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.delete(updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0500 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0500 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0500 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransDelete0600
     * @tc.number testRdbTransDelete0600
     * @tc.desc   testRdbTransDelete0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDelete0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.delete(updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0600 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0600 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0600 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransDeleteSync0100
     * @tc.number testRdbTransDeleteSync0100
     * @tc.desc   testRdbTransDeleteSync0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDeleteSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0700 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0100 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0100 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0100 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransDeleteSync0200
     * @tc.number testRdbTransDeleteSync0200
     * @tc.desc   testRdbTransDeleteSync0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDeleteSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDeleteSync0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0200 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0200 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0200 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransDeleteSync0300
     * @tc.number testRdbTransDeleteSync0300
     * @tc.desc   testRdbTransDeleteSync0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDeleteSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDeleteSync0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0300 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0300 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0300 end *************");
      done();
    })




    /**
     * @tc.name   testRdbTransDeleteSync0400
     * @tc.number testRdbTransDeleteSync0400
     * @tc.desc   testRdbTransDeleteSync0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDeleteSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDeleteSync0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0400 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0400 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0400 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDeleteSync0500
     * @tc.number testRdbTransDeleteSync0500
     * @tc.desc   testRdbTransDeleteSync0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDeleteSync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDeleteSync0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0500 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0500 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0500 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransDeleteSync0600
     * @tc.number testRdbTransDeleteSync0600
     * @tc.desc   testRdbTransDeleteSync0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDeleteSync0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDeleteSync0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0600 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0600 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0600 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransQuery0100
     * @tc.number testRdbTransQuery0100
     * @tc.desc   testRdbTransQuery0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransQuery0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbTrans.query(predicates);
        console.log(TAG + "testRdbTransQuery0100 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0100 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0100 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransQuery0200
     * @tc.number testRdbTransQuery0200
     * @tc.desc   testRdbTransQuery0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransQuery0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbTrans.query(predicates);
        console.log(TAG + "testRdbTransQuery0200 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0200 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0200 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransQuery0300
     * @tc.number testRdbTransQuery0300
     * @tc.desc   testRdbTransQuery0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransQuery0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbTrans.query(predicates);
        console.log(TAG + "testRdbTransQuery0300 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0300 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0300 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransQuery0400
     * @tc.number testRdbTransQuery0400
     * @tc.desc   testRdbTransQuery0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransQuery0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbTrans.querySync(predicates);
        console.log(TAG + "testRdbTransQuery0400 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0400 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0400 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransQuery0500
     * @tc.number testRdbTransQuery0500
     * @tc.desc   testRdbTransQuery0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransQuery0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbTrans.querySync(predicates);
        console.log(TAG + "testRdbTransQuery0500 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0500 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0500 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransQuery0600
     * @tc.number testRdbTransQuery0600
     * @tc.desc   testRdbTransQuery0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransQuery0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbTrans.querySync(predicates);
        console.log(TAG + "testRdbTransQuery0600 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0600 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0600 end *************");
      done();
    })
	
	
	
	



    /**
     * @tc.name   testRdbTransSameThreadInsert0100
     * @tc.number testRdbTransSameThreadInsert0100
     * @tc.desc   testRdbTransSameThreadInsert0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadInsert0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadInsert0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await insertInThread(context, options, 10);
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadInsert0100 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadInsert0100 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadInsert0100 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransSameThreadInsert0200
     * @tc.number testRdbTransSameThreadInsert0200
     * @tc.desc   testRdbTransSameThreadInsert0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadInsert0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadInsert0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await insertInThread(context, options, 10);
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadInsert0200 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadInsert0200 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadInsert0200 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransSameThreadInsert0300
     * @tc.number testRdbTransSameThreadInsert0300
     * @tc.desc   testRdbTransSameThreadInsert0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadInsert0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadInsert0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options3);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await insertInThread(context, options, 10);
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadInsert0300 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadInsert0300 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadInsert0300 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransSameThreadInsert0400
     * @tc.number testRdbTransSameThreadInsert0400
     * @tc.desc   testRdbTransSameThreadInsert0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadInsert0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadInsert0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        console.log(TAG + "before second trans create");
        const errCode = await insertInThread(context, options, 10);
        console.log(TAG + "after second trans create");
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        console.log(TAG + "before query predicates create");
        let predicates = new relationalStore.RdbPredicates("test");
        console.log(TAG + "after query predicates create");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadInsert0400 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadInsert0400 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadInsert0400 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransSameThreadInsert0500
     * @tc.number testRdbTransSameThreadInsert0500
     * @tc.desc   testRdbTransSameThreadInsert0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadInsert0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadInsert0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await insertInThread(context, options, 10);
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadInsert0005 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadInsert0500 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadInsert0500 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransSameThreadInsert0600
     * @tc.number testRdbTransSameThreadInsert0600
     * @tc.desc   testRdbTransSameThreadInsert0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadInsert0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadInsert0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options3);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await insertInThread(context, options, 10);
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadInsert0600 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadInsert0600 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadInsert0600 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransSameThreadInsert0700
     * @tc.number testRdbTransSameThreadInsert0700
     * @tc.desc   testRdbTransSameThreadInsert0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadInsert0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadInsert0700 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await insertInThread(context, options, 10);
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadInsert0700 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadInsert0700 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadInsert0700 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransSameThreadInsert0800
     * @tc.number testRdbTransSameThreadInsert0800
     * @tc.desc   testRdbTransSameThreadInsert0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadInsert0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadInsert0800 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await insertInThread(context, options3, 10);
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadInsert0800 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadInsert0800 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadInsert0800 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransSameThreadInsert0900
     * @tc.number testRdbTransSameThreadInsert0900
     * @tc.desc   testRdbTransSameThreadInsert0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadInsert0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadInsert0900 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options3);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await insertInThread(context, options3, 10);
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadInsert0900 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadInsert0900 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadInsert0900 end *************");
      done();
    })







    /**
     * @tc.name   testRdbTransDiffThreadInsert0100
     * @tc.number testRdbTransDiffThreadInsert0100
     * @tc.desc   testRdbTransDiffThreadInsert0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadInsert0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadInsert0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(insertInThread, context, options, 10)
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadInsert0100 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadInsert0100 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadInsert0100 end *************");
      done();
    })







    /**
     * @tc.name   testRdbTransDiffThreadInsert0200
     * @tc.number testRdbTransDiffThreadInsert0200
     * @tc.desc   testRdbTransDiffThreadInsert0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadInsert0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadInsert0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(insertInThread, context, options, 10)
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadInsert0200 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadInsert0200 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadInsert0200 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransDiffThreadInsert0300
     * @tc.number testRdbTransDiffThreadInsert0300
     * @tc.desc   testRdbTransDiffThreadInsert0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadInsert0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadInsert0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options3);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(insertInThread, context, options, 10)
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadInsert0300 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadInsert0300 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadInsert0300 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadInsert0400
     * @tc.number testRdbTransDiffThreadInsert0400
     * @tc.desc   testRdbTransDiffThreadInsert0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadInsert0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadInsert0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(insertInThread, context, options2, 10)
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadInsert0400 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadInsert0400 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadInsert0400 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadInsert0500
     * @tc.number testRdbTransDiffThreadInsert0500
     * @tc.desc   testRdbTransDiffThreadInsert0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadInsert0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadInsert0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(insertInThread, context, options2, 10)
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadInsert0500 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadInsert0500 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadInsert0500 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransDiffThreadInsert0600
     * @tc.number testRdbTransDiffThreadInsert0600
     * @tc.desc   testRdbTransDiffThreadInsert0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadInsert0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadInsert0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options3);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(insertInThread, context, options2, 10)
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadInsert0600 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadInsert0600 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadInsert0600 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadInsert0700
     * @tc.number testRdbTransDiffThreadInsert0700
     * @tc.desc   testRdbTransDiffThreadInsert0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadInsert0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadInsert0700 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(insertInThread, context, options3, 10)
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadInsert0700 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadInsert0700 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadInsert0700 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadInsert0800
     * @tc.number testRdbTransDiffThreadInsert0800
     * @tc.desc   testRdbTransDiffThreadInsert0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadInsert0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadInsert0800 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(insertInThread, context, options3, 10)
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadInsert0800 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadInsert0800 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadInsert0800 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadInsert0900
     * @tc.number testRdbTransDiffThreadInsert0900
     * @tc.desc   testRdbTransDiffThreadInsert0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadInsert0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadInsert0900 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options3);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(insertInThread, context, options3, 10)
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadInsert0900 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadInsert0900 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadInsert0900 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransSameThreadQuery0100
     * @tc.number testRdbTransSameThreadQuery0100
     * @tc.desc   testRdbTransSameThreadQuery0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadQuery0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadQuery0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const rowCount = await queryInThread(context, options, 'select * from test');
        expect(rowCount).assertEqual(0);

        await rdbTrans.commit();

        {
          const rowCount = await queryInThread(context, options, 'select * from test');
          expect(rowCount).assertEqual(10);
        }
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadQuery0100 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadQuery0100 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadQuery0100 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransSameThreadQuery0200
     * @tc.number testRdbTransSameThreadQuery0200
     * @tc.desc   testRdbTransSameThreadQuery0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadQuery0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadQuery0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const rowCount = await queryInThread(context, options, 'select * from test');
        expect(rowCount).assertEqual(0);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadQuery0200 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadQuery0200 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadQuery0200 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransSameThreadQuery0300
     * @tc.number testRdbTransSameThreadQuery0300
     * @tc.desc   testRdbTransSameThreadQuery0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadQuery0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadQuery0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })

        await rdbStore.batchInsert('test', valueBuckets);

        const rdbTrans = await rdbStore.createTransaction(options3);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const rowCount = await queryInThread(context, options, 'select * from test');
        expect(rowCount).assertEqual(10);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadQuery0300 result count " + resultSet.rowCount);
        expect(20).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadQuery0300 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadQuery0300 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransSameThreadQuery0400
     * @tc.number testRdbTransSameThreadQuery0400
     * @tc.desc   testRdbTransSameThreadQuery0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadQuery0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadQuery0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction();

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await queryInThread(context, options2, 'select * from test');
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadQuery0400 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadQuery0400 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadQuery0400 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransSameThreadQuery0500
     * @tc.number testRdbTransSameThreadQuery0500
     * @tc.desc   testRdbTransSameThreadQuery0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadQuery0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadQuery0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await queryInThread(context, options2, 'select * from test');
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadQuery0500 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadQuery0500 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadQuery0500 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransSameThreadQuery0600
     * @tc.number testRdbTransSameThreadQuery0600
     * @tc.desc   testRdbTransSameThreadQuery0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadQuery0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadQuery0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options3);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await queryInThread(context, options2, 'select * from test');
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadQuery0600 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadQuery0600 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadQuery0600 end *************");
      done();
    })





    /**
     * @tc.name   testRdbTransSameThreadQuery0700
     * @tc.number testRdbTransSameThreadQuery0700
     * @tc.desc   testRdbTransSameThreadQuery0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadQuery0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadQuery0700 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await queryInThread(context, options3, 'select * from test');
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadQuery0700 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadQuery0700 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadQuery0700 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransSameThreadQuery0800
     * @tc.number testRdbTransSameThreadQuery0800
     * @tc.desc   testRdbTransSameThreadQuery0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadQuery0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadQuery0800 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await queryInThread(context, options3, 'select * from test');
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadQuery0800 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadQuery0800 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadQuery0800 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransSameThreadQuery0900
     * @tc.number testRdbTransSameThreadQuery0900
     * @tc.desc   testRdbTransSameThreadQuery0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransSameThreadQuery0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransSameThreadQuery0900 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options3);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const errCode = await queryInThread(context, options3, 'select * from test');
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransSameThreadQuery0900 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransSameThreadQuery0900 failed");
      }

      console.log(TAG + "************* testRdbTransSameThreadQuery0900 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadQuery0100
     * @tc.number testRdbTransDiffThreadQuery0100
     * @tc.desc   testRdbTransDiffThreadQuery0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadQuery0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadQuery0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(queryInThread, context, options, 'select * from test')
        const queryCount = await taskpool.execute(task)
        expect(queryCount).assertEqual(0);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadQuery0100 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadQuery0100 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadQuery0100 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadQuery0200
     * @tc.number testRdbTransDiffThreadQuery0200
     * @tc.desc   testRdbTransDiffThreadQuery0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadQuery0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadQuery0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);
        const task = new taskpool.Task(queryInThread, context, options, 'select * from test')
        const threadInsertCount = await taskpool.execute(task)
        expect(threadInsertCount).assertEqual(0);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadQuery0200 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadQuery0200 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadQuery0200 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadQuery0300
     * @tc.number testRdbTransDiffThreadQuery0300
     * @tc.desc   testRdbTransDiffThreadQuery0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadQuery0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadQuery0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options3);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(queryInThread, context, options, 'select * from test')
        const threadInsertCount = await taskpool.execute(task)
        expect(threadInsertCount).assertEqual(0);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadQuery0300 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadQuery0300 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadQuery0300 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadQuery0400
     * @tc.number testRdbTransDiffThreadQuery0400
     * @tc.desc   testRdbTransDiffThreadQuery0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadQuery0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadQuery0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);


        const task = new taskpool.Task(queryInThread, context, options2, 'select * from test')
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadQuery0400 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadQuery0400 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadQuery0400 end *************");
      done();
    })








    /**
     * @tc.name   testRdbTransDiffThreadQuery0500
     * @tc.number testRdbTransDiffThreadQuery0500
     * @tc.desc   testRdbTransDiffThreadQuery0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadQuery0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadQuery0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(queryInThread, context, options2, 'select * from test')
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadQuery0500 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadQuery0500 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadQuery0500 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadQuery0600
     * @tc.number testRdbTransDiffThreadQuery0600
     * @tc.desc   testRdbTransDiffThreadQuery0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadQuery0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadQuery0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options3);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(queryInThread, context, options2, 'select * from test')
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadQuery0600 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadQuery0600 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadQuery0600 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadQuery0700
     * @tc.number testRdbTransDiffThreadQuery0700
     * @tc.desc   testRdbTransDiffThreadQuery0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadQuery0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadQuery0700 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(queryInThread, context, options3, 'select * from test')
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadQuery0700 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadQuery0700 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadQuery0700 end *************");
      done();
    })






    /**
     * @tc.name   testRdbTransDiffThreadQuery0800
     * @tc.number testRdbTransDiffThreadQuery0800
     * @tc.desc   testRdbTransDiffThreadQuery0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransDiffThreadQuery0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDiffThreadQuery0800 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(10).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rdbTrans = await rdbStore.createTransaction(options2);

        const insertCount = await rdbTrans.batchInsert('test', valueBuckets);
        expect(insertCount).assertEqual(10);

        const task = new taskpool.Task(queryInThread, context, options3, 'select * from test')
        const errCode = await taskpool.execute(task)
        expect(errCode).assertEqual(14800024);

        await rdbTrans.commit();

        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbStore.querySync(predicates);
        console.log(TAG + "testRdbTransDiffThreadQuery0800 result count " + resultSet.rowCount);
        expect(10).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDiffThreadQuery0800 failed");
      }

      console.log(TAG + "************* testRdbTransDiffThreadQuery0800 end *************");
      done();
    })
  })
}