/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
let context: common.UIAbilityContext | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let rdbStore: relationalStore.RdbStore | undefined;

export default function RdbBatchInsertTransactionTest() {
  describe('RdbBatchInsertTransactionTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll start');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
      console.info(TAG + 'beforeAll end');
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await rdbStore!.executeSql("DELETE FROM test");
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
        let transaction = await rdbStore!.createTransaction();
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
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let rowId = await transaction!.insert('', valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual(14800000)
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
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let rowId = transaction.insertSync('', valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual(14800000)
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
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let rowId = await transaction!.insert('', valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual(14800000)
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
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let rowId = transaction.insertSync('', valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual(14800000)
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
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let rowId = await transaction!.insert('', valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual(14800000)
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
      console.log(TAG + "************* testCreateTransactionErr0600 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let rowId = transaction.insertSync('', valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testCreateTransactionErr0600 failed");
      }
    })

    /**
     * @tc.name   testCreateTransactionErr0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CreateTransactionErrTest_0700
     * @tc.desc   testCreateTransactionErr0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateTransactionErr0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testCreateTransactionErr0700 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let rowId = transaction.insertSync('', valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "insert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testCreateTransactionErr0700 failed");
      }
    })

    /**
     * @tc.name   testBatchInsertErr0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertErrTest_0100
     * @tc.desc   testBatchInsertErr0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchInsertErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testBatchInsertErr0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let rowId = await transaction!.batchInsert('', [valueBucket]);
        console.log(TAG + "batchInsert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testBatchInsertErr0100 failed");
      }
    })

    /**
     * @tc.name   testBatchInsertErr0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertErrTest_0200
     * @tc.desc   testBatchInsertErr0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchInsertErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testBatchInsertErr0200 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let rowId = transaction.batchInsertSync('', [valueBucket]);
        console.log(TAG + "batchInsert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual(14800000)
        console.log(TAG + "testBatchInsertErr0200 failed");
      }
    })

    /**
     * @tc.name   testBatchInsertWithConflictResolutionSyncErr0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionSyncErr_0100
     * @tc.desc   testBatchInsertWithConflictResolutionSyncErr0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchInsertWithConflictResolutionSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testBatchInsertWithConflictResolutionSyncErr0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let rowId = transaction.batchInsertWithConflictResolutionSync('', [valueBucket], relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "batchInsert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual(14800021)
        console.log(TAG + "testBatchInsertWithConflictResolutionSyncErr0100 failed");
      }
    })

    /**
     * @tc.name   testBatchInsertWithConflictResolutionSyncErr0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionSyncErr_0200
     * @tc.desc   testBatchInsertWithConflictResolutionSyncErr0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchInsertWithConflictResolutionSyncErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testBatchInsertWithConflictResolutionSyncErr0200 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.DEFERRED
      }
      let transaction = await rdbStore!.createTransaction(options);
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let rowId = await transaction!.batchInsertWithConflictResolution('', [valueBucket], relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "batchInsert success ");
        expect().assertFail();
      } catch (err) {
        console.log(TAG + err + " code: " + err.code);
        await transaction!.rollback()
        expect(err.code).assertEqual(14800021)
        console.log(TAG + "testBatchInsertWithConflictResolutionSyncErr0200 failed");
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
        try {
        const valueBucket1: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "Jim");
          let rowId: long =
            await transaction.update(valueBucket1, predicates,
              relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
          transaction.commit();
          console.info(TAG + `update is successful, rowId = ${rowId}`);
          expect(rowId).assertEqual(0);
        } catch (e) {
          transaction.rollback();
          console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
          expect().assertFail();
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
      try {
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": "Jim",
        "age": 30 as long,
        "salary": 2000.1
      }
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Jim");
        let rowId: long =
          await transaction.update(valueBucket1, predicates,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        transaction.commit();
        console.info(TAG + `update is successful, rowId = ${rowId}`);
        expect(rowId).assertEqual(0);
      } catch (e) {
        transaction.rollback();
        console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
        expect().assertFail();
      }
      console.log(TAG + "************* testUpdateErrTest002 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateErrTest_0300
     * @tc.name testUpdateErrTest003
     * @tc.desc testUpdateErrTest003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUpdateErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testUpdateErrTest003 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      try {
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": "Jim",
        "age": 30 as long,
        "salary": 2000.1
      }
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Jim");
        let rowId: long =
          await transaction.update(valueBucket1, predicates,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        transaction.commit();
        console.info(TAG + `update is successful, rowId = ${rowId}`);
        expect(rowId).assertEqual(0);
      } catch (e) {
        transaction.rollback();
        console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
        expect().assertFail();
      }
      console.log(TAG + "************* testUpdateErrTest003 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateErrTest_0400
     * @tc.name testUpdateErrTest004
     * @tc.desc testUpdateErrTest004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUpdateErrTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testUpdateErrTest004 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      try {
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": "Jim",
        "age": 30 as long,
        "salary": 2000.1
      }
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Jim");
        let rowId: long =
          await transaction.update(valueBucket1, predicates,
            relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        transaction.commit();
        console.info(TAG + `update is successful, rowId = ${rowId}`);
        expect(rowId).assertEqual(0);
      } catch (e) {
        transaction.rollback();
        console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
        expect().assertFail();
      }
      console.log(TAG + "************* testUpdateErrTest004 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateSyncErrTest_0100
     * @tc.name testUpdateSyncErrTest001
     * @tc.desc testUpdateSyncErrTest001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUpdateSyncErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      console.log(TAG + "************* testUpdateSyncErrTest001 start *************");
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      try {
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": "Jim",
        "age": 30 as long,
        "salary": 2000.1
      }
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Jim");
        let rowId = transaction.updateSync(valueBucket1, predicates,
            relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        transaction.commit();
        console.info(TAG + `update is successful, rowId = ${rowId}`);
        expect(rowId).assertEqual(0);
      } catch (e) {
        transaction.rollback();
        console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
        expect().assertFail();
      }
      console.log(TAG + "************* testUpdateSyncErrTest001 end   *************");
    })

  /**
   * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateSyncErrTest_0200
   * @tc.name testUpdateSyncErrTest002
   * @tc.desc testUpdateSyncErrTest002
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testUpdateSyncErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
    console.log(TAG + "************* testUpdateSyncErrTest002 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    try {
    const valueBucket1: relationalStore.ValuesBucket = {
      "id": "abc",
      "name": "Jim",
      "age": 30 as long,
      "salary": 2000.1
    }
    let predicates = new relationalStore.RdbPredicates("test");
    predicates.equalTo("name", "Jim");
      let rowId = transaction.updateSync(valueBucket1, predicates,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
      transaction.commit();
      console.info(TAG + `update is successful, rowId = ${rowId}`);
      expect(rowId).assertEqual(0);
    } catch (e) {
      transaction.rollback();
      console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
      expect().assertFail();
    }
    console.log(TAG + "************* testUpdateSyncErrTest002 end   *************");
  })

  /**
   * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateSyncErrTest_0300
   * @tc.name testUpdateSyncErrTest003
   * @tc.desc testUpdateSyncErrTest003
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testUpdateSyncErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
    console.log(TAG + "************* testUpdateSyncErrTest003 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    try {
    const valueBucket1: relationalStore.ValuesBucket = {
      "id": "abc",
      "name": "Jim",
      "age": 30 as long,
      "salary": 2000.1
    }
    let predicates = new relationalStore.RdbPredicates("test");
    predicates.equalTo("name", "Jim");
      let rowId = transaction.updateSync(valueBucket1, predicates,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
      transaction.commit();
      console.info(TAG + `update is successful, rowId = ${rowId}`);
      expect(rowId).assertEqual(0);
    } catch (e) {
      transaction.rollback();
      console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
      expect().assertFail();
    }
    console.log(TAG + "************* testUpdateSyncErrTest003 end   *************");
  })

  /**
   * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateSyncErrTest_0400
   * @tc.name testUpdateSyncErrTest004
   * @tc.desc testUpdateSyncErrTest004
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testUpdateSyncErrTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
    console.log(TAG + "************* testUpdateSyncErrTest004 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    try {
    const valueBucket1: relationalStore.ValuesBucket = {
      "id": "abc",
      "name": "Jim",
      "age": 30 as long,
      "salary": 2000.1
    }
    let predicates = new relationalStore.RdbPredicates("test");
    predicates.equalTo("name", "Jim");
      let rowId = transaction.updateSync(valueBucket1, predicates,
          relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
      transaction.commit();
      console.info(TAG + `update is successful, rowId = ${rowId}`);
      expect(rowId).assertEqual(0);
    } catch (e) {
      transaction.rollback();
      console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
      expect().assertFail();
    }
    console.log(TAG + "************* testUpdateSyncErrTest004 end   *************");
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
    let predicates = new relationalStore.RdbPredicates("test");
    predicates.equalTo("name", "Jim");
      let rowId = transaction.deleteSync(predicates);
      transaction.commit();
      console.info(TAG + `update is successful, rowId = ${rowId}`);
      expect(rowId).assertEqual(0);
    } catch (e) {
      transaction.rollback();
      console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
      expect().assertFail();
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
    let predicates = new relationalStore.RdbPredicates("test");
    predicates.equalTo("name", "Jim");
      let rowId = await transaction.delete(predicates);
      transaction.commit();
      console.info(TAG + `update is successful, rowId = ${rowId}`);
      expect(rowId).assertEqual(0);
    } catch (e) {
      transaction.rollback();
      console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
      expect().assertFail();
    }
    console.log(TAG + "************* testDeleteSyncErrTest002 end   *************");
  })

  /**
     * @tc.name   testExecuteErrTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteErrTest_0100
     * @tc.desc   Transaction Execute 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testExecuteErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testExecuteErrTest001 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testExecuteErrTest001 end createTransaction');
    try {
      let result =  await transaction.execute(CREATE_TABLE_TEST);
      console.info(TAG + 'execute success' + JSON.stringify(result));
      expect(result).assertEqual(null);
    } catch (err) {
      await transaction.rollback();
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
  it("testExecuteErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testExecuteErrTest002 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testExecuteErrTest002 end createTransaction');
    try {
      let result =  await transaction.execute("");
      console.info(TAG + 'execute success' + JSON.stringify(result));
      expect().assertFail();
    } catch (err) {
      await transaction.rollback();
      console.error(TAG + `testExecuteErrTest002 + ${err.code} + ${err.message}`);
      expect(err.code).assertEqual(14800000);
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
  it("testExecuteErrTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testExecuteErrTest003 start *************");
    try {
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testExecuteErrTest003 end createTransaction');
      await transaction.rollback();
      let result =  await transaction.execute("");
      console.info(TAG + 'execute success' + JSON.stringify(result));
      expect().assertFail();
    } catch (err) {
      console.error(TAG + `testExecuteErrTest003 + ${err.code} + ${err.message}`);
      expect(err.code).assertEqual(14800014);
    }
  })

  /**
     * @tc.name   testExecuteSyncErrTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteSyncErrTest_0100
     * @tc.desc   Transaction Execute 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testExecuteSyncErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testExecuteSyncErrTest001 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testExecuteSyncErrTest001 end createTransaction');
    try {
      let result = transaction.executeSync(CREATE_TABLE_TEST);
      console.info(TAG + 'executeSync success' + JSON.stringify(result));
      expect(result).assertEqual(null);
    } catch (err) {
      await transaction.rollback();
      console.error(TAG + `testExecuteSyncErrTest001 + ${err.code} + ${err.message}`);
      expect().assertFail();
    }
  })

  /**
     * @tc.name   testExecuteSyncErrTest002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteSyncErrTest_0200
     * @tc.desc   Transaction Execute 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testExecuteSyncErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testExecuteSyncErrTest002 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testExecuteSyncErrTest002 end createTransaction');
    try {
      let result = transaction.executeSync("");
      console.info(TAG + 'executeSync success' + JSON.stringify(result));
      expect().assertFail();
    } catch (err) {
      await transaction.rollback();
      console.error(TAG + `testExecuteSyncErrTest002 + ${err.code} + ${err.message}`);
      expect(err.code).assertEqual(14800000);
    }
  })

  /**
     * @tc.name   testExecuteSyncErrTest003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteSyncErrTest_0300
     * @tc.desc   Transaction Execute 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testExecuteSyncErrTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testExecuteSyncErrTest003 start *************");
    try {
      let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
      console.info(TAG + 'testExecuteSyncErrTest003 end createTransaction');
      await transaction.rollback();
      let result = transaction.executeSync("");
      console.info(TAG + 'executeSync success' + JSON.stringify(result));
      expect().assertFail();
    } catch (err) {
      console.error(TAG + `testExecuteSyncErrTest003 + ${err.code} + ${err.message}`);
      expect(err.code).assertEqual(14800014);
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
  it("testBatchInsertWithReturningErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningErrTest001 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningErrTest001 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
      }
      let results = await transaction.batchInsertWithReturning("test", [valueBucket], config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
      console.log(TAG + "trans batchInsertWithReturning" + results.changed);
      expect(results?.changed).assertEqual(1);
      console.log(TAG + "trans batchInsertWithReturning" + results.resultSet);
      expect(results?.resultSet).assertInstanceOf("Object");
      await transaction.commit()
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans batchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
      expect().assertFail();
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
  it("testBatchInsertWithReturningErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningErrTest002 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningErrTest002 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [],
      }
      let results = await transaction.batchInsertWithReturning("test", [valueBucket], config, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
      console.log(TAG + "trans batchInsertWithReturning" + results.changed);
      await transaction.commit()
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans batchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800001);
    }
  })

  /**
     * @tc.name   testBatchInsertWithReturningErrTest003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningErrTest_0300
     * @tc.desc   Transaction testBatchInsertWithReturningErrTest003 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testBatchInsertWithReturningErrTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningErrTest003 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningErrTest003 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [""],
      }
      let results = await transaction.batchInsertWithReturning("", [valueBucket], config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
      console.log(TAG + "trans batchInsertWithReturning" + results.changed);
      await transaction.commit()
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans batchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800001);
    }
  })

  /**
     * @tc.name   testBatchInsertWithReturningErrTest004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningErrTest_0400
     * @tc.desc   Transaction testBatchInsertWithReturningErrTest004 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testBatchInsertWithReturningErrTest004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningErrTest004 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningErrTest004 end createTransaction');
    try {
      const config: relationalStore.ReturningConfig = {
        columns: [""],
      }
      let results = await transaction.batchInsertWithReturning("", [], config, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
      console.log(TAG + "trans batchInsertWithReturning" + results.changed);
      await transaction.commit()
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans batchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800001);
    }
  })

  /**
     * @tc.name   testBatchInsertWithReturningErrTest005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningErrTest_0500
     * @tc.desc   Transaction testBatchInsertWithReturningErrTest005 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testBatchInsertWithReturningErrTest005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningErrTest005 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningErrTest005 end createTransaction');
    await transaction.commit()
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [""],
      }
      let results = await transaction.batchInsertWithReturning("test", [valueBucket], config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
      console.log(TAG + "trans batchInsertWithReturning" + results.changed);
      expect().assertFail();
    } catch (e) {
      console.error(TAG + `trans batchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800014);
    }
  })

  /**
     * @tc.name   testBatchInsertWithReturningErrTest006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningErrTest_0600
     * @tc.desc   Transaction testBatchInsertWithReturningErrTest006 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testBatchInsertWithReturningErrTest006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningErrTest006 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningErrTest006 end createTransaction');
    try {
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": "Jim",
        "age": 30 as long,
        "salary": 2000.1
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
      }
      let results = await transaction.batchInsertWithReturning("test", [valueBucket1], config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
      console.log(TAG + "trans batchInsertWithReturning" + results.changed);
      expect().assertFail();
      await transaction.commit()
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans batchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800033);
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
  it("testBatchInsertWithReturningSyncErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningSyncErrTest001 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningSyncErrTest001 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
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
     * @tc.name   testBatchInsertWithReturningSyncErrTest002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningSyncErrTest_0200
     * @tc.desc   Transaction testBatchInsertWithReturningSyncErrTest002 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testBatchInsertWithReturningSyncErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningSyncErrTest002 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningSyncErrTest002 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [],
      }
      let results = transaction.batchInsertWithReturningSync("test", [valueBucket], config, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
      console.log(TAG + "trans batchInsertWithReturningSync" + results.changed);
      await transaction.commit()
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800001);
    }
  })

  /**
     * @tc.name   testBatchInsertWithReturningSyncErrTest003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningSyncErrTest_0300
     * @tc.desc   Transaction testBatchInsertWithReturningSyncErrTest003 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testBatchInsertWithReturningSyncErrTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningSyncErrTest003 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningSyncErrTest003 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [""],
      }
      let results = transaction.batchInsertWithReturningSync("", [valueBucket], config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
      console.log(TAG + "trans batchInsertWithReturningSync" + results.changed);
      await transaction.commit()
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800001);
    }
  })

  /**
     * @tc.name   testBatchInsertWithReturningSyncErrTest004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningSyncErrTest_0400
     * @tc.desc   Transaction testBatchInsertWithReturningSyncErrTest004 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testBatchInsertWithReturningSyncErrTest004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningSyncErrTest004 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningSyncErrTest004 end createTransaction');
    try {
      const config: relationalStore.ReturningConfig = {
        columns: [""],
      }
      let results = transaction.batchInsertWithReturningSync("", [], config, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
      console.log(TAG + "trans batchInsertWithReturningSync" + results.changed);
      await transaction.commit()
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800001);
    }
  })

  /**
     * @tc.name   testBatchInsertWithReturningSyncErrTest005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningSyncErrTest_0500
     * @tc.desc   Transaction testBatchInsertWithReturningSyncErrTest005 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testBatchInsertWithReturningSyncErrTest005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningSyncErrTest005 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningSyncErrTest005 end createTransaction');
    await transaction.commit()
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [""],
      }
      let results = transaction.batchInsertWithReturningSync("test", [valueBucket], config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
      console.log(TAG + "trans batchInsertWithReturningSync" + results.changed);
      expect().assertFail();
    } catch (e) {
      console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800014);
    }
  })

  /**
     * @tc.name   testBatchInsertWithReturningSyncErrTest006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithReturningSyncErrTest_0600
     * @tc.desc   Transaction testBatchInsertWithReturningSyncErrTest006 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testBatchInsertWithReturningSyncErrTest006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testBatchInsertWithReturningSyncErrTest006 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testBatchInsertWithReturningSyncErrTest006 end createTransaction');
    try {
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": "Jim",
        "age": 30 as long,
        "salary": 2000.1
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
      }
      let results = transaction.batchInsertWithReturningSync("test", [valueBucket1], config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
      console.log(TAG + "trans batchInsertWithReturningSync" + results.changed);
      expect().assertFail();
      await transaction.commit()
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans batchInsertWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800033);
    }
  })

  /**
     * @tc.name   testUpdateWithReturningErrTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateWithReturningErrTest_0100
     * @tc.desc   Transaction testUpdateWithReturningErrTest001 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testUpdateWithReturningErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testUpdateWithReturningErrTest001 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testUpdateWithReturningErrTest001 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      let results1 = await transaction.updateWithReturning(valueBucket, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
      console.log(TAG + " trans updateWithReturning" + results1.changed);
      expect(results1?.changed).assertEqual(0);
      console.log(TAG + "trans testUpdateWithReturningErrTest001" + results1.resultSet);
      expect(results1?.resultSet).assertInstanceOf("Object");
      await transaction.commit()
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans testUpdateWithReturningErrTest001 failed. code is ${e.code}, message is ${e.message}`);
      expect().assertFail();
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
  it("testUpdateWithReturningErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testUpdateWithReturningErrTest002 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testUpdateWithReturningErrTest002 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      let results1 = await transaction.updateWithReturning(valueBucket, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
      console.log(TAG + " trans updateWithReturning" + results1.changed);
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans testUpdateWithReturningErrTest002 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800001);
    }
  })

  /**
     * @tc.name   testUpdateWithReturningErrTest003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateWithReturningErrTest_0300
     * @tc.desc   Transaction testUpdateWithReturningErrTest002 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testUpdateWithReturningErrTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testUpdateWithReturningErrTest003 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testUpdateWithReturningErrTest003 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [""],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      let results1 = await transaction.updateWithReturning(valueBucket, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
      console.log(TAG + " trans updateWithReturning" + results1.changed);
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans testUpdateWithReturningErrTest003 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800021);
    }
  })

  /**
     * @tc.name   testUpdateWithReturningErrTest004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateWithReturningErrTest_0400
     * @tc.desc   Transaction testUpdateWithReturningErrTest004 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testUpdateWithReturningErrTest004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testUpdateWithReturningErrTest004 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testUpdateWithReturningErrTest004 end createTransaction');
    await transaction.commit()
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: ["name"],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      let results1 = await transaction.updateWithReturning(valueBucket, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
      console.log(TAG + " trans updateWithReturning" + results1.changed);
      expect().assertFail();
    } catch (e) {
      console.error(TAG + `trans testUpdateWithReturningErrTest004 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800014);
    }
  })

  /**
     * @tc.name   testUpdateWithReturningErrTest005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateWithReturningErrTest_0500
     * @tc.desc   Transaction testUpdateWithReturningErrTest005 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testUpdateWithReturningErrTest005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testUpdateWithReturningErrTest005 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testUpdateWithReturningErrTest005 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      await transaction.insert("test", valueBucket);
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": 111 as long,
      }
      const config: relationalStore.ReturningConfig = {
        columns: ["name"],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan');
      let results1 = await transaction.updateWithReturning(valueBucket1, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
      console.log(TAG + " trans updateWithReturning" + results1.changed);
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans testUpdateWithReturningErrTest005 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800033);
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
  it("testUpdateWithReturningSyncErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testUpdateWithReturningSyncErrTest001 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testUpdateWithReturningSyncErrTest001 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
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
     * @tc.name   testUpdateWithReturningSyncErrTest002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateWithReturningSyncErrTest_0200
     * @tc.desc   Transaction testUpdateWithReturningSyncErrTest002 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testUpdateWithReturningSyncErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testUpdateWithReturningSyncErrTest002 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testUpdateWithReturningSyncErrTest002 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      let results1 = transaction.updateWithReturningSync(valueBucket, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
      console.log(TAG + " trans updateWithReturningSync" + results1.changed);
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans testUpdateWithReturningSyncErrTest002 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800001);
    }
  })

  /**
     * @tc.name   testUpdateWithReturningSyncErrTest003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateWithReturningSyncErrTest_0300
     * @tc.desc   Transaction testUpdateWithReturningSyncErrTest002 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testUpdateWithReturningSyncErrTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testUpdateWithReturningSyncErrTest003 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testUpdateWithReturningSyncErrTest003 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: [""],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      let results1 = transaction.updateWithReturningSync(valueBucket, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
      console.log(TAG + " trans updateWithReturningSync" + results1.changed);
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans testUpdateWithReturningSyncErrTest003 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800021);
    }
  })

  /**
     * @tc.name   testUpdateWithReturningSyncErrTest004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateWithReturningSyncErrTest_0400
     * @tc.desc   Transaction testUpdateWithReturningSyncErrTest004 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testUpdateWithReturningSyncErrTest004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testUpdateWithReturningSyncErrTest004 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testUpdateWithReturningSyncErrTest004 end createTransaction');
    await transaction.commit()
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      const config: relationalStore.ReturningConfig = {
        columns: ["name"],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      let results1 = transaction.updateWithReturningSync(valueBucket, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
      console.log(TAG + " trans updateWithReturningSync" + results1.changed);
      expect().assertFail();
    } catch (e) {
      console.error(TAG + `trans testUpdateWithReturningSyncErrTest004 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800014);
    }
  })

  /**
     * @tc.name   testUpdateWithReturningSyncErrTest005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateWithReturningSyncErrTest_0500
     * @tc.desc   Transaction testUpdateWithReturningSyncErrTest005 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testUpdateWithReturningSyncErrTest005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testUpdateWithReturningSyncErrTest005 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testUpdateWithReturningSyncErrTest005 end createTransaction');
    try {
      const valueBucket: relationalStore.ValuesBucket = {
        "id": 1 as long,
        "name": "zhangsan",
      }
      await transaction.insert("test", valueBucket);
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": 111 as long,
      }
      const config: relationalStore.ReturningConfig = {
        columns: ["name"],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan');
      let results1 = transaction.updateWithReturningSync(valueBucket1, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
      console.log(TAG + " trans updateWithReturningSync" + results1.changed);
      expect().assertFail();
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans testUpdateWithReturningSyncErrTest005 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800033);
    }
  })

  /**
     * @tc.name   testDeleteWithReturningErrTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteWithReturningErrTest_0100
     * @tc.desc   Transaction testDeleteWithReturningErrTest001 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testDeleteWithReturningErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testDeleteWithReturningErrTest001 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testUpdateWithReturningErrTest001 end createTransaction');
    try {
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      let results1 = await transaction.deleteWithReturning(predicates, config);
      console.log(TAG + " trans deleteWithReturning" + results1.changed);
      expect(results1?.changed).assertEqual(0);
      console.log(TAG + "trans testDeleteWithReturningErrTest001" + results1.resultSet);
      expect(results1?.resultSet).assertInstanceOf("Object");
      await transaction.commit()
    } catch (e) {
      await transaction.rollback()
      console.error(TAG + `trans testDeleteWithReturningErrTest001 failed. code is ${e.code}, message is ${e.message}`);
      expect().assertFail();
    }
  })

  /**
     * @tc.name   testDeleteWithReturningErrTest002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteWithReturningErrTest_0200
     * @tc.desc   Transaction testDeleteWithReturningErrTest002 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testDeleteWithReturningErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testDeleteWithReturningErrTest002 start *************");
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
      console.error(TAG + `trans testDeleteWithReturningErrTest002 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800021);
    }
  })

  /**
     * @tc.name   testDeleteWithReturningErrTest003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteWithReturningErrTest_0300
     * @tc.desc   Transaction testDeleteWithReturningErrTest003 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testDeleteWithReturningErrTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testDeleteWithReturningErrTest003 start *************");
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
      console.error(TAG + `trans testDeleteWithReturningErrTest003 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800021);
    }
  })

  /**
     * @tc.name   testDeleteWithReturningErrTest004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteWithReturningErrTest_0400
     * @tc.desc   Transaction testDeleteWithReturningErrTest004 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testDeleteWithReturningErrTest004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testDeleteWithReturningErrTest004 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testDeleteWithReturningErrTest004 end createTransaction');
    await transaction.commit()
    try {
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      let results1 = await transaction.deleteWithReturning(predicates, config);
      console.log(TAG + " trans deleteWithReturning" + results1.changed);
      expect().assertFail();
    } catch (e) {
      console.error(TAG + `trans testDeleteWithReturningErrTest004 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800014);
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
  it("testDeleteWithReturningSyncErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
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
  it("testDeleteWithReturningSyncErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.name   testDeleteWithReturningSyncErrTest003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteWithReturningSyncErrTest_0300
     * @tc.desc   Transaction testDeleteWithReturningSyncErrTest003 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testDeleteWithReturningSyncErrTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testDeleteWithReturningSyncErrTest003 start *************");
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
      console.error(TAG + `trans testDeleteWithReturningSyncErrTest003 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800021);
    }
  })

  /**
     * @tc.name   testDeleteWithReturningSyncErrTest004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteWithReturningSyncErrTest_0400
     * @tc.desc   Transaction testDeleteWithReturningSyncErrTest004 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testDeleteWithReturningSyncErrTest004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testDeleteWithReturningSyncErrTest004 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testDeleteWithReturningSyncErrTest004 end createTransaction');
    await transaction.commit()
    try {
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
      }
      let predicates = new relationalStore.RdbPredicates("test");
      let results1 = transaction.deleteWithReturningSync(predicates, config);
      console.log(TAG + " trans deleteWithReturningSync" + results1.changed);
      expect().assertFail();
    } catch (e) {
      console.error(TAG + `trans testDeleteWithReturningSyncErrTest004 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800014);
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
  it("testQueryErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
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
  it("testQueryErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testQueryErrTest002 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testQueryErrTest002 end createTransaction');
    await transaction.commit()
    try {
      let predicates = new relationalStore.RdbPredicates("test");
      let resultSet = await transaction.query(predicates, []);
      console.log(TAG + " trans query success");
      resultSet.close();
      expect().assertFail();
    } catch (e) {
      console.error(TAG + `trans testQueryErrTest002 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800014);
    }
  })

  /**
     * @tc.name   testQuerySyncErrTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QuerySyncErrTest_0100
     * @tc.desc   Transaction testQuerySyncErrTest001 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testQuerySyncErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testQuerySyncErrTest001 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testQuerySyncErrTest001 end createTransaction');
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
      console.error(TAG + `trans testQuerySyncErrTest001 failed. code is ${e.code}, message is ${e.message}`);
      expect().assertFail();
    }
  })

  /**
     * @tc.name   testQuerySyncErrTest002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QuerySyncErrTest_0200
     * @tc.desc   Transaction testQuerySyncErrTest002 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testQuerySyncErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testQuerySyncErrTest002 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testQuerySyncErrTest002 end createTransaction');
    await transaction.commit()
    try {
      let predicates = new relationalStore.RdbPredicates("test");
      let resultSet = transaction.querySync(predicates, []);
      console.log(TAG + " trans querySync success");
      resultSet.close();
      expect().assertFail();
    } catch (e) {
      console.error(TAG + `trans testQuerySyncErrTest002 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800014);
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
  it("testQuerySqlErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
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
  it("testQuerySqlErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testQuerySqlErrTest002 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testQuerySqlErrTest002 end createTransaction');
    await transaction.commit()
    try {
      let resultSet = await transaction.querySql("");
      console.log(TAG + " trans querySync success");
      resultSet.close();
      expect().assertFail();
    } catch (e) {
      console.error(TAG + `trans testQuerySqlErrTest002 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800014);
    }
  })

  /**
     * @tc.name   testQuerySqlSyncErrTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QuerySqlSyncErrTest_0100
     * @tc.desc   Transaction testQuerySqlSyncErrTest001 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testQuerySqlSyncErrTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testQuerySqlSyncErrTest001 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testQuerySqlSyncErrTest001 end createTransaction');
    try {
      let resultSet = transaction.querySqlSync("SELECT * FROM test", []);
      console.log(TAG + " trans queryaqlSync success");
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
      console.error(TAG + `trans testQuerySqlSyncErrTest001 failed. code is ${e.code}, message is ${e.message}`);
      expect().assertFail();
    }
  })

  /**
     * @tc.name   testQuerySqlSyncErrTest002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QuerySqlSyncErrTest_0200
     * @tc.desc   Transaction testQuerySqlErrTest002 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testQuerySqlSyncErrTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (): Promise<void> => {
    console.info(TAG + "************* testQuerySqlSyncErrTest002 start *************");
    let transaction: relationalStore.Transaction = await rdbStore!.createTransaction();
    console.info(TAG + 'testQuerySqlSyncErrTest002 end createTransaction');
    await transaction.commit()
    try {
      let resultSet = transaction.querySqlSync("");
      console.log(TAG + " trans querySqlSync success");
      resultSet.close();
      expect().assertFail();
    } catch (e) {
      console.error(TAG + `trans testQuerySqlSyncErrTest002 failed. code is ${e.code}, message is ${e.message}`);
      expect(e.code).assertEqual(14800014);
    }
  })

  /**
     * @tc.name   testProgressCodeTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbNull_ProgressCode_0100
     * @tc.desc   ProgressCode Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("testProgressCodeTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
    console.info(TAG + "************* testProgressCodeTest001 start *************");
    try {
      let statistic1: relationalStore.Statistic = {"total": 10, "successful": 6, "failed": 3, "remained": 1};
      let statistic2: relationalStore.Statistic = {"total": 100, "successful": 60, "failed": 30, "remained": 10};
      let tableDetail: relationalStore.TableDetails = {"upload": statistic1, "download": statistic2};

      expect(tableDetail.upload).assertEqual(statistic1);
      expect(tableDetail.download).assertEqual(statistic2);

      console.info(TAG + 'ProgressCode.SUCCESS=' + relationalStore.ProgressCode.SUCCESS);
      expect(relationalStore.ProgressCode.SUCCESS).assertEqual(0);
      expect(relationalStore.ProgressCode.UNKNOWN_ERROR).assertEqual(1);
      expect(relationalStore.ProgressCode.NETWORK_ERROR).assertEqual(2);
      expect(relationalStore.ProgressCode.CLOUD_DISABLED).assertEqual(3);
      expect(relationalStore.ProgressCode.LOCKED_BY_OTHERS).assertEqual(4);
      expect(relationalStore.ProgressCode.RECORD_LIMIT_EXCEEDED).assertEqual(5);
      expect(relationalStore.ProgressCode.NO_SPACE_FOR_ASSET).assertEqual(6);
      expect(relationalStore.ProgressCode.BLOCKED_BY_NETWORK_STRATEGY).assertEqual(7);
    } catch (e) {
      console.error(TAG + ` testProgressCodeTest001 failed. code is ${e.code}, message is ${e.message}`);
      expect().assertFail();
    }
  })

  })
}



