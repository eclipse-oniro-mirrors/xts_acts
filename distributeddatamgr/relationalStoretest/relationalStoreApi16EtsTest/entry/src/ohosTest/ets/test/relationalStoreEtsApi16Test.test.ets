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
import { relationalStore } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'


const TAG = "[ttt]"
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbTest.db",
  securityLevel: relationalStore.SecurityLevel.S3
};
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS test  (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL, age INTEGER, salary REAL, blobType BLOB)";

let rdbStore: relationalStore.RdbStore | undefined | null ;


export default function relationalStoreBatchInsertTest() {
  describe('relationalStoreBatchInsertTest', () => {

    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach')
      try {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG)
        console.info(TAG + 'Get RdbStore successfully.');
        await (rdbStore as relationalStore.RdbStore).executeSql(CREATE_TABLE_TEST);
      } catch (err) {
        console.error(TAG + `Get RdbStore failed, code is ${err.code},message is ${err.message}`);
      }
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach')
      rdbStore = undefined;
      await relationalStore.deleteRdbStore(context, "RdbTest.db");
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll')
    })


    /**
     * @tc.name testRdbStoreBatchInsertWithConflictResolution0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_0100
     * @tc.desc RelationalStore normal batch insert with conflict resolution test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */

    it('testRdbStoreBatchInsertWithConflictResolution0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0100 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution001 batch num1 " + num)
        expect(2).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution001 result count " + resultSet.rowCount)
        expect(2).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail()
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0100 end *************");
    })


    /**
     * @tc.name testRdbStoreBatchInsertWithConflictResolution0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_0200
     * @tc.desc RelationalStore normal batch insert with conflict resolution test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */

    it('testRdbStoreBatchInsertWithConflictResolution0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0200 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0200 batch num1 " + num);
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0200 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail();
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0200 end *************");
    })


    /**
     * @tc.name testRdbStoreBatchInsertWithConflictResolution0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_0300
     * @tc.desc RelationalStore normal batch insert with conflict resolution test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolution0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0300 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0300 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0300 result count " + resultSet.rowCount)
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail()
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0300 end *************");
    })


    /**
     * @tc.name testRdbStoreBatchInsertWithConflictResolution0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_0400
     * @tc.desc RelationalStore normal batch insert with conflict resolution test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */


    it('testRdbStoreBatchInsertWithConflictResolution0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0400 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0400 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0400 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail()
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0400 end *************");
    })


    /**
     * @tc.name testRdbStoreBatchInsertWithConflictResolution0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_0500
     * @tc.desc RelationalStore normal batch insert with conflict resolution test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolution0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0500 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0500 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0500 result count " + resultSet.rowCount)
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail()
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0500 end *************");
    })


    /**
     * @tc.name testRdbStoreBatchInsertWithConflictResolution0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_0600
     * @tc.desc RelationalStore normal batch insert with conflict resolution test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolution0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0600 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0600 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0600 result count " + resultSet.rowCount)
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail()
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0600 end *************");
    })


    /**
     * @tc.name testRdbStoreBatchInsertWithConflictResolution0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_0700
     * @tc.desc RelationalStore batch insert with conflict resolution with invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolution0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0700 start *************");
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
        };
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray, undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + "testRdbStoreBatchInsertWithConflictResolution0700 with 3 args: " + e.code);
        expect(String(e.code)).assertEqual(String(401));
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0700 end *************");
    })


    /**
     * @tc.name testRdbStoreBatchInsertWithConflictResolution0800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_0800
     * @tc.desc RelationalStore batch insert with conflict resolution with invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolution0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0800 start *************");
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
        };
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution(null, valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + "testRdbStoreBatchInsertWithConflictResolution0800 with 1 args: " + e.code);
        expect(String(e.code)).assertEqual(String(401));
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0800 end *************");
    })


    /**
     * @tc.name testRdbStoreBatchInsertWithConflictResolution0900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_0900
     * @tc.desc RelationalStore batch insert with conflict resolution with invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolution0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "********* testRdbStoreBatchInsertWithConflictResolution0900 start **********");
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
        };
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", undefined,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + "testRdbStoreBatchInsertWithConflictResolution0900 with 2 args: " + e.code);
        expect(String(e.code)).assertEqual(String(401));
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0900 end *************");
    })


    /**
     * @tc.name testRdbStoreBatchInsertWithConflictResolution1000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_1000
     * @tc.desc RelationalStore batch insert with conflict resolution with over limit rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolution1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "******* testRdbStoreBatchInsertWithConflictResolution1000 start *******");
      let u8 = new Uint8Array([1, 2, 3]);
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        let rows = 32768 / 4 + 1;
        for (let i = 0; i < rows; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution1000 failed num " + num);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + " code: " + e.code);
        expect(14800000).assertEqual(e.code);
        done();
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution1000 success");
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution1000 end *************");
    })


    /**
     * @tc.name testRdbStoreBatchInsertWithConflictResolution1100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_1100
     * @tc.desc RelationalStore batch insert with conflict resolution with over limit rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */



    it('testRdbStoreBatchInsertWithConflictResolution1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution1100 start *************");
      let transaction = await (rdbStore as relationalStore.RdbStore).createTransaction({
        transactionType: relationalStore.TransactionType.IMMEDIATE
      });
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
        };
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        await transaction.rollback();
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + " code: " + e.code);
        expect(14800024).assertEqual(e.code);
        done();
        try {
          await transaction.rollback();
        } catch (e) {
          console.log(TAG + e + " rollback code: " + e.code);
          expect(null).assertFail();
          done();
        }
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution1100 end *************");
    })

  })
}