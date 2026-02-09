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

const dbName = "BachInsertRdbStore.db";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
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
  let dbPath = context.databaseDir + "/rdb/" + STORE_CONFIG.name;
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

export default function RdbStoreBatchInsertWithReturning() {
  describe('RdbStoreBatchInsertWithReturning', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
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
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_0100
     * @tc.name batchInsertWithReturning001
     * @tc.desc empty table name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* batchInsertWithReturning001 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning001 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync001 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* batchInsertWithReturning001 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_0200
     * @tc.name batchInsertWithReturning002
     * @tc.desc Incorrect table name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning002 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning002 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync002 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      console.log(TAG + "************* batchInsertWithReturning002 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_0300
     * @tc.name batchInsertWithReturning003
     * @tc.desc There are spaces in the table name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning003 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("test test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning003 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync003 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* batchInsertWithReturning003 end *************");
      done();
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_0400
     * @tc.name batchInsertWithReturning004
     * @tc.desc The values is an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning004 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning004 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync004 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* batchInsertWithReturning004 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_0500
     * @tc.name batchInsertWithReturning005
     * @tc.desc normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning005 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        let results = await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        results?.resultSet.goToNextRow();
        console.info(TAG + `batchInsertWithReturning005 index ${results?.resultSet.getColumnIndex('name')}`);
        const name = results?.resultSet.getString(results?.resultSet.getColumnIndex('name'));
        const age:number = results?.resultSet.getLong(results?.resultSet.getColumnIndex('age'));
        expect(results?.changed).assertEqual(1);
        expect(name).assertEqual("zhangsan");
        expect(age).assertEqual(18);
        results?.resultSet.close();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning005 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      try {
        let results = rdbStore?.batchInsertWithReturningSync("test", [valueBucket1], config);
        results?.resultSet.goToNextRow();
        console.info(TAG + `batchInsertWithReturningSync005 index ${results?.resultSet.getColumnIndex('name')}`);
        const name = results?.resultSet.getString(results?.resultSet.getColumnIndex('name'));
        const age:number = results?.resultSet.getLong(results?.resultSet.getColumnIndex('age'));
        expect(results?.changed).assertEqual(1);
        expect(name).assertEqual("zhangsan");
        expect(age).assertEqual(18);
        results?.resultSet.close();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync005 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturning005 end *************");
      done();
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_0600
     * @tc.name batchInsertWithReturning006
     * @tc.desc There are duplicate assets in the values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning006 start *************");
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
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning006 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync006 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* batchInsertWithReturning006 end *************");
      done();
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_0700
     * @tc.name batchInsertWithReturning007
     * @tc.desc 1. 1 < values.size <= 1024, The returned results can contain all the changed data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning007 start *************");
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
      try {
        let results = await rdbStore?.batchInsertWithReturning("test", valueBuckets, config);
        let num = getRowCount(results?.resultSet);
        console.log(TAG + "results?.changed" + results?.changed + "getRowCount(results?.resultSet)" + num);
        expect(results?.changed).assertEqual(1024);
        expect(num).assertEqual(1024);
        results?.resultSet.close();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning007 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturning007 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_0800
     * @tc.name batchInsertWithReturningSync007
     * @tc.desc 1. 1 < values.size <= 1024, The returned results can contain all the changed data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturningSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturningSync007 start *************");
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
      try {
        let results = rdbStore?.batchInsertWithReturningSync("test", valueBuckets, config);
        let num = getRowCount(results?.resultSet);
        console.log(TAG + "results?.changed" + results?.changed + "getRowCount(results?.resultSet)" + num);
        expect(results?.changed).assertEqual(1024);
        expect(num).assertEqual(1024);
        results?.resultSet.close();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync007 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturningSync007 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_0900
     * @tc.name batchInsertWithReturning008
     * @tc.desc 1. values.size > 1024, The returned results contains only 1024 entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning008 start *************");
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
      try {
        let results = await rdbStore?.batchInsertWithReturning("test", valueBuckets, config);
        let num = getRowCount(results?.resultSet);
        console.log(TAG + "results?.changed" + results?.changed + "getRowCount(results?.resultSet)" + num);
        expect(results?.changed).assertEqual(1100);
        expect(num).assertEqual(1024);
        results?.resultSet.close();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning008 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturning008 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_1000
     * @tc.name batchInsertWithReturningSync008
     * @tc.desc 1. values.size > 1024, The returned results contains only 1024 entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturningSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturningSync008 start *************");
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
      try {
        let results = rdbStore?.batchInsertWithReturningSync("test", valueBuckets, config);
        let num = getRowCount(results?.resultSet);
        console.log(TAG + "results?.changed" + results?.changed + "getRowCount(results?.resultSet)" + num);
        expect(results?.changed).assertEqual(1100);
        expect(num).assertEqual(1024);
        results?.resultSet.close();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync008 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturningSync008 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_1100
     * @tc.name batchInsertWithReturning009
     * @tc.desc 1. 1 < columns.size <= 4, Return the results of the specified field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning009 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age','salary'],
      }
      try {
        let results = await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        results?.resultSet.goToNextRow();
        const name = results?.resultSet.getString(results?.resultSet.getColumnIndex('name'));
        const age:number = results?.resultSet.getLong(results?.resultSet.getColumnIndex('age'));
        expect(name).assertEqual("zhangsan");
        expect(age).assertEqual(18);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning009 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturning009 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_1200
     * @tc.name batchInsertWithReturningSync009
     * @tc.desc 1. 1 < columns.size <= 4, Return the results of the specified field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturningSync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturningSync009 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age','salary'],
      }
      try {
        let results = rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        results?.resultSet.goToNextRow();
        const name = results?.resultSet.getString(results?.resultSet.getColumnIndex('name'));
        const age:number = results?.resultSet.getLong(results?.resultSet.getColumnIndex('age'));
        expect(name).assertEqual("zhangsan");
        expect(age).assertEqual(18);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync009 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturningSync009 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_1300
     * @tc.name batchInsertWithReturning010
     * @tc.desc 1. columns.size == 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning010 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: [],
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning010 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync010 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* batchInsertWithReturning010 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_1400
     * @tc.name batchInsertWithReturning011
     * @tc.desc 1. columns.size > 4, Throwing an error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning011 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age', 'salary', 'data', 'blobType'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync011 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* batchInsertWithReturning011 end *************");
      done();
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_1500
     * @tc.name batchInsertWithReturning012
     * @tc.desc 1. columns contain special characters: "*"," ",",".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning012 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['ab*'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning012 failed 1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning012 failed 1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ["a b"];
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning012 failed 3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning012 failed 4. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ["a,b"];
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync012 failed 5. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync012 failed 6. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* batchInsertWithReturning012 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_1600
     * @tc.name batchInsertWithReturning013
     * @tc.desc  code is 14800032
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning013 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        id: 1,
        name: 'zhangsan',
        age: 18,
      };
      await rdbStore?.insert("test", valueBucket);
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket,valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning013 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket, valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync013 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      console.log(TAG + "************* batchInsertWithReturning013 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_1700
     * @tc.name batchInsertWithReturning014
     * @tc.desc Conflict is null, handle according to the default conflict resolution mode.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning014 start *************");
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
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning014 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync014 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      console.log(TAG + "************* batchInsertWithReturning014 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_1800
     * @tc.name batchInsertWithReturning015
     * @tc.desc 1. Conflict is undefined, handle according to the default conflict resolution mode.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning015 start *************");
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
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket, valueBucket], config, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning015 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket, valueBucket], config, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning015 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      console.log(TAG + "************* batchInsertWithReturning015 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_1900
     * @tc.name batchInsertWithReturning016
     * @tc.desc 1. Conflict is ON_CONFLICT_REPLACE.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning016 start *************");
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
      try {
        let results = await rdbStore?.batchInsertWithReturning("test", valueBuckets, config,
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
        let res = await rdbStore?.querySql("SELECT * FROM test");
        expect(res?.rowCount).assertEqual(1);
        res?.goToNextRow();
        const name3 = res?.getString(res.getColumnIndex('name'));
        expect(name3).assertEqual("lisi");
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning016 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturning016 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_2000
     * @tc.name batchInsertWithReturningSync016
     * @tc.desc 1. Conflict is ON_CONFLICT_REPLACE.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturningSync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturningSync016 start *************");
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
      try {
        let results = rdbStore?.batchInsertWithReturningSync("test", valueBuckets, config,
          relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("zhangsan");
        expect(results?.resultSet.getRow().age).assertEqual(18);
        expect(results?.resultSet.goToNextRow()).assertFalse();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync016 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturningSync016 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_2100
     * @tc.name batchInsertWithReturning017
     * @tc.desc 1. Normal parameters, rdb already close.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning017 start *************");
      let rdbStore1: relationalStore.RdbStore | undefined = undefined;
      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: "rdbtest.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG);
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      await rdbStore1?.close();
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore1?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning017 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      try {
        rdbStore1?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync017 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      await relationalStore.deleteRdbStore(context, "rdbtest.db");
      console.log(TAG + "************* batchInsertWithReturning017 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_2200
     * @tc.name batchInsertWithReturning018
     * @tc.desc Abnormal parameters, rdb already close.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning018 start *************");
      let rdbStore1: relationalStore.RdbStore | undefined = undefined;
      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: "rdbtest.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG);
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      await rdbStore1?.close();
      const config: relationalStore.ReturningConfig = {
        columns: ['name?', 'age'],
      }
      try {
        await rdbStore1?.batchInsertWithReturning("test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning018 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      try {
        rdbStore1?.batchInsertWithReturningSync("test test1", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync018 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      await relationalStore.deleteRdbStore(context, "rdbtest.db");
      console.log(TAG + "************* batchInsertWithReturning018 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_2300
     * @tc.name batchInsertWithReturning019
     * @tc.desc 1. Database corruption.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning019 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      await createCorruptDb();
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning019 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync019 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      console.log(TAG + "************* batchInsertWithReturning019 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_2400
     * @tc.name batchInsertWithReturning020
     * @tc.desc 1. The database file is locked.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning020 start *************");
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
      await deferredTrans?.insert("test", valueBucket);
      try {       
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning020 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync020 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      await deferredTrans?.rollback();
      console.log(TAG + "************* batchInsertWithReturning020 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_2500
     * @tc.name batchInsertWithReturning021
     * @tc.desc A table in the database is locked.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning021 start *************");
      const STORE_CONFIG1: relationalStore.StoreConfig = {
        name: dbName,
        securityLevel: relationalStore.SecurityLevel.S1,
        persist: false,
      }
      let rdb = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdb?.executeSql(CREATE_TABLE_TEST);
      let deferredTrans = await rdb?.createTransaction({
        transactionType: relationalStore.TransactionType.IMMEDIATE
      });
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 18,
        "salary": 100.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdb?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning021 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025);
      }
      try {
        rdb?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync021 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025);
      }
      await deferredTrans.commit();
      await rdb?.close();
      console.log(TAG + "************* batchInsertWithReturning021 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_2600
     * @tc.name batchInsertWithReturning022
     * @tc.desc The Database is full.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning022 start *************");
      await rdbStore?.execute("PRAGMA max_page_count = 256;");
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
        await rdbStore?.batchInsertWithReturning("test", valueBuckets, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning022 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", valueBuckets, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync022 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      console.log(TAG + "************* batchInsertWithReturning022 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_2700
     * @tc.name batchInsertWithReturning023
     * @tc.desc Violation of constraints.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning023 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "name": null,
        "age": 18,
        "salary": 100.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket, valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning023 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket,valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync023 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      console.log(TAG + "************* batchInsertWithReturning023 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_2800
     * @tc.name batchInsertWithReturning024
     * @tc.desc Data type error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning024 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "id": "abc",
        "name": 18,
        "age": new Uint8Array([1, 2, 3]),
        "salary": "100.5",
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning024 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync024 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033);
      }
      console.log(TAG + "************* batchInsertWithReturning024 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_2900
     * @tc.name batchInsertWithReturning025
     * @tc.desc conflict: ON_CONFLICT_REPLACE, twice batchInsertWithReturning.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning025 start *************");
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
      try {
        let results1 = await rdbStore?.batchInsertWithReturning("test", [valueBucket1], config1);
        expect(getRowCount(results1?.resultSet)).assertEqual(1);
        expect(results1?.changed).assertEqual(1);
        let results2 = await rdbStore?.batchInsertWithReturning("test", [valueBucket2], config2,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(results2?.changed).assertEqual(1);
        results2?.resultSet.goToNextRow();
        expect(results2?.resultSet.getRow().id).assertEqual(1);
        expect(results2?.resultSet.getRow().name).assertEqual("lisi");
        expect(results2?.resultSet.getRow().age).assertEqual(20);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning025 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturning025 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_3000
     * @tc.name batchInsertWithReturningSync025
     * @tc.desc conflict: ON_CONFLICT_REPLACE, twice batchInsertWithReturning.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturningSync025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturningSync025 start *************");
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
      try {
        let results1 = rdbStore?.batchInsertWithReturningSync("test", [valueBucket1], config1);
        expect(getRowCount(results1?.resultSet)).assertEqual(1);
        expect(results1?.changed).assertEqual(1);
        let results2 = rdbStore?.batchInsertWithReturningSync("test", [valueBucket2], config2,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(results2?.changed).assertEqual(1);
        results2?.resultSet.goToNextRow();
        expect(results2?.resultSet.getRow().id).assertEqual(1);
        expect(results2?.resultSet.getRow().name).assertEqual("lisi");
        expect(results2?.resultSet.getRow().age).assertEqual(20);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync025 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturningSync025 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_3100
     * @tc.name batchInsertWithReturning026
     * @tc.desc 1. illegal table name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning026 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("123test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning026 1 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("123test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning026 2 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        await rdbStore?.batchInsertWithReturning("te.s.t", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning026 3 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("te.s.t", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning026 4 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        await rdbStore?.batchInsertWithReturning(".test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning026 5 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("..test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning026 6 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        await rdbStore?.batchInsertWithReturning("test..", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning026 7 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test.", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning026 8 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* batchInsertWithReturning026 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_3200
     * @tc.name batchInsertWithReturning027
     * @tc.desc 1. maxReturningCount <= 0 || maxReturningCount > 0x7ffe.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning027 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
        maxReturningCount: -2
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning027 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync027 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0;
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning027 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync027 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0x7fff;
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning027 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync027 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* batchInsertWithReturning027 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_3300
     * @tc.name batchInsertWithReturning028
     * @tc.desc 1. valueBuckets.size < maxReturningCount < 0x7FFF.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning028 start *************");
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
      try {
        let results = await rdbStore?.batchInsertWithReturning("test", valueBuckets, config);
        console.log(TAG + "results?.changed" + results?.changed);
        expect(results?.changed).assertEqual(2);
        expect(getRowCount(results?.resultSet)).assertEqual(2);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning028 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturning028 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_3400
     * @tc.name batchInsertWithReturningSync028
     * @tc.desc 1. valueBuckets.size < maxReturningCount < 0x7FFF.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturningSync028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturningSync028 start *************");
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
      try {
        let results = rdbStore?.batchInsertWithReturningSync("test", valueBuckets, config);
        console.log(TAG + "results?.changed" + results?.changed);
        expect(results?.changed).assertEqual(2);
        expect(getRowCount(results?.resultSet)).assertEqual(2);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync028 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturningSync028 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_3500
     * @tc.name batchInsertWithReturning029
     * @tc.desc 1. maxReturningCount < valueBuckets.size < 0x7FFF.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning029 start *************");
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
      try {
        let results = await rdbStore?.batchInsertWithReturning("test", valueBuckets, config);
        console.log(TAG + "results?.changed" + results?.changed);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning029 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturning029 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_3600
     * @tc.name batchInsertWithReturningSync029
     * @tc.desc 1.maxReturningCount < valueBuckets.size < 0x7FFF.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturningSync029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturningSync029 start *************");
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
      try {
        let results = rdbStore?.batchInsertWithReturningSync("test", valueBuckets, config);
        console.log(TAG + "results?.changed" + results?.changed);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync029 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturningSync029 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_3700
     * @tc.name batchInsertWithReturning030
     * @tc.desc 1. Pass special characters to field names.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning030 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name?'],
        maxReturningCount: 5
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config);
        console.log(TAG + "batchInsertWithReturning030");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning030 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config);
        console.log(TAG + "batchInsertWithReturningSync030");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync030 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      console.log(TAG + "************* batchInsertWithReturning030 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_3800
     * @tc.name batchInsertWithReturning031
     * @tc.desc errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning031 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.batchInsertWithReturning(null, [valueBucket], config);
        console.log(TAG + "batchInsertWithReturning031 success1");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning031 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await rdbStore?.batchInsertWithReturning(undefined, [valueBucket], config);
        console.log(TAG + "batchInsertWithReturning031 success2");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning031 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", undefined, config);
        console.log(TAG + "batchInsertWithReturning031 success3");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning031 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", null, config);
        console.log(TAG + "batchInsertWithReturning031 success4");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning031 failed4. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], undefined);
        console.log(TAG + "batchInsertWithReturning031 success5");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning031 failed5. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], null);
        console.log(TAG + "batchInsertWithReturning031 success6");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning031 failed6. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      console.log(TAG + "************* batchInsertWithReturning031 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_3900
     * @tc.name batchInsertWithReturningSync031
     * @tc.desc errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturningSync031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturningSync031 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        rdbStore?.batchInsertWithReturningSync(null, [valueBucket], config);
        console.log(TAG + "batchInsertWithReturningSync031 success1");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync031 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.batchInsertWithReturningSync(undefined, [valueBucket], config);
        console.log(TAG + "batchInsertWithReturningSync031 success2");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync031 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", undefined, config);
        console.log(TAG + "batchInsertWithReturningSync031 success3");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync031 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", null, config);
        console.log(TAG + "batchInsertWithReturningSync031 success4");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync031 failed4. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], undefined);
        console.log(TAG + "batchInsertWithReturningSync031 success5");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync031 failed5. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], null);
        console.log(TAG + "batchInsertWithReturningSync031 success6");
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync031 failed6. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      console.log(TAG + "************* batchInsertWithReturningSync031 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_4000
     * @tc.name batchInsertWithReturning036
     * @tc.desc conflict is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning036 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        let results = await rdbStore?.batchInsertWithReturning("test", [valueBucket], config, undefined);
        console.log(TAG + "results?.changed" + results?.changed);
        expect(results?.changed).assertEqual(1);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning036 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturning036 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_4100
     * @tc.name batchInsertWithReturningSync036
     * @tc.desc conflict is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturningSync036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturningSync036 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        let results = rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config, undefined);
        console.log(TAG + "results?.changed" + results?.changed);
        expect(results?.changed).assertEqual(1);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync036 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturningSync036 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_4200
     * @tc.name batchInsertWithReturning037
     * @tc.desc error valueBucket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning037 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name1': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.batchInsertWithReturning("test", [valueBucket], config, undefined);
        console.log(TAG + "batchInsertWithReturning037")
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning037 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      try {
        rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config, undefined);
        console.log(TAG + "batchInsertWithReturningSync037")
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync037 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      console.log(TAG + "************* batchInsertWithReturning037 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_4300
     * @tc.name batchInsertWithReturning038
     * @tc.desc maxReturningCount is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturning038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturning038 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name','age'],
        maxReturningCount:undefined
      }
      try {
        let results = await rdbStore?.batchInsertWithReturning("test", [valueBucket], config, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + "results?.changed" + results?.changed);
        expect(results?.changed).assertEqual(1);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturning038 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturning038 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_4400
     * @tc.name batchInsertWithReturningSync038
     * @tc.desc maxReturningCount is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('batchInsertWithReturningSync038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* batchInsertWithReturningSync038 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name','age'],
        maxReturningCount:undefined
      }
      try {
        let results = rdbStore?.batchInsertWithReturningSync("test", [valueBucket], config, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + "results?.changed" + results?.changed);
        expect(results?.changed).assertEqual(1);
      } catch (e) {
        console.error(TAG + `batchInsertWithReturningSync038 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* batchInsertWithReturningSync038 end *************");
      done();
    })
  })
}