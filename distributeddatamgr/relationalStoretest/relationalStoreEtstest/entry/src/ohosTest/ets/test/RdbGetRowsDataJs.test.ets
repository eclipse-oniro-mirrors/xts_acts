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

export default function RdbGetRowsData() {
  describe('RdbGetRowsData', () => {
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
     * @tc.name   queryGetRowsData_001
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0009
     * @tc.desc   multi-table querySql with getRowsData and getRows comparison test
     *            1. query all data
     *            2. execute getRowsData and getRows
     *            3. compare the values returned by the two methods
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_001 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];
        let rowsData = await resultSet.getRowsData(1);
        expect(1).assertEqual(rowsData.length);
        expect(10).assertEqual(rowsData[0].length);
        expect(1).assertEqual(rowsData[0][0]);
        expect('zhangsan').assertEqual(rowsData[0][1]);
        expect(18).assertEqual(rowsData[0][2]);
        expect(25000.0).assertEqual(rowsData[0][3]);
        let rowU8 = rowsData[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(rowsData[0][5]);
        expect('liming').assertEqual(rowsData[0][6]);
        expect(22).assertEqual(rowsData[0][7]);
        expect(checkAssetEqual(rowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowsData[0][9] as relationalStore.Assets, assets2)).assertTrue();

        let rows = await resultSet.getRows(1, 0);
        expect('zhangsan').assertEqual(rows[0].name);
        expect(18).assertEqual(rows[0].age);
        expect(25000.0).assertEqual(rows[0].data1);
        rowU8 = rows[0].data2 as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(checkAssetEqual(rows[0].data3 as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rows[0].data4 as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`queryGetRowsData_001 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_001 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_002
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0010
     * @tc.desc   multi-table querySql with getRowsData and getRows comparison test
     *            1. query all data
     *            2. execute getRowsData and getRows
     *            3. compare the values returned by the two methods
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_002 start *************');
      let u8 = new Uint8Array([1, 2, 3]);
      const assets2 = [asset1, asset2];
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        let querySQL = 'SELECT test.id AS test_id, test.name AS test_name, test.age AS test_age, ' +
          'test.data1, test.data2, test1.id AS test1_id, test1.name AS test1_name, test1.age AS test1_age, ' +
          'test1.data3, test1.data4 FROM test INNER JOIN test1 ON test.id = test1.id;'
        resultSet = await rdbStore.querySql(querySQL);
        let asRowsData = await resultSet.getRowsData(1);
        expect(1).assertEqual(asRowsData.length);
        expect(10).assertEqual(asRowsData[0].length);
        expect(1).assertEqual(asRowsData[0][0]);
        expect('zhangsan').assertEqual(asRowsData[0][1]);
        expect(18).assertEqual(asRowsData[0][2]);
        expect(25000.0).assertEqual(asRowsData[0][3]);
        let rowU8 = asRowsData[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(asRowsData[0][5]);
        expect('liming').assertEqual(asRowsData[0][6]);
        expect(22).assertEqual(asRowsData[0][7]);
        expect(checkAssetEqual(asRowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(asRowsData[0][9] as relationalStore.Assets, assets2)).assertTrue();
        let asRows = await resultSet.getRows(1, 0);
        expect('zhangsan').assertEqual(asRows[0].test_name);
        expect(18).assertEqual(asRows[0].test_age);
        expect(25000.0).assertEqual(asRows[0].data1);
        rowU8 = asRows[0].data2 as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect('liming').assertEqual(asRows[0].test1_name);
        expect(22).assertEqual(asRows[0].test1_age);
        expect(checkAssetEqual(asRows[0].data3 as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(asRows[0].data4 as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`queryGetRowsData_002 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_002 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_003
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0011
     * @tc.desc   getRowsData test with resultSet already close.
     *            1. execute querySql and close resultSet
     *            2. return 14800014
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_003 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        resultSet?.close();
        await resultSet.getRowsData(1);
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetRowsData_003 failed message:${err.message} code:${err.code}`);
        expect(14800014).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_003 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_004
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0012
     * @tc.desc   getRowsData test with resultSet querySql no such table.
     *            1. not create table and execute querySql
     *            2. return 14800021
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_004 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test2');
        await resultSet.getRowsData(1);
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetRowsData_004 failed message:${err.message} code:${err.code}`);
        expect(14800021).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_004 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_005
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0013
     * @tc.desc   getRowsData test with resultSet querySql no such table.
     *            1. create table using querySql
     *            2. execute getCurrentRowData and return 14800019
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_005 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql(CREATE_TABLE_TEST);
        await resultSet.getRowsData(1);
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetRowsData_005 failed message:${err.message} code:${err.code}`);
        expect(14800019).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_005 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_006
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0014
     * @tc.desc   getRowsData test with resultSet querySql input create table sql.
     *            1. execute querySql, SQL length is less than 3
     *            2. return 14800001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_006 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('se');
        await resultSet.getRowsData(1);
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetRowsData_006 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_006 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_007
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0015
     * @tc.desc   getRowsData test with resultSet is empty.
     *            1. execute querySql
     *            2. no data and return 14800012
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_007 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test where id = 3');
        await resultSet.getRowsData(1, 1);
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetRowsData_007 failed message:${err.message} code:${err.code}`);
        expect(14800012).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_007 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_008
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0016
     * @tc.desc   getRowsData test with input maxCount out of resultSet rows.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_008 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];
        let rowsDataAll = await resultSet.getRowsData(4);
        expect(2).assertEqual(rowsDataAll.length);
        expect(10).assertEqual(rowsDataAll[0].length);
        expect(10).assertEqual(rowsDataAll[1].length);
        expect(1).assertEqual(rowsDataAll[0][0]);
        expect('zhangsan').assertEqual(rowsDataAll[0][1]);
        expect(18).assertEqual(rowsDataAll[0][2]);
        expect(25000.0).assertEqual(rowsDataAll[0][3]);
        let rowU8 = rowsDataAll[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(rowsDataAll[0][5]);
        expect('liming').assertEqual(rowsDataAll[0][6]);
        expect(22).assertEqual(rowsDataAll[0][7]);
        expect(checkAssetEqual(rowsDataAll[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowsDataAll[0][9] as relationalStore.Assets, assets2)).assertTrue();
        expect(2).assertEqual(rowsDataAll[1][0]);
        expect('lisi').assertEqual(rowsDataAll[1][1]);
        expect(20).assertEqual(rowsDataAll[1][2]);
        expect(20000.0).assertEqual(rowsDataAll[1][3]);
        rowU8 = rowsDataAll[1][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(2).assertEqual(rowsDataAll[1][5]);
        expect('lifei').assertEqual(rowsDataAll[1][6]);
        expect(24).assertEqual(rowsDataAll[1][7]);
        expect(checkAssetEqual(rowsDataAll[1][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowsDataAll[1][9] as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`queryGetRowsData_008 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_008 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_009
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0017
     * @tc.desc   getRowsData test with input maxCount is -1.
     *            1. maxCount is less than 0
     *            2. return 14800001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_009 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test where id = 1');
        await resultSet.getRowsData(-1);
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetRowsData_009 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_009 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_010
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0018
     * @tc.desc   ResultSet.getRowsData test with attach db querySql.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_010 start *************');
      let rdbStoreAttach = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      let count = await rdbStoreAttach.attach('/data/storage/el2/database/rdb/rdbQueryResultSet.db', 'attachDB2');
      expect(count == 1).assertTrue();
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStoreAttach.querySql('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let u8 = new Uint8Array([1, 2, 3])
        const assets2 = [asset1, asset2];
        let rowsData = await resultSet.getRowsData(1, 0);
        expect(1).assertEqual(rowsData.length);
        expect(10).assertEqual(rowsData[0].length);
        expect(1).assertEqual(rowsData[0][0]);
        expect('zhangsan').assertEqual(rowsData[0][1]);
        expect(18).assertEqual(rowsData[0][2]);
        expect(25000.0).assertEqual(rowsData[0][3]);
        let rowU8 = rowsData[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(rowsData[0][5]);
        expect('liming').assertEqual(rowsData[0][6]);
        expect(22).assertEqual(rowsData[0][7]);
        expect(checkAssetEqual(rowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowsData[0][9] as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`queryGetRowsData_010 failed message:${err.message} code:${err.code}`);
        expect().assertFalse();
      }
      resultSet?.close();
      await rdbStoreAttach.detach('attachDB2');
      await rdbStoreAttach.close();
      console.log(TAG + '************* queryGetRowsData_010 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_011
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0019
     * @tc.desc   getRowsData test with input maxCount and position are -1.
     *            1. both maxCount and position are less than 0
     *            2. return 14800001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_011 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test where id = 1');
        await resultSet.getRowsData(-1, -1);
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetRowsData_011 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_011 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_012
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0020
     * @tc.desc   getRowsData test with input maxCount -1 and position is 0.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_012 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test where id = 1');
        await resultSet.getRowsData(-1, 0);
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetRowsData_012 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_012 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_013
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0021
     * @tc.desc   getRowsData test, maxCount is 1, position is 1.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_013 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];
        let rowsData = await resultSet.getRowsData(1, 1);
        expect(1).assertEqual(rowsData.length);
        expect(10).assertEqual(rowsData[0].length);
        expect(1).assertEqual(rowsData.length);
        expect(2).assertEqual(rowsData[0][0]);
        expect('lisi').assertEqual(rowsData[0][1]);
        expect(20).assertEqual(rowsData[0][2]);
        expect(20000.0).assertEqual(rowsData[0][3]);
        let rowU8 = rowsData[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(2).assertEqual(rowsData[0][5]);
        expect('lifei').assertEqual(rowsData[0][6]);
        expect(24).assertEqual(rowsData[0][7]);
        expect(checkAssetEqual(rowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowsData[0][9] as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`queryGetRowsData_013 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_013 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_014
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0022
     * @tc.desc   getRowsData test with input maxCount 0.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetRowsData_014 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test where id = 1');
        await resultSet.getRowsData(0);
        expect().assertFail();
      } catch(err) {
        console.error(`queryGetRowsData_014 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_014 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_001
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0023
     * @tc.desc   multi-table querySqlWithoutRowCount with getRowsData and getRows comparison test
     *            1. query all data, using 'select * from ...'
     *            2. execute getRows and getRowsData
     *            3. compare the values returned by the two methods
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async () => {
      console.log(TAG + '************* lite_queryGetRowsData_001 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet =
          await rdbStore.querySqlWithoutRowCount('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];

        let liteRowsData = await liteResultSet.getRowsData(1, 0);
        expect(1).assertEqual(liteRowsData.length);
        expect(10).assertEqual(liteRowsData[0].length);
        expect(1).assertEqual(liteRowsData[0][0]);
        expect('zhangsan').assertEqual(liteRowsData[0][1]);
        expect(18).assertEqual(liteRowsData[0][2]);
        expect(25000.0).assertEqual(liteRowsData[0][3]);
        let rowU8 = liteRowsData[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(liteRowsData[0][5]);
        expect('liming').assertEqual(liteRowsData[0][6]);
        expect(22).assertEqual(liteRowsData[0][7]);
        expect(checkAssetEqual(liteRowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteRowsData[0][9] as relationalStore.Assets, assets2)).assertTrue();

        let liteRows = await liteResultSet.getRows(1, 0);
        expect(1).assertEqual(liteRows[0].id);
        expect('zhangsan').assertEqual(liteRows[0].name);
        expect(18).assertEqual(liteRows[0].age);
        expect(25000.0).assertEqual(liteRows[0].data1);
        rowU8 = liteRows[0].data2 as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(checkAssetEqual(liteRows[0].data3 as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteRows[0].data4 as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`lite_queryGetRowsData_001 failed message:${err.message} code:${err.code}`);
        liteResultSet?.close();
        expect().assertFail();
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_001 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_002
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0024
     * @tc.desc   multi-table querySqlWithoutRowCount with getRowsData and getRows comparison test
     *            1. query all data
     *            2. execute getRows and getRowsData
     *            3. compare the values returned by the two methods
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_002 start *************');
      let u8 = new Uint8Array([1, 2, 3]);
      const assets2 = [asset1, asset2];
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        let querySQL = 'SELECT test.id AS test_id, test.name AS test_name, test.age AS test_age, ' +
          'test.data1, test.data2, test1.id AS test1_id, test1.name AS test1_name, test1.age AS test1_age, ' +
          'test1.data3, test1.data4 FROM test INNER JOIN test1 ON test.id = test1.id;'
        liteResultSet = await rdbStore.querySqlWithoutRowCount(querySQL);

        let liteAsRowsData = await liteResultSet.getRowsData(1);
        expect(1).assertEqual(liteAsRowsData.length);
        expect(10).assertEqual(liteAsRowsData[0].length);
        expect(1).assertEqual(liteAsRowsData[0][0]);
        expect('zhangsan').assertEqual(liteAsRowsData[0][1]);
        expect(18).assertEqual(liteAsRowsData[0][2]);
        expect(25000.0).assertEqual(liteAsRowsData[0][3]);
        let rowU8 = liteAsRowsData[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(liteAsRowsData[0][5]);
        expect('liming').assertEqual(liteAsRowsData[0][6]);
        expect(22).assertEqual(liteAsRowsData[0][7]);
        expect(checkAssetEqual(liteAsRowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteAsRowsData[0][9] as relationalStore.Assets, assets2)).assertTrue();

        let liteAsRows = await liteResultSet.getRows(1, 0);
        expect('zhangsan').assertEqual(liteAsRows[0].test_name);
        expect(18).assertEqual(liteAsRows[0].test_age);
        expect(25000.0).assertEqual(liteAsRows[0].data1);
        rowU8 = liteAsRows[0].data2 as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect('liming').assertEqual(liteAsRows[0].test1_name);
        expect(22).assertEqual(liteAsRows[0].test1_age);
        expect(true).assertEqual(checkAssetEqual(liteAsRows[0].data3 as relationalStore.Asset, asset1));
        expect(true).assertEqual(checkAssetsEqual(liteAsRows[0].data4 as relationalStore.Assets, assets2));
      } catch(err) {
        console.error(`lite_queryGetRowsData_002 failed message:${err.message} code:${err.code}`);
        liteResultSet?.close();
        expect().assertFail();
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_002 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_003
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0025
     * @tc.desc   liteResultSet.getRowsData test with liteResultSet already close.
     *            1. close resultSet
     *            2. execute getRowsData and return 14800014
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_003 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet =
          await rdbStore.querySqlWithoutRowCount('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        liteResultSet?.close();
        await liteResultSet.getRowsData(1);
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetRowsData_003 failed message:${err.message} code:${err.code}`);
        expect(14800014).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_003 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_004
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0026
     * @tc.desc   liteResultSet.getRowsData test with querySqlWithoutRowCount no such table.
     *            1. not create table
     *            2. execute getRowsData and return 14800021
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_004 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('SELECT * FROM test2');
        await liteResultSet.getRowsData(1);
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetRowsData_004 failed message:${err.message} code:${err.code}`);
        expect(14800021).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_004 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_005
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0027
     * @tc.desc   liteResultSet.getRowsData test with querySqlWithoutRowCount input create table sql.
     *            1. create table by querySqlWithoutRowCount
     *            2. execute getRowsData and return 14800021
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_005 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount(CREATE_TABLE_TEST);
        await liteResultSet.getRowsData(1);
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetRowsData_005 failed message:${err.message} code:${err.code}`);
        expect(14800019).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_005 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_006
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0028
     * @tc.desc   liteResultSet.getRowsData test with querySqlWithoutRowCount input sql size less then 3.
     *            1. SQL length is less than 3
     *            2. execute getRowsData and return 14800001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_006 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('se');
        await liteResultSet.getRowsData(1);
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetRowsData_006 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_006 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_007
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0029
     * @tc.desc   liteResultSet.getRowsData test with resultSet is empty.
     *            1. no data in resultSet
     *            2. execute getRowsData and return 14800012
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_007 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('SELECT * FROM test where id = 3');
        await liteResultSet.getRowsData(1, 1);
      } catch(err) {
        console.error(`lite_queryGetRowsData_007 failed message:${err.message} code:${err.code}`);
        expect(14800012).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_006 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_008
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0030
     * @tc.desc   getRowsData test with input maxCount out of liteResultSet rows.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_008 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet =
          await rdbStore.querySqlWithoutRowCount('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];

        let liteRowsDataAll = await liteResultSet.getRowsData(4);
        expect(2).assertEqual(liteRowsDataAll.length);
        expect(10).assertEqual(liteRowsDataAll[0].length);
        expect(10).assertEqual(liteRowsDataAll[1].length);
        expect(1).assertEqual(liteRowsDataAll[0][0]);
        expect('zhangsan').assertEqual(liteRowsDataAll[0][1]);
        expect(18).assertEqual(liteRowsDataAll[0][2]);
        expect(25000.0).assertEqual(liteRowsDataAll[0][3]);
        let rowU8 = liteRowsDataAll[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(liteRowsDataAll[0][5]);
        expect('liming').assertEqual(liteRowsDataAll[0][6]);
        expect(22).assertEqual(liteRowsDataAll[0][7]);
        expect(checkAssetEqual(liteRowsDataAll[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteRowsDataAll[0][9] as relationalStore.Assets, assets2)).assertTrue();
        expect(2).assertEqual(liteRowsDataAll[1][0]);
        expect('lisi').assertEqual(liteRowsDataAll[1][1]);
        expect(20).assertEqual(liteRowsDataAll[1][2]);
        expect(20000.0).assertEqual(liteRowsDataAll[1][3]);
        rowU8 = liteRowsDataAll[1][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(2).assertEqual(liteRowsDataAll[1][5]);
        expect('lifei').assertEqual(liteRowsDataAll[1][6]);
        expect(24).assertEqual(liteRowsDataAll[1][7]);
        expect(checkAssetEqual(liteRowsDataAll[1][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteRowsDataAll[1][9] as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`lite_queryGetRowsData_008 failed message:${err.message} code:${err.code}`);
        liteResultSet?.close();
        expect().assertFail();
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_008 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_009
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0031
     * @tc.desc   getRowsData test with input maxCount is -1.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_009 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('SELECT * FROM test where id = 1');
        await liteResultSet.getRowsData(-1);
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetRowsData_009 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_009 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_010
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0032
     * @tc.desc   LiteResultSet.getRowsData test with attach db querySqlWithoutRowCount.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_010 start *************');
      let rdbStoreAttach = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      let count = await rdbStoreAttach.attach('/data/storage/el2/database/rdb/rdbQueryResultSet.db', 'attachDB5');
      expect(count == 1).assertTrue();
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet =
          await rdbStoreAttach.querySqlWithoutRowCount('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let u8 = new Uint8Array([1, 2, 3])
        const assets2 = [asset1, asset2];
        let rowsData = await liteResultSet.getRowsData(1, 0);
        expect(1).assertEqual(rowsData.length);
        expect(10).assertEqual(rowsData[0].length);
        expect(1).assertEqual(rowsData[0][0]);
        expect('zhangsan').assertEqual(rowsData[0][1]);
        expect(18).assertEqual(rowsData[0][2]);
        expect(25000.0).assertEqual(rowsData[0][3]);
        let rowU8 = rowsData[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(rowsData[0][5]);
        expect('liming').assertEqual(rowsData[0][6]);
        expect(22).assertEqual(rowsData[0][7]);
        expect(checkAssetEqual(rowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowsData[0][9] as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`lite_queryGetRowsData_010 failed message:${err.message} code:${err.code}`);
        await rdbStoreAttach.detach('attachDB5');
        expect().assertFalse();
      }
      liteResultSet?.close();
      await rdbStoreAttach.detach('attachDB5');
      await rdbStoreAttach.close();
      console.log(TAG + '************* lite_queryGetRowsData_010 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_011
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0033
     * @tc.desc   getRowsData test with input maxCount and position are -1.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_011 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('SELECT * FROM test where id = 1');
        await liteResultSet.getRowsData(-1, -1);
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetRowsData_011 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_011 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_012
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0034
     * @tc.desc   getRowsData test with input maxCount -1 and position is 0.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + '************* lite_queryGetRowsData_012 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('SELECT * FROM test where id = 1');
        await liteResultSet.getRowsData(-1, 0);
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetRowsData_012 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_012 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_013
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0036
     * @tc.desc   getRowsData test for liteResultSet, maxCount is 1, position is 1.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_013 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet =
          await rdbStore.querySqlWithoutRowCount('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];
        let rowsData = await liteResultSet.getRowsData(1,1);
        expect(1).assertEqual(rowsData.length);
        expect(10).assertEqual(rowsData[0].length);
        expect(2).assertEqual(rowsData[0][0]);
        expect('lisi').assertEqual(rowsData[0][1]);
        expect(20).assertEqual(rowsData[0][2]);
        expect(20000.0).assertEqual(rowsData[0][3]);
        let rowU8 = rowsData[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(2).assertEqual(rowsData[0][5]);
        expect('lifei').assertEqual(rowsData[0][6]);
        expect(24).assertEqual(rowsData[0][7]);
        expect(checkAssetEqual(rowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowsData[0][9] as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`lite_queryGetRowsData_013 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_013 end *************');
    })

    /**
     * @tc.name   lite_queryGetRowsData_014
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0037
     * @tc.desc   getRowsData test with input maxCount -1 and position is 0.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryGetRowsData_014 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('SELECT * FROM test where id = 1');
        await liteResultSet.getRowsData(0);
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryGetRowsData_014 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryGetRowsData_014 end *************');
    })
  })
}