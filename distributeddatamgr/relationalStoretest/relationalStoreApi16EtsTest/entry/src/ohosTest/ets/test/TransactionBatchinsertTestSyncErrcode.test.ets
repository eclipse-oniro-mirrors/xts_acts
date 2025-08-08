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
  name: "TransactionTestSync.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let rdbStore: data_relationalStore.RdbStore | undefined | null ;

export default function TransactionBatchinsertTestSyncErrcode() {
  describe('TransactionBatchinsertTestSyncErrcode', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
    });
    beforeEach(async () => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await (rdbStore as data_relationalStore.RdbStore).executeSql(CREATE_TABLE_TEST);
      console.info(TAG + 'beforeEach');
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      rdbStore = null;
      await data_relationalStore.deleteRdbStore(context, "TransactionTestSync.db");
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');

    });

    /**
     * @tc.name transaction.batchInsertWithConflictResolutionSync errcode is 14800014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_4500
     * @tc.desc transaction.batchInsertWithConflictResolutionSync errcode is 14800014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testTransactionBatchInsertWithConflictResolutionSyncErrcode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testTransactionBatchInsertWithConflictResolutionSyncErrcode0100 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBucketArray:data_relationalStore.ValuesBucket[] = new Array();
      for (let i = 0; i < 2; i++) {
        valueBucketArray.push(valueBucket);
      }
      await (rdbStore as data_relationalStore.RdbStore).close();
      try{
        await transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect(null).assertFail()
        done();
      } catch (err) {
        console.log(TAG + err + err.code);
        expect(err.code == 14800014).assertTrue()
        done();
      }
      console.log(TAG + "************* testTransactionBatchInsertWithConflictResolutionSyncErrcode0100 end *************");
    })


    /**
     * @tc.name transaction.batchInsertWithConflictResolutionSync errcode is 14800027
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_4600
     * @tc.desc transaction.batchInsertWithConflictResolutionSync errcode is 14800027
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testTransactionBatchInsertWithConflictResolutionSyncErrcode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testTransactionBatchInsertWithConflictResolutionSyncErrcode0200 start *************");
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
        let num = await transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + " batch num1 " + num);
        expect(2).assertEqual(num);
        let resultSet = await transaction.querySql("select * from test")
        console.log(TAG + "result count " + resultSet.rowCount)
        expect(2).assertEqual(resultSet.rowCount);
        resultSet.close();
        await transaction.commit();
        done();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction.rollback()
        expect(err.code == 14800027).assertTrue()
        done();
      }
      console.log(TAG + "testTransactionBatchInsertWithConflictResolutionSyncErrcode0200 end");
    })

    /**
     * @tc.name transaction.batchInsertWithConflictResolutionSync errcode is 14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_4700
     * @tc.desc transaction.batchInsertWithConflictResolutionSync errcode is 14800033
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testTransactionBatchInsertWithConflictResolutionSyncErrcode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testTransactionBatchInsertWithConflictResolutionSyncErrcode0300 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "id":"abc",
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);

        }
       await transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG +"testTransactionBatchInsertWithConflictResolutionSyncErrcode0300 error");
        expect(null).assertFail()
        done();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code == 14800033).assertTrue()
        done();
      }
      console.log(TAG + "testTransactionBatchInsertWithConflictResolutionSyncErrcode0300 end");
    })

    /**
     * @tc.name transaction.batchInsertWithConflictResolutionSync errcode is 14800047
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_4800
     * @tc.desc transaction.batchInsertWithConflictResolutionSync errcode is 14800047
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testTransactionBatchInsertWithConflictResolutionSyncErrcode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testTransactionBatchInsertWithConflictResolutionSyncErrcode0400 start *************");
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
        let num = await transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + " batch num1 " + num);
        expect(2).assertEqual(num);
        let resultSet = await transaction.querySql("select * from test")
        console.log(TAG + "result count " + resultSet.rowCount)
        expect(2).assertEqual(resultSet.rowCount);
        resultSet.close();
        await transaction.commit();
        done();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction.rollback()
        expect(err.code == 14800047).assertTrue()
        done();
      }
      console.log(TAG + "testTransactionBatchInsertWithConflictResolutionSyncErrcode0400 end");
    })
  })
}
