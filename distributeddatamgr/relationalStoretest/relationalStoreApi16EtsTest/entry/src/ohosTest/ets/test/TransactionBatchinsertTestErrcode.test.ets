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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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

export default function TransactionBatchinsertTestErrcode() {
  describe('TransactionBatchinsertTestErrcode', () => {
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
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');

    });

    /**
     * @tc.name transaction.batchInsertWithConflictResolution errcode is 14800014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_4000
     * @tc.desc transaction.batchInsertWithConflictResolution errcode is 14800014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testTransactionBatchInsertWithConflictResolutionErrcode0100', 0, async (done:Function) => {
      console.log(TAG + "************* testTransactionBatchInsertWithConflictResolutionErrcode0100 start *************");
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
        await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect(null).assertFail()
        done();
      } catch (err) {
        console.log(TAG + err + err.code);
        expect(err.code == 14800014).assertTrue()
        done();
      }
      console.log(TAG + "************* testTransactionBatchInsertWithConflictResolutionErrcode0100 end *************");
    })


    /**
     * @tc.name transaction.batchInsertWithConflictResolution errcode is 14800027
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_4100
     * @tc.desc transaction.batchInsertWithConflictResolution errcode is 14800027
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testTransactionBatchInsertWithConflictResolutionErrcode0200', 0, async (done: Function) => {
      console.log(TAG + "************* testTransactionBatchInsertWithConflictResolutionErrcode0200 start *************");
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
      console.log(TAG + "testTransactionBatchInsertWithConflictResolutionErrcode0200 end");
    })
    /**
     * @tc.name transaction.batchInsertWithConflictResolution errcode is 14800021
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_4200
     * @tc.desc transaction.batchInsertWithConflictResolution errcode is 14800021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testTransactionBatchInsertWithConflictResolutionErrcode0300', 0, async (done: Function) => {
      console.log(TAG + "************* testTransactionBatchInsertWithConflictResolutionErrcode0300 start *************");
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
         await transaction.batchInsertWithConflictResolution("test1", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect(null).assertFail()
        console.log(TAG +"testTransactionBatchInsertWithConflictResolutionErrcode0300 error");
        done();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code == 14800021).assertTrue()
        done();
      }
      console.log(TAG + "testTransactionBatchInsertWithConflictResolutionErrcode0300 end");
    })

    /**
     * @tc.name transaction.batchInsertWithConflictResolution errcode is 14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_4300
     * @tc.desc transaction.batchInsertWithConflictResolution errcode is 14800033
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testTransactionBatchInsertWithConflictResolutionErrcode0400', 0, async (done: Function) => {
      console.log(TAG + "************* testTransactionBatchInsertWithConflictResolutionErrcode0400 start *************");
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
       await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG +"testTransactionBatchInsertWithConflictResolutionErrcode0400 error");
        expect(null).assertFail()
        done();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        expect(err.code == 14800033).assertTrue()
        done();
      }
      console.log(TAG + "testTransactionBatchInsertWithConflictResolutionErrcode0400 end");
    })

    /**
     * @tc.name transaction.batchInsertWithConflictResolution errcode is 14800047
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_4400
     * @tc.desc transaction.batchInsertWithConflictResolution errcode is 14800047
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testTransactionBatchInsertWithConflictResolutionErrcode0500', 0, async (done: Function) => {
      console.log(TAG + "************* testTransactionBatchInsertWithConflictResolutionErrcode0500 start *************");
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
      console.log(TAG + "testTransactionBatchInsertWithConflictResolutionErrcode0500 end");
    })
  })
}
