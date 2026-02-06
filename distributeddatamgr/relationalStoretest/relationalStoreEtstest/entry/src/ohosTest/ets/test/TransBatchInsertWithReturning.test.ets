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

const dbName = "BachInsertTrans.db";
const dbName1 = "BachInsertTransCorrupt.db";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
}
const STORE_CONFIG1: relationalStore.StoreConfig = {
  name: dbName1,
  securityLevel: relationalStore.SecurityLevel.S1,
}
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const dbPath = context.databaseDir + "/rdb/" + dbName;
const dbPathWal = dbPath + "-wal";
const dbPathShm = dbPath + "-shm";

let options: relationalStore.TransactionOptions = {
  transactionType: relationalStore.TransactionType.IMMEDIATE
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

export default function TransBatchInsertWithReturning() {
  describe('TransBatchInsertWithReturning', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      expect(rdbStore != undefined).assertTrue();
      await rdbStore?.executeSql(CREATE_TABLE_TEST);
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
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_20600
     * @tc.name  transBatchInsertWithReturning001
     * @tc.desc  empty table name
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning001 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      expect(trans != undefined).assertTrue();
      try {
        console.log(TAG + "************* transBatchInsertWithReturning001 11111 *************");
        await trans?.batchInsertWithReturning("", [valueBucket], config);
        console.log(TAG + "************* transBatchInsertWithReturning001 22222 *************");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning001 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync001 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning001 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_20700
     * @tc.name  transBatchInsertWithReturning002
     * @tc.desc  Incorrect table name
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning002 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning002 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      try {
        trans?.batchInsertWithReturningSync("test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync002 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning002 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_20800
     * @tc.name  transBatchInsertWithReturning003
     * @tc.desc  There are spaces in the table name
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning003 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning003 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync003 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning003 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_20900
     * @tc.name  transBatchInsertWithReturning004
     * @tc.desc  The values is an empty array
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning004 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning004 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync004 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning004 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_21000
     * @tc.name  transBatchInsertWithReturning005
     * @tc.desc  normal values
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning005 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction();
      try {
        let results = await trans?.batchInsertWithReturning("test", [valueBucket], config);
        console.info(TAG + `transBatchInsertWithReturning005 index ${results?.resultSet.getColumnIndex('name')}`);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan");
        expect(results?.resultSet.getRow().age).assertEqual(18);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning005 failed. code is ${e.code}, message is ${e.message}`);
        await trans?.rollback();
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturning005 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_21100
     * @tc.name  transBatchInsertWithReturningSync005
     * @tc.desc  normal values
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturningSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturningSync005 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan");
        expect(results?.resultSet.getRow().age).assertEqual(18);
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturningSync005 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturningSync005 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_21200
     * @tc.name  transBatchInsertWithReturning006
     * @tc.desc  There are duplicate assets in the values
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning006 start *************");
      const asset1: relationalStore.Asset = {
        name: "example-image.jpg",
        uri: "content://media/external/images/media/12345",
        path: "/storage/emulated/0/Pictures/example-image.jpg",
        createTime: "2024-01-15T10:30:00Z",
        modifyTime: "2024-01-15T14:45:23Z",
        size: "2048576"
      }
      let assets: relationalStore.Assets = [asset1, asset1];
      const valueBucket: relationalStore.ValuesBucket = {
        'data1': assets,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning006 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync006 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning006 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_21300
     * @tc.name  transBatchInsertWithReturning007
     * @tc.desc  1 < values.size <= 1024, The returned results can contain all the changed data
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning007 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 0; i < 1024; i++) {
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
      try {
        let results = await trans?.batchInsertWithReturning("test", valueBuckets, config);
        expect(results?.changed).assertEqual(1024);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning007 failed. code is ${e.code}, message is ${e.message}`);
        await trans?.rollback();
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturning007 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_21400
     * @tc.name  transBatchInsertWithReturningSync007
     * @tc.desc  1 < values.size <= 1024, The returned results can contain all the changed data
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturningSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturningSync007 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 0; i < 1024; i++) {
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
      try {
        let results = trans?.batchInsertWithReturningSync("test", valueBuckets, config);
        expect(results?.changed).assertEqual(1024);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturningSync007 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturningSync007 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_21500
     * @tc.name  transBatchInsertWithReturning008
     * @tc.desc  values.size > 1024, The returned results contains only 1024 entries
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning008 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 0; i < 1100; i++) {
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
      try {
        let results = await trans?.batchInsertWithReturning("test", valueBuckets, config);
        expect(results?.changed).assertEqual(1100);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturning008 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturning008 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_21600
     * @tc.name  transBatchInsertWithReturningSync008
     * @tc.desc  values.size > 1024, The returned results contains only 1024 entries
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturningSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturningSync008 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 0; i < 1100; i++) {
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
      try {
        let results = trans?.batchInsertWithReturningSync("test", valueBuckets, config);
        expect(results?.changed).assertEqual(1100);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturningSync008 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturningSync008 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_21700
     * @tc.name  transBatchInsertWithReturning009
     * @tc.desc  1 < columns.size <= 4, Return the results of the specified field
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning009 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age','salary'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.batchInsertWithReturning("test", [valueBucket], config);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan");
        expect(results?.resultSet.getRow().age).assertEqual(18);
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturning009 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturning009 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_21800
     * @tc.name  transBatchInsertWithReturningSync009
     * @tc.desc  1 < columns.size <= 4, Return the results of the specified field
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturningSync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturningSync009 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age','salary'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan");
        expect(results?.resultSet.getRow().age).assertEqual(18);
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturningSync009 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturningSync009 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_21900
     * @tc.name  transBatchInsertWithReturning010
     * @tc.desc  columns.size == 0
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning010 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: [],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning010 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync010 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning010 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_22000
     * @tc.name  transBatchInsertWithReturning011
     * @tc.desc  columns.size > 4, Throwing an error
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning011',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning011 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age', 'salary', 'data', 'blobType'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync011 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning011 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_22100
     * @tc.name  transBatchInsertWithReturning012
     * @tc.desc  columns contain special characters: "*"," ",","
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning012 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['ab*'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning012 failed 1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning012 failed 1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ["a b"];
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning012 failed 2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync012 failed 2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ["a,b"];
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning012 failed 3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync012 failed 3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning012 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_22200
     * @tc.name  transBatchInsertWithReturning013
     * @tc.desc  Do not transmit conflict, handle according to the default conflict resolution mode
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning013 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        id: 1,
        name: 'zhangsan',
        age: 18,
      };
      await rdbStore?.insert("test", valueBucket);
      valueBucket.name = "lisi";
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning013 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket, valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync013 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning013 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_22300
     * @tc.name  transBatchInsertWithReturning014
     * @tc.desc  Conflict is null, handle according to the default conflict resolution mode
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning014 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'id': 1,
        'name': 'zhangsan',
        'age': 18,
      };
      await rdbStore?.insert("test", valueBucket);
      valueBucket.name = "lisi";
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning014 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket, valueBucket], config, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync014 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning014 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_22400
     * @tc.name  transBatchInsertWithReturning015
     * @tc.desc  Conflict is undefined, handle according to the default conflict resolution mode
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning015 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'id': 1,
        'name': 'zhangsan',
        'age': 18,
      };
      await rdbStore?.insert("test", valueBucket);
      valueBucket.name = "lisi";
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket, valueBucket], config, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket, valueBucket], config, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync015 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning015 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_22500
     * @tc.name  transBatchInsertWithReturning016
     * @tc.desc  Conflict is ON_CONFLICT_REPLACE
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning016 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      const valueBucket1: relationalStore.ValuesBucket = {
        'id': 1,
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'id': 1,
        'name': 'lisi',
        'age': 20,
        'salary': 30000.5,
      };
      valueBuckets.push(valueBucket1);
      valueBuckets.push(valueBucket2);
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.batchInsertWithReturning("test", valueBuckets, config,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(results?.changed).assertEqual(2);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().id).assertEqual(1);
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan");
        expect(results?.resultSet.getRow().age).assertEqual(18);
        while (results?.resultSet.goToNextRow()) {
          expect(results?.resultSet.getRow().id).assertEqual(1);
          expect(results?.resultSet.getRow().name).assertEqual("lisi");
          expect(results?.resultSet.getRow().age).assertEqual(20);
        }
        let res = await trans?.querySql("SELECT * FROM test");
        expect(res?.rowCount).assertEqual(1);
        res?.goToNextRow();
        const name3 = res?.getString(res.getColumnIndex('name'));
        expect(name3).assertEqual("lisi");
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturning016 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturning016 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_22600
     * @tc.name  transBatchInsertWithReturningSync016
     * @tc.desc  Conflict is ON_CONFLICT_IGNORE
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturningSync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturningSync016 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      const valueBucket1: relationalStore.ValuesBucket = {
        'id': 1,
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'id': 1,
        'name': 'lisi',
        'age': 20,
        'salary': 30000.5,
      };
      valueBuckets.push(valueBucket1);
      valueBuckets.push(valueBucket2);
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.batchInsertWithReturningSync("test", valueBuckets, config,
          relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan");
        expect(results?.resultSet.getRow().age).assertEqual(18);
        expect(results?.resultSet.goToNextRow()).assertFalse();
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturningSync016 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturningSync016 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_22700
     * @tc.name  transBatchInsertWithReturning017
     * @tc.desc  Normal parameters, rdb already close
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning017 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      let trans = await rdbStore?.createTransaction(options);
      await trans?.commit();
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning017 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync017 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      console.log(TAG + "************* transBatchInsertWithReturning017 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_22800
     * @tc.name  transBatchInsertWithReturning018
     * @tc.desc  Abnormal parameters, rdb already close
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning018 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      let trans = await rdbStore?.createTransaction(options);
      await trans?.commit();
      const config: relationalStore.ReturningConfig = {
        columns: ['name?', 'age'],
      }
      try {
        await trans?.batchInsertWithReturning("test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning018 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      try {
        trans?.batchInsertWithReturningSync("test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync018 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      console.log(TAG + "************* transBatchInsertWithReturning018 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_22900
     * @tc.name  transBatchInsertWithReturning019
     * @tc.desc  Database corruption
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning019 start *************");
      let rdbStoreCorrupt: relationalStore.RdbStore | undefined = undefined;
      rdbStoreCorrupt = await relationalStore.getRdbStore(context,STORE_CONFIG1);
      await rdbStoreCorrupt?.executeSql(CREATE_TABLE_TEST);
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      let trans = await rdbStoreCorrupt?.createTransaction(options);
      await createCorruptDb();
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning019 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync019 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      await rdbStoreCorrupt?.close();
      await relationalStore.deleteRdbStore(context,STORE_CONFIG1);
      console.log(TAG + "************* transBatchInsertWithReturning019 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_23000
     * @tc.name  transBatchInsertWithReturning020
     * @tc.desc  Abnormal parameters, rdb already close
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning020 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      let trans = await rdbStore?.createTransaction(options);
      await trans?.commit();
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age*'],
      }
      try {
        trans?.batchInsertWithReturningSync("test test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync020 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        await trans?.batchInsertWithReturning("test test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning020 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* transBatchInsertWithReturning020 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_23100
     * @tc.name  transBatchInsertWithReturning021
     * @tc.desc  The database file is locked
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning021 start *************");
      let deferredTrans = await rdbStore?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 18,
        "salary": 100.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      await deferredTrans?.insert("test", valueBucket);
      try {   
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync021 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      await deferredTrans?.commit();
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning021 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_23200
     * @tc.name  transBatchInsertWithReturning022
     * @tc.desc  A table in the database is locked
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning022 start *************");
      const STORE_CONFIG1: relationalStore.StoreConfig = {
        name: dbName,
        securityLevel: relationalStore.SecurityLevel.S1,
        persist: false,
      }
      let rdb = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdb?.executeSql(CREATE_TABLE_TEST);
      let deferredTrans = await rdb?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 18,
        "salary": 100.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      await deferredTrans.insert("test", valueBucket);
      let trans = await rdb?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning022 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync022 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025);
      }
      await deferredTrans?.rollback();
      await trans?.rollback();
      await rdb?.close();
      await relationalStore.deleteRdbStore(context,STORE_CONFIG1);
      console.log(TAG + "************* transBatchInsertWithReturning022 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_23300
     * @tc.name  transBatchInsertWithReturning023
     * @tc.desc  The Database is full
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning023 start *************");
      let trans = await rdbStore?.createTransaction(options);
      await trans?.execute("PRAGMA max_page_count = 256;");
      let u8 = new Uint8Array(Array(1024 * 1024).fill(1));
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 0; i < 3; i++) {
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
          'age': 18 + i,
          'salary': 25000.5 + i,
          'blobType': u8
        };
        valueBuckets.push(valueBucket);
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await trans?.batchInsertWithReturning("test", valueBuckets, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning023 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      try {
        trans?.batchInsertWithReturningSync("test", valueBuckets, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync023 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning023 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_23400
     * @tc.name  transBatchInsertWithReturning024
     * @tc.desc  Violation of constraints
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning024 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "name": null,
        "age": 18,
        "salary": 100.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket, valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning024 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync024 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning024 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_23500
     * @tc.name  transBatchInsertWithReturning025
     * @tc.desc  Data type error
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning025 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": 18,
        "age": new Uint8Array([1, 2, 3]),
        "salary": "100.5",
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning025 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync026 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning025 end *************");
      done();
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_23600
     * @tc.name  transBatchInsertWithReturning027
     * @tc.desc  conflict: ON_CONFLICT_REPLACE, twice batchInsertWithReturning
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning027 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 30000.4,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        "id": 1,
        "name": "lisi",
        "age": 20,
        "salary": 40000.4,
      };
      const config1: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      const config2: relationalStore.ReturningConfig = {
        columns: ['name', 'age', 'id'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results1 = await trans?.batchInsertWithReturning("test", [valueBucket1], config1);
        expect(getRowCount(results1?.resultSet)).assertEqual(1);
        expect(results1?.changed).assertEqual(1);
        let results2 = await trans?.batchInsertWithReturning("test", [valueBucket2], config2,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(results2?.changed).assertEqual(1);
        results2?.resultSet.goToNextRow();
        expect(results2?.resultSet.getRow().id).assertEqual(1);
        expect(results2?.resultSet.getRow().name).assertEqual("lisi");
        expect(results2?.resultSet.getRow().age).assertEqual(20);
        expect(results2?.resultSet.goToNextRow()).assertFalse();
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturning027 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturning027 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_23700
     * @tc.name  transBatchInsertWithReturningSync027
     * @tc.desc  conflict: ON_CONFLICT_REPLACE, twice batchInsertWithReturningSync
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturningSync027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturningSync027 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 30000.4,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        "id": 1,
        "name": "lisi",
        "age": 20,
        "salary": 40000.4,
      };
      const config1: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      const config2: relationalStore.ReturningConfig = {
        columns: ['name', 'age', 'id'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results1 = trans?.batchInsertWithReturningSync("test", [valueBucket1], config1);
        expect(getRowCount(results1?.resultSet)).assertEqual(1);
        expect(results1?.changed).assertEqual(1);
        let results2 = trans?.batchInsertWithReturningSync("test", [valueBucket2], config2,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(results2?.changed).assertEqual(1);
        results2?.resultSet.goToNextRow();
        expect(results2?.resultSet.getRow().id).assertEqual(1);
        expect(results2?.resultSet.getRow().name).assertEqual("lisi");
        expect(results2?.resultSet.getRow().age).assertEqual(20);6
        expect(results2?.resultSet.goToNextRow()).assertFalse();
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturningSync027 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturningSync027 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_23800
     * @tc.name  transBatchInsertWithReturning028
     * @tc.desc  illegal table name
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning028 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("123test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning028 1 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("123test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning028 2 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        await trans?.batchInsertWithReturning("te.s.t", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning028 3 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("te.s.t", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning028 4 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        await trans?.batchInsertWithReturning(".test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning028 5 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("..test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning028 6 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        await trans?.batchInsertWithReturning("test..", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning028 7 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test.", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning028 8 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning028 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_23900
     * @tc.name  transBatchInsertWithReturning029
     * @tc.desc  maxReturningCount <= 0 || maxReturningCount > 0x7ffe
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning029 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
        maxReturningCount: -2
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning029 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync029 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0;
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning029 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync029 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0x7fff;
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning029 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync029 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning029 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_24000
     * @tc.name  transBatchInsertWithReturning030
     * @tc.desc  valueBuckets.size < maxReturningCount < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning030 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 0; i < 2; i++) {
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
        };
        valueBuckets.push(valueBucket);
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.batchInsertWithReturning("test", valueBuckets, config);
        expect(results?.changed).assertEqual(2);
        await trans?.commit();
        expect(getRowCount(results?.resultSet)).assertEqual(2);
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturning030 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturning030 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_24100
     * @tc.name  transBatchInsertWithReturningSync030
     * @tc.desc  valueBuckets.size < maxReturningCount < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturningSync030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturningSync030 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 0; i < 2; i++) {
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
        };
        valueBuckets.push(valueBucket);
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.batchInsertWithReturningSync("test", valueBuckets, config);
        expect(results?.changed).assertEqual(2);
        expect(getRowCount(results?.resultSet)).assertEqual(2);
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturningSync030 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturningSync030 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_24200
     * @tc.name  transBatchInsertWithReturning031
     * @tc.desc  maxReturningCount < valueBuckets.size < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning031 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 0; i < 10; i++) {
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
        };
        valueBuckets.push(valueBucket);
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = await trans?.batchInsertWithReturning("test", valueBuckets, config);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturning031 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturning031 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_24300
     * @tc.name  transBatchInsertWithReturningSync031
     * @tc.desc  maxReturningCount < valueBuckets.size < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturningSync031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturningSync031 start *************");
      let valueBuckets = new Array<relationalStore.ValuesBucket>();
      for (let i = 0; i < 10; i++) {
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
        };
        valueBuckets.push(valueBucket);
      }
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        let results = trans?.batchInsertWithReturningSync("test", valueBuckets, config);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
        await trans?.commit();
      } catch (e) {
        await trans?.rollback();
        console.error(TAG + `transBatchInsertWithReturningSync031 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* transBatchInsertWithReturningSync031 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_24400
     * @tc.name  transBatchInsertWithReturning032
     * @tc.desc  error columns
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning032 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name?'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturning032 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync032 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturning032 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_24500
     * @tc.name  transBatchInsertWithReturning033
     * @tc.desc  errcode is 401
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturning033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturning033 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      let trans = await rdbStore?.createTransaction(options);
      try {
        trans?.batchInsertWithReturningSync(null, [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync032 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.batchInsertWithReturningSync(undefined, [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync032 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.batchInsertWithReturning(null, [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync032 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.batchInsertWithReturning(undefined, [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync032 failed4. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.batchInsertWithReturningSync("test", null, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync032 failed5. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.batchInsertWithReturningSync("test", undefined, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync032 failed6. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.batchInsertWithReturning("test", undefined, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync032 failed7. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.batchInsertWithReturning("test", null, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync032 failed8. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync032 failed6. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        trans?.batchInsertWithReturningSync("test", [valueBucket], undefined);
        expect(true).assertFail();
      } catch (e) {;
        console.error(TAG + `transBatchInsertWithReturningSync032 failed6. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `transBatchInsertWithReturningSync032 failed7. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await trans?.batchInsertWithReturning("test", [valueBucket], undefined);
        expect(true).assertFail();
      } catch (e) {;
        console.error(TAG + `transBatchInsertWithReturningSync032 failed8. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      await trans?.rollback();
      console.log(TAG + "************* transBatchInsertWithReturningSync032 end *************");
      done();
    })
  })
}