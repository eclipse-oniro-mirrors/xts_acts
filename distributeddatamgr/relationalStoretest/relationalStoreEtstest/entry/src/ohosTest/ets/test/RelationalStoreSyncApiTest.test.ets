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
import data_Rdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs'

let context: common.UIAbilityContext;
const TAG = "[RelationalStore_JSKITS_TEST]"
let rdbStore:data_Rdb.RdbStore |undefined = undefined;
const STORE_CONFIG: data_Rdb.StoreConfig = {
  name: "UpdataTest.db",
  securityLevel: data_Rdb.SecurityLevel.S1
}
const STORE_CONFIG1: data_Rdb.StoreConfig = {
  name: "12345.db",
  securityLevel: data_Rdb.SecurityLevel.S1,
  allowRebuild:true
}
const STORE_CONFIG2: data_Rdb.StoreConfig = {
  name: "123452.db",
  securityLevel: data_Rdb.SecurityLevel.S1,
  allowRebuild:true
}
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " + "dec TEXT)";

const dbName = "12345.db"
// const dbPath = "/data/storage/el2/database/entry_test/rdb/" + dbName;
// const dbPathWal = "/data/storage/el2/database/entry_test/rdb/" + dbName + "-wal";
// const dbPathShm = "/data/storage/el2/database/entry_test/rdb/" + dbName + "-shm";
const dbPath = "/data/storage/el2/database/relationalstore/rdb/" + dbName;
const dbPathWal = "/data/storage/el2/database/relationalstore/rdb/" + dbName + "-wal";
const dbPathShm = "/data/storage/el2/database/relationalstore/rdb/" + dbName + "-shm";
let num ='a'.repeat((1024 * 1024-10));
let num1 = "p".repeat((1024 * 1024));
async function CreateCorruptDb() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(TAG + "fileExist:"+fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4)
    fs.truncateSync(dbPathShm, 4)
    let file = fs.openSync(dbPath, fs.OpenMode.READ_WRITE);
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
  } catch (err) {
    console.info(TAG, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(TAG, `quit create corrupt store`);
}



export default function RelationalStoreSyncApiTest() {
  describe('RelationalStoreSyncApiTest', () => {
    beforeAll(() => {
      console.info(TAG + 'beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    })

    beforeEach(async (done:Function) => {
      console.info(TAG + 'beforeEach');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      done();
    })
    afterEach(async (done:Function) => {
      console.info(TAG + 'afterEach');
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })

    /***************************************insertSync***************************/
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0100
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0100');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      try {
        let result = rdbStore.insertSync("test", valueBucket);
        expect(result).assertEqual(1);
      }
      catch (err) {
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0100');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0200
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase illegal paramter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0200');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      const valueBucket: data_Rdb.ValuesBucket = {}
      try {
        rdbStore.insertSync("test", valueBucket);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0300
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase illegal paramter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0300');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      try {
        rdbStore.insertSync("", valueBucket);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0400
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase illegal paramter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0400');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": "",
        "blobType": u8,
      }
      try {
        rdbStore.insertSync(null, valueBucket);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0500
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase illegal paramter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0500');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": "",
        "blobType": u8,
      }
      try {
        rdbStore.insertSync(undefined, valueBucket);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0600
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase illegal paramter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0600');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": "",
        "blobType": u8,
      }
      try {
        rdbStore.insertSync(undefined, valueBucket);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0700
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0700');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      let path = context.databaseDir;
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0700'+ path);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      try {
        let result = rdbStore.insertSync("test", valueBucket,data_Rdb.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0700'+result);
        expect(result).assertEqual(1);
      }
      catch (err) {
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0700'+err);
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0700');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0800
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase Corrupt database
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info(TAG + 'SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0800');
      let rdbStore1 = await data_Rdb.getRdbStore(context, STORE_CONFIG1);
      console.info(TAG + "111")
      await rdbStore1.execute(CREATE_TABLE_TEST, null);
      console.info(TAG + "222")
      let path = context.databaseDir;
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0800'+ path);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      rdbStore1.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      let res = rdbStore1.querySync(predicates);
      await CreateCorruptDb();
      try{
        rdbStore1.insertSync("test", valueBucket);
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0800 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800011);
      }
      res.close();
      await data_Rdb.deleteRdbStore(context, "12345.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0800');
      done();
    })


    /***************************************updateSync***************************/
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1000
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1000');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 200.5,
        "blobType": u8,
      }
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      rdbStore.insertSync("test", valueBucket);
      try{
        let result = rdbStore.updateSync(valueBucket1,predicates);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1000 == ' + result);
        expect(result ).assertEqual(1);
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1000');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1100
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1100');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 200.5,
        "blobType": u8,
      }
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "lisi");
      rdbStore.insertSync("test", valueBucket);
      try{
        let result = rdbStore.updateSync(valueBucket1,predicates);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1100 == ' + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1100');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1200
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1200');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
      }
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      rdbStore.insertSync("test", valueBucket);
      try{
        rdbStore.updateSync(valueBucket1,predicates);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1200');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1400
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1400');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      rdbStore.insertSync("test", valueBucket);
      try{
        rdbStore.updateSync(null,predicates);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1400');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1500
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1500');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      rdbStore.insertSync("test", valueBucket);
      try{
        rdbStore.updateSync(undefined,predicates);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1500');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1600
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1600');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      rdbStore.insertSync("test", valueBucket);
      try{
        rdbStore.updateSync(valueBucket,null);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1600');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1700
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1700');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      rdbStore.insertSync("test", valueBucket);
      try{
        rdbStore.updateSync(valueBucket,undefined);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1700');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1800
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1800');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 200.5,
        "blobType": u8,
      }
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "");
      rdbStore.insertSync("test", valueBucket);
      try{
        let result = rdbStore.updateSync(valueBucket1,predicates);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1800'+result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1800');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1900
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1900');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 200.5,
        "blobType": u8,
      }
      let predicates = new data_Rdb.RdbPredicates("test1");
      predicates.equalTo("NAME", "zhangsan");
      rdbStore.insertSync("test", valueBucket);
      try{
        let result = rdbStore.updateSync(valueBucket1,predicates);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1900'+result);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800021);
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_1900');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2000
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2000');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "lisi");
      rdbStore.insertSync("test", valueBucket);
      try{
        let result = rdbStore.updateSync({},predicates);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2000'+result);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2000');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2100
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2100');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 200.5,
        "blobType": u8,
      }
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      rdbStore.insertSync("test", valueBucket);
      try{
        let result = rdbStore.updateSync(valueBucket1,predicates,data_Rdb.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2100' + result);
        expect(result ).assertEqual(1);
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2100');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2200
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2200');
      let rdbStore1 = await data_Rdb.getRdbStore(context, STORE_CONFIG1);
      await rdbStore1.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary":200.5,
        "blobType": u8,
      }
      rdbStore1.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      let res = rdbStore1.querySync(predicates);
      await CreateCorruptDb();
      try{
        rdbStore1.updateSync(valueBucket1,predicates);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2200 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code ).assertEqual(14800011);
      }
      res.close();
      await data_Rdb.deleteRdbStore(context, "12345.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2200');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2400
     * @tc.desc   Test Js Api relationalStore.updateSync() testcase 014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300');
      let rdbStore1 = await data_Rdb.getRdbStore(context, STORE_CONFIG2);
      rdbStore1.beginTransaction();
      await rdbStore1.execute(CREATE_TABLE_TEST, null);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      for(let i =0;i<201;i++){
        rdbStore1.insertSync("test", valueBucket);
      }
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      let res = rdbStore1.querySync(predicates);
      try{
        rdbStore1.updateSync(valueBucket1,predicates);
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800047);
      }
      res.close();
      rdbStore1.commit();
      await rdbStore1.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "123452.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300');
      done();
    })
    /***************************************deleteSync***************************/

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2400
     * @tc.desc   Test Js Api relationalStore.deleteSync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2400');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let result = rdbStore.deleteSync(predicates);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2400  ' + result);
        expect(result ).assertEqual(1);
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2400');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2500
     * @tc.desc   Test Js Api relationalStore.deleteSync() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2500');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test1");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let result = rdbStore.deleteSync(predicates);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2500' + result);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800021);
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2500');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2600
     * @tc.desc   Test Js Api relationalStore.deleteSync() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2600');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let result = rdbStore.deleteSync(null);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2600' + result);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2600 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2600');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2700
     * @tc.desc   Test Js Api relationalStore.deleteSync() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2700');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let result = rdbStore.deleteSync(undefined);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2700' + result);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2700 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2700');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2800
     * @tc.desc   Test Js Api relationalStore.deleteSync() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2800');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "");
      try{
        let result = rdbStore.deleteSync(predicates);
        console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2800 ===' + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2800 err.code ${err.code}, err.message ${err.message}`)
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2800');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2900
     * @tc.desc   Test Js Api relationalStore.deleteSync() testcase 013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2900');
      let rdbStore1 = await data_Rdb.getRdbStore(context, STORE_CONFIG1);
      await rdbStore1.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      rdbStore1.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      let res = rdbStore1.querySync(predicates);
      await CreateCorruptDb();
      try{
        rdbStore1.deleteSync(predicates);
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2900 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800011);
      }
      res.close();
      await data_Rdb.deleteRdbStore(context, "12345.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2900');
      done();
    })


    /***************************************querySync***************************/
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3100
     * @tc.desc   Test Js Api relationalStore.querySync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3100');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let result:data_Rdb.ResultSet= rdbStore.querySync(predicates);
        while (result.goToNextRow()){
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3100 == ' + result.getString(result.getColumnIndex("NAME")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3100 == ' + result.getLong(result.getColumnIndex("AGE")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3100 == ' + result.getDouble(result.getColumnIndex("SALARY")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3100 == ' + result.getBlob(result.getColumnIndex("BLOBTYPE")));
          expect(result.getString(result.getColumnIndex("NAME")).toString() == "zhangsan").assertTrue();
          expect(result.getString(result.getColumnIndex("AGE")).toString() == "18").assertTrue();
          expect(result.getString(result.getColumnIndex("SALARY")).toString()=="100.5").assertTrue();
        }
        result.close();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3100 err.code ${err.code}, err.message ${err.message}`)
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3100');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3200
     * @tc.desc   Test Js Api relationalStore.querySync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3200');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test1");
      predicates.equalTo("NAME", "zhangsan");
      let result:data_Rdb.ResultSet;
      try{
        result= rdbStore.querySync(predicates);
        if (result.goToNextRow()){
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3200'+result.goToNextRow());
          expect(result.goToNextRow()=== true ).assertFail();
        }else {
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3200 11'+result.goToNextRow());
          expect(result.goToNextRow() === false).assertTrue()
        }
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3200 err.code ${err.code}, err.message ${err.message}`)
        expect().assertFail();
      }
      result.close();
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3200');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3300
     * @tc.desc   Test Js Api relationalStore.querySync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3300');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let result:data_Rdb.ResultSet= rdbStore.querySync(null);
        result.close();
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3300 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3300');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3400
     * @tc.desc   Test Js Api relationalStore.querySync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3400');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let result:data_Rdb.ResultSet= rdbStore.querySync(null);
        result.close();
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3400 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code ).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3400');
      done();
    })

    /***************************************batchInsertSync***************************/
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3500
     * @tc.desc   Test Js Api relationalStore.batchInsertSync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3500');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket2:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBuckets: Array<data_Rdb.ValuesBucket> = new Array(valueBucket, valueBucket1, valueBucket2);
      try {
        let insertNum: number = rdbStore.batchInsertSync("test", valueBuckets);
        console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect( insertNum).assertEqual(valueBuckets.length);
      } catch (err) {
        console.info(`batchInsert is failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3500');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3600
     * @tc.desc   Test Js Api relationalStore.batchInsertSync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3600');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket2:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBuckets: Array<data_Rdb.ValuesBucket> = new Array(valueBucket, valueBucket1, valueBucket2);
      try {
        let insertNum: number = rdbStore.batchInsertSync("", valueBuckets);
        console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect().assertFail();
      } catch (err) {
        console.info(`batchInsert is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3600');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3700
     * @tc.desc   Test Js Api relationalStore.batchInsertSync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3700');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket2:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBuckets: Array<data_Rdb.ValuesBucket> = new Array(valueBucket, valueBucket1, valueBucket2);
      try {
        let insertNum: number = rdbStore.batchInsertSync(null, valueBuckets);
        console.info(`SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3700 batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect().assertFail();
      } catch (err) {
        console.info(`SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3700 batchInsert is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3700');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3800
     * @tc.desc   Test Js Api relationalStore.batchInsertSync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3800');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket2:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBuckets: Array<data_Rdb.ValuesBucket> = new Array(valueBucket, valueBucket1, valueBucket2);
      try {
        let insertNum: number = rdbStore.batchInsertSync(undefined, valueBuckets);
        console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect().assertFail();
      } catch (err) {
        console.info(`batchInsert is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3800');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3900
     * @tc.desc   Test Js Api relationalStore.batchInsertSync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3900');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      const valueBucket:data_Rdb.ValuesBucket = {}
      let valueBuckets: Array<data_Rdb.ValuesBucket> = new Array(valueBucket, valueBucket, valueBucket);
      try {
        let insertNum: number = rdbStore.batchInsertSync("test", valueBuckets);
        console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect().assertFail();
      } catch (err) {
        console.info(`batchInsert is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_3900');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase Corrupt database
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000');
      let rdbStore1 = await data_Rdb.getRdbStore(context, STORE_CONFIG1);
      await rdbStore1.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBuckets: Array<data_Rdb.ValuesBucket> = new Array(valueBucket, valueBucket, valueBucket);
      rdbStore1.batchInsertSync("test", valueBuckets);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      let res = rdbStore1.querySync(predicates);
      await CreateCorruptDb();
      try{
        let res = rdbStore1.batchInsertSync("test", valueBuckets);
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000`+  res)
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800011);
      }
      res.close();
      await data_Rdb.deleteRdbStore(context, "12345.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4100
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase the wal File is 200M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4100');
      let rdbStore1 = await data_Rdb.getRdbStore(context, STORE_CONFIG2);
      rdbStore1.beginTransaction();
      await rdbStore1.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": num,
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket1:data_Rdb.ValuesBucket = {
        "name": "num",
        "age": 20,
        "salary": 100.5,
        "blobType": u8,
      }
      const valueBucket2:data_Rdb.ValuesBucket = {
        "name": "num",
        "age": 19,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBuckets: Array<data_Rdb.ValuesBucket> = new Array(valueBucket, valueBucket1, valueBucket2);
      for (let i= 0;i<201;i++){
        rdbStore1.insertSync("test", valueBucket1);
      }
      try{
        rdbStore1.batchInsertSync("test", valueBuckets);
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4100 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800047);
      }
      rdbStore1.commit();
      await rdbStore1.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "123452.db");
      done();
    })

    /***************************************querySqlSync***************************/
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4200
     * @tc.desc   Test Js Api relationalStore.querySync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4200');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let resultSet: data_Rdb.ResultSet = rdbStore.querySqlSync("SELECT * FROM test WHERE NAME = 'zhangsan'");
        while (resultSet.goToNextRow()){
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4200 == ' + resultSet.getString(resultSet.getColumnIndex("NAME")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4200 == ' + resultSet.getLong(resultSet.getColumnIndex("AGE")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4200 == ' + resultSet.getDouble(resultSet.getColumnIndex("SALARY")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4200 == ' + resultSet.getBlob(resultSet.getColumnIndex("BLOBTYPE")));
          expect(resultSet.getString(resultSet.getColumnIndex("NAME")).toString() == "zhangsan").assertTrue();
          expect(resultSet.getString(resultSet.getColumnIndex("AGE")).toString() == "18").assertTrue();
          expect(resultSet.getString(resultSet.getColumnIndex("SALARY")).toString()=="100.5").assertTrue();
        }
        resultSet.close();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4200 err.code ${err.code}, err.message ${err.message}`)
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4200');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4300
     * @tc.desc   Test Js Api relationalStore.querySync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4300');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test1");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let resultSet: data_Rdb.ResultSet = rdbStore.querySqlSync("SELECT * FROM test1 WHERE NAME = 'zhangsan'");
        if (resultSet.goToNextRow()){
          expect().assertFail();
        }else {
          expect(resultSet.goToNextRow() === false).assertTrue();
        }
        resultSet.close();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4300 err.code ${err.code}, err.message ${err.message}`)
        expect().assertTrue();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4300');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4400
     * @tc.desc   Test Js Api relationalStore.querySync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4400');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      rdbStore.insertSync("test", valueBucket);
      try{
        let resultSet: data_Rdb.ResultSet = rdbStore.querySqlSync(null);
        resultSet.close();
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4400 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4400');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4500
     * @tc.desc   Test Js Api relationalStore.querySync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4500');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let resultSet: data_Rdb.ResultSet = rdbStore.querySqlSync(undefined);
        resultSet.close();
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4500 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4500');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4600
     * @tc.desc   Test Js Api relationalStore.querySync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4600');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let resultSet: data_Rdb.ResultSet = rdbStore.querySqlSync("");
        resultSet.close();
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4600 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4600');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4700
     * @tc.desc   Test Js Api relationalStore.querySync() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4700');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      rdbStore.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      try{
        let resultSet: data_Rdb.ResultSet = rdbStore.querySqlSync("DELETE FROM test");
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4700 `+resultSet.goToNextRow())
        if (resultSet.goToNextRow()){
          expect().assertFail();
        }else {
          expect(resultSet.goToNextRow() === false).assertTrue();
        }
        resultSet.close();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4700 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4700');
      done();
    })

    /***************************************executeSync***************************/
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4800
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4800');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      try {
        let data:data_Rdb.ValueType = rdbStore.executeSync(CREATE_TABLE_TEST1)
        console.info(`SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4800 result: ${data}`);
        expect(data).assertEqual(null);
      }
      catch (err) {
        console.info(`SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4800 code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4900
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4900');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      const SQL_DELETE_TABLE = 'DELETE FROM test1';
      try {
        let data:data_Rdb.ValueType = rdbStore.executeSync(SQL_DELETE_TABLE)
        console.info(`delete result: ${data}`);
        expect().assertFail();
      }
      catch (err) {
        console.info(`SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4900 code is ${err.code},message is ${err.message}`);
        expect( err.code).assertEqual(14800021);
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5000
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5000');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      try {
        let data:data_Rdb.ValueType = rdbStore.executeSync(null)
        console.info(`delete result: ${data}`);
        expect().assertFail();
      }
      catch (err) {
        console.info(` code is ${err.code},message is ${err.message}`);
        expect( err.code ).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5100
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5100');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      try {
        let data:data_Rdb.ValueType = rdbStore.executeSync(undefined)
        console.info(`delete result: ${data}`);
        expect().assertFail();
      }
      catch (err) {
        console.info(` code is ${err.code},message is ${err.message}`);
        expect( err.code ).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5200
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5200');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      try {
        let data:data_Rdb.ValueType = rdbStore.executeSync("")
        console.info(`delete result: ${data}`);
        expect().assertFail();
      }
      catch (err) {
        console.info(` code is ${err.code},message is ${err.message}`);
        expect( err.code ).assertEqual("401");
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5300
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5300');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST, null);
      try {
        let data:data_Rdb.ValueType = rdbStore.executeSync("1111")
        console.info(`delete result: ${data}`);
        expect().assertFail();
      }
      catch (err) {
        console.info(` code is ${err.code},message is ${err.message}`);
        expect( err.code).assertEqual(14800021);
      }
      await rdbStore.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5500
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase Corrupt database
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5500');
      let rdbStore1 = await data_Rdb.getRdbStore(context, STORE_CONFIG1);
      await rdbStore1.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      rdbStore1.insertSync("test", valueBucket);
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("NAME", "zhangsan");
      let res = rdbStore1.querySync(predicates);
      await CreateCorruptDb();
      try{
        rdbStore1.executeSync("UPDATE test SET age=23 WHERE name = 'zhangsan'")
        // rdbStore1.insertSync("test", valueBucket);
        expect().assertFail();
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5500 err.code ${err.code}, err.message ${err.message}`)
        expect(err.code ).assertEqual(14800011);
      }
      res.close();
      await data_Rdb.deleteRdbStore(context, "12345.db");
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5500');
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5700
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5700');
      let rdbStore1 = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore1.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      try{
        let instnum = rdbStore1.insertSync("test", valueBucket);
        expect(instnum).assertEqual(1);
        let predicates = new data_Rdb.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let result2 = rdbStore1.updateSync(valueBucket,predicates,data_Rdb.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(result2).assertEqual(1);
        let result = rdbStore1.querySync(predicates);
        while (result.goToNextRow()){
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5700 == ' + result.getString(result.getColumnIndex("NAME")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5700 == ' + result.getLong(result.getColumnIndex("AGE")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5700 == ' + result.getDouble(result.getColumnIndex("SALARY")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5700 == ' + result.getBlob(result.getColumnIndex("BLOBTYPE")));
          expect(result.getString(result.getColumnIndex("NAME")).toString() == "zhangsan").assertTrue();
          expect(result.getString(result.getColumnIndex("AGE")).toString() == "18").assertTrue();
          expect(result.getString(result.getColumnIndex("SALARY")).toString()=="100.5").assertTrue();
        }
        let result1 = rdbStore1.deleteSync(predicates);
        expect(result1).assertEqual(1);
        rdbStore1.executeSync("DELETE FROM test");
      } catch (err) {
        console.info(`SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5700 insert code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5800
     * @tc.desc   Test Js Api SingleKvStore.GetResultSet() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5800');
      let rdbStore1 = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore1.execute(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      try{
        let instnum = rdbStore1.insertSync("test", valueBucket);
        expect(instnum).assertEqual(1);
        let predicates = new data_Rdb.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let result2 = rdbStore1.updateSync(valueBucket,predicates,data_Rdb.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(result2).assertEqual(1);
        let result = rdbStore1.querySqlSync("SELECT * FROM test WHERE NAME = 'zhangsan'");
        while (result.goToNextRow()){
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5800 == ' + result.getString(result.getColumnIndex("NAME")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5800 == ' + result.getLong(result.getColumnIndex("AGE")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5800 == ' + result.getDouble(result.getColumnIndex("SALARY")));
          console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_5800 == ' + result.getBlob(result.getColumnIndex("BLOBTYPE")));
          expect(result.getString(result.getColumnIndex("NAME")).toString() == "zhangsan").assertTrue();
          expect(result.getString(result.getColumnIndex("AGE")).toString() == "18").assertTrue();
          expect(result.getString(result.getColumnIndex("SALARY")).toString()=="100.5").assertTrue();
        }
        let result1 = rdbStore1.deleteSync(predicates);
        expect(result1).assertEqual(1);
        rdbStore1.executeSync("DELETE FROM test");
      } catch (err) {
        console.info(`insert code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
      done();
    })
  })
}