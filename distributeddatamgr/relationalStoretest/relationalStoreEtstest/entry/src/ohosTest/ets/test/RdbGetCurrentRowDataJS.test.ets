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

export default function RdbGetCurrentRowData() {
  describe('RdbGetCurrentRowData', () => {
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
      } catch (error) {
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
      } catch (error) {
        console.error(TAG + `afterAll failed, code:${error.code}, message:${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   queryCurrentRowData_001
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0001
     * @tc.desc   multi-table querySql with getCurrentRowData and getRow comparison test
     *            1. query all data
     *            2. execute getCurrentRowData and getRow
     *            3. compare the values returned by the two methods
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + '************* queryCurrentRowData_001 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        expect(true).assertEqual(resultSet.goToFirstRow());
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];

        let row = resultSet.getRow();
        expect('zhangsan').assertEqual(row.name);
        expect(18).assertEqual(row.age);
        expect(25000.0).assertEqual(row.data1);
        let rowU8 = row.data2 as Uint8Array;
        for (let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(checkAssetEqual(row.data3 as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(row.data4 as relationalStore.Assets, assets2)).assertTrue();

        let rowData = resultSet.getCurrentRowData();
        expect(10).assertEqual(rowData.length);
        expect(1).assertEqual(rowData[0]);
        expect('zhangsan').assertEqual(rowData[1]);
        expect(18).assertEqual(rowData[2]);
        expect(25000.0).assertEqual(rowData[3]);
        rowU8 = rowData[4] as Uint8Array;
        for (let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(rowData[5]);
        expect('liming').assertEqual(rowData[6]);
        expect(22).assertEqual(rowData[7]);
        expect(checkAssetEqual(rowData[8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowData[9] as relationalStore.Assets, assets2)).assertTrue();
      } catch (err) {
        console.error(`queryCurrentRowData_001 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.log(TAG + '************* queryCurrentRowData_001 end *************');
    })

    /**
     * @tc.name   queryCurrentRowData_002
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0002
     * @tc.desc   multi-table querySql with getCurrentRowData and getRow comparison test
     *            1. query all data
     *            2. execute getCurrentRowData and getRow
     *            3. compare the values returned by the two methods
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + '************* queryCurrentRowData_002 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        let querySQL = 'SELECT test.id AS test_id, test.name AS test_name, test.age AS test_age, ' +
          'test.data1, test.data2, test1.id AS test1_id, test1.name AS test1_name, test1.age AS test1_age, ' +
          'test1.data3, test1.data4 FROM test INNER JOIN test1 ON test.id = test1.id;'
        resultSet = await rdbStore.querySql(querySQL);
        expect(true).assertEqual(resultSet.goToFirstRow());
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];

        let asRowData = resultSet.getCurrentRowData();
        expect(10).assertEqual(asRowData.length);
        expect(1).assertEqual(asRowData[0]);
        expect('zhangsan').assertEqual(asRowData[1]);
        expect(18).assertEqual(asRowData[2]);
        expect(25000.0).assertEqual(asRowData[3]);
        let rowU8 = asRowData[4] as Uint8Array;
        for (let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(asRowData[5]);
        expect('liming').assertEqual(asRowData[6]);
        expect(22).assertEqual(asRowData[7]);
        expect(checkAssetEqual(asRowData[8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(asRowData[9] as relationalStore.Assets, assets2)).assertTrue();

        let asRow = resultSet.getRow();
        expect('zhangsan').assertEqual(asRow.test_name);
        expect(18).assertEqual(asRow.test_age);
        expect(25000.0).assertEqual(asRow.data1);
        rowU8 = asRow.data2 as Uint8Array;
        for (let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect('liming').assertEqual(asRow.test1_name);
        expect(22).assertEqual(asRow.test1_age);
        expect(checkAssetEqual(asRow.data3 as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(asRow.data4 as relationalStore.Assets, assets2)).assertTrue();
      } catch (err) {
        console.error(`queryCurrentRowData_002 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.log(TAG + '************* queryCurrentRowData_002 end *************');
    })

    /**
     * @tc.name   queryCurrentRowData_003
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0003
     * @tc.desc   getCurrentRowData test with resultSet already close.
     *            1. query all data
     *            2. close resultSet
     *            3. execute getCurrentRowData and return 14800014
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + '************* queryCurrentRowData_003 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        resultSet.close();
        resultSet.getCurrentRowData();
        expect().assertFail();
      } catch (err) {
        console.error(`queryCurrentRowData_003 failed message:${err.message} code:${err.code}`);
        expect(14800014).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryCurrentRowData_003 end *************');
    })

    /**
     * @tc.name   queryCurrentRowData_004
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0004
     * @tc.desc   getCurrentRowData test with resultSet querySql no such table.
     *            1. query all data from table test2 that is not exist
     *            2. execute getCurrentRowData and return 14800021
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + '************* queryCurrentRowData_004 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test2');
        resultSet.getCurrentRowData();
        expect().assertFail();
      } catch (err) {
        console.error(`queryCurrentRowData_004 failed message:${err.message} code:${err.code}`);
        expect(14800021).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryCurrentRowData_004 end *************');
    })

    /**
     * @tc.name   queryCurrentRowData_005
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0005
     * @tc.desc   getCurrentRowData test with resultSet querySql no such table.
     *            1. create table using querySql
     *            2. execute getCurrentRowData and return 14800019
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + '************* queryCurrentRowData_005 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql(CREATE_TABLE_TEST);
        resultSet.getCurrentRowData();
        expect().assertFail();
      } catch (err) {
        console.error(`queryCurrentRowData_005 failed message:${err.message} code:${err.code}`);
        expect(14800019).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryCurrentRowData_005 end *************');
    })

    /**
     * @tc.name   queryCurrentRowData_006
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0006
     * @tc.desc   getCurrentRowData test with resultSet querySql input sql size less then 3.
     *            1. input incomplete SQL statement
     *            2. execute getCurrentRowData and return 14800001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + '************* queryCurrentRowData_006 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('se');
        resultSet.getCurrentRowData();
        expect().assertFail();
      } catch (err) {
        console.error(`queryCurrentRowData_006 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryCurrentRowData_006 end *************');
    })

    /**
     * @tc.name   queryCurrentRowData_007
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0007
     * @tc.desc   getCurrentRowData test with resultSet is empty.
     *            1. not execute goToFirstRow
     *            2. execute getCurrentRowData and return 14800012
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + '************* queryCurrentRowData_007 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test where id = 2');
        resultSet.getCurrentRowData();
        expect().assertFail();
      } catch (err) {
        console.error(`queryCurrentRowData_007 failed message:${err.message} code:${err.code}`);
        expect(14800012).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + '************* queryCurrentRowData_007 end *************');
    })

    /**
     * @tc.name   queryCurrentRowData_008
     * @tc.number SUB_DistributedData_RelationalStore_queryCurrentRowDataJsApiTest_0008
     * @tc.desc   ResultSet.CurrentRowData test with attach db querySql.
     *            1. execute attach and querySql
     *            2. get all values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + '************* queryCurrentRowData_008 start *************');
      let rdbStoreAttach = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      let count = await rdbStoreAttach.attach('/data/storage/el2/database/rdb/rdbQueryResultSet.db', 'attachDB1');
      expect(1).assertEqual(count);
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStoreAttach.querySql('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let u8 = new Uint8Array([1, 2, 3])
        const assets2 = [asset1, asset2];
        expect(true).assertEqual(resultSet.goToFirstRow());

        let rowData = resultSet.getCurrentRowData();
        expect(10).assertEqual(rowData.length);
        expect(1).assertEqual(rowData[0]);
        expect('zhangsan').assertEqual(rowData[1]);
        expect(18).assertEqual(rowData[2]);
        expect(25000.0).assertEqual(rowData[3]);
        let rowU8 = rowData[4] as Uint8Array;
        for (let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(rowData[5]);
        expect('liming').assertEqual(rowData[6]);
        expect(22).assertEqual(rowData[7]);
        expect(checkAssetEqual(rowData[8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowData[9] as relationalStore.Assets, assets2)).assertTrue();
      } catch (err) {
        console.error(`queryCurrentRowData_008 failed message:${err.message} code:${err.code}`);
        expect().assertFalse();
      }
      resultSet?.close();
      await rdbStoreAttach.detach('attachDB1');
      await rdbStoreAttach.close();
      console.log(TAG + '************* queryCurrentRowData_008 end *************');
    })

    /**
     * @tc.name   lite_queryCurrentRowData_001
     * @tc.number SUB_DistributedData_RelationalStore_ litequeryCurrentRowDataJsApiTest_0001
     * @tc.desc   multi-table querySqlWithoutRowCount with getCurrentRowData and getRow comparison test
     *            1. query all data, using 'select * from ....'
     *            2. execute getCurrentRowData and getRow
     *            3. compare the values returned by the two methods
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryCurrentRowData_001 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await
        rdbStore.querySqlWithoutRowCount('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];
        liteResultSet.goToNextRow();

        let liteRow = liteResultSet.getRow();
        expect('zhangsan').assertEqual(liteRow.name);
        expect(18).assertEqual(liteRow.age);
        expect(25000.0).assertEqual(liteRow.data1);
        let rowU8 = liteRow.data2 as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(checkAssetEqual(liteRow.data3 as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteRow.data4 as relationalStore.Assets, assets2)).assertTrue();

        let liteRowData = liteResultSet.getCurrentRowData();
        expect(10).assertEqual(liteRowData.length);
        expect(1).assertEqual(liteRowData[0]);
        expect('zhangsan').assertEqual(liteRowData[1]);
        expect(18).assertEqual(liteRowData[2]);
        expect(25000.0).assertEqual(liteRowData[3]);
        rowU8 = liteRowData[4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(liteRowData[5]);
        expect('liming').assertEqual(liteRowData[6]);
        expect(22).assertEqual(liteRowData[7]);
        expect(checkAssetEqual(liteRowData[8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteRowData[9] as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`lite_queryCurrentRowData_001 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryCurrentRowData_001 end *************');
    })

    /**
     * @tc.name   lite_queryCurrentRowData_002
     * @tc.number SUB_DistributedData_RelationalStore_ litequeryCurrentRowDataJsApiTest_0002
     * @tc.desc   multi-table querySqlWithoutRowCount with getCurrentRowData and getRow comparison test
     *            1. query all data
     *            2. execute getCurrentRowData and getRow
     *            3. compare the values returned by the two methods
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryCurrentRowData_002 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        let querySQL = 'SELECT test.id AS test_id, test.name AS test_name, test.age AS test_age, ' +
          'test.data1, test.data2, test1.id AS test1_id, test1.name AS test1_name, test1.age AS test1_age, ' +
          'test1.data3, test1.data4 FROM test INNER JOIN test1 ON test.id = test1.id;'
        liteResultSet = await rdbStore.querySqlWithoutRowCount(querySQL);
        liteResultSet.goToNextRow();
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];

        let asLiteRowData = liteResultSet.getCurrentRowData();
        expect(10).assertEqual(asLiteRowData.length);
        expect(1).assertEqual(asLiteRowData[0]);
        expect('zhangsan').assertEqual(asLiteRowData[1]);
        expect(18).assertEqual(asLiteRowData[2]);
        expect(25000.0).assertEqual(asLiteRowData[3]);
        let rowU8 = asLiteRowData[4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(asLiteRowData[5]);
        expect('liming').assertEqual(asLiteRowData[6]);
        expect(22).assertEqual(asLiteRowData[7]);
        expect(checkAssetEqual(asLiteRowData[8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(asLiteRowData[9] as relationalStore.Assets, assets2)).assertTrue();

        let asLiteRow = liteResultSet.getRow();
        expect('zhangsan').assertEqual(asLiteRow.test_name);
        expect(18).assertEqual(asLiteRow.test_age);
        expect(25000.0).assertEqual(asLiteRow.data1);
        rowU8 = asLiteRow.data2 as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect('liming').assertEqual(asLiteRow.test1_name);
        expect(22).assertEqual(asLiteRow.test1_age);
        expect(checkAssetEqual(asLiteRow.data3 as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(asLiteRow.data4 as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`lite_queryCurrentRowData_002 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryCurrentRowData_002 end *************');
    })

    /**
     * @tc.name   lite_queryCurrentRowData_003
     * @tc.number SUB_DistributedData_RelationalStore_ litequeryCurrentRowDataJsApiTest_0003
     * @tc.desc   liteResultSet.getCurrentRowData test with liteResultSet already close.
     *            1. close resultSet and execute getCurrentRowData
     *            2. return 14800014
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryCurrentRowData_003 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await
        rdbStore.querySqlWithoutRowCount('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        liteResultSet?.close();
        liteResultSet.getCurrentRowData();
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryCurrentRowData_003 failed message:${err.message} code:${err.code}`);
        expect(14800014).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryCurrentRowData_003 end *************');
    })

    /**
     * @tc.name   lite_queryCurrentRowData_004
     * @tc.number SUB_DistributedData_RelationalStore_ litequeryCurrentRowDataJsApiTest_0004
     * @tc.desc   liteResultSet.getCurrentRowData test with querySqlWithoutRowCount no such table.
     *            1. not create table and execute getCurrentRowData
     *            2. return 14800021
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryCurrentRowData_004 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('SELECT * FROM test2');
        liteResultSet.getCurrentRowData();
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryCurrentRowData_004 failed message:${err.message} code:${err.code}`);
        expect(14800021).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryCurrentRowData_004 end *************');
    })

    /**
     * @tc.name   lite_queryCurrentRowData_005
     * @tc.number SUB_DistributedData_RelationalStore_ litequeryCurrentRowDataJsApiTest_0005
     * @tc.desc   liteResultSet.getCurrentRowData test with querySqlWithoutRowCount input create table sql.
     *            1. create table by querySqlWithoutRowCount
     *            2. execute getCurrentRowData and return 14800021
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryCurrentRowData_005 start *************');
      let liteResultSet : relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount(CREATE_TABLE_TEST);
        liteResultSet.getCurrentRowData();
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryCurrentRowData_005 failed message:${err.message} code:${err.code}`);
        expect(14800019).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryCurrentRowData_005 end *************');
    })

    /**
     * @tc.name   lite_queryCurrentRowData_006
     * @tc.number SUB_DistributedData_RelationalStore_ litequeryCurrentRowDataJsApiTest_0006
     * @tc.desc   liteResultSet.getCurrentRowData test with querySqlWithoutRowCount input sql size less then 3.
     *            1. SQL length is less than 3
     *            2. execute getCurrentRowData and return 14800021
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryCurrentRowData_006 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('se');
        liteResultSet.getCurrentRowData();
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryCurrentRowData_006 failed message:${err.message} code:${err.code}`);
        expect(14800001).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryCurrentRowData_006 end *************');
    })

    /**
     * @tc.name   lite_queryCurrentRowData_007
     * @tc.number SUB_DistributedData_RelationalStore_ litequeryCurrentRowDataJsApiTest_0007
     * @tc.desc   getCurrentRowData test with liteResultSet is empty.
     *            1. no data and execute getCurrentRowData
     *            2. return 14800012
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryCurrentRowData_007 start *************');
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount('SELECT * FROM test where id = 2');
        liteResultSet.getCurrentRowData();
        expect().assertFail();
      } catch(err) {
        console.error(`lite_queryCurrentRowData_007 failed message:${err.message} code:${err.code}`);
        expect(14800012).assertEqual(err.code);
      }
      liteResultSet?.close();
      console.log(TAG + '************* lite_queryCurrentRowData_007 end *************');
    })

    /**
     * @tc.name   lite_queryCurrentRowData_008
     * @tc.number SUB_DistributedData_RelationalStore_ litequeryCurrentRowDataJsApiTest_0008
     * @tc.desc   ResultSet.CurrentRowData test with attach db querySql.
     *            1. execute attach and querySql
     *            2. get all values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* lite_queryCurrentRowData_008 start *************');
      let rdbStoreAttach = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      let count = await rdbStoreAttach.attach('/data/storage/el2/database/rdb/rdbQueryResultSet.db', 'attachDB4');
      expect(1).assertEqual(count);
      let liteResultSet: relationalStore.LiteResultSet | undefined;
      try {
        liteResultSet = await
        rdbStoreAttach.querySqlWithoutRowCount('SELECT * FROM test INNER JOIN test1 ON test.id = test1.id');
        let u8 = new Uint8Array([1, 2, 3])
        const assets2 = [asset1, asset2];
        expect(true).assertEqual(liteResultSet.goToNextRow());

        let liteRowData = liteResultSet.getCurrentRowData();
        expect(10).assertEqual(liteRowData.length);
        expect(1).assertEqual(liteRowData[0]);
        expect('zhangsan').assertEqual(liteRowData[1]);
        expect(18).assertEqual(liteRowData[2]);
        expect(25000.0).assertEqual(liteRowData[3]);
        let rowU8 = liteRowData[4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(u8[i]).assertEqual(rowU8[i]);
        }
        expect(1).assertEqual(liteRowData[5]);
        expect('liming').assertEqual(liteRowData[6]);
        expect(22).assertEqual(liteRowData[7]);
        expect(checkAssetEqual(liteRowData[8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteRowData[9] as relationalStore.Assets, assets2)).assertTrue();
      } catch(err) {
        console.error(`lite_queryCurrentRowData_008 failed message:${err.message} code:${err.code}`);
        expect().assertFalse();
      }
      liteResultSet?.close();
      await rdbStoreAttach.detach('attachDB4');
      await rdbStoreAttach.close();
      console.log(TAG + '************* lite_queryCurrentRowData_008 end *************');
    })

  })
}