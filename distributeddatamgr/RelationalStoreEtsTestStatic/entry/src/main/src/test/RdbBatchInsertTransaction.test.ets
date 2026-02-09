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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

const TAG = "[RdbBatchInsertTransactionTest]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "TransactionTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
let context: common.UIAbilityContext;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let rdbStore: relationalStore.RdbStore;

export default function RdbBatchInsertTransactionTest() {
  describe('RdbBatchInsertTransactionTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll start');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      console.info(TAG + 'beforeAll end');
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      await rdbStore.executeSql(CREATE_TABLE_TEST);
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await rdbStore.executeSql("DELETE FROM test");
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    });


    /**
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction0100
     * @tc.number testbatchInsertWithConflictResolutionInTransaction0100
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0100 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
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
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction0200
     * @tc.number testbatchInsertWithConflictResolutionInTransaction0200
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0200 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
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
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction0300
     * @tc.number testbatchInsertWithConflictResolutionInTransaction0300
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0300 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
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
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction0400
     * @tc.number testbatchInsertWithConflictResolutionInTransaction0400
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0300 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
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
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction0500
     * @tc.number testbatchInsertWithConflictResolutionInTransaction0500
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0500 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
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
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction0600
     * @tc.number testbatchInsertWithConflictResolutionInTransaction0600
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0500 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
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
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction0701
     * @tc.number testbatchInsertWithConflictResolutionInTransaction0701
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction0701
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0701 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "id": 2 as long,
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          await transaction.insert("test", valueBucket);
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i: long = 0; i < 5; i++) {
            let vb: relationalStore.ValuesBucket = {
              "id": 2 as long,
              "name": "zhangsan",
              "age": 19 as long,
              "salary": 100.5,
              "blobType": u8,
            };
            vb["id"] = i;
            valueBucketArray.push(vb);
          }
          let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0701 failed num " + num);
          expect(null).assertFail();
          done();
        } catch (err) {
          console.info(TAG, ` ON_CONFLICT_NONE failed, errCode:${err.code}, message:${err.message}`);
          expect(14800032).assertEqual(err.code);
          await transaction.rollback();
          done();
        }
        done();
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0701 end *************");
      })


    /**
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction0800
     * @tc.number testbatchInsertWithConflictResolutionInTransaction0800
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0800 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "id": 2 as long,
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          await transaction.insert("test", valueBucket);
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i: long = 0; i < 5; i++) {
            let vb: relationalStore.ValuesBucket = {
              "id": 2 as long,
              "name": "lisi",
              "age": 18 as long,
              "salary": 100.5,
              "blobType": u8,
            };
            vb["id"] = i;
            valueBucketArray.push(vb);
          }
          let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
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
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction0900
     * @tc.number testbatchInsertWithConflictResolutionInTransaction0900
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0900 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "id": 2 as long,
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          await transaction.insert("test", valueBucket);
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i: long = 0; i < 5; i++) {
            let vb: relationalStore.ValuesBucket = {
              "id": 2 as long,
              "name": "lisi",
              "age": 18 as long,
              "salary": 100.5,
              "blobType": u8,
            };
            vb["id"] = i;
            valueBucketArray.push(vb);
          }
          let num = await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
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
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction1000
     * @tc.number testbatchInsertWithConflictResolutionInTransaction1000
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1000 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": null,
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let num =
            await transaction.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
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
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction1201
     * @tc.number testbatchInsertWithConflictResolutionInTransaction1201
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction1201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1201 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": null,
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          valueBucketArray.push(valueBucket);
          let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction1201 insert num " + num);
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
          console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction1201 success");
        }
        done();
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1201 end *************");
      })

    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction0100
     * @tc.number testbatchInsertWithConflictResolutionSyncInTransaction0100
     * @tc.desc   testbatchInsertWithConflictResolutionSyncInTransaction0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testbatchInsertWithConflictResolutionSyncInTransaction0100 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0100 batch num1 " + num);
          expect(2).assertEqual(num);
          let resultSet = await transaction.querySql("select * from test")
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0100 result count " +
          resultSet.rowCount)
          expect(2).assertEqual(resultSet.rowCount);
          resultSet.close();
          await transaction.commit();
          done();
        } catch (err) {
          console.log(TAG + err + " code: " + err.code);
          await transaction.rollback()
          expect(null).assertFail()
          done();
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0100 failed");
        }
      })


    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction0200
     * @tc.number testbatchInsertWithConflictResolutionSyncInTransaction0200
     * @tc.desc   testbatchInsertWithConflictResolutionSyncInTransaction0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testbatchInsertWithConflictResolutionSyncInTransaction0200 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0200 batch num1 " + num);
          expect(2).assertEqual(num);
          let resultSet = await transaction.querySql("select * from test")
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0200 result count " +
          resultSet.rowCount)
          expect(2).assertEqual(resultSet.rowCount);
          resultSet.close();
          await transaction.commit();
          done();
        } catch (err) {
          console.log(TAG + err + " code: " + err.code);
          await transaction.rollback()
          expect(null).assertFail()
          done();
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0100 failed");
        }
      })


    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction0300
     * @tc.number testbatchInsertWithConflictResolutionSyncInTransaction0300
     * @tc.desc   testbatchInsertWithConflictResolutionSyncInTransaction0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testbatchInsertWithConflictResolutionSyncInTransaction0300 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0300 batch num1 " + num);
          expect(2).assertEqual(num);
          let resultSet = await transaction.querySql("select * from test")
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0300 result count " +
          resultSet.rowCount)
          expect(2).assertEqual(resultSet.rowCount);
          resultSet.close();
          await transaction.commit();
          done();
        } catch (err) {
          console.log(TAG + err + " code: " + err.code);
          await transaction.rollback()
          expect(null).assertFail()
          done();
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0300 failed");
        }
      })


    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction0400
     * @tc.number testbatchInsertWithConflictResolutionSyncInTransaction0400
     * @tc.desc   testbatchInsertWithConflictResolutionSyncInTransaction0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testbatchInsertWithConflictResolutionSyncInTransaction0300 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0400 batch num1 " + num);
          expect(2).assertEqual(num);
          let resultSet = await transaction.querySql("select * from test")
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0400 result count " +
          resultSet.rowCount)
          expect(2).assertEqual(resultSet.rowCount);
          resultSet.close();
          await transaction.commit();
          done();
        } catch (err) {
          console.log(TAG + err + " code: " + err.code);
          await transaction.rollback()
          expect(null).assertFail()
          done();
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0400 failed");
        }
      })


    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction0500
     * @tc.number testbatchInsertWithConflictResolutionSyncInTransaction0500
     * @tc.desc   testbatchInsertWithConflictResolutionSyncInTransaction0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testbatchInsertWithConflictResolutionSyncInTransaction0500 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0500 batch num1 " + num);
          expect(2).assertEqual(num);
          let resultSet = await transaction.querySql("select * from test")
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0500 result count " +
          resultSet.rowCount)
          expect(2).assertEqual(resultSet.rowCount);
          resultSet.close();
          await transaction.commit();
          done();
        } catch (err) {
          console.log(TAG + err + " code: " + err.code);
          await transaction.rollback()
          expect(null).assertFail()
          done();
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0500 failed");
        }
      })


    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction0600
     * @tc.number testbatchInsertWithConflictResolutionSyncInTransaction0600
     * @tc.desc   testbatchInsertWithConflictResolutionSyncInTransaction0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testbatchInsertWithConflictResolutionSyncInTransaction0500 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0500 batch num1 " + num);
          expect(2).assertEqual(num);
          let resultSet = await transaction.querySql("select * from test")
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0500 result count " +
          resultSet.rowCount)
          expect(2).assertEqual(resultSet.rowCount);
          resultSet.close();
          await transaction.commit();
          done();
        } catch (err) {
          console.log(TAG + err + " code: " + err.code);
          await transaction.rollback()
          expect(null).assertFail()
          done();
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0500 failed");
        }
      })


    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction0700
     * @tc.number testbatchInsertWithConflictResolutionSyncInTransaction0700
     * @tc.desc   testbatchInsertWithConflictResolutionSyncInTransaction0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testbatchInsertWithConflictResolutionSyncInTransaction0700 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "id": 2 as long,
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          await transaction.insert("test", valueBucket);
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i: long = 0; i < 5; i++) {
            let vb: relationalStore.ValuesBucket = {
              "id": 2 as long,
              "name": "zhangsan",
              "age": 19 as long,
              "salary": 100.5,
              "blobType": u8,
            };
            vb["id"] = i;
            valueBucketArray.push(vb);
          }
          let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0700 failed num " + num);
          expect(null).assertFail();
          done();
        } catch (err) {
          console.info(TAG, ` ON_CONFLICT_NONE failed, errCode:${err.code}, message:${err.message}`);
          expect(14800032).assertEqual(err.code);
          await transaction.rollback();
          done();
        }
        done();
        console.log(TAG + "************* testbatchInsertWithConflictResolutionSyncInTransaction0700 end *************");
      })


    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction0800
     * @tc.number testbatchInsertWithConflictResolutionSyncInTransaction0800
     * @tc.desc   testbatchInsertWithConflictResolutionSyncInTransaction0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testbatchInsertWithConflictResolutionSyncInTransaction0800 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "id": 2 as long,
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          await transaction.insert("test", valueBucket);
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i: long = 0; i < 5; i++) {
            let vb: relationalStore.ValuesBucket = {
              "id": 2 as long,
              "name": "lisi",
              "age": 18 as long,
              "salary": 100.5,
              "blobType": u8,
            };
            vb["id"] = i;
            valueBucketArray.push(vb);
          }
          let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0800 failed num " + num);
          expect(null).assertFail();
        } catch (err) {
          console.info(TAG, ` ON_CONFLICT_ABORT failed, errCode:${err.code}, message:${err.message}`);
          expect(14800032).assertEqual(err.code);
          await transaction.rollback();
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0800 success");
        }
        done();
        console.log(TAG + "************* testbatchInsertWithConflictResolutionSyncInTransaction0800 end *************");
      })


    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction0900
     * @tc.number testbatchInsertWithConflictResolutionSyncInTransaction0900
     * @tc.desc   testbatchInsertWithConflictResolutionSyncInTransaction0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testbatchInsertWithConflictResolutionSyncInTransaction0900 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "id": 2 as long,
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          await transaction.insert("test", valueBucket);
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i: long = 0; i < 5; i++) {
            let vb: relationalStore.ValuesBucket = {
              "id": 2 as long,
              "name": "lisi",
              "age": 18 as long,
              "salary": 100.5,
              "blobType": u8,
            };
            vb["id"] = i;
            valueBucketArray.push(vb);
          }
          let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0900 failed num " + num);
          expect(null).assertFail();
          done();
        } catch (err) {
          console.info(TAG, ` ON_CONFLICT_FAIL failed, errCode:${err.code}, message:${err.message}`);
          expect(14800032).assertEqual(err.code);
          await transaction.rollback();
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction0900 success");
          done();
        }
        done();
        console.log(TAG + "************* testbatchInsertWithConflictResolutionSyncInTransaction0900 end *************");
      })


    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction1000
     * @tc.number testbatchInsertWithConflictResolutionSyncInTransaction1000
     * @tc.desc   testbatchInsertWithConflictResolutionSyncInTransaction1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testbatchInsertWithConflictResolutionSyncInTransaction1000 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": null,
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let num =
            await transaction.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction1000 fail num " + num);
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
        console.log(TAG + "************* testbatchInsertWithConflictResolutionSyncInTransaction1000 end *************");
      })

    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction1200
     * @tc.number testbatchInsertWithConflictResolutionSyncInTransaction1200
     * @tc.desc   testbatchInsertWithConflictResolutionSyncInTransaction1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testbatchInsertWithConflictResolutionSyncInTransaction1200 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": null,
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          valueBucketArray.push(valueBucket);
          let num = transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction1200 insert num " + num);
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
          console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction1200 success");
        }
        done();
        console.log(TAG + "************* testbatchInsertWithConflictResolutionSyncInTransaction1200 end *************");
      })
  })
}



