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

const dbName = "UpdateRdbStore.db";
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

export default function RdbStoreUpdateWithReturning() {
  describe('RdbStoreUpdateWithReturning', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
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
      console.log(TAG + "results?.changed" + results?.changed);
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await rdbStore?.close();
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_7700
     * @tc.name  updateWithReturning001
     * @tc.desc  0 < values.size <= 1024, The returned results can contain all the changed data.
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning001 start *************");
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
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 18,
        'salary': 25000.5,
      };
      try {
        let result = await rdbStore?.updateWithReturning(valueBucket1, predicates, config);
        expect(result?.changed).assertEqual(1024);
        expect(getRowCount(result?.resultSet)).assertEqual(1024);
      } catch (e) {
        console.error(TAG + `updateWithReturning001 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning001 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_7800
     * @tc.name  updateWithReturningSync001
     * @tc.desc  0 < values.size <= 1024, The returned results can contain all the changed data.
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync001 start *************");
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
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 18,
        'salary': 25000.5,
      };
      try {
        let results = rdbStore?.updateWithReturningSync(valueBucket1, predicates, config);
        expect(results?.changed).assertEqual(1024);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
      } catch (e) {
        console.error(TAG + `updateWithReturningSync001 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync001 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_7900
     * @tc.name  updateWithReturning002
     * @tc.desc  values.size > 1024, The returned results contains only 1024 entries
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning002 start *************");
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
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 18,
        'salary': 25000.5,
      };
      try {
        let results = await rdbStore?.updateWithReturning(valueBucket1, predicates, config);
        expect(results?.changed).assertEqual(1100);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
      } catch (e) {
        console.error(TAG + `updateWithReturning002 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning002 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_8000
     * @tc.name  updateWithReturningSync002
     * @tc.desc  values.size > 1024, The returned results contains only 1024 entries
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync002 start *************");
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
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 18,
        'salary': 25000.5,
      };
      try {
        let results = rdbStore?.updateWithReturningSync(valueBucket1, predicates, config);
        expect(results?.changed).assertEqual(1100);
        expect(getRowCount(results?.resultSet)).assertEqual(1024);
      } catch (e) {
        console.error(TAG + `updateWithReturningSync002 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync002 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_8100
     * @tc.name  updateWithReturning003
     * @tc.desc  Values is normal
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning003 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 20,
        'salary': 25000.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan1');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        let results = await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("lisi");
        expect(results?.resultSet.getRow().age).assertEqual(20);
        expect(results?.resultSet.goToNextRow()).assertFalse();
      } catch (e) {
        console.error(TAG + `updateWithReturning003 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning003 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_8200
     * @tc.name  updateWithReturningSync003
     * @tc.desc  Values is normal
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync003 start *************");
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
      try {
        let results = rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("lisi");
        expect(results?.resultSet.getRow().age).assertEqual(20);
        expect(results?.resultSet.goToNextRow()).assertFalse();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync003 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync003 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_8400
     * @tc.name  updateWithReturning004
     * @tc.desc  Values is empty
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning004 start *************");
      const valueBucket: relationalStore.ValuesBucket = {};
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning004 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync004 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* updateWithReturning004 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_8500
     * @tc.name  updateWithReturning005
     * @tc.desc  The tableName is wrong
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
      let predicates = new relationalStore.RdbPredicates("wrongTableName");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning005 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync005 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800021);
      }
      console.log(TAG + "************* updateWithReturning005 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_8600
     * @tc.name  updateWithReturning007
     * @tc.desc  There are spaces in the table name
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning007 start *************");
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
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning007 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync007 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* updateWithReturning007 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_8700
     * @tc.name  updateWithReturning008
     * @tc.desc  There are duplicate assets in the values
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning008 start *************");
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
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning008 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync008 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* updateWithReturning008 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_8800
     * @tc.name  updateWithReturning009
     * @tc.desc  1 < columns.size <= 4, Return the results of the specified field
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning009 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 20,
        'salary': 25100.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan4');
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age','salary'],
      }
      try {
        let results = await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("lisi");
        expect(results?.resultSet.getRow().age).assertEqual(20);
      } catch (e) {
        console.error(TAG + `updateWithReturning009 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning009 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_8900
     * @tc.name  updateWithReturningSync009
     * @tc.desc  1 < columns.size <= 4, Return the results of the specified field
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync009 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 21,
        'salary': 25010.5,
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['id', 'name', 'age','salary'],
      }
      try {
        let results = rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().name).assertEqual("lisi");
        expect(results?.resultSet.getRow().age).assertEqual(21);
      } catch (e) {
        console.error(TAG + `updateWithReturningSync009 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync009 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_9000
     * @tc.name  updateWithReturning010
     * @tc.desc  columns.size == 0, errCode 14800001.
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning010 start *************");
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
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning010 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync010 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* updateWithReturning010 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_9100
     * @tc.name  updateWithReturning011
     * @tc.desc  columns.size > 4, errCode 14800001.
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning011 start *************");
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
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning011 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync011 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* updateWithReturning011 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_9200
     * @tc.name  updateWithReturning012
     * @tc.desc  columns contain special characters: "*"," ",",".
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning012 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['ab*'],
      }
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning012 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync012 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ['a b'];
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning012 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync012 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.columns = ['a,b'];
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning012 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync012 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* updateWithReturning012 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_9300
     * @tc.name  updateWithReturning013
     * @tc.desc  Do not transmit conflict, handle according to the default conflict resolution mode
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
      predicates.equalTo('name', 'zhangsan1');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning013 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync013 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      console.log(TAG + "************* updateWithReturning013 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_9400
     * @tc.name  updateWithReturning014
     * @tc.desc  Conflict is null, handle according to the default conflict resolution mode
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
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning014 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync014 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      console.log(TAG + "************* updateWithReturning014 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_9500
     * @tc.name  updateWithReturning015
     * @tc.desc  Conflict is undefined, handle according to the default conflict resolution mode
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning015 start *************");
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
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning015 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync015 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      console.log(TAG + "************* updateWithReturning015 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_9600
     * @tc.name  updateWithReturning016
     * @tc.desc  Conflict is ON_CONFLICT_REPLACE
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning016 start *************");
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
      try {
        let results = await rdbStore?.updateWithReturning(valueBucket, predicates, config,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(results?.changed).assertEqual(1);
        results?.resultSet.goToNextRow();
        expect(results?.resultSet.getRow().id).assertEqual(1);
        expect(results?.resultSet.getRow().name).assertEqual("lisi");
        expect(results?.resultSet.getRow().age).assertEqual(20);
        expect(results?.resultSet.goToNextRow()).assertFalse();
        let res = await rdbStore?.querySql("SELECT * FROM test Where id = 1");
        res?.goToNextRow();
        const name3 = res?.getString(res.getColumnIndex('name'));
        expect(name3).assertEqual("lisi");
      } catch (e) {
        console.error(TAG + `updateWithReturning016 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning016 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_9700
     * @tc.name  updateWithReturningSync016
     * @tc.desc  Conflict is ON_CONFLICT_IGNORE
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync016 start *************");
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
      try {
        let results = rdbStore?.updateWithReturningSync(valueBucket, predicates, config,
          relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        expect(getRowCount(results?.resultSet)).assertEqual(0);
        expect(results?.changed).assertEqual(0);
        let res = await rdbStore?.querySql("SELECT * FROM test Where id = 1");
        res?.goToNextRow();
        const name = res?.getString(res.getColumnIndex('name'));
        expect(name != "lisi").assertTrue();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync016 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync016 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_9800
     * @tc.name  updateWithReturning017
     * @tc.desc  Normal parameters, rdb already close
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning017 start *************");
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
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore1?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning017 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      try {
        rdbStore1?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync017 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      console.log(TAG + "************* updateWithReturning017 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_9900
     * @tc.name  updateWithReturning018
     * @tc.desc  Abnormal parameters, rdb already close
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning018 start *************");
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
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age', '*'],
      }
      try {
        await rdbStore1?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning018 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      try {
        rdbStore1?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync018 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      console.log(TAG + "************* updateWithReturning018 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_10000
     * @tc.name  updateWithReturning019
     * @tc.desc  Database corruption
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning019 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000.5,
      };
      await createCorruptDb();
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning019 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync019 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800011);
      }
      console.log(TAG + "************* updateWithReturning019 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_10100
     * @tc.name  updateWithReturning020
     * @tc.desc  The database file is locked
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
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
      await deferredTrans?.insert("test", valueBucket);
      try {       
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync020 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800024);
      }
      await deferredTrans?.rollback();
      console.log(TAG + "************* updateWithReturning020 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_10200
     * @tc.name  updateWithReturning021
     * @tc.desc  The Database is full
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning021 start *************");
      await rdbStore?.execute("PRAGMA max_page_count = 256;");
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
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning021 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync021 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800029);
      }
      console.log(TAG + "************* updateWithReturning021 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_10300
     * @tc.name  updateWithReturning022
     * @tc.desc  Violation of constraints
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning022 start *************");
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
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning022 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync022 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      console.log(TAG + "************* updateWithReturning022 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_10400
     * @tc.name  updateWithReturning028
     * @tc.desc  Data type error
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
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
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning028 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync028 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800033);
      }
      console.log(TAG + "************* updateWithReturning028 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_10500
     * @tc.name  updateWithReturning023
     * @tc.desc  illegal table name
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning023 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      try {
        let predicates1 = new relationalStore.RdbPredicates("123test");
        await rdbStore?.updateWithReturning(valueBucket, predicates1, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning023 1 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        let predicates2 = new relationalStore.RdbPredicates("345test");
        rdbStore?.updateWithReturningSync(valueBucket, predicates2, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning023 2 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates3 = new relationalStore.RdbPredicates("te.s.t");
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates3, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning023 3 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates3, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning023 4 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates5 = new relationalStore.RdbPredicates(".test");
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates5, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning023 5 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates5, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning023 6 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      let predicates7 = new relationalStore.RdbPredicates("test..");
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates7, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning023 7 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates7, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning023 8 failed. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* updateWithReturning023 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_10600
     * @tc.name  updateWithReturning024
     * @tc.desc  maxReturningCount <= 0 || maxReturningCount > 0x7ffe
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning024 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
        maxReturningCount: -2
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      let predicates = new relationalStore.RdbPredicates("test");
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning024 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync024 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0;
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning024 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning024 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      config.maxReturningCount = 0x7fff;
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning024 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning024 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800001);
      }
      console.log(TAG + "************* updateWithReturning024 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_10700
     * @tc.name  updateWithReturning025
     * @tc.desc  valueBuckets.size < maxReturningCount < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning025 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 2);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      try {
        let results = await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(2);
        expect(getRowCount(results?.resultSet)).assertEqual(2);
      } catch (e) {
        console.error(TAG + `updateWithReturning025 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning025 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_10800
     * @tc.name  updateWithReturningSync025
     * @tc.desc  valueBuckets.size < maxReturningCount < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync025 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 2);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      try {
        let results = rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(2);
        expect(getRowCount(results?.resultSet)).assertEqual(2);
      } catch (e) {
        console.error(TAG + `updateWithReturningSync025 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync025 end *************");
      done();
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_10900
     * @tc.name  updateWithReturning026
     * @tc.desc  maxReturningCount < valueBuckets.size < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning026 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 10);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      try {
        let results = await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
      } catch (e) {
        console.error(TAG + `updateWithReturning026 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturning026 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_11000
     * @tc.name  updateWithReturningSync026
     * @tc.desc  maxReturningCount < valueBuckets.size < 0x7FFF
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync026 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.between('id', 1, 10);
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      try {
        let results = rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(results?.changed).assertEqual(10);
        expect(getRowCount(results?.resultSet)).assertEqual(5);
      } catch (e) {
        console.error(TAG + `updateWithReturningSync026 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync026 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_11100
     * @tc.name  updateWithReturning027
     * @tc.desc  error columns
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning027 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      const config: relationalStore.ReturningConfig = {
        columns: ['name?'],
        maxReturningCount: 5
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning027 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturningSync027 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800021).assertEqual(e.code);
      }
      console.log(TAG + "************* updateWithReturning027 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_11200
     * @tc.name  updateWithReturning029
     * @tc.desc  predicates is undefined/null
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning029 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      try {
        await rdbStore?.updateWithReturning(valueBucket, undefined, config, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning029 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await rdbStore?.updateWithReturning(valueBucket, null, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning029 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, undefined, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning029 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, null, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning029 failed4. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      console.log(TAG + "************* updateWithReturning029 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_11300
     * @tc.name  updateWithReturning031
     * @tc.desc  config is null/undefined
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning031 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, null);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, undefined);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning031 failed4. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      console.log(TAG + "************* updateWithReturning031 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_11400
     * @tc.name  updateWithReturning032
     * @tc.desc  valueBucket is null/undefined
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning032 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      try {
        rdbStore?.updateWithReturningSync(null, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning032 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        rdbStore?.updateWithReturningSync(undefined, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning032 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await rdbStore?.updateWithReturning(null, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning032 failed3. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        await rdbStore?.updateWithReturning(undefined, predicates, config);
        expect(true).assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning032 failed4. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      console.log(TAG + "************* updateWithReturning032 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_11500
     * @tc.name  updateWithReturningSync033
     * @tc.desc  conflict is undefined
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturningSync033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturningSync033 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      try {
        let results = rdbStore?.updateWithReturningSync(valueBucket, predicates, config, undefined);
        console.log(TAG + "results?.changed " + results?.changed)
        expect(results?.changed).assertEqual(1);
      } catch (e) {
        console.error(TAG + `updateWithReturningSync033 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      console.log(TAG + "************* updateWithReturningSync033 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_11600
     * @tc.name  updateWithReturning033
     * @tc.desc  conflict is undefined
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning033 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('name', 'zhangsan5');
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "lisi",
      };
      const config: relationalStore.ReturningConfig = {
        columns: ['name'],
        maxReturningCount: 5
      }
      try {
        let results = await rdbStore?.updateWithReturning(valueBucket, predicates, config, undefined);
        console.log(TAG + "results?.changed " + results?.changed)
        expect(results?.changed).assertEqual(1);
      } catch (e) {
        console.error(TAG + `updateWithReturning033 failed. code is ${e.code}, message is ${e.message}`);
        expect().assertFail();
      }
      console.log(TAG + "************* updateWithReturning033 end *************");
      done();
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_11700
     * @tc.name  updateWithReturning034
     * @tc.desc  errcode is 14800025
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('updateWithReturning034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* updateWithReturning034 start *************");
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
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore?.executeSql(CREATE_TABLE_TEST);
      let deferredTrans = await rdbStore?.createTransaction({
        transactionType: relationalStore.TransactionType.DEFERRED
      });
      await deferredTrans?.insert("test",valueBucket);
      try {
        await rdbStore?.updateWithReturning(valueBucket, predicates, config, undefined);
        console.log(TAG + "updateWithReturning034 success1");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning034 failed1. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025)
      }
      try {
        rdbStore?.updateWithReturningSync(valueBucket, predicates, config, undefined);
        console.log(TAG + "updateWithReturning034 success2");
        expect().assertFail();
      } catch (e) {
        console.error(TAG + `updateWithReturning034 failed2. code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(14800025)
      }
      await deferredTrans?.rollback();
      console.log(TAG + "************* updateWithReturning034 end *************");
      done();
    })
  })
}