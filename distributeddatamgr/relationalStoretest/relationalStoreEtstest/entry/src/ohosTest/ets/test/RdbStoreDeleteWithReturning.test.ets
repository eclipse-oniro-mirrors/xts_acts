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

const DROP_TABLE_TEST1 = "DROP TABLE IF EXISTS test1";
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
const FOREIGN_KEYS_ON = "PRAGMA foreign_keys = ON;";
const FOREIGN_KEYS_OFF = "PRAGMA foreign_keys = OFF;";

const dbName = "DeleteRdbStore.db";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
}

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const dbPath = context.databaseDir + "/rdb/" + dbName;
const dbPathWal = dbPath + "-wal";
const dbPathShm = dbPath + "-shm";

function getRowCount(resultSet:relationalStore.LiteResultSet|undefined):number {
  let count = 0;
  while(resultSet?.goToNextRow()) {
    count++;
  }
  return count;
}

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
  let dbPath = context.databaseDir + "/rdb/" + STORE_CONFIG.name;
  let dbPathWal = dbPath + "-wal";
  let dbPathShm = dbPath + "-shm";
  await corruptDatabaseFile(dbPath);
  await corruptDatabaseFile(dbPathWal);
  await corruptDatabaseFile(dbPathShm);
}

export default function RdbStoreDeleteWithReturning() {
  describe('rdbStoreDeleteWithReturning', () => {
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
      console.log(TAG + "results?.changed" + results?.changed);
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
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_4500
     * @tc.name deleteWithReturning001
     * @tc.desc Values is normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deleteWithReturning001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning001 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan1');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        let results = await rdbStore?.deleteWithReturning(predicates, config);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan1");
        expect(results?.resultSet.getRow().age).assertEqual(19);
      } catch (e) {
        console.error(TAG + `deleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturning001 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_4600
     * @tc.name deleteWithReturningSync002
     * @tc.desc Values is normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deleteWithReturningSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturningSync002 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        let results = rdbStore?.deleteWithReturningSync(predicates, config);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan4");
        expect(results?.resultSet.getRow().age).assertEqual(22);
        expect(results?.resultSet.goToNextRow()).assertFalse();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync002 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturningSync002 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_4700
     * @tc.name deleteWithReturning003
     * @tc.desc The tableName is wrong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deleteWithReturning003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning003 start *************");
      let predicates = new relationalStore.RdbPredicates("wrongTableName");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning003 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync003 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      console.log(TAG + "************* deleteWithReturning003 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_4800
     * @tc.name deleteWithReturning005
     * @tc.desc There are spaces in the table name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deleteWithReturning005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning005 start *************");
      let predicates = new relationalStore.RdbPredicates("test test1");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning005 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync005 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* deleteWithReturning005 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_4900
     * @tc.name deleteWithReturning006
     * @tc.desc  0 < values.size <= 1024, The returned results can contain all the changed data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deleteWithReturning006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning006 start *************");
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
      let results = await rdbStore?.batchInsertWithReturning("test", valueBuckets, config);
      expect(results?.changed).assertEqual(1014);
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.contains('name', 'zhangsan');
      try {
        let result = await rdbStore?.deleteWithReturning(predicates, config);
        expect(result?.changed).assertEqual(1024);
        expect(getRowCount(result?.resultSet)).assertEqual(1024);
      } catch (e) {
        console.error(TAG + `deleteWithReturning006 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturning006 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_5000
     * @tc.name deleteWithReturningSync006
     * @tc.desc 0 < values.size <= 1024, The returned results can contain all the changed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deleteWithReturningSync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturningSync006 start *************");
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
      let results = await rdbStore?.batchInsertWithReturning("test", valueBuckets, config);
      expect(results?.changed).assertEqual(1014);
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.contains('name', 'zhangsan');
      try {
        let result = rdbStore?.deleteWithReturningSync(predicates, config);
        expect(result?.changed).assertEqual(1024);
        expect(getRowCount(result?.resultSet)).assertEqual(1024);
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync006 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturningSync006 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_5100
     * @tc.name deleteWithReturning007
     * @tc.desc values.size > 1024, The returned results contains only 1024 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deleteWithReturning007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning007 start *************");
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
      let results = await rdbStore?.batchInsertWithReturning("test", valueBuckets, config);
      expect(results?.changed).assertEqual(1090);
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.contains('name', 'zhangsan');
      try {
        let results = await rdbStore?.deleteWithReturning(predicates, config);
        expect(results?.changed).assertEqual(1100);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
      } catch (e) {
        console.error(TAG + `deleteWithReturning007 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturning007 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_5200
     * @tc.name  deleteWithReturningSync007
     * @tc.desc  values.size > 1024, The returned results contains only 1024 entries
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('deleteWithReturningSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturningSync007 start *************");
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
      let results = await rdbStore?.batchInsertWithReturning("test", valueBuckets, config);
      expect(results?.changed).assertEqual(1090);
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.contains('name', 'zhangsan');
      try {
        let result = rdbStore?.deleteWithReturningSync(predicates, config);
        expect(result?.changed).assertEqual(1100);
        expect(getRowCount(result?.resultSet)).assertEqual(1024);
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync007 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturningSync007 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_5300
     * @tc.name  deleteWithReturning008
     * @tc.desc  1 < columns.size <= 4, Return the results of the specified field.
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('deleteWithReturning008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning008 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age','salary'],
      }
      try {
        let results = await rdbStore?.deleteWithReturning(predicates, config);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan4");
        expect(results?.resultSet.getRow().age).assertEqual(22);
      } catch (e) {
        console.error(TAG + `deleteWithReturning008 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturning008 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_5400
     * @tc.name  deleteWithReturningSync008
     * @tc.desc  1 < columns.size <= 4, Return the results of the specified field.
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('deleteWithReturningSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturningSync008 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age','salary'],
      }
      try {
        let results = rdbStore?.deleteWithReturningSync(predicates, config);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan5");
        expect(results?.resultSet.getRow().age).assertEqual(23);
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync008 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturningSync008 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_5500
     * @tc.name  deleteWithReturning009
     * @tc.desc  columns.size == 0, errCode 14800001.
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('deleteWithReturning009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning009 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: [],
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning009 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync009 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* deleteWithReturning009 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_5600
     * @tc.name  deleteWithReturning010
     * @tc.desc  columns.size > 4, Throwing an error.
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('deleteWithReturning010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning010 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age', 'salary', 'data', 'blobType'],
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning010 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync010 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* deleteWithReturning010 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_5700
     * @tc.name  deleteWithReturning011
     * @tc.desc  columns contain special characters: "*"," ",","
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('deleteWithReturning011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning011 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['ab*'],
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning011 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync011 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ['a b'];
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning011 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ['a,b'];
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning011 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* deleteWithReturning011 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_5800
     * @tc.name  deleteWithReturning012
     * @tc.desc  Violation of constraint foreign key
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('deleteWithReturning012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning012 start *************");
      await rdbStore?.executeSql(FOREIGN_KEYS_ON);
      let predicates = new relationalStore.RdbPredicates("test1");
      predicates.equalTo('test_id', 1);
      const config: relationalStore.ReturningConfig = {
        columns: ['test_name'],
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        await rdbStore?.executeSql(FOREIGN_KEYS_OFF);
        console.error(TAG + `deleteWithReturning012 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      await rdbStore?.executeSql(FOREIGN_KEYS_OFF);
      await rdbStore?.executeSql(FOREIGN_KEYS_ON);
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        await rdbStore?.executeSql(FOREIGN_KEYS_OFF);
        expect(true).assertFail();
      } catch (e) {
        await rdbStore?.executeSql(FOREIGN_KEYS_OFF);
        console.error(TAG + `deleteWithReturningSync012 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      await rdbStore?.executeSql(FOREIGN_KEYS_OFF);
      console.log(TAG + "************* deleteWithReturning012 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_5900
     * @tc.name  deleteWithReturning013
     * @tc.desc  Normal parameters, rdb already close
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('deleteWithReturning013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning013 start *************");
      let rdbStore1: relationalStore.RdbStore | undefined = undefined;
      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: "rdbtest.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore1?.close();
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore1?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning013 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      try {
        rdbStore1?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync013 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      console.log(TAG + "************* deleteWithReturning013 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_6000
     * @tc.name   deleteWithReturning014
     * @tc.desc   Abnormal parameters, rdb already close
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning014 start *************");
      let rdbStore1: relationalStore.RdbStore | undefined = undefined;
      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: "rdbtest.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore1?.close();
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age', '*'],
      }
      try {
        await rdbStore1?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning014 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      try {
        rdbStore1?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync014 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      console.log(TAG + "************* deleteWithReturning014 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_6100
     * @tc.name   deleteWithReturning015
     * @tc.desc   Database corruption
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning015 start *************");
      await createCorruptDb();
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning015 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync015 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      console.log(TAG + "************* deleteWithReturning015 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_6200
     * @tc.name   deleteWithReturning016
     * @tc.desc   The database file is locked
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning016 start *************");
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
      await deferredTrans?.insert("test", valueBucket);
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning016 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync016 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      await deferredTrans?.rollback();
      console.log(TAG + "************* deleteWithReturning016 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_6300
     * @tc.name   deleteWithReturning017
     * @tc.desc   illegal table name
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning017 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        let predicates1 = new relationalStore.RdbPredicates("123test");
        await rdbStore?.deleteWithReturning(predicates1, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning017 1 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        let predicates2 = new relationalStore.RdbPredicates("345test");
        rdbStore?.deleteWithReturningSync(predicates2, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning017 2 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates3 = new relationalStore.RdbPredicates("te.s.t");
      try {
        await rdbStore?.deleteWithReturning(predicates3, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning017 3 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates3, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning017 4 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates5 = new relationalStore.RdbPredicates(".test");
      try {
        await rdbStore?.deleteWithReturning(predicates5, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning017 5 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates5, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning017 6 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates7 = new relationalStore.RdbPredicates("test..");
      try {
        await rdbStore?.deleteWithReturning(predicates7, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning017 7 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates7, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning017 8 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* deleteWithReturning017 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_6400
     * @tc.name   deleteWithReturning018
     * @tc.desc   maxReturningCount <= 0 || maxReturningCount > 0x7ffe
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning018 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
        maxReturningCount: -2
      }
      let predicates = new relationalStore.RdbPredicates("test");
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning018 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync018 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0;
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning018 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync018 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0x7fff;
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning018 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync018 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* deleteWithReturning018 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_6500
     * @tc.name   deleteWithReturning019
     * @tc.desc   valueBuckets.size < maxReturningCount < 0x7FFF
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning019 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 2);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      try {
        let results = await rdbStore?.deleteWithReturning(predicates, config);
        expect(results?.changed).assertEqual(2);
        expect(getRowCount(results?.resultSet)).assertEqual(2);
      } catch (e) {
        console.error(TAG + `deleteWithReturning019 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturning019 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_6600
     * @tc.name   deleteWithReturningSync019
     * @tc.desc   valueBuckets.size < maxReturningCount < 0x7FFF
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturningSync019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturningSync019 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 2);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      try {
        let results = rdbStore?.deleteWithReturningSync(predicates, config);
        expect(results?.changed).assertEqual(2);
        expect(getRowCount(results?.resultSet)).assertEqual(2);
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync019 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturningSync019 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_6700
     * @tc.name   deleteWithReturning020
     * @tc.desc   maxReturningCount < valueBuckets.size < 0x7FFF
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning020 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 10);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      try {
        let results = await rdbStore?.deleteWithReturning(predicates, config);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
      } catch (e) {
        console.error(TAG + `deleteWithReturning020 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturning020 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_6800
     * @tc.name   deleteWithReturningSync020
     * @tc.desc   maxReturningCount < valueBuckets.size < 0x7FFF
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturningSync020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturningSync020 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 10);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      try {
        let results = rdbStore?.deleteWithReturningSync(predicates, config);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync020 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* deleteWithReturningSync020 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_6900
     * @tc.name   deleteWithReturning021
     * @tc.desc   error columns
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning021 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      const config: relationalStore.ReturningConfig = {
        columns: ['name?'],
        maxReturningCount: 5
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning021 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturningSync021 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      console.log(TAG + "************* deleteWithReturning021 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_7000
     * @tc.name   deleteWithReturning022
     * @tc.desc   errcode is 401
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning022 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      try {
        await rdbStore?.deleteWithReturning(null, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning022 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await rdbStore?.deleteWithReturning(undefined, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning023 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.deleteWithReturningSync(null, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning027 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.deleteWithReturningSync(undefined, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning027 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      console.log(TAG + "************* deleteWithReturning022 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_7100
     * @tc.name   deleteWithReturning024
     * @tc.desc   errcode is 401
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning024 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      try {
        await rdbStore?.deleteWithReturning(predicates, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning024 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning024 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning024 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning024 failed4. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      console.log(TAG + "************* deleteWithReturning024 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_7200
     * @tc.name   deleteWithReturning026
     * @tc.desc   maxReturningCount is undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning026 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: undefined
      }
      try {
        let results = await rdbStore?.deleteWithReturning(predicates, config);
        console.log(TAG + "results?.changed" + results?.changed);
        expect(results?.changed).assertEqual(10);
      } catch (e) {
        console.error(TAG + `deleteWithReturning026 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      console.log(TAG + "************* deleteWithReturning026 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_7300
     * @tc.name   deleteWithReturning031
     * @tc.desc   maxReturningCount is undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning031 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: undefined
      }
      try {
        let results = rdbStore?.deleteWithReturningSync(predicates, config);
        console.log(TAG + "results?.changed" + results?.changed);
        expect(results?.changed).assertEqual(10);
      } catch (e) {
        console.error(TAG + `deleteWithReturning031 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      console.log(TAG + "************* deleteWithReturning031 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_7400
     * @tc.name   deleteWithReturning032
     * @tc.desc   errcode is 14800029
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning032 start *************");
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
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        console.log(TAG + "deleteWithReturning032 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning032 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        console.log(TAG + "deleteWithReturning032 success2");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning032 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      await rdbStore?.execute(DROP_TRIGGER1);
      await rdbStore?.execute(DROP_TABLE_TEST2);
      console.log(TAG + "************* deleteWithReturning032 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_7500
     * @tc.name   deleteWithReturning033
     * @tc.desc   errcode is 14800033
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning033 start *************");
      await rdbStore?.execute(CREATE_TABLE_TEST2);
      await rdbStore?.execute(CREATE_TRIGGER2);
      let predicates = new relationalStore.RdbPredicates("test");
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: undefined
      }
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        console.log(TAG + "deleteWithReturning033 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning033 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033)
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        console.log(TAG + "deleteWithReturning033 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning033 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033)
      }
      await rdbStore?.execute(DROP_TRIGGER1);
      await rdbStore?.execute(DROP_TABLE_TEST2);
      console.log(TAG + "************* deleteWithReturning033 end *************");
      done();
     })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_7600
     * @tc.name   deleteWithReturning034
     * @tc.desc   errcode is 14800025
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('deleteWithReturning034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* deleteWithReturning034 start *************");
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
      let rdbStore: relationalStore.RdbStore | undefined = undefined;
      rdbStore = await relationalStore.getRdbStore(context, STOTE_CONFIG1);
      await rdbStore?.executeSql(CREATE_TABLE_TEST);
      let deferredTrans = await rdbStore?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      await deferredTrans?.insert("test",valueBucket);
      try {
        rdbStore?.deleteWithReturningSync(predicates, config);
        console.log(TAG + "deleteWithReturning034 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning034 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025)
      }
      try {
        await rdbStore?.deleteWithReturning(predicates, config);
        console.log(TAG + "deleteWithReturning034 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `deleteWithReturning034 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025)
      }
      await deferredTrans?.rollback();
      await rdbStore?.close();
      console.log(TAG + "************* deleteWithReturning034 end *************");
      done();
    })
  })
}