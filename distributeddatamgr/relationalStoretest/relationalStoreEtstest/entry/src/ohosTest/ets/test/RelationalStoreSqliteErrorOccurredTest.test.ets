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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();

const TAG = "[RELATIONAL_STORE_ON_ERROR]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const CREATE_TABLE_TEST4 = "CREATE TABLE IF NOT EXISTS users (" + "id INTEGER PRIMARY KEY," + "username TEXT UNIQUE," +
  "email TEXT NOT NULL)";
const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "sqliteErrorOccurred.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

let rdbStore: data_relationalStore.RdbStore;

export default function rdbStoreSqliteErrorOccurredTest() {
  describe('rdbStoreSqliteErrorOccurredTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach')
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      await rdbStore.executeSql(CREATE_TABLE_TEST4);
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucketUser: data_relationalStore.ValuesBucket = {
        "username": 'user1',
        "email": 'user1@example.com',
      };
      await rdbStore.insert("users", valueBucketUser);
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await rdbStore.insert("test", valueBucket);
    })

    afterEach(async () => {
      console.info(TAG + 'afterEach')
      try {
        rdbStore.off('sqliteErrorOccurred');
      } catch (err) {
        console.log(TAG + `afterEach error, failed code:${err.code},message:${err.message}`);
      }
      await data_relationalStore.deleteRdbStore(context, "sqliteErrorOccurred.db");
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll')
    })

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onSqliteErrorOccurredJsAPITest_0100
     * @tc.name testRdbStoreOnsqliteErrorOccurred0001
     * @tc.desc 1.create db 2.close db 3.OnsqliteErrorOccurred
     */
    it('testRdbStoreOnsqliteErrorOccurred0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0001 start *************");
      try {
        rdbStore.close();
        let exceptionMessage: data_relationalStore.ExceptionMessage;
        rdbStore.on('sqliteErrorOccurred', exceptionMessage => {
          console.log(TAG + `error log is ${exceptionMessage.code}`)
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect(err.code == 14800014).assertTrue();
        console.log(TAG + `error is failed code:${err.code},message:${err.message}`);
        done();
      }
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0001 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onSqliteErrorOccurredJsAPITest_0200
     * @tc.name testRdbStoreOnsqliteErrorOccurred0002
     * @tc.desc 1.OnsqliteErrorOccurred 2.execute sql with SQLITE_ERROR
     */
    it('testRdbStoreOnsqliteErrorOccurred0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0002 start *************");
      try {
        let exceptionMessage: data_relationalStore.ExceptionMessage;
        rdbStore.on('sqliteErrorOccurred', exceptionMessage => {
          let sqliteCode = exceptionMessage.code;
          let sqliteMessage = exceptionMessage.message;
          let errSQL = exceptionMessage.sql;
          console.log(TAG + `error log is ${sqliteCode}, errMessage is ${sqliteMessage}, errSQL is ${errSQL}`);
          expect(sqliteCode == 1).assertTrue();
          expect(sqliteMessage == "table test has no column named exsc").assertTrue();
          expect(errSQL == "INSERT INTO test(age,blobType,exsc,name,salary) VALUES (?,?,?,?,?)").assertTrue();
          done();
        });
        console.log(TAG + `sqliteErrorOccurred on is success`);
      } catch (err) {
        console.log(TAG + `sqliteErrorOccurred on is failed ${err.code}`);
        expect().assertFail();
        done();
      }
      try {
        let u8: Uint8Array = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
          "exsc": 100,
        }
        await rdbStore.insert("test", valueBucket);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + `sqliteErrorOccurred on is failed code:${err.code},message:${err.message}`);
        expect(err.code == 14800021).assertTrue();
      }
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0002 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onSqliteErrorOccurredJsAPITest_0300
     * @tc.name testRdbStoreOnsqliteErrorOccurred0003
     * @tc.desc 1.Insert data
     */
    it('testRdbStoreOnsqliteErrorOccurred0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0003 start *************");
      try {
        let exceptionMessage: data_relationalStore.ExceptionMessage;
        rdbStore.on('sqliteErrorOccurred', exceptionMessage => {
          let sqliteCode = exceptionMessage.code;
          let sqliteMessage = exceptionMessage.message;
          let errSQL = exceptionMessage.sql;
          console.log(TAG + `error log is ${sqliteCode}, errMessage is ${sqliteMessage}, errSQL is ${errSQL}`);
          expect(sqliteCode == 20).assertTrue();
          expect(sqliteMessage == "datatype mismatch").assertTrue();
          expect(errSQL == "INSERT INTO test(age,blobType,id,name,salary) VALUES (?,?,?,?,?)").assertTrue();
          done();
        });
      } catch (err) {
        console.error(TAG + `err log failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
      let transaction = await rdbStore?.createTransaction({
        transactionType: data_relationalStore.TransactionType.IMMEDIATE
      });
      try {
         let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "id": "test",
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
         let row = transaction?.insertSync("test", valueBucket);
         console.log(TAG + "testRdbStoreOnsqliteErrorOccurred0003 insert row:" + row);
         expect().assertFail();
         await transaction?.commit();
         done();
      } catch (e) {
         await transaction?.rollback();
         console.log(TAG + e + " code: " + e.code);
         expect(e.code == 14800033).assertTrue();
      }
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0003 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onSqliteErrorOccurredJsAPITest_0500
     * @tc.name testRdbStoreOnsqliteErrorOccurred0005
     * @tc.desc 1.Insert data
     */
    it('testRdbStoreOnsqliteErrorOccurred0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0005 start *************");
      try {
        let exceptionMessage: data_relationalStore.ExceptionMessage;
        rdbStore.on('sqliteErrorOccurred', exceptionMessage => {
          expect().assertFail();
          done()
        });
        rdbStore.off('sqliteErrorOccurred');
      } catch (err) {
        console.log(TAG + `11111sqliteErrorOccurred on is failed ${err.code}`);
        expect().assertFail();
        done()
      }
      try {
        let u8: Uint8Array = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
          "exsc": 100,
        }
        await rdbStore.insert("test", valueBucket);
        expect().assertFail();
        done()
      } catch (err) {
        console.log(TAG + `sqliteErrorOccurred filed code:${err.code},message:${err.message}`);
        expect(err.code == 14800021).assertTrue();
        done()
      }
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0005 end *************");
    })
	/**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onSqliteErrorOccurredJsAPITest_0600
     * @tc.name testRdbStoreOnsqliteErrorOccurred0006
     * @tc.desc 1.create db 2.close db 3.OffsqliteErrorOccurred
     */
    it('testRdbStoreOnsqliteErrorOccurred0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0006 start *************");
      try {
        rdbStore.close();
        let exceptionMessage: data_relationalStore.ExceptionMessage;
        rdbStore.off('sqliteErrorOccurred', exceptionMessage => {
          console.log(TAG + `error log is ${exceptionMessage.code}`)
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect(err.code == 14800014).assertTrue();
        console.log(TAG + `error is failed code:${err.code},message:${err.message}`);
        done();
      }
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0006 end *************");
    })
    console.log(TAG + "*************Unit Test End*************");
  })
}