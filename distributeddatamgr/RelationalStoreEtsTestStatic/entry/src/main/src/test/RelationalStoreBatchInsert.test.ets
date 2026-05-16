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

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../hypium/index";
import relationalStore from '@ohos.data.relationalStore'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import { window } from '@kit.ArkUI';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';


const TAG = "[RdbBatchInsertWithConflictResolutionTest]"
const bucket1000: relationalStore.ValuesBucket = {};
for (let i: long = 0; i < 1001; i++) {
  bucket1000["test" + i] = i;
}
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbTest.db",
  securityLevel: relationalStore.SecurityLevel.S3
};
let context: common.UIAbilityContext;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS test  (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL, age INTEGER, salary REAL, blobType BLOB)";

let rdbStore: relationalStore.RdbStore;


export default function relationalStoreBatchInsertTest() {
  describe('relationalStoreBatchInsertTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll start');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      console.info(TAG + 'beforeAll end');
    })
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach')
      try {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG)
        console.info(TAG + 'Get RdbStore successfully.');
        await rdbStore.executeSql(CREATE_TABLE_TEST);
      } catch (err) {
        console.error(TAG + `Get RdbStore failed, code is ${err.code},message is ${err.message}`);
      }
    })
    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach')
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll')
    })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0100
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0100
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRdbStoreBatchInsertWithConflictResolution0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0100 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await rdbStore.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution001 batch num1 " + num)
          expect(2).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution001 result count " + resultSet.rowCount)
          expect(2).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolution failed" + err.code);
          expect(null).assertFail()
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0100 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0200
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0200
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRdbStoreBatchInsertWithConflictResolution0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0200 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await rdbStore.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0200 batch num1 " + num);
          expect(3).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0200 result count " + resultSet.rowCount);
          expect(3).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolution failed" + err.code);
          expect(null).assertFail();
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0200 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0300
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0300
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0300 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await rdbStore.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0300 batch num1 " + num)
          expect(3).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0300 result count " + resultSet.rowCount)
          expect(3).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolution failed" + err.code);
          expect(null).assertFail()
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0300 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0400
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0400
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0400 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await rdbStore.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0400 batch num1 " + num)
          expect(3).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0400 result count " + resultSet.rowCount);
          expect(3).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolution failed" + err.code);
          expect(null).assertFail()
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0400 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0500
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0500
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0500 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await rdbStore.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0500 batch num1 " + num)
          expect(3).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0500 result count " + resultSet.rowCount)
          expect(3).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolution failed" + err.code);
          expect(null).assertFail()
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0500 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0600
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0600
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0600 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await rdbStore.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0600 batch num1 " + num)
          expect(3).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0600 result count " + resultSet.rowCount)
          expect(3).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolution failed" + err.code);
          expect(null).assertFail()
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0600 end *************");
      })

    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution1000
     * @tc.number testRdbStoreBatchInsertWithConflictResolution1000
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "******* testRdbStoreBatchInsertWithConflictResolution1000 start *******");
        let u8 = new Uint8Array([1, 2, 3]);
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          let rows = 32768 / 4 + 1;
          for (let i = 0; i < rows; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await rdbStore.batchInsertWithConflictResolution("test", valueBucketArray,
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
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution1100
     * @tc.number testRdbStoreBatchInsertWithConflictResolution1100
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution1100 start *************");
        let transaction = await rdbStore.createTransaction({
          transactionType: relationalStore.TransactionType.IMMEDIATE
        });
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          await rdbStore.batchInsertWithConflictResolution("test", valueBucketArray,
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

    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSync0101
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionSync0101
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSync0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRdbStoreBatchInsertWithConflictResolutionSync0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0101 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = rdbStore.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync001 batch num1 " + num)
          expect(2).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync001 result count " + resultSet.rowCount)
          expect(2).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolutionSync failed" + err.code);
          expect(null).assertFail()
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0101 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSync0200
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionSync0200
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSync0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRdbStoreBatchInsertWithConflictResolutionSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0200 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = rdbStore.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync0200 batch num1 " + num);
          expect(3).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync0200 result count " + resultSet.rowCount);
          expect(3).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolutionSync failed" + err.code);
          expect(null).assertFail();
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0200 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSync0300
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionSync0300
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSync0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0300 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = rdbStore.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync0300 batch num1 " + num)
          expect(3).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync0300 result count " + resultSet.rowCount)
          expect(3).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolutionSync failed" + err.code);
          expect(null).assertFail()
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0300 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSync0400
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionSync0400
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSync0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0400 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = rdbStore.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync0400 batch num1 " + num)
          expect(3).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync0400 result count " + resultSet.rowCount);
          expect(3).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolutionSync failed" + err.code);
          expect(null).assertFail()
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0400 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSync0500
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionSync0500
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSync0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionSync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0500 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = rdbStore.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync0500 batch num1 " + num)
          expect(3).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync0500 result count " + resultSet.rowCount)
          expect(3).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolutionSync failed" + err.code);
          expect(null).assertFail()
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0500 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSync0600
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionSync0600
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSync0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionSync0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0600 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = rdbStore.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync0600 batch num1 " + num)
          expect(3).assertEqual(num);
          let resultSet = await rdbStore.querySql("select * from test")
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync0600 result count " + resultSet.rowCount)
          expect(3).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolutionSync failed" + err.code);
          expect(null).assertFail()
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync0600 end *************");
      })

    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSync1000
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionSync1000
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSync1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionSync1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "******* testRdbStoreBatchInsertWithConflictResolutionSync1000 start *******");
        let u8 = new Uint8Array([1, 2, 3]);
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          let rows = 32768 / 4 + 1;
          for (let i = 0; i < rows; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = rdbStore.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync1000 failed num " + num);
          expect(null).assertFail();
          done();
        } catch (e) {
          console.log(TAG + e + " code: " + e.code);
          expect(14800000).assertEqual(e.code);
          done();
          console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSync1000 success");
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync1000 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSync1100
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionSync1100
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSync1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionSync1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync1100 start *************");
        let transaction = await rdbStore.createTransaction({
          transactionType: relationalStore.TransactionType.IMMEDIATE
        });
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          rdbStore.batchInsertWithConflictResolutionSync("test", valueBucketArray,
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
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSync1100 end *************");
      })
  })
}