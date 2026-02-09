/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import relationalStore from '@ohos.data.relationalStore';

const TAG = '[RELATIONAL_STORE_TEST]';
let rdbStore: relationalStore.RdbStore;
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const CREATE_TABLE_TEST = 'CREATE TABLE IF NOT EXISTS test ' +
  '(id INTEGER PRIMARY KEY AUTOINCREMENT, name text, age long, data1 real, data2 blob)';

const CREATE_TABLE_TEST1 = 'CREATE TABLE IF NOT EXISTS test1 ' +
  '(id INTEGER PRIMARY KEY AUTOINCREMENT, name text, age long, data3 asset, data4 assets)';

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: 'rdbQueryResultSet.db',
  securityLevel: relationalStore.SecurityLevel.S1,
}
const STORE_CONFIG1: relationalStore.StoreConfig = {
  name: 'rdbQueryAttach.db',
  securityLevel: relationalStore.SecurityLevel.S1,
}

const asset1 : relationalStore.Asset = {
  name: 'name1',
  uri: 'uri1',
  createTime: 'createTime1',
  modifyTime: 'modifyTime1',
  size: 'size1',
  path: 'path1',
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2 : relationalStore.Asset = {
  name: 'name2',
  uri: 'uri2',
  createTime: 'createTime2',
  modifyTime: 'modifyTime2',
  size: 'size2',
  path: 'path2',
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}

function checkAssetEqual(assetEq1: relationalStore.Asset, assetEq2: relationalStore.Asset) : boolean
{
  return assetEq1.name == assetEq2.name && assetEq1.uri == assetEq2.uri &&
    assetEq1.createTime == assetEq2.createTime && assetEq1.modifyTime == assetEq2.modifyTime &&
    assetEq1.size == assetEq2.size && assetEq1.path == assetEq2.path;
}

function checkAssetsEqual(assetsEq1: relationalStore.Assets, assetsEq2: relationalStore.Assets) : boolean
{
  if (assetsEq1.length == assetsEq2.length) {
    for (let i = 0; i < assetsEq1.length; ++i) {
      if (!checkAssetEqual(assetsEq1[i], assetsEq2[i])) {
        return false;
      }
    }
    return true;
  }
  return false;
}

export default function RdbGetColumnNames() {
  describe('RdbGetColumnNames', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
      try {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        expect(rdbStore != undefined).assertTrue();
        await rdbStore.executeSql(CREATE_TABLE_TEST);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array([1, 2, 3])
        const assets2 = [asset1, asset2];
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan',
          'age': 18,
          'data1': 25000.0,
          'data2': u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          'name': 'lisi',
          'age': 20,
          'data1': 20000.0,
          'data2': u8,
        };
        const valueBucket2: relationalStore.ValuesBucket = {
          'name': 'liming',
          'age': 22,
          'data3': asset1,
          'data4': assets2,
        };
        const valueBucket3: relationalStore.ValuesBucket = {
          'name': 'lifei',
          'age': 24,
          'data3': asset1,
          'data4': assets2,
        };
        await rdbStore.insert('test', valueBucket);
        await rdbStore.insert('test', valueBucket1);
        await rdbStore.insert('test1', valueBucket2);
        await rdbStore.insert('test1', valueBucket3);
      } catch(error) {
        console.error(TAG + `beforeAll failed, code:${error.code}, message:${error.message}`);
        expect().assertFail();
      }
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      try {
        await rdbStore.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch(error) {
        console.error(TAG + `afterAll failed, code:${error.code}, message:${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   queryGetColumnNames_001
     * @tc.number SUB_DistributedData_RelationalStore_queryGetColumnNames_0001
     * @tc.desc   multi-table for query all column names by getColumnNames
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetColumnNames_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetColumnNames_001 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        console.log('aaaaaa' +"000")
        let columnNames = resultSet.getColumnNames();
        console.log('aaaaaa' +"1.1.1")
        expect(10).assertEqual(columnNames.length);
        console.log('aaaaaa' +"111")
        expect('id').assertEqual(columnNames[0]);
        console.log('aaaaaa' +"222")
        expect('name').assertEqual(columnNames[1]);
        console.log('aaaaaa' +"333")
        expect('age').assertEqual(columnNames[2]);
        expect('data1').assertEqual(columnNames[3]);
        expect('data2').assertEqual(columnNames[4]);
        expect('id').assertEqual(columnNames[5]);
        expect('name').assertEqual(columnNames[6]);
        expect('age').assertEqual(columnNames[7]);
        expect('data3').assertEqual(columnNames[8]);
        expect('data4').assertEqual(columnNames[9]);
        console.log('aaaaaa' +"queryGetColumnNames_001 is finish")
      } catch(err) {
        console.error('aaaaaa' + `queryGetColumnNames_001 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetColumnNames_001 end *************');
    })

    /**
     * @tc.name   queryGetColumnNames_002
     * @tc.number SUB_DistributedData_RelationalStore_queryGetColumnNames_0002
     * @tc.desc   getColumnNames test with resultSet already close.
     *            1. close resultSet and execute getColumnNames
     *            2. return 14800014
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetColumnNames_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetColumnNames_002 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        resultSet?.close();
        resultSet.getColumnNames();
        console.error(`queryGetColumnNames_002 success`);
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetColumnNames_002 failed message:${err.message} code:${err.code}`);
        expect(14800014).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetColumnNames_002 end *************');
    })

    /**
     * @tc.name   queryGetColumnNames_003
     * @tc.number SUB_DistributedData_RelationalStore_queryGetColumnNames_0003
     * @tc.desc   getColumnNames test with resultSet querySql no such table.
     *            1. not create table and execute getColumnNames
     *            2. return 14800021
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetColumnNames_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetColumnNames_003 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test2');
        resultSet.getColumnNames();
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetColumnNames_003 failed message:${err.message} code:${err.code}`);
        expect(14800021).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetColumnNames_003 end *************');
    })

    /**
     * @tc.name   queryGetColumnNames_004
     * @tc.number SUB_DistributedData_RelationalStore_queryGetColumnNames_0004
     * @tc.desc   getColumnNames test with resultSet querySql input create table sql.
     *            1. create table by querySql and execute getColumnNames
     *            2. return 14800019
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetColumnNames_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetColumnNames_004 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql(CREATE_TABLE_TEST);
        resultSet.getColumnNames();
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetColumnNames_004 failed message:${err.message} code:${err.code}`);
        expect(14800019).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetColumnNames_004 end *************');
    })

    /**
     * @tc.name   queryGetColumnNames_005
     * @tc.number SUB_DistributedData_RelationalStore_queryGetColumnNames_0005
     * @tc.desc   getColumnNames test with resultSet querySql input sql size less then 3.
     *            1. SQL length is less than 3
     *            2. execute getColumnNames and return 14800001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetColumnNames_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetColumnNames_005 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('se');
        resultSet.getColumnNames();
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetColumnNames_005 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetColumnNames_005 end *************');
    })

    /**
     * @tc.name   queryGetColumnNames_006
     * @tc.number SUB_DistributedData_RelationalStore_queryGetColumnNames_0006
     * @tc.desc   ResultSet.getColumnNames test with attach db querySql.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetColumnNames_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetColumnNames_006 start *************');
      let rdbStoreAttach = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      let count = await rdbStoreAttach.attach('/data/storage/el2/database/rdb/rdbQueryResultSet.db', 'attachDB3');
      expect(count == 1).assertTrue();
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStoreAttach.querySql('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let columnNames = resultSet.getColumnNames();
        expect(10).assertEqual(columnNames.length);
        expect('id').assertEqual(columnNames[0]);
        expect('name').assertEqual(columnNames[1]);
        expect('age').assertEqual(columnNames[2]);
        expect('data1').assertEqual(columnNames[3]);
        expect('data2').assertEqual(columnNames[4]);
        expect('id').assertEqual(columnNames[5]);
        expect('name').assertEqual(columnNames[6]);
        expect('age').assertEqual(columnNames[7]);
        expect('data3').assertEqual(columnNames[8]);
        expect('data4').assertEqual(columnNames[9]);
      } catch(err) {
        console.error(`queryGetColumnNames_006 failed message:${err.message} code:${err.code}`);
        expect().assertFalse();
      }
      resultSet?.close();
      await rdbStoreAttach.detach('attachDB3');
      await rdbStoreAttach.close();
      console.log(TAG + '************* queryGetColumnNames_006 end *************');
    })

    /**
     * @tc.name   lite_queryGetColumnNames_001
     * @tc.number SUB_DistributedData_RelationalStore_lite_queryGetColumnNames_0001
     * @tc.desc   multi-table querySqlWithoutRowCount with getColumnNames test, query all column names
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetColumnNames_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetColumnNames_001 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet =
          await rdbStore.querySqlWithoutRowCount('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let columnNames = liteResultSet.getColumnNames();
        expect(10).assertEqual(columnNames.length);
        expect('id').assertEqual(columnNames[0]);
        expect('name').assertEqual(columnNames[1]);
        expect('age').assertEqual(columnNames[2]);
        expect('data1').assertEqual(columnNames[3]);
        expect('data2').assertEqual(columnNames[4]);
        expect('id').assertEqual(columnNames[5]);
        expect('name').assertEqual(columnNames[6]);
        expect('age').assertEqual(columnNames[7]);
        expect('data3').assertEqual(columnNames[8]);
        expect('data4').assertEqual(columnNames[9]);
      } catch(err) {
        console.error(`lite_queryGetColumnNames_001 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetColumnNames_001 end *************');
    })

    /**
     * @tc.name   lite_queryGetColumnNames_002
     * @tc.number SUB_DistributedData_RelationalStore_lite_queryGetColumnNames_0002
     * @tc.desc   liteResultSet.getColumnNames test with liteResultSet already close.
     *            1. close resultSet
     *            2. execute getColumnNames and return 14800014
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetColumnNames_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetColumnNames_002 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet =
          await rdbStore.querySqlWithoutRowCount('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        liteResultSet?.close();
        liteResultSet.getColumnNames();
        console.info(`lite_queryGetColumnNames_002 success`);
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetColumnNames_002 failed message:${err.message} code:${err.code}`);
        expect(14800014).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetColumnNames_002 end *************');
    })

    /**
     * @tc.name   lite_queryGetColumnNames_003
     * @tc.number SUB_DistributedData_RelationalStore_lite_queryGetColumnNames_0003
     * @tc.desc   liteResultSet.getColumnNames test with querySqlWithoutRowCount no such table.
     *            1. not create table
     *            2. execute getColumnNames and return 14800021
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetColumnNames_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetColumnNames_003 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('SELECT * FROM test2');
        liteResultSet.getColumnNames();
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetColumnNames_003 failed message:${err.message} code:${err.code}`);
        expect(14800021).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetColumnNames_003 end *************');
    })

    /**
     * @tc.name   lite_queryGetColumnNames_004
     * @tc.number SUB_DistributedData_RelationalStore_lite_queryGetColumnNames_0004
     * @tc.desc   liteResultSet.getColumnNames test with querySqlWithoutRowCount input create table sql.
     *            1. create table by querySqlWithoutRowCount
     *            2. execute getColumnNames and return 14800021
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetColumnNames_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetColumnNames_004 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount(CREATE_TABLE_TEST);
        liteResultSet.getColumnNames();
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetColumnNames_004 failed message:${err.message} code:${err.code}`);
        expect(14800019).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetColumnNames_004 end *************');
    })

    /**
     * @tc.name   lite_queryGetColumnNames_005
     * @tc.number SUB_DistributedData_RelationalStore_lite_queryGetColumnNames_0005
     * @tc.desc   liteResultSet.getColumnNames test with querySqlWithoutRowCount input sql size less then 3.
     *            1. SQL length is less than 3
     *            2. execute getColumnNames and return 14800001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetColumnNames_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetColumnNames_005 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('se');
        liteResultSet.getColumnNames();
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetColumnNames_005 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetColumnNames_005 end *************');
    })

    /**
     * @tc.name   lite_queryGetColumnNames_006
     * @tc.number SUB_DistributedData_RelationalStore_lite_queryGetColumnNames_0006
     * @tc.desc   LiteResultSet.getColumnNames test with attach db querySqlWithoutRowCount.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetColumnNames_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetColumnNames_006 start *************');
      let rdbStoreAttach = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      let count = await rdbStoreAttach.attach('/data/storage/el2/database/rdb/rdbQueryResultSet.db', 'attachDB6');
      expect(1).assertEqual(count);
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet =
          await rdbStore.querySqlWithoutRowCount('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let columnNames = liteResultSet.getColumnNames();
        expect(10).assertEqual(columnNames.length);
        expect('id').assertEqual(columnNames[0]);
        expect('name').assertEqual(columnNames[1]);
        expect('age').assertEqual(columnNames[2]);
        expect('data1').assertEqual(columnNames[3]);
        expect('data2').assertEqual(columnNames[4]);
        expect('id').assertEqual(columnNames[5]);
        expect('name').assertEqual(columnNames[6]);
        expect('age').assertEqual(columnNames[7]);
        expect('data3').assertEqual(columnNames[8]);
        expect('data4').assertEqual(columnNames[9]);
      } catch(e) {
        console.error(`lite_queryGetColumnNames_006 failed message:${e.message} code:${e.code}`);
        expect().assertFalse();
      }
      liteResultSet?.close();
      await rdbStoreAttach.detach('attachDB6');
      await rdbStoreAttach.close();
      console.log(TAG + '************* lite_queryGetColumnNames_006 end *************');
    })
  })
}