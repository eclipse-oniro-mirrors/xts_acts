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
import relationalStore from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

const TAG = "[RDB_STORE_WITH_RETURNING_TEST]";
let rdbStore: relationalStore.RdbStore | undefined = undefined;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "data ASSET, " + "data1 ASSETS," + "blobType BLOB," +
  "test_id INTEGER," + "FOREIGN KEY (test_id) REFERENCES test1(test_id)" + ");"

const CREATE_TABLE_TEST1 =
  "CREATE TABLE IF NOT EXISTS test1 (" + " test_id INTEGER PRIMARY KEY AUTOINCREMENT," + "test_name TEXT NOT NULL" +
    ");";
const CREATE_TABLE_TEST2 = "CREATE TABLE IF NOT EXISTS test2 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
const DROP_TABLE_TEST2 = "DROP TABLE IF EXISTS test2";
const CREATE_TRIGGER1 = "CREATE TRIGGER after_test_delete " +
  "AFTER DELETE ON test " +
  "FOR EACH ROW " +
  "BEGIN " +
  "INSERT INTO test2 (data1, data2, data3, data4) " +
  "VALUES (OLD.name, OLD.age, OLD.salary, OLD.blobType); " +
  "END;"
const CREATE_TRIGGER2 = "CREATE TRIGGER after_test_delete " +
  "AFTER DELETE ON test " +
  "FOR EACH ROW " +
  "BEGIN " +
  "INSERT INTO test2 (id) " +
  "VALUES ('abc'); " +
  "END;"
const DROP_TRIGGER1 = "DROP TRIGGER IF EXISTS after_test_delete;";
const dbName = "DeleteTrans.db";
const dbName1 = "DeleteTransCorrupt.db";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
}
const STORE_CONFIG1: relationalStore.StoreConfig = {
  name: dbName1,
  securityLevel: relationalStore.SecurityLevel.S1,
}
let options: relationalStore.TransactionOptions = {
  transactionType: relationalStore.TransactionType.IMMEDIATE
}

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const dbPath = context.databaseDir + "/rdb/" + dbName;
const dbPathWal = dbPath + "-wal";
const dbPathShm = dbPath + "-shm";

async function corruptDatabaseFile(fileName: string)
{
  let stat = await fs.stat(fileName);
  let file = await fs.open(fileName, fs.OpenMode.READ_WRITE);
  fs.lseek(file.fd, 0, fs.WhenceType.SEEK_SET);
  let bufferSize = stat.size;
  let buffer = new ArrayBuffer(bufferSize);
  let uint8Array = new Uint8Array(buffer);
  let fChar = 'F'.charCodeAt(0);
  uint8Array.fill(fChar);
  await fs.write(file.fd, buffer, { offset: 0, length: bufferSize });
}

async function createCorruptDb()
{
  let dbPath = context.databaseDir + "/rdb/" + STORE_CONFIG1.name;
  let dbPathWal = dbPath + "-wal";
  let dbPathShm = dbPath + "-shm";
  await corruptDatabaseFile(dbPath);
  await corruptDatabaseFile(dbPathWal);
  await corruptDatabaseFile(dbPathShm);
}

function getRowCount(resultSet:relationalStore.LiteResultSet|undefined):number {
  let count = 0;
  while(resultSet?.goToNextRow()) {
    count++;
  }
  return count;
}

export default function TransDeleteWithReturning() {
  describe('TransDeleteWithReturning', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      expect(rdbStore != undefined).assertTrue();
      await rdbStore?.executeSql(CREATE_TABLE_TEST1);
      await rdbStore?.executeSql(CREATE_TABLE_TEST);
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      let valueBuckets1 = new Array<relationalStore.ValuesBucket>();
      const num = 10;
      for (let i = 0; i < num; i++) {
        const valueBucket: relationalStore.ValuesBucket = {
          'test_name': 'lisi' + i,
        };
        valueBuckets1.push(valueBucket);
      }
      const config1: relationalStore.ReturningConfig = {
        columns: ['test_name'],
      }
      let results1 = await rdbStore?.batchInsertWithReturning("test1", valueBuckets1, config1);
      expect(results1.changed).assertEqual(num);
      for (let i = 0; i < num; i++) {
        const asset: relationalStore.Asset = {
          name: "example-image.jpg" + i,
          uri: "content://media/external/images/media/12345" + i,
          path: "/storage/emulated/0/Pictures/example-image.jpg" + i,
          createTime: "2024-01-15T10:30:00Z" + i,
          modifyTime: "2024-01-15T14:45:23Z" + i,
          size: "2048576" + i
        }
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
          'age': 18 + i,
          'salary': 25000.5 + i,
          'data': asset,
          'test_id': i
        };
        valueBuckets.push(valueBucket);
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let results = await rdbStore?.batchInsertWithReturning("test", valueBuckets, config);
      expect(results.changed).assertEqual(num);
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await rdbStore?.close();
      await relationalStore.deleteRdbStore(context, dbName);
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_24600
     * @tc.name  transDeleteWithReturning001
     * @tc.desc  Values is normal
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning001 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan1');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.deleteWithReturning(predicates, config);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan1");
        expect(results?.resultSet.getRow().age).assertEqual(19);
        expect(results?.resultSet.goToNextRow()).assertFalse();
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transDeleteWithReturning001 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_24700
     * @tc.name  transDeleteWithReturningSync001
     * @tc.desc  Values is normal
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturningSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturningSync001 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.deleteWithReturningSync(predicates, config);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan4");
        expect(results?.resultSet.getRow().age).assertEqual(22);
        expect(results?.resultSet.goToNextRow()).assertFalse();
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transDeleteWithReturningSync001 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_24800
     * @tc.name  transDeleteWithReturning003
     * @tc.desc  The tableName is wrong
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning003 start *************");
      let predicates = new relationalStore.RdbPredicates("wrongTableName");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      await trans?.rollback();
      console.log(TAG + "************* transDeleteWithReturning003 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_24900
     * @tc.name  transDeleteWithReturning005
     * @tc.desc  There are spaces in the table name
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning005 start *************");
      let predicates = new relationalStore.RdbPredicates("test test1");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transDeleteWithReturning005 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_25000
     * @tc.name  transDeleteWithReturning006
     * @tc.desc  values.size > 1024, The returned results contains only 1024 entries
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning006 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 10; i < 1100; i++) {
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
          'age': 18 + i,
          'salary': 25000.5 + i,
        };
        valueBuckets.push(valueBucket);
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      let results = await trans?.batchInsertWithReturning("test", valueBuckets, config);
      expect(results?.changed).assertEqual(1090);
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.contains('name', 'zhangsan');
      try {
        let results = await trans?.deleteWithReturning(predicates, config);
        expect(results?.changed).assertEqual(1100);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transDeleteWithReturning006 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_25100
     * @tc.name  transDeleteWithReturningSync006
     * @tc.desc  values.size > 1024, The returned results contains only 1024 entries
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturningSync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturningSync006 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 10; i < 1100; i++) {
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
          'age': 18 + i,
          'salary': 25000.5 + i,
        };
        valueBuckets.push(valueBucket);
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      let results = await trans?.batchInsertWithReturning("test", valueBuckets, config);
      expect(results?.changed).assertEqual(1090);
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.contains('name', 'zhangsan');
      try {
        let results = trans?.deleteWithReturningSync(predicates, config);
        expect(results?.changed).assertEqual(1100);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transDeleteWithReturningSync006 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_25200
     * @tc.name  transDeleteWithReturning007
     * @tc.desc  0 < values.size <= 1024, The returned results can contain all the changed data
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning007 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 10; i < 1024; i++) {
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
          'age': 18 + i,
          'salary': 25000.5 + i,
        };
        valueBuckets.push(valueBucket);
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      let results = await trans?.batchInsertWithReturning("test", valueBuckets, config);
      expect(results?.changed).assertEqual(1014);
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.contains('name', 'zhangsan');
      try {
        let result = await trans?.deleteWithReturning(predicates, config);
        expect(result?.changed).assertEqual(1024);
        expect(getRowCount(result?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }

      console.log(TAG + "************* transDeleteWithReturning007 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_25300
     * @tc.name  transDeleteWithReturningSync007
     * @tc.desc  0 < values.size <= 1024, The returned results can contain all the changed data
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturningSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturningSync007 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 10; i < 1024; i++) {
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
          'age': 18 + i,
          'salary': 25000.5 + i,
        };
        valueBuckets.push(valueBucket);
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      let results = await trans?.batchInsertWithReturning("test", valueBuckets, config);
      expect(results?.changed).assertEqual(1014);
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.contains('name', 'zhangsan');
      try {
        let results = trans?.deleteWithReturningSync(predicates, config);
        expect(results?.changed).assertEqual(1024);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transDeleteWithReturningSync007 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_25400
     * @tc.name  transDeleteWithReturning008
     * @tc.desc  1 < columns.size <= 4, Return the results of the specified field
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning008 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age', 'salary'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.deleteWithReturning(predicates, config);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan4");
        expect(results?.resultSet.getRow().age).assertEqual(22);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transDeleteWithReturning008 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_25500
     * @tc.name  transDeleteWithReturningSync008
     * @tc.desc  1 < columns.size <= 4, Return the results of the specified field
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturningSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturningSync008 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age', 'salary'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.deleteWithReturningSync(predicates, config);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan5");
        expect(results?.resultSet.getRow().age).assertEqual(23);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transDeleteWithReturningSync008 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_25600
     * @tc.name  transDeleteWithReturning009
     * @tc.desc  columns.size == 0, errCode 14800001
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning009 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: [],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transDeleteWithReturning009 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_25700
     * @tc.name  transDeleteWithReturning010
     * @tc.desc  columns.size > 4, Throwing an error
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning010 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age', 'salary', 'data', 'blobType'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transDeleteWithReturning010 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_25800
     * @tc.name  transDeleteWithReturning011
     * @tc.desc  columns contain special characters: "*"," ",","
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning011 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['ab*'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning011 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync011 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ['a b'];
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning011 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync011 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ['a,b'];
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning011 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync011 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transDeleteWithReturning011 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_25900
     * @tc.name  transDeleteWithReturning016
     * @tc.desc  Normal parameters, rdb already close
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning016 start *************");
      let trans = await rdbStore?.createTransaction(options);
      await trans?.commit();
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      console.log(TAG + "************* transDeleteWithReturning016 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_26000
     * @tc.name  transDeleteWithReturning017
     * @tc.desc  Abnormal parameters, rdb already close
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning017 start *************");
      let trans = await rdbStore?.createTransaction(options);
      await trans?.commit();
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age', '*'],
      }
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning017 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync017 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* transDeleteWithReturning017 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_26100
     * @tc.name  transDeleteWithReturning018
     * @tc.desc  Database corruption
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning018 start *************");
      let rdbStoreCorrupt: relationalStore.RdbStore | undefined = undefined;
      rdbStoreCorrupt = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStoreCorrupt?.executeSql(CREATE_TABLE_TEST);
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 0; i < 10; i++) {
        const asset: relationalStore.Asset = {
          name: "example-image.jpg" + i,
          uri: "content://media/external/images/media/12345" + i,
          path: "/storage/emulated/0/Pictures/example-image.jpg" + i,
          createTime: "2024-01-15T10:30:00Z" + i,
          modifyTime: "2024-01-15T14:45:23Z" + i,
          size: "2048576" + i
        }
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
          'age': 18 + i,
          'salary': 25000.5 + i,
          'data': asset,
          'test_id': i
        };
        valueBuckets.push(valueBucket);
      }
      const config1: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      await rdbStoreCorrupt?.batchInsertWithReturning("test", valueBuckets, config1);
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStoreCorrupt?.createTransaction(options);
      await createCorruptDb();
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      await rdbStoreCorrupt?.close();
      await relationalStore.deleteRdbStore(context,STORE_CONFIG1);
      console.log(TAG + "************* transDeleteWithReturning018 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_26200
     * @tc.name  transDeleteWithReturning020
     * @tc.desc  The database file is locked
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning020 start *************");
      let deferredTrans = await rdbStore?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 18,
        "salary": 100.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      await deferredTrans?.insert("test", valueBucket);
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      await deferredTrans?.commit();
      await trans?.rollback();
      console.log(TAG + "************* transDeleteWithReturning020 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_26300
     * @tc.name  transDeleteWithReturning028
     * @tc.desc  illegal table name
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning028 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let predicates1 = new relationalStore.RdbPredicates("123test");
        await trans?.deleteWithReturning(predicates1, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning028 1 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        let predicates2 = new relationalStore.RdbPredicates("345test");
        trans?.deleteWithReturningSync(predicates2, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning028 2 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates3 = new relationalStore.RdbPredicates("te.s.t");
      try {
        await trans?.deleteWithReturning(predicates3, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning028 3 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates3, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning028 4 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates5 = new relationalStore.RdbPredicates(".test");
      try {
        await trans?.deleteWithReturning(predicates5, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning028 5 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates5, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning028 6 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates7 = new relationalStore.RdbPredicates("test..");
      try {
        await trans?.deleteWithReturning(predicates7, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning028 7 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates7, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning028 8 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transDeleteWithReturning028 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_26400
     * @tc.name  transDeleteWithReturning029
     * @tc.desc  maxReturningCount <= 0 || maxReturningCount > 0x7ffe
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning029 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
        maxReturningCount: -2
      }
      let predicates = new relationalStore.RdbPredicates("test");
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning029 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync029 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0;
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning029 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync029 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0x7fff;
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning029 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync029 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transDeleteWithReturning029 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_26500
     * @tc.name  transDeleteWithReturning030
     * @tc.desc  valueBuckets.size < maxReturningCount < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning030 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 2);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.deleteWithReturning(predicates, config);
        expect(results?.changed).assertEqual(2);
        expect(getRowCount(results?.resultSet)).assertEqual(2);
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning030 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans?.commit();
      console.log(TAG + "************* transDeleteWithReturning030 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_26600
     * @tc.name  transDeleteWithReturningSync030
     * @tc.desc  valueBuckets.size < maxReturningCount < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturningSync030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturningSync030 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 2);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.deleteWithReturningSync(predicates, config);
        expect(results?.changed).assertEqual(2);
        expect(getRowCount(results?.resultSet)).assertEqual(2);
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync030 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans?.commit();
      console.log(TAG + "************* transDeleteWithReturningSync030 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_26700
     * @tc.name  transDeleteWithReturning031
     * @tc.desc  maxReturningCount < valueBuckets.size < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning031 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 10);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.deleteWithReturning(predicates, config);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning031 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans?.commit();
      console.log(TAG + "************* transDeleteWithReturning031 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_26800
     * @tc.name  transDeleteWithReturningSync031
     * @tc.desc  maxReturningCount < valueBuckets.size < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturningSync031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturningSync031 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 10);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.deleteWithReturningSync(predicates, config);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync031 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans?.commit();
      console.log(TAG + "************* transDeleteWithReturningSync031 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_26900
     * @tc.name  transDeleteWithReturning032
     * @tc.desc  error columns
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning032 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      let trans = await rdbStore?.createTransaction(options);
      const config: relationalStore.ReturningConfig = {
        columns: ['name?'],
        maxReturningCount: 5
      }
      try {
        await trans?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning032 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      try {
        trans?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturningSync032 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      await trans?.rollback();
      console.log(TAG + "************* transDeleteWithReturning032 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_27000
     * @tc.name  transDeleteWithReturning033
     * @tc.desc  errcode is 401
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transDeleteWithReturning033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning033 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name","zhangsan5")
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        trans?.deleteWithReturningSync(null, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning033 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.deleteWithReturningSync(undefined, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning033 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.deleteWithReturning(undefined, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning033 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.deleteWithReturning(null, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning033 failed4. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.deleteWithReturningSync(predicates, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning033 failed5. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.deleteWithReturningSync(predicates, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning033 failed6. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.deleteWithReturning(predicates, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning033 failed7. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.deleteWithReturning(predicates, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning033 failed8. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturningSync032 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_27100
     * @tc.name   transDeleteWithReturning034
     * @tc.desc   errcode is 14800029
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('transDeleteWithReturning034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning034 start *************");
      await rdbStore?.execute(CREATE_TABLE_TEST2);
      await rdbStore?.execute(CREATE_TRIGGER1);
      const valueBucket: relationalStore.ValuesBucket = { 'name': 'A' };
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 0; i < 512; ++i) {
        valueBuckets.push(valueBucket);
      }
      await rdbStore?.batchInsert('test', valueBuckets);
      await rdbStore?.execute("PRAGMA max_page_count = 1;");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'A');
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: undefined
      }
      let trans = await rdbStore?.createTransaction(options);
      await trans?.execute("PRAGMA max_page_count = 1;");
      try {
        trans?.deleteWithReturningSync(predicates, config);
        console.log(TAG + "transDeleteWithReturning034 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning034 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      try {
        await trans?.deleteWithReturning(predicates, config);
        console.log(TAG + "transDeleteWithReturning034 success2");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning034 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      await rdbStore?.execute(DROP_TRIGGER1);
      await rdbStore?.execute(DROP_TABLE_TEST2);
      console.log(TAG + "************* transDeleteWithReturning034 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_27200
     * @tc.name   transDeleteWithReturning035
     * @tc.desc   errcode is 14800033
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('transDeleteWithReturning035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning035 start *************");
      await rdbStore?.execute(CREATE_TABLE_TEST2);
      await rdbStore?.execute(CREATE_TRIGGER2);
      let predicates = new relationalStore.RdbPredicates("test");
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: undefined
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        trans?.deleteWithReturningSync(predicates, config);
        console.log(TAG + "transDeleteWithReturning035 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning035 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033)
      }
      try {
        await trans?.deleteWithReturning(predicates, config);
        console.log(TAG + "transDeleteWithReturning035 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning035 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033)
      }
      await trans?.rollback();
      await rdbStore?.execute(DROP_TRIGGER1);
      await rdbStore?.execute(DROP_TABLE_TEST2);
      console.log(TAG + "************* transDeleteWithReturning035 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_27300
     * @tc.name   transDeleteWithReturning036
     * @tc.desc   errcode is 14800025
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('transDeleteWithReturning036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transDeleteWithReturning036 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: undefined
      }
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan'
      }
      const STOTE_CONFIG1: relationalStore.StoreConfig = {
        name: dbName,
        securityLevel: relationalStore.SecurityLevel.S1,
        persist: false
      }
      rdbStore = await relationalStore.getRdbStore(context, STOTE_CONFIG1);
      await rdbStore?.executeSql(CREATE_TABLE_TEST);
      let deferredTrans = await rdbStore?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      let trans = await rdbStore?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      })
      await deferredTrans?.insert("test",valueBucket);
      try {
        trans?.deleteWithReturningSync(predicates, config);
        console.log(TAG + "transDeleteWithReturning036 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning036 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025)
      }
      try {
        await trans?.deleteWithReturning(predicates, config);
        console.log(TAG + "transDeleteWithReturning036 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `transDeleteWithReturning036 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025)
      }
      await deferredTrans?.rollback();
      await trans?.rollback();
      console.log(TAG + "************* transDeleteWithReturning036 end *************");
      done();
    })
  })
}