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

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const CREATE_ASSERT_TABLE_TEST = "CREATE TABLE IF NOT EXISTS asset_table (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 asset," + "data2 assets)";

const DROP_TEST = "DROP TABLE IF EXISTS test";

const asset1 : relationalStore.Asset = {
  name: "name1",
  uri: "uri1",
  createTime: "createTime1",
  modifyTime: "modifyTime1",
  size: "size1",
  path: "path1",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2 : relationalStore.Asset = {
  name: "name2",
  uri: "uri2",
  createTime: "createTime2",
  modifyTime: "modifyTime2",
  size: "size2",
  path: "path2",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
let STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbQuery.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
export default function RdbStoreErrorCodeAdd2Test() {
  describe('RdbStoreErrorCodeAdd2Test', (): void => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      try{
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        console.error(TAG + 'contextDir' + context.databaseDir);
        expect(rdbStore != undefined).assertTrue();
        if (rdbStore != undefined){
          await rdbStore!.executeSql(DROP_TEST);
          await rdbStore!.executeSql(CREATE_TABLE_TEST);
          let u8 = new Uint8Array([1, 2, 3])
          const valueBucket: relationalStore.ValuesBucket = {
            'data1': 'zhangsan',
            'data2': 18,
            'data3': 25000.0,
            'data4': u8,
            'data5': asset1,

          };
          await rdbStore!.insert('test', valueBucket);
        }
      }catch (error) {
        console.error('%{public}s', 'beforeEach failed');
        expect().assertFail();
      }
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name        LiteResultSetGetAssetTest0001
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetGetAssetTest_0010
     * @tc.desc        getAsset normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetGetAssetTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG +
          "************* LiteResultSetGetAssetTest0001 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        try {
          resultSet.getAsset(9);
          expect().assertFail();
        } catch(err) {
          console.error(`LiteResultSetGetAssetTest0001 failed:${err.message} code:${err.code}`);

          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code == 14800012).assertTrue();
        }
        console.log(TAG + "************* LiteResultSetGetAssetTest0001 end *************");
      })

    /**
     * @tc.name        LiteResultSetGetAssetTest0002
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetGetAssetTest_0020
     * @tc.desc        getAsset normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetGetAssetTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
        console.info(TAG +
          "************* LiteResultSetGetAssetTest0002 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getAsset(9);
          expect().assertFail();
        } catch(err) {
          console.error(`LiteResultSetGetAssetTest0002 failed:${err.message} code:${err.code}`);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code == 14800013).assertTrue();
        }
        console.log(TAG + "************* LiteResultSetGetAssetTest0002 end *************");
      })

    /**
     * @tc.name        LiteResultSetGetAssetTest0003
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetGetAssetTest_0030
     * @tc.desc        getAsset normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetGetAssetTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG +
          "************* LiteResultSetGetAssetTest0003 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const doc = resultSet.getAsset(resultSet.getColumnIndex("zhangsan"));
          expect().assertFail();
        } catch(err) {
          console.error(`LiteResultSetGetAssetTest0003 failed:${err.message} code:${err.code}`);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code == 14800014).assertTrue();
        }
        console.log(TAG + "************* LiteResultSetGetAssetTest0003 end *************");
      })

    /**
     * @tc.name        LiteResultSetgetAssetsTest0001
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetGetAssetsTest_0010
     * @tc.desc        getAssets normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetgetAssetsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG +
          "************* LiteResultSetgetAssetsTest0001 start *************");
        await rdbStore!.executeSql("delete from test");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        try {
          resultSet.getAssets(5);
          expect().assertFail();
        } catch(err) {
          console.error(`LiteResultSetgetAssetsTest0001 failed:${err.message} code:${err.code}`);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code == 14800012).assertTrue();
        }
        console.log(TAG + "************* LiteResultSetgetAssetsTest0001 end *************");
      })

    /**
     * @tc.name        LiteResultSetgetAssetsTest0002
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetGetAssetsTest_0020
     * @tc.desc        getAsset normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetgetAssetsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG +
          "************* LiteResultSetgetAssetsTest0002 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getAsset(9);
          expect().assertFail();
        } catch(err) {
          console.error(`LiteResultSetgetAssetsTest0002 failed:${err.message} code:${err.code}`);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code == 14800013).assertTrue();
        }
        console.log(TAG + "************* LiteResultSetgetAssetsTest0002 end *************");
      })

    /**
     * @tc.name        LiteResultSetgetAssetsTest0003
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetGetAssetsTest_0030
     * @tc.desc        getAssets normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetgetAssetsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG +
          "************* LiteResultSetgetAssetsTest0003 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const doc = resultSet.getAssets(resultSet.getColumnIndex("zhangsan"));
          expect().assertFail();
        } catch(err) {
          console.error(`LiteResultSetgetAssetsTest0003 failed:${err.message} code:${err.code}`);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code == 14800014).assertTrue();
        }
        console.log(TAG + "************* LiteResultSetgetAssetsTest0003 end *************");
      })


    /**
     * @tc.name   queryGetColumnNames_001
     * @tc.number SUB_DistributedData_RelationalStore_RdbStoreSetgetColumnNames_0001
     * @tc.desc   multi-table for query all column names by getColumnNames
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetColumnNames_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ()  => {
      console.log(TAG + '************* queryGetColumnNames_001 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql('SELECT * FROM test');
        let columnNames = resultSet.getColumnNames();
        expect(columnNames.length > 0).assertTrue();
        console.log("queryGetColumnNames_001 is finish")
      } catch(err) {
        console.error(`queryGetColumnNames_001 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetColumnNames_001 end *************');
    })

    /**
     * @tc.name   queryGetRowsData_002
     * @tc.number SUB_DistributedData_RelationalStore_RdbStoreSetqueryGetRowsData_0002
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
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test");
        let asRowsData = await resultSet.getRowsData(5);
        expect(asRowsData.length > 0).assertTrue();
      } catch(err) {
        console.error(`queryGetRowsData_002 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.log(TAG + '************* queryGetRowsData_002 end *************');
    })
  })
}