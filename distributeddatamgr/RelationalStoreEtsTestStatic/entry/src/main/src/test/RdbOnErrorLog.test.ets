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
} from "../../../hypium";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

import deviceInfo from '@ohos.deviceInfo';

let context: common.UIAbilityContext;
let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const TAG = "[RELATIONAL_STORE_ON_ERROR]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const CREATE_TABLE_TEST4 = "CREATE TABLE IF NOT EXISTS users (" + "id INTEGER PRIMARY KEY," + "username TEXT UNIQUE," +
  "email TEXT NOT NULL)";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "sqliteErrorOccurred.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let rdbStore: relationalStore.RdbStore;

export default function RdbStoreSqliteErrorOccurredTest() {
  describe('rdbStoreSqliteErrorOccurredTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG, "*************Unit Test Begin*************");
      delegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
      console.info(TAG + 'beforeAll')
    });
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach begin')
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      await rdbStore.executeSql(CREATE_TABLE_TEST4);
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucketUser: relationalStore.ValuesBucket = {
        "username": 'user1',
        "email": 'user1@example.com',
      };
      await rdbStore.insert("users", valueBucketUser);
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18 as long,
        "salary": 100.5 as long,
        "blobType": u8,
      }
      await rdbStore.insert("test", valueBucket);
      console.info(TAG + 'beforeEach end')
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach')
      try {
        rdbStore.offSqliteErrorOccurred();
        await rdbStore.close();
      } catch (err) {
        console.log(`afterEach error, failed code:${err.code},message:${err.message}`);
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll')
    })

    /**
     *
     * @tc.number   testRdbStoreOnsqliteErrorOccurred0001
     * @tc.name testRdbStoreOnsqliteErrorOccurred0001
     * @tc.desc   1.create db 2.close db 3.OnsqliteErrorOccurred
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreOnsqliteErrorOccurred0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0001 start *************");
      try {
        await rdbStore.close();
        let exceptionMessage: relationalStore.ExceptionMessage;
        rdbStore.onSqliteErrorOccurred(exceptionMessage => {
          console.log(`error log is ${exceptionMessage.code}`)
        });
      } catch (err) {
        expect(err.code == 14800014).assertTrue();
        console.error(`error is failed code:${err.code},message:${err.message}`);
      }
      done();
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0001 end *************");
    })

    /**
     * @tc.number testRdbStoreOnsqliteErrorOccurred0002
     * @tc.name testRdbStoreOnsqliteErrorOccurred0002
     * @tc.desc 1.OnsqliteErrorOccurred 2.execute sql with SQLITE_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreOnsqliteErrorOccurred0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0002 start *************");
      try {
        let exceptionMessage: relationalStore.ExceptionMessage;
        rdbStore.onSqliteErrorOccurred(exceptionMessage => {
          let sqliteCode = exceptionMessage.code;
          let sqliteMessage = exceptionMessage.message;
          let errSQL = exceptionMessage.sql;
          console.info(`error log is ${sqliteCode}, errMessage is ${sqliteMessage}, errSQL is ${errSQL}`);
          expect(sqliteCode == 1).assertTrue();
          expect(sqliteMessage == "table test has no column named exsc").assertTrue();
          expect(errSQL == "INSERT INTO test(age,blobType,exsc,name,salary) VALUES (?,?,?,?,?)").assertTrue();
        });
        console.log(`sqliteErrorOccurred on is success`);
      } catch (err) {
        console.error(`sqliteErrorOccurred on is failed ${err.code}`);
      }
      try {
        let u8: Uint8Array = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5 as long,
          "blobType": u8,
          "exsc": 100 as long,
        }
        await rdbStore.insert("test", valueBucket);
        expect(true).assertFail();
      } catch (err) {
        console.error(`sqliteErrorOccurred on is failed code:${err.code},message:${err.message}`);
        expect(err.code == 14800021).assertTrue();
      }
      done();
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0002 end *************");
    })

    /**
     * @tc.number testRdbStoreOnsqliteErrorOccurred0003
     * @tc.name testRdbStoreOnsqliteErrorOccurred0003
     * @tc.desc 1.Insert data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreOnsqliteErrorOccurred0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0003 start *************");
      try {
        let exceptionMessage: relationalStore.ExceptionMessage;
        rdbStore.onSqliteErrorOccurred(exceptionMessage => {
          let sqliteCode = exceptionMessage.code;
          let sqliteMessage = exceptionMessage.message;
          let errSQL = exceptionMessage.sql;
          expect(sqliteCode == 20).assertTrue();
          expect(sqliteMessage == "datatype mismatch").assertTrue();
          expect(errSQL == "INSERT INTO test(age,blobType,id,name,salary) VALUES (?,?,?,?,?)").assertTrue();
          console.info(`errCode is ${sqliteCode}, errMessage is ${sqliteMessage}, errSQL is ${errSQL}`);
        });
      } catch (err) {
        console.error(`err log failed, code is ${err.code},message is ${err.message}`);
        expect(true).assertFail();
      }
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await rdbStore.createTransaction({
        transactionType: relationalStore.TransactionType.IMMEDIATE
      });
      try {
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "test",
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5 as long,
          "blobType": u8,
        };
        let row = transaction.insertSync("test", valueBucket);
        console.log(TAG + "testRdbStoreOnsqliteErrorOccurred0003 insert row:" + row);
        expect(true).assertFail();
        await transaction.commit();
      } catch (e) {
        await transaction.rollback();
        console.log(TAG + e + " code: " + e.code);
        expect(e.code == 14800033).assertTrue();
        console.log(TAG + "testRdbStoreOnsqliteErrorOccurred0003 failed");
      }
      done();
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0003 end *************");
    })

    /**
     * @tc.number testRdbStoreOnsqliteErrorOccurred0005
     * @tc.name testRdbStoreOnsqliteErrorOccurred0005
     * @tc.desc 1.Insert data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreOnsqliteErrorOccurred0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0005 start *************");
      try {
        let exceptionMessage: relationalStore.ExceptionMessage;
        rdbStore.onSqliteErrorOccurred(exceptionMessage => {
          expect(exceptionMessage.code === 0).assertTrue();
        });
        rdbStore.offSqliteErrorOccurred();
      } catch (err) {
        console.error(`sqliteErrorOccurred on is failed ${err.code}`);
      }
      try {
        let u8: Uint8Array = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5 as long,
          "blobType": u8,
          "exsc": 100 as long,
        }
        await rdbStore.insert("test", valueBucket);
        expect().assertFail();
      } catch (err) {
        console.error(`sqliteErrorOccurred on is failed code:${err.code},message:${err.message}`);
      }
      done();
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0005 end *************");
    })

    /**
     * @tc.number testRdbStoreOnsqliteErrorOccurred0006
     * @tc.name testRdbStoreOnsqliteErrorOccurred0006
     * @tc.desc 1.Insert data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreOnsqliteErrorOccurred0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0006 start *************");
      if (!relationalStore.isVectorSupported()) {
        done()
        return
      }
      let STORE_CONFIG1: relationalStore.StoreConfig = {
        name: 'rdbStore2.db',
        securityLevel: relationalStore.SecurityLevel.S1,
        vector: true,
      };
      let rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG1)
      try{
        rdbStore1.onSqliteErrorOccurred(exceptionMessage => {
          expect().assertFail();
        });
        expect().assertFail();
        done();
      } catch (err){
        expect(err.code).assertEqual(801);
        done()
      }
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0006 end *************");
    })

    /**
     * @tc.number testRdbStoreOnsqliteErrorOccurred0007
     * @tc.name testRdbStoreOnsqliteErrorOccurred0007
     * @tc.desc 1.Insert data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreOnsqliteErrorOccurred0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0007 start *************");
      if (!relationalStore.isVectorSupported()) {
        done()
        return
      }
      let STORE_CONFIG1: relationalStore.StoreConfig = {
        name: 'rdbStore2.db',
        securityLevel: relationalStore.SecurityLevel.S1,
        vector: true,
      };
      let rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG1)
      try{
        rdbStore1.offSqliteErrorOccurred();
        expect().assertFail();
        done();
      } catch (err){
        expect(err.code).assertEqual(801);
        done()
      }
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0007 end *************");
    })

    console.log(TAG + "*************Unit Test End*************");
  })
}