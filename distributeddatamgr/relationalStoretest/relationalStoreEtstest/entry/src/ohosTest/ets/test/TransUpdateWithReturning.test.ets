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
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "data ASSET, " + "data1 ASSETS," + "blobType BLOB)";

const dbName = "UpdateTrans.db";
const dbName1 = "UpdateTransCorrupt.db";
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

export default function TransUpdateWithReturning() {
  describe('TransUpdateWithReturning', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      expect(rdbStore != undefined).assertTrue();
      await rdbStore?.executeSql(CREATE_TABLE_TEST);
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      const num = 10;
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
          'data': asset
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
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_27400
     * @tc.name  updateWithReturning001
     * @tc.desc  Values is normal
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* updateWithReturning001 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 20,
        'salary': 25000.5,
      };
      let trans = await rdbStore?.createTransaction(options);
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan1');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        let results = await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("lisi");
        expect(results?.resultSet.getRow().age).assertEqual(20);
        expect(results?.resultSet.goToNextRow()).assertFalse();
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning001 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_27500
     * @tc.name  updateWithReturningSync001
     * @tc.desc  Values is normal
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync001 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 20,
        'salary': 25000.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("lisi");
        expect(results?.resultSet.getRow().age).assertEqual(20);
        expect(results?.resultSet.goToNextRow()).assertFalse();
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }

      console.log(TAG + "************* updateWithReturningSync001 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_27600
     * @tc.name  updateWithReturning002
     * @tc.desc  Values is empty
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* updateWithReturning002 start *************");
      const valueBucket: relationalStore.ValuesBucket = {};
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning002 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_27700
     * @tc.name  updateWithReturning003
     * @tc.desc  The tableName is wrong
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* updateWithReturning003 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      let predicates = new relationalStore.RdbPredicates("wrongTableName");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning003 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_27800
     * @tc.name  updateWithReturning005
     * @tc.desc  There are spaces in the table name
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning005 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      let predicates = new relationalStore.RdbPredicates("test test1");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning005 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync005 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning005 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_27900
     * @tc.name  updateWithReturning006
     * @tc.desc  values.size > 1024, The returned results contains only 1024 entries
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning006 start *************");
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
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 18,
        'salary': 25000.5,
      };
      try {
        let results = await trans?.updateWithReturning(valueBucket1, predicates, config);
        expect(results?.changed).assertEqual(1100);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }

      console.log(TAG + "************* updateWithReturning006 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_28000
     * @tc.name  updateWithReturningSync006
     * @tc.desc  values.size > 1024, The returned results contains only 1024 entries
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync006 start *************");
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
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 18,
        'salary': 25000.5,
      };
      try {
        let results = trans?.updateWithReturningSync(valueBucket1, predicates, config);
        expect(results?.changed).assertEqual(1100);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync006 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_28100
     * @tc.name  updateWithReturning007
     * @tc.desc  0 < values.size <= 1024, The returned results can contain all the changed data
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning007 start *************");
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
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 18,
        'salary': 25000.5,
      };
      try {
        let result = await trans?.updateWithReturning(valueBucket1, predicates, config);
        expect(result?.changed).assertEqual(1024);
        expect(getRowCount(result?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning007 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_28200
     * @tc.name  updateWithReturningSync007
     * @tc.desc  0 < values.size <= 1024, The returned results can contain all the changed data
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync007 start *************");
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
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 18,
        'salary': 25000.5,
      };
      try {
        let results = trans?.updateWithReturningSync(valueBucket1, predicates, config);
        expect(results?.changed).assertEqual(1024);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync007 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_28300
     * @tc.name  updateWithReturning008
     * @tc.desc  1 < columns.size <= 4, Return the results of the specified field
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning008 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'id': 12,
        'name': 'lisi',
        'age': 20,
        'salary': 25100.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['id','name', 'age', 'salary'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.updateWithReturning(valueBucket, predicates, config);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("lisi");
        expect(results?.resultSet.getRow().age).assertEqual(20);
        expect(results?.resultSet.goToNextRow()).assertFalse();
        results?.resultSet.close();
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning008 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_28400
     * @tc.name  updateWithReturningSync008
     * @tc.desc  1 < columns.size <= 4, Return the results of the specified field
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync008 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'id': 12,
        'name': 'lisi',
        'age': 21,
        'salary': 25010.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age', 'salary'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.updateWithReturningSync(valueBucket, predicates, config);
        console.log(TAG + "results?.changed" + results?.changed);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("lisi");
        expect(results?.resultSet.getRow().age).assertEqual(21);
        expect(results?.resultSet.goToNextRow()).assertFalse();
        results?.resultSet.close();
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync008 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_28500
     * @tc.name  updateWithReturning009
     * @tc.desc  columns.size == 0, errCode 14800001
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning009 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: [],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning009 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning009Sync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning009 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_28600
     * @tc.name  updateWithReturning010
     * @tc.desc  columns.size > 4, Throwing an error
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning010 start *************");
      const asset: relationalStore.Asset = {
        name: "example-image.jpg",
        uri: "content://media/external/images/media/12345",
        path: "/storage/emulated/0/Pictures/example-image.jpg",
        createTime: "2024-01-15T10:30:00Z",
        modifyTime: "2024-01-15T14:45:23Z",
        size: "2048576"
      }
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
        'data': asset,
        'blobType': new Uint8Array([1, 2, 3])
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age', 'salary', 'data', 'blobType'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning010 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync010 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning010 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_28700
     * @tc.name  updateWithReturning011
     * @tc.desc  columns contain special characters: "*"," ",","
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning011 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['ab*'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning011 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync011 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ['a b'];
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning011 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync011 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ['a,b'];
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning011 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync011 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning011 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_28800
     * @tc.name  updateWithReturning012
     * @tc.desc  Do not transmit conflict, handle according to the default conflict resolution mode
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning012 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': null,
        'age': 18,
        'salary': 25000.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan1');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning012 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync012 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning012 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_28900
     * @tc.name  updateWithReturning013
     * @tc.desc  Conflict is null, handle according to the default conflict resolution mode
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning013 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': null,
        'age': 18,
        'salary': 25000.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning013 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync013 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning013 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_29000
     * @tc.name  updateWithReturning014
     * @tc.desc   Conflict is undefined, handle according to the default conflict resolution mode
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning014 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': null,
        'age': 18,
        'salary': 25000.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning014 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_29100
     * @tc.name   updateWithReturning015
     * @tc.desc   Conflict is ON_CONFLICT_REPLACE
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning015 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'id': 1,
        'name': 'lisi',
        'age': 20,
        'salary': 25000.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.updateWithReturning(valueBucket, predicates, config,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().id).assertEqual(1);
        expect(results?.resultSet.getRow().name).assertEqual("lisi");
        expect(results?.resultSet.getRow().age).assertEqual(20);
        expect(results?.resultSet.goToNextRow()).assertFalse();
        let res = await trans?.querySql("SELECT * FROM test Where id = 1");
        res?.goToNextRow();
        const name3 = res?.getString(res.getColumnIndex('name'));
        expect(name3).assertEqual("lisi");
      } catch (e) {
        console.error(TAG + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans?.commit();
      console.log(TAG + "************* updateWithReturning015 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_29200
     * @tc.name   updateWithReturningSync015
     * @tc.desc   Conflict is ON_CONFLICT_IGNORE
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturningSync015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync015 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'id': 1,
        'name': 'lisi',
        'age': 20,
        'salary': 25000.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.updateWithReturningSync(valueBucket, predicates, config,
          relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        expect(getRowCount(results?.resultSet)).assertEqual(0);
        expect(results?.changed).assertEqual(0);
        let res = await trans?.querySql("SELECT * FROM test Where id = 1");
        res?.goToNextRow();
        const name = res?.getString(res.getColumnIndex('name'));
        expect(name != "lisi").assertTrue();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans?.commit();
      console.log(TAG + "************* updateWithReturningSync015 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_29300
     * @tc.name   updateWithReturning016
     * @tc.desc   Normal parameters, rdb already close
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning016 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      let trans = await rdbStore?.createTransaction(options);
      await trans?.commit();
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      console.log(TAG + "************* updateWithReturning016 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_29400
     * @tc.name   updateWithReturning017
     * @tc.desc   Abnormal parameters, rdb already close
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning017 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      let trans = await rdbStore?.createTransaction(options);
      await trans?.commit();
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age', '*'],
      }
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning017 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync017 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* updateWithReturning017 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_29500
     * @tc.name   updateWithReturning018
     * @tc.desc   Database corruption
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning018 start *************");
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
          'data': asset
        };
        valueBuckets.push(valueBucket);
      }
      const config1: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let results = await rdbStoreCorrupt?.batchInsertWithReturning("test", valueBuckets, config1);
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStoreCorrupt?.createTransaction(options);
      await createCorruptDb();
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning018 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync018 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      await rdbStoreCorrupt?.close();
      await relationalStore.deleteRdbStore(context,STORE_CONFIG1);
      console.log(TAG + "************* updateWithReturning018 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_29600
     * @tc.name   updateWithReturning020
     * @tc.desc   The database file is locked
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning020 start *************");
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
      let trans =  await rdbStore?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      await deferredTrans?.insert("test", valueBucket);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning020 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync020 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      await deferredTrans?.commit();
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning020 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_29700
     * @tc.name   updateWithReturning025
     * @tc.desc   The Database is full
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning025 start *************");
      let options: relationalStore.TransactionOptions = {
        transactionType: relationalStore.TransactionType.IMMEDIATE
      }
      let trans = await rdbStore?.createTransaction(options);
      await trans?.execute("PRAGMA max_page_count = 256;");
      let u8 = new Uint8Array(Array(1024 * 1024).fill(1));
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 18,
        'salary': 25000.5,
        'blobType': u8
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning025 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync025 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning025 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_29800
     * @tc.name   updateWithReturning027
     * @tc.desc   Violation of constraints
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning027 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "name": null,
        "age": 18,
        "salary": 100.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning027 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync027 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning027 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_29900
     * @tc.name   updateWithReturning028
     * @tc.desc   Data type error
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning028 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": 18,
        "age": new Uint8Array([1, 2, 3]),
        "salary": "100.5",
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning028 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync028 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning028 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_30000
     * @tc.name   updateWithReturning030
     * @tc.desc   There are duplicate assets in the values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning030 start *************");
      const asset1: relationalStore.Asset = {
        name: "example-image.jpg",
        uri: "content://media/external/images/media/12345",
        path: "/storage/emulated/0/Pictures/example-image.jpg",
        createTime: "2024-01-15T10:30:00Z",
        modifyTime: "2024-01-15T14:45:23Z",
        size: "2048576"
      }
      const asset2: relationalStore.Asset = {
        name: "example-image.jpg",
        uri: "content://media/external/images/media/12345",
        path: "/storage/emulated/0/Pictures/example-image.jpg",
        createTime: "2024-01-15T10:30:00Z",
        modifyTime: "2024-01-15T14:45:23Z",
        size: "2048576"
      }
      let assets: relationalStore.Assets = [asset1, asset2];
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 30,
        'salary': 55000.5,
        'data1': assets,
        'blobType': new Uint8Array([1, 2, 3])
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning30 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync030 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning030 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_30100
     * @tc.name   updateWithReturning031
     * @tc.desc   illegal table name
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning031 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      let trans = await rdbStore?.createTransaction(options);
      try {
        let predicates1 = new relationalStore.RdbPredicates("123test");
        await trans?.updateWithReturning(valueBucket, predicates1, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 1 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        let predicates2 = new relationalStore.RdbPredicates("345test");
        trans?.updateWithReturningSync(valueBucket, predicates2, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 2 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates3 = new relationalStore.RdbPredicates("te.s.t");
      try {
        await trans?.updateWithReturning(valueBucket, predicates3, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 3 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates3, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 4 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates5 = new relationalStore.RdbPredicates(".test");
      try {
        await trans?.updateWithReturning(valueBucket, predicates5, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 5 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates5, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 6 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates7 = new relationalStore.RdbPredicates("test..");
      try {
        await trans?.updateWithReturning(valueBucket, predicates7, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 7 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates7, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 8 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning031 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_30200
     * @tc.name   updateWithReturning032
     * @tc.desc   maxReturningCount <= 0 || maxReturningCount > 0x7ffe
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning032 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
        maxReturningCount: -2
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      let predicates = new relationalStore.RdbPredicates("test");
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning032 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync032 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0;
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning032 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync032 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0x7fff;
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning032 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync032 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning032 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_30300
     * @tc.name   updateWithReturning033
     * @tc.desc   valueBuckets.size < maxReturningCount < 0x7FFF
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning033 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 2);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(2);
        expect(getRowCount(results?.resultSet)).assertEqual(2);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturning033 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning033 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_30400
     * @tc.name   updateWithReturningSync033
     * @tc.desc   valueBuckets.size < maxReturningCount < 0x7FFF
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturningSync033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync033 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 2);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(2);
        expect(getRowCount(results?.resultSet)).assertEqual(2);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync033 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync033 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_30500
     * @tc.name   updateWithReturning034
     * @tc.desc   maxReturningCount < valueBuckets.size < 0x7FFF
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning034 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 10);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturning034 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning034 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_30600
     * @tc.name   updateWithReturningSync034
     * @tc.desc   maxReturningCount < valueBuckets.size < 0x7FFF
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturningSync034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync034 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 10);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync034 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync034 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_30700
     * @tc.name   updateWithReturning035
     * @tc.desc   error columns
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('updateWithReturning035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning035 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      const config: relationalStore.ReturningConfig = {
        columns: ['name?'],
        maxReturningCount: 5
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning035 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync035 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      await trans?.rollback();
      console.log(TAG + "************* updateWithReturning035 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_30800
     * @tc.name  updateWithReturning036
     * @tc.desc  valueBucket is null/undefined
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* updateWithReturning036 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name","zhangsan5")
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        trans?.updateWithReturningSync(null, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.updateWithReturningSync(undefined, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.updateWithReturning(null, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.updateWithReturning(undefined, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed4. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, null, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed5. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, undefined, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed6. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.updateWithReturning(valueBucket, undefined, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed7. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.updateWithReturning(valueBucket, null, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed8. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed6. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed6. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.updateWithReturning(valueBucket, predicates, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed7. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.updateWithReturning(valueBucket, predicates, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning036 failed8. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturningSync032 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_30900
     * @tc.name  transBatchInsertWithReturning033
     * @tc.desc  errcode is 14800025
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning033 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      const STORE_CONFIG1: relationalStore.StoreConfig = {
        name: dbName,
        securityLevel: relationalStore.SecurityLevel.S1,
        persist: false
      }
      let rdbStore: relationalStore.RdbStore | undefined = undefined;
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore?.executeSql(CREATE_TABLE_TEST);
      let deferredTrans = await rdbStore?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      await deferredTrans?.insert("test",valueBucket);
      let trans = await rdbStore?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      try {
        await trans?.updateWithReturning(valueBucket, predicates, config, undefined);
        console.log(TAG + "transBatchInsertWithReturning033 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning033 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025)
      }
      try {
        trans?.updateWithReturningSync(valueBucket, predicates, config, undefined);
        console.log(TAG + "transBatchInsertWithReturning033 success2");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning033 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025)
      }
      await deferredTrans?.rollback();
      await trans?.rollback();
      await rdbStore?.close();
      console.log(TAG + "************* updateWithReturning034 end *************");
      done();
    })
  })
}