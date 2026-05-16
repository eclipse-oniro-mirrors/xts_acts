/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'

const TAG = "[RELATIONAL_STORE_TRANSACTION_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "TransactionTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let rdbStore: relationalStore.RdbStore | undefined | null;

export default function relationalStoreTransactionErrTest() {
  describe('relationalStoreTransactionErrTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
    });
    beforeEach(async () => {
      await (rdbStore as relationalStore.RdbStore).executeSql(CREATE_TABLE_TEST);
      console.info(TAG + 'beforeEach');
    });
    afterEach(async () => {
      await (rdbStore as relationalStore.RdbStore).executeSql("DELETE FROM test");
      console.info(TAG + 'afterEach');
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "TransactionTest.db");
    });


    /**
         * @tc.name   testCreateTransactionErr0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CreateTransactionErrTest_0100
         * @tc.desc   testCreateTransactionErr0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it('testCreateTransactionErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testCreateTransactionErr0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      };
      try {
        let rowId = await transaction!.insert('', valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testCreateTransactionErr0100 failed");
      }
      try {
        let rowId = await transaction!.insert(null, valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testCreateTransactionErr0100 failed");
      }
      try {
        let rowId = await transaction!.insert(undefined, valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testCreateTransactionErr0100 failed");
      }
      try {
        let rowId = await transaction!.insert("test", null, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0100 failed");
      }
      try {
        let rowId = await transaction!.insert("test", undefined, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0100 failed");
      }
    })

    /**
     * @tc.name   testCreateTransactionErr0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CreateTransactionErrTest_0200
     * @tc.desc   testCreateTransactionErr0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateTransactionErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testCreateTransactionErr0200 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      };
      try {
        transaction!.insertSync('', valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "insertSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testCreateTransactionErr0200 failed");
      }
      try {
        transaction!.insertSync(null, valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "insertSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testCreateTransactionErr0200 failed");
      }
      try {
        transaction!.insertSync(undefined, valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "insertSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testCreateTransactionErr0200 failed");
      }
      try {
        transaction!.insertSync("test", null, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "insertSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0200 failed");
      }
      try {
        transaction!.insertSync("test", undefined, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "insertSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0200 failed");
      }
    })

    /**
     * @tc.name   testCreateTransactionErr0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CreateTransactionErrTest_0300
     * @tc.desc   testCreateTransactionErr0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateTransactionErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testCreateTransactionErr0300 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      };
      try {
        await transaction!.batchInsert('', [valueBucket]);
        console.log(TAG + "batchInsert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testCreateTransactionErr0300 failed");
      }
      try {
        await transaction!.batchInsert(null, [valueBucket]);
        console.log(TAG + "batchInsert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0300 failed");
      }
      try {
        await transaction!.batchInsert(undefined, [valueBucket]);
        console.log(TAG + "batchInsert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0300 failed");
      }
      try {
        await transaction!.batchInsert("test", []);
        console.log(TAG + "batchInsert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0300 failed");
      }
      try {
        await transaction!.batchInsert("test", null);
        console.log(TAG + "batchInsert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0300 failed");
      }
      try {
        await transaction!.batchInsert("test", undefined);
        console.log(TAG + "batchInsert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0300 failed");
      }
    })

    /**
     * @tc.name   testCreateTransactionErr0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CreateTransactionErrTest_0400
     * @tc.desc   testCreateTransactionErr0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateTransactionErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testCreateTransactionErr0400 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      };
      try {
        transaction!.batchInsertSync('', [valueBucket]);
        console.log(TAG + "batchInsertSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testCreateTransactionErr0400 failed");
      }
      try {
        transaction!.batchInsertSync(null, [valueBucket]);
        console.log(TAG + "batchInsertSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0400 failed");
      }
      try {
        transaction!.batchInsertSync(undefined, [valueBucket]);
        console.log(TAG + "batchInsertSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0400 failed");
      }
      try {
        transaction!.batchInsertSync("test", []);
        console.log(TAG + "batchInsertSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0400 failed");
      }
      try {
        transaction!.batchInsertSync("test", null);
        console.log(TAG + "batchInsertSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0400 failed");
      }
      try {
        transaction!.batchInsertSync("test", undefined);
        console.log(TAG + "batchInsertSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        transaction!.rollback()
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0400 failed");
      }
    })

    /**
     * @tc.name   testCreateTransactionErr0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CreateTransactionErrTest_0500
     * @tc.desc   testCreateTransactionErr0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateTransactionErr0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testCreateTransactionErr0500 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      };
      try {
        transaction!.batchInsertWithConflictResolutionSync('', [valueBucket], relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "batchInsertWithConflictResolutionSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual(14800021)
        console.log(TAG + "testCreateTransactionErr0500 failed");
      }
      try {
        transaction!.batchInsertWithConflictResolutionSync(null, [valueBucket], relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "batchInsertWithConflictResolutionSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0500 failed");
      }
      try {
        transaction!.batchInsertWithConflictResolutionSync(undefined, [valueBucket], relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "batchInsertWithConflictResolutionSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0500 failed");
      }
      try {
        transaction!.batchInsertWithConflictResolutionSync("test", [], relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "batchInsertWithConflictResolutionSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0500 failed");
      }
      try {
        transaction!.batchInsertWithConflictResolutionSync("test", null, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "batchInsertWithConflictResolutionSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0500 failed");
      }
      try {
        transaction!.batchInsertWithConflictResolutionSync("test", undefined, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + "batchInsertWithConflictResolutionSync success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        transaction!.rollback()
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0500 failed");
      }
    })

    /**
     * @tc.name   testCreateTransactionErr0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CreateTransactionErrTest_0600
     * @tc.desc   testCreateTransactionErr0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateTransactionErr0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testCreateTransactionErr0500 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      };
      try {
        await transaction!.batchInsertWithConflictResolution('', [valueBucket], relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "batchInsertWithConflictResolution success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual(14800021)
        console.log(TAG + "testCreateTransactionErr0600 failed");
      }
      try {
        await transaction!.batchInsertWithConflictResolution(null, [valueBucket], relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "batchInsertWithConflictResolution success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0600 failed");
      }
      try {
        await transaction!.batchInsertWithConflictResolution(undefined, [valueBucket], relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "batchInsertWithConflictResolution success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0600 failed");
      }
      try {
        await transaction!.batchInsertWithConflictResolution("test", [], relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "batchInsertWithConflictResolution success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0600 failed");
      }
      try {
        await transaction!.batchInsertWithConflictResolution("test", null, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "batchInsertWithConflictResolution success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0600 failed");
      }
      try {
        await transaction!.batchInsertWithConflictResolution("test", undefined, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + "batchInsertWithConflictResolution success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        transaction!.rollback()
        expect(err.code).assertEqual("401")
        console.log(TAG + "testCreateTransactionErr0600 failed");
      }
    })

    /**
         * @tc.name   testBatchInsertWithReturningErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningErrTest_0100
         * @tc.desc   Transaction testBatchInsertWithReturningErrTest001 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testBatchInsertWithReturningErrTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testBatchInsertWithReturningErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testBatchInsertWithReturningErrTest001 end createTransaction');
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1,
        "name": "zhangsan",
      }
      try {
        await transaction.batchInsertWithReturning("", [valueBucket], { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "trans batchInsertWithReturning");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `trans batchInsertWithReturning failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001)
      }
      try {
        await transaction.batchInsertWithReturning(null, [], { columns: [""] }, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "trans batchInsertWithReturning");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `trans batchInsertWithReturning failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
      }
      try {
        await transaction.batchInsertWithReturning(undefined, [valueBucket], { columns: [""] }, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "trans batchInsertWithReturning");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `trans batchInsertWithReturning failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
      }
      try {
        await transaction.batchInsertWithReturning("test", null, { columns: [""] }, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "trans batchInsertWithReturning");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `trans batchInsertWithReturning failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
      }
      try {
        await transaction.batchInsertWithReturning("test", undefined, { columns: [""] }, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "trans batchInsertWithReturning");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `trans batchInsertWithReturning failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
      }
      try {
        await transaction.batchInsertWithReturning("test", undefined, { columns: [""] }, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + "trans batchInsertWithReturning");
        expect().assertFail();
      } catch (err) {
        await transaction.rollback()
        console.error(TAG + `trans batchInsertWithReturning failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
      }
    })

    /**
       * @tc.name   testBatchInsertWithReturningErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningErrTest_0200
       * @tc.desc   Transaction testBatchInsertWithReturningErrTest002 
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
    it("testBatchInsertWithReturningErrTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testBatchInsertWithReturningErrTest002 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testBatchInsertWithReturningErrTest002 end createTransaction');
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1,
        "name": "zhangsan",
      }
      try {
        transaction.batchInsertWithReturningSync("", [valueBucket], { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "trans batchInsertWithReturningSync");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001)
      }
      try {
        transaction.batchInsertWithReturningSync(null, [], { columns: [""] }, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "trans batchInsertWithReturningSync");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
      }
      try {
        transaction.batchInsertWithReturningSync(undefined, [valueBucket], { columns: [""] }, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "trans batchInsertWithReturningSync");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
      }
      try {
        transaction.batchInsertWithReturningSync("test", null, { columns: [""] }, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "trans batchInsertWithReturningSync");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
      }
      try {
        transaction.batchInsertWithReturningSync("test", undefined, { columns: [""] }, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "trans batchInsertWithReturningSync");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
      }
      try {
        transaction.batchInsertWithReturningSync("test", undefined, { columns: [""] }, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + "trans batchInsertWithReturningSync");
        expect().assertFail();
      } catch (err) {
        await transaction.rollback()
        console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
      }
    })

    /**
         * @tc.name   testBatchInsertWithReturningSyncErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningSyncErrTest_0100
         * @tc.desc   Transaction testBatchInsertWithReturningSyncErrTest001 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testBatchInsertWithReturningSyncErrTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testBatchInsertWithReturningSyncErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testBatchInsertWithReturningSyncErrTest001 end createTransaction');
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "id": 1,
          "name": "zhangsan",
        }
        const config: relationalStore.ReturningConfig = {
          columns: ['name'],
        }
        let results = transaction.batchInsertWithReturningSync("test", [valueBucket], config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "trans batchInsertWithReturningSync" + results.changed);
        expect(results?.changed).assertEqual(1);
        console.log(TAG + "trans batchInsertWithReturningSync" + results.resultSet);
        expect(results?.resultSet).assertInstanceOf("Object");
        await transaction.commit()
      } catch (e) {
        await transaction.rollback()
        console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
    })
    /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateErrTest_0100
         * @tc.name testUpdateErrTest001
         * @tc.desc testUpdateErrTest001
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
    it('testUpdateErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testUpdateErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": "Jim",
        "age": 30,
        "salary": 2000.1
      }
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Jim");
      try {
        let rowId = await transaction.update(null, predicates, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + `update is successful, rowId = ${rowId}`);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401")
      }
      try {
        let rowId = await transaction.update(undefined, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(TAG + `update is successful, rowId = ${rowId}`);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401")
      }
      try {
        let rowId = await transaction.update(valueBucket1, null, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(TAG + `update is successful, rowId = ${rowId}`);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401")
      }
      try {
        let rowId = await transaction.update(valueBucket1, undefined, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(TAG + `update is successful, rowId = ${rowId}`);
        expect().assertFail();
      } catch (e) {
        transaction.rollback();
        console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401")
      }
      console.log(TAG + "************* testUpdateErrTest001 end   *************");
    })

    /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateErrTest_0200
         * @tc.name testUpdateErrTest002
         * @tc.desc testUpdateErrTest002
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
    it('testUpdateErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testUpdateErrTest002 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": "Jim",
        "age": 30,
        "salary": 2000.1
      }
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Jim");
      try {
        transaction.updateSync(null, predicates, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + `updateSync is successful`);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `updateSync is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401")
      }
      try {
        transaction.updateSync(undefined, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(TAG + `updateSync is successful`);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `updateSync is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401")
      }
      try {
        transaction.updateSync(valueBucket1, null, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(TAG + `updateSync is successful`);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `updateSync is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401")
      }
      try {
        transaction.updateSync(valueBucket1, undefined, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(TAG + `updateSync is successful`);
        expect().assertFail();
      } catch (e) {
        transaction.rollback();
        console.error(TAG + `updateSync is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401")
      }
      console.log(TAG + "************* testUpdateErrTest001 end   *************");
    })

    /**
         * @tc.name   testUpdateWithReturningErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateWithReturningErrTest_0100
         * @tc.desc   Transaction testUpdateWithReturningErrTest001 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testUpdateWithReturningErrTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testUpdateWithReturningErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testUpdateWithReturningErrTest001 end createTransaction');
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [""],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      try {
        let results1 = await transaction.updateWithReturning(null, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + " trans updateWithReturning" + results1.changed);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testUpdateWithReturningErrTest001 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let results1 = await transaction.updateWithReturning(undefined, predicates, { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + " trans updateWithReturning" + results1.changed);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testUpdateWithReturningErrTest001 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let results1 = await transaction.updateWithReturning(valueBucket, null, { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + " trans updateWithReturning" + results1.changed);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testUpdateWithReturningErrTest001 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let results1 = await transaction.updateWithReturning(valueBucket, undefined, { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + " trans updateWithReturning" + results1.changed);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testUpdateWithReturningErrTest001 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let results1 = await transaction.updateWithReturning(valueBucket, undefined, { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + " trans updateWithReturning" + results1.changed);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testUpdateWithReturningErrTest001 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let results1 = await transaction.updateWithReturning(valueBucket, undefined, { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + " trans updateWithReturning" + results1.changed);
        expect().assertFail();
      } catch (e) {
        await transaction.rollback()
        console.error(TAG + `trans testUpdateWithReturningErrTest001 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
       * @tc.name   testUpdateWithReturningErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateWithReturningErrTest_0200
       * @tc.desc   Transaction testUpdateWithReturningErrTest002 
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
    it("testUpdateWithReturningErrTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testUpdateWithReturningErrTest002 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testUpdateWithReturningErrTest002 end createTransaction');
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [""],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      try {
        transaction.updateWithReturningSync(null, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + " trans updateWithReturningSync");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        transaction.updateWithReturningSync(undefined, predicates, { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + " trans updateWithReturningSync");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        transaction.updateWithReturningSync(valueBucket, null, { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + " trans updateWithReturningSync");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        transaction.updateWithReturningSync(valueBucket, undefined, { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + " trans updateWithReturningSync");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        transaction.updateWithReturningSync(valueBucket, undefined, { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + " trans updateWithReturningSync");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        transaction.updateWithReturningSync(valueBucket, undefined, { columns: [] }, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + " trans updateWithReturningSync");
        expect().assertFail();
      } catch (e) {
        await transaction.rollback()
        console.error(TAG + `trans updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
         * @tc.name   testUpdateWithReturningSyncErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateWithReturningSyncErrTest_0100
         * @tc.desc   Transaction testUpdateWithReturningSyncErrTest001 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testUpdateWithReturningSyncErrTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testUpdateWithReturningSyncErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testUpdateWithReturningSyncErrTest001 end createTransaction');
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "id": 1,
          "name": "zhangsan",
        }
        const config: relationalStore.ReturningConfig = {
          columns: ['name'],
        }
        let predicates = new relationalStore.RdbPredicates("test");
        let results1 = transaction.updateWithReturningSync(valueBucket, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + " trans updateWithReturningSync" + results1.changed);
        expect(results1?.changed).assertEqual(0);
        console.log(TAG + "trans testUpdateWithReturningSyncErrTest001" + results1.resultSet);
        expect(results1?.resultSet).assertInstanceOf("Object");
        await transaction.commit()
      } catch (e) {
        await transaction.rollback()
        console.error(TAG + `trans testUpdateWithReturningSyncErrTest001 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
    })

    /**
       * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteSyncErrTest_0100
       * @tc.name testDeleteSyncErrTest001
       * @tc.desc testDeleteSyncErrTest001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
    it('testDeleteSyncErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testDeleteSyncErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      try {
        transaction.deleteSync(null);
        console.info(TAG + `deleteSync is successful`);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `deleteSync is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      try {
        transaction.deleteSync(undefined);
        console.info(TAG + `deleteSync is successful`);
        expect().assertFail();
      } catch (e) {
        transaction.rollback();
        console.error(TAG + `deleteSync is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      console.log(TAG + "************* testDeleteSyncErrTest001 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteSyncErrTest_0200
     * @tc.name testDeleteSyncErrTest002
     * @tc.desc testDeleteSyncErrTest002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeleteSyncErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testDeleteSyncErrTest002 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      try {
        await transaction.delete(null);
        console.info(TAG + `delete is successful`);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `delete is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      try {
        await transaction.delete(undefined);
        console.info(TAG + `delete is successful`);
        expect().assertFail();
      } catch (e) {
        transaction.rollback();
        console.error(TAG + `delete is failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      console.log(TAG + "************* testDeleteSyncErrTest002 end   *************");
    })

    /**
         * @tc.name   testDeleteWithReturningErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteWithReturningErrTest_0100
         * @tc.desc   Transaction testDeleteWithReturningErrTest001 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testDeleteWithReturningErrTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testDeleteWithReturningErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testUpdateWithReturningErrTest001 end createTransaction');
      try {
        const config: relationalStore.ReturningConfig = {
          columns: [''],
        }
        let predicates = new relationalStore.RdbPredicates("test");
        let results1 = await transaction.deleteWithReturning(predicates, config);
        console.log(TAG + " trans deleteWithReturning" + results1.changed);
        expect().assertFail();
      } catch (e) {
        await transaction.rollback()
        console.error(TAG + `trans testDeleteWithReturningErrTest001 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
    })

    /**
         * @tc.name   testDeleteWithReturningSyncErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteWithReturningSyncErrTest_0100
         * @tc.desc   Transaction testDeleteWithReturningSyncErrTest001 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testDeleteWithReturningSyncErrTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testDeleteWithReturningSyncErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testUpdateWithReturningSyncErrTest001 end createTransaction');
      try {
        const config: relationalStore.ReturningConfig = {
          columns: ['name'],
        }
        let predicates = new relationalStore.RdbPredicates("test");
        let results1 = transaction.deleteWithReturningSync(predicates, config);
        console.log(TAG + " trans deleteWithReturningSync" + results1.changed);
        expect(results1?.changed).assertEqual(0);
        console.log(TAG + "trans testDeleteWithReturningSyncErrTest001" + results1.resultSet);
        expect(results1?.resultSet).assertInstanceOf("Object");
        await transaction.commit()
      } catch (e) {
        await transaction.rollback()
        console.error(TAG + `trans testDeleteWithReturningSyncErrTest001 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
    })

    /**
       * @tc.name   testDeleteWithReturningSyncErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteWithReturningSyncErrTest_0200
       * @tc.desc   Transaction testDeleteWithReturningSyncErrTest002 
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
    it("testDeleteWithReturningSyncErrTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testDeleteWithReturningSyncErrTest002 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testUpdateWithReturningSyncErrTest001 end createTransaction');
      try {
        const config: relationalStore.ReturningConfig = {
          columns: [''],
        }
        let predicates = new relationalStore.RdbPredicates("test");
        let results1 = transaction.deleteWithReturningSync(predicates, config);
        console.log(TAG + " trans deleteWithReturningSync" + results1.changed);
        expect().assertFail();
      } catch (e) {
        await transaction.rollback()
        console.error(TAG + `trans testDeleteWithReturningSyncErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
    })

    /**
         * @tc.name   testQueryErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryErrTest_0100
         * @tc.desc   Transaction testQueryErrTest001 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testQueryErrTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testQueryErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testQueryErrTest001 end createTransaction');
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await transaction.query(predicates);
        console.log(TAG + " trans query success");
        console.log(TAG + "columnNames:" + resultSet.columnNames[0]);
        expect(resultSet.columnNames[0]).assertEqual("id");
        console.log(TAG + "columnCount:" + resultSet.columnCount);
        expect(resultSet.columnCount).assertEqual(5);
        console.log(TAG + "rowIndex:" + resultSet.rowIndex);
        expect(resultSet.rowIndex).assertEqual(-1);
        console.log(TAG + "isAtFirstRow:" + resultSet.isAtFirstRow);
        expect(resultSet.isAtFirstRow).assertEqual(false);
        console.log(TAG + "isAtLastRow:" + resultSet.isAtLastRow);
        expect(resultSet.isAtLastRow).assertEqual(true);
        console.log(TAG + "isEnded:" + resultSet.isEnded);
        expect(resultSet.isEnded).assertEqual(true);
        console.log(TAG + "isStarted:" + resultSet.isStarted);
        expect(resultSet.isStarted).assertEqual(false);
        console.log(TAG + "isClosed:" + resultSet.isClosed);
        expect(resultSet.isClosed).assertEqual(false);
        console.log(TAG + "rowCount:" + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close();
        await transaction.commit()
      } catch (e) {
        await transaction.rollback()
        console.error(TAG + `trans testQueryErrTest001 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
    })

    /**
       * @tc.name   testQueryErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryErrTest_0200
       * @tc.desc   Transaction testQueryErrTest002 
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
    it("testQueryErrTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testQueryErrTest002 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testQueryErrTest002 end createTransaction');
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await transaction.query(null);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testQueryErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await transaction.query(undefined);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testQueryErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await transaction.query(predicates, null);
        expect(resultSet).assertInstanceOf("Object");
      } catch (e) {
        console.error(TAG + `trans testQueryErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await transaction.query(predicates, undefined);
        expect(resultSet).assertInstanceOf("Object");
      } catch (e) {
        console.error(TAG + `trans testQueryErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await transaction.query(predicates, []);
        expect(resultSet).assertInstanceOf("Object");
        await transaction.rollback()
      } catch (e) {
        console.error(TAG + `trans testQueryErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
    })

    /**
       * @tc.name   testQueryErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryErrTest_0300
       * @tc.desc   Transaction testQueryErrTest003 
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
    it("testQueryErrTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testQueryErrTest003 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testQueryErrTest003 end createTransaction');
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = transaction.querySync(predicates);
        console.log(TAG + " trans querySync success");
        console.log(TAG + "columnNames:" + resultSet.columnNames[0]);
        expect(resultSet.columnNames[0]).assertEqual("id");
        console.log(TAG + "columnCount:" + resultSet.columnCount);
        expect(resultSet.columnCount).assertEqual(5);
        console.log(TAG + "rowIndex:" + resultSet.rowIndex);
        expect(resultSet.rowIndex).assertEqual(-1);
        console.log(TAG + "isAtFirstRow:" + resultSet.isAtFirstRow);
        expect(resultSet.isAtFirstRow).assertEqual(false);
        console.log(TAG + "isAtLastRow:" + resultSet.isAtLastRow);
        expect(resultSet.isAtLastRow).assertEqual(true);
        console.log(TAG + "isEnded:" + resultSet.isEnded);
        expect(resultSet.isEnded).assertEqual(true);
        console.log(TAG + "isStarted:" + resultSet.isStarted);
        expect(resultSet.isStarted).assertEqual(false);
        console.log(TAG + "isClosed:" + resultSet.isClosed);
        expect(resultSet.isClosed).assertEqual(false);
        console.log(TAG + "rowCount:" + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close();
        await transaction.commit()
      } catch (e) {
        await transaction.rollback()
        console.error(TAG + `trans testQueryErrTest003 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
    })

    /**
       * @tc.name   testQueryErrTest004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryErrTest_0400
       * @tc.desc   Transaction testQueryErrTest004 
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
    it("testQueryErrTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testQueryErrTest004 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testQueryErrTest004 end createTransaction');
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = transaction.querySync(null);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testQueryErrTest004 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = transaction.querySync(undefined);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testQueryErrTest004 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = transaction.querySync(predicates, null);
        expect(resultSet).assertInstanceOf("Object");
      } catch (e) {
        console.error(TAG + `trans testQueryErrTest004 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = transaction.querySync(predicates, undefined);
        expect(resultSet).assertInstanceOf("Object");
      } catch (e) {
        console.error(TAG + `trans testQueryErrTest004 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = transaction.querySync(predicates, []);
        expect(resultSet).assertInstanceOf("Object");
        await transaction.rollback()
      } catch (e) {
        console.error(TAG + `trans testQueryErrTest004 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
    })

    /**
         * @tc.name   testQuerySqlErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_QuerySqlErrTest_0100
         * @tc.desc   Transaction testQuerySqlErrTest001 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testQuerySqlErrTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testQuerySqlErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testQuerySqlErrTest001 end createTransaction');
      try {
        let resultSet = await transaction.querySql("SELECT * FROM test", []);
        console.log(TAG + " trans queryaql success");
        console.log(TAG + "columnNames:" + resultSet.columnNames[0]);
        expect(resultSet.columnNames[0]).assertEqual("id");
        console.log(TAG + "columnCount:" + resultSet.columnCount);
        expect(resultSet.columnCount).assertEqual(5);
        console.log(TAG + "rowIndex:" + resultSet.rowIndex);
        expect(resultSet.rowIndex).assertEqual(-1);
        console.log(TAG + "isAtFirstRow:" + resultSet.isAtFirstRow);
        expect(resultSet.isAtFirstRow).assertEqual(false);
        console.log(TAG + "isAtLastRow:" + resultSet.isAtLastRow);
        expect(resultSet.isAtLastRow).assertEqual(true);
        console.log(TAG + "isEnded:" + resultSet.isEnded);
        expect(resultSet.isEnded).assertEqual(true);
        console.log(TAG + "isStarted:" + resultSet.isStarted);
        expect(resultSet.isStarted).assertEqual(false);
        console.log(TAG + "isClosed:" + resultSet.isClosed);
        expect(resultSet.isClosed).assertEqual(false);
        console.log(TAG + "rowCount:" + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close();
        await transaction.commit()
      } catch (e) {
        await transaction.rollback()
        console.error(TAG + `trans testQuerySqlErrTest001 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
    })

    /**
       * @tc.name   testQuerySqlErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_QuerySqlErrTest_0200
       * @tc.desc   Transaction testQuerySqlErrTest002 
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
    it("testQuerySqlErrTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testQuerySqlErrTest002 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testQuerySqlErrTest002 end createTransaction');
      try {
        let resultSet = await transaction.querySql("");
        expect(resultSet).assertInstanceOf("Object");
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      try {
        let resultSet = await transaction.querySql(null);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      try {
        let resultSet = await transaction.querySql(undefined);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await transaction.querySql("SELECT * FROM test", []);
        expect(resultSet).assertInstanceOf("Object");
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await transaction.querySql("SELECT * FROM test", null);
        expect(resultSet).assertInstanceOf("Object");
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await transaction.querySql("SELECT * FROM test", undefined);
        expect(resultSet).assertInstanceOf("Object");
        await transaction.rollback()
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
    })

    /**
         * @tc.name   testQuerySqlErrTest003
         * @tc.number SUB_DistributedData_RelationalStore_SDK_QuerySqlErrTest_0300
         * @tc.desc   Transaction testQuerySqlErrTest003 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testQuerySqlErrTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testQuerySqlErrTest003 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testQuerySqlErrTest003 end createTransaction');
      try {
        let resultSet = transaction.querySqlSync("SELECT * FROM test", []);
        console.log(TAG + " trans querySqlSync success");
        console.log(TAG + "columnNames:" + resultSet.columnNames[0]);
        expect(resultSet.columnNames[0]).assertEqual("id");
        console.log(TAG + "columnCount:" + resultSet.columnCount);
        expect(resultSet.columnCount).assertEqual(5);
        console.log(TAG + "rowIndex:" + resultSet.rowIndex);
        expect(resultSet.rowIndex).assertEqual(-1);
        console.log(TAG + "isAtFirstRow:" + resultSet.isAtFirstRow);
        expect(resultSet.isAtFirstRow).assertEqual(false);
        console.log(TAG + "isAtLastRow:" + resultSet.isAtLastRow);
        expect(resultSet.isAtLastRow).assertEqual(true);
        console.log(TAG + "isEnded:" + resultSet.isEnded);
        expect(resultSet.isEnded).assertEqual(true);
        console.log(TAG + "isStarted:" + resultSet.isStarted);
        expect(resultSet.isStarted).assertEqual(false);
        console.log(TAG + "isClosed:" + resultSet.isClosed);
        expect(resultSet.isClosed).assertEqual(false);
        console.log(TAG + "rowCount:" + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close();
        await transaction.commit()
      } catch (e) {
        await transaction.rollback()
        console.error(TAG + `trans testQuerySqlErrTest003 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
    })

    /**
       * @tc.name   testQuerySqlErrTest004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_QuerySqlErrTest_0400
       * @tc.desc   Transaction testQuerySqlErrTest004 
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
    it("testQuerySqlErrTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testQuerySqlErrTest004 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testQuerySqlErrTest004 end createTransaction');
      try {
        let resultSet = transaction.querySqlSync("");
        expect(resultSet).assertInstanceOf("Object");
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest004 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      try {
        let resultSet = transaction.querySqlSync(null);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest004 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      try {
        let resultSet = transaction.querySqlSync(undefined);
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest004 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = transaction.querySqlSync("SELECT * FROM test", []);
        expect(resultSet).assertInstanceOf("Object");
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest004 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = transaction.querySqlSync("SELECT * FROM test", null);
        expect(resultSet).assertInstanceOf("Object");
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest004 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = transaction.querySqlSync("SELECT * FROM test", undefined);
        expect(resultSet).assertInstanceOf("Object");
        await transaction.rollback()
      } catch (e) {
        console.error(TAG + `trans testQuerySqlErrTest002 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
    })

    /**
         * @tc.name   testExecuteErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteErrTest_0100
         * @tc.desc   Transaction Execute 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testExecuteErrTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testExecuteErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testExecuteErrTest001 end createTransaction');
      try {
        let result: relationalStore.ValueType = await transaction.execute("DELETE FROM test");
        console.info(TAG + 'execute success' + JSON.stringify(result));
        expect(result).assertEqual(0);
        await transaction.rollback();
      } catch (err) {
        console.error(TAG + `testExecuteErrTest001 + ${err.code} + ${err.message}`);
        expect().assertFail();
      }
    })

    /**
         * @tc.name   testExecuteErrTest002
         * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteErrTest_0200
         * @tc.desc   Transaction Execute 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testExecuteErrTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testExecuteErrTest002 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testExecuteErrTest002 end createTransaction');
      try {
        await transaction.execute("");
        console.info(TAG + 'execute success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `testExecuteErrTest002 + ${err.code} + ${err.message}`);
        expect(err.code).assertEqual(14800000);
      }
      try {
        await transaction.execute(null);
        console.info(TAG + 'execute success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `testExecuteErrTest002 + ${err.code} + ${err.message}`);
        expect(err.code).assertEqual(14800000);
      }
      try {
        await transaction.execute(undefined);
        console.info(TAG + 'execute success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `testExecuteErrTest002 + ${err.code} + ${err.message}`);
        expect(err.code).assertEqual(14800000);
      }
      try {
        let result: relationalStore.ValueType = await transaction.execute("DELETE FROM test", []);
        console.info(TAG + 'execute success' + JSON.stringify(result));
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(TAG + `testExecuteErrTest002 + ${err.code} + ${err.message}`);
        expect().assertFail();
      }
      try {
        let result: relationalStore.ValueType = await transaction.execute("DELETE FROM test", null);
        console.info(TAG + 'execute success' + JSON.stringify(result));
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(TAG + `testExecuteErrTest002 + ${err.code} + ${err.message}`);
        expect().assertFail();
      }
      try {
        let result: relationalStore.ValueType = await transaction.execute("DELETE FROM test", undefined);
        console.info(TAG + 'execute success' + JSON.stringify(result));
        expect(result).assertEqual(0);
        await transaction.rollback();
      } catch (err) {
        console.error(TAG + `testExecuteErrTest002 + ${err.code} + ${err.message}`);
        expect().assertFail();
      }
    })

    /**
       * @tc.name   testExecuteErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteErrTest_0300
       * @tc.desc   Transaction Execute 
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
    it("testExecuteErrTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testExecuteErrTest003 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testExecuteErrTest003 end createTransaction');
      try {
        let result: relationalStore.ValueType = transaction.executeSync("DELETE FROM test");
        console.info(TAG + 'executeSync success' + JSON.stringify(result));
        expect(result).assertEqual(0);
        await transaction.rollback();
      } catch (err) {
        console.error(TAG + `testExecuteErrTest003 + ${err.code} + ${err.message}`);
        expect().assertFail();
      }
    })

    /**
         * @tc.name   testExecuteErrTest004
         * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteErrTest_0400
         * @tc.desc   Transaction Execute 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it("testExecuteErrTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.info(TAG + "************* testExecuteErrTest004 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testExecuteErrTest004 end createTransaction');
      try {
        transaction.executeSync("");
        console.info(TAG + 'executeSync success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `testExecuteErrTest004 + ${err.code} + ${err.message}`);
        expect(err.code).assertEqual(14800000);
      }
      try {
        transaction.executeSync(null);
        console.info(TAG + 'executeSync success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `testExecuteErrTest004 + ${err.code} + ${err.message}`);
        expect(err.code).assertEqual(14800000);
      }
      try {
        transaction.executeSync(undefined);
        console.info(TAG + 'executeSync success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `testExecuteErrTest004 + ${err.code} + ${err.message}`);
        expect(err.code).assertEqual(14800000);
      }
      try {
        let result: relationalStore.ValueType = transaction.executeSync("DELETE FROM test", []);
        console.info(TAG + 'executeSync success' + JSON.stringify(result));
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(TAG + `testExecuteErrTest004 + ${err.code} + ${err.message}`);
        expect().assertFail();
      }
      try {
        let result: relationalStore.ValueType = transaction.executeSync("DELETE FROM test", null);
        console.info(TAG + 'executeSync success' + JSON.stringify(result));
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(TAG + `testExecuteErrTest004 + ${err.code} + ${err.message}`);
        expect().assertFail();
      }
      try {
        let result: relationalStore.ValueType = transaction.executeSync("DELETE FROM test", undefined);
        console.info(TAG + 'executeSync success' + JSON.stringify(result));
        expect(result).assertEqual(0);
        await transaction.rollback();
      } catch (err) {
        console.error(TAG + `testExecuteErrTest004 + ${err.code} + ${err.message}`);
        expect().assertFail();
      }
    })

  })
}



