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
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + "data9 text" + ")";

const CREATE_ASSERT_TABLE_TEST1 = "CREATE TABLE test1 ('' TEXT);"

const DROP_TEST = "DROP TABLE IF EXISTS test";
const DROP_TEST1 = "DROP TABLE IF EXISTS test1";

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
export default function RdbStoreErrorCodeAdd3Test() {
  describe('RdbStoreErrorCodeAdd3Test', (): void => {
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
     * @tc.name        LiteResultSetErroeCode14800041Test0001
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreErroeCode14800041Test0001
     * @tc.desc        getAsset normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErroeCode14800041Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG +
        "************* LiteResultSetGetAssetTest0004 start *************");
      let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
      resultSet.goToNextRow();
      try {
        resultSet.getAsset(2);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSetErroeCode14800041Test0001 failed:${err.message} code:${err.code}`);
        await rdbStore!.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        expect(err.code === 14800041).assertTrue();
      }
      console.log(TAG + "************* LiteResultSetErroeCode14800041Test0001 end *************");
    })

    /**
     * @tc.name        LiteResultSetErroeCode14800041Test0002
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreErroeCode14800041Test0002
     * @tc.desc        getAssets normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErroeCode14800041Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG +
        "************* LiteResultSetErroeCode14800041Test0002 start *************");
      let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
      resultSet.goToNextRow();
      try {
        resultSet.getAssets(2);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSetErroeCode14800041Test0002 failed:${err.message} code:${err.code}`);
        await rdbStore!.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        expect(err.code === 14800041).assertTrue();
      }
      console.log(TAG + "************* LiteResultSetErroeCode14800041Test0002 end *************");
    })

    /**
     * @tc.name        LiteResultSetErroeCode14800041Test0003
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreErroeCode14800041Test0003
     * @tc.desc        getBlob normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErroeCode14800041Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG +
        "************* LiteResultSetErroeCode14800041Test0003 start *************");
      let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
      resultSet.goToNextRow();
      try {
        resultSet.getBlob(5);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSetErroeCode14800041Test0003 failed:${err.message} code:${err.code}`);
        await rdbStore!.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        expect(err.code === 14800041).assertTrue();
      }
      console.log(TAG + "************* LiteResultSetErroeCode14800041Test0003 end *************");
    })
    /**
     * @tc.name   LiteResultSetErroeCode14800041Test0004
     * @tc.number SUB_DistributedData_RelationalStore_RdbStoreErroeCode14800041Test0004
     * @tc.desc   getString normal test
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('LiteResultSetErroeCode14800041Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG +
        "************* LiteResultSetErroeCode14800041Test0004 start *************");
      let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
      resultSet.goToNextRow();
      try {
        resultSet.getString(5);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSetErroeCode14800041Test0004 failed:${err.message} code:${err.code}`);
        await rdbStore!.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        expect(err.code === 14800041).assertTrue();
      }
      console.log(TAG + "************* LiteResultSetErroeCode14800041Test0004 end *************");
    })
    /**
     * @tc.name   LiteResultSetErroeCode14800041Test0005
     * @tc.number SUB_DistributedData_RelationalStore_RdbStoreErroeCode14800041Test0005
     * @tc.desc   getLong normal test.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('LiteResultSetErroeCode14800041Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG +
        "************* LiteResultSetErroeCode14800041Test0005 start *************");
      let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
      resultSet.goToNextRow();
      try {
        resultSet.getLong(5);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSetErroeCode14800041Test0005 failed:${err.message} code:${err.code}`);
        await rdbStore!.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        expect(err.code === 14800041).assertTrue();
      }
      console.log(TAG + "************* LiteResultSetErroeCode14800041Test0005 end *************");
    })

    /**
     * @tc.name   LiteResultSetErroeCode14800041Test0006
     * @tc.number SUB_DistributedData_RelationalStore_RdbStoreErroeCode14800041Test0006
     * @tc.desc   getDouble normal test
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('LiteResultSetErroeCode14800041Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG +
        "************* LiteResultSetErroeCode14800041Test0006 start *************");
      let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
      resultSet.goToNextRow();
      try {
        resultSet.getDouble(5);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSetErroeCode14800041Test0006 failed:${err.message} code:${err.code}`);
        await rdbStore!.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        expect(err.code === 14800041).assertTrue();
      }
      console.log(TAG + "************* LiteResultSetErroeCode14800041Test0006 end *************");
    })

    /**
     * @tc.name   LiteResultSetgetColumnIndexTrueTest0007
     * @tc.number SUB_DistributedData_RelationalStore_RdbStoreSetgetColumnIndexTrueTest0007
     * @tc.desc   getDouble normal test
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('LiteResultSetgetColumnIndexTrueTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* LiteResultSetgetColumnIndexTrueTest0007 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore?.queryWithoutRowCount(predicates);
        resultSet?.goToNextRow()
        let data = resultSet?.isColumnNull(resultSet!.getColumnIndex("data6"));
        console.error(`mmy :${data}}`);
        expect(data).assertEqual(true);
      }catch (e){
        console.error(`LiteResultSetgetColumnIndexTrueTest0007 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        expect().assertTrue()
      }
      console.log(TAG + "************* LiteResultSetgetColumnIndexTrueTest0007 end *************");
    })

    /**
     * @tc.name   LiteResultSetgetColumnIndexTrueTest0008
     * @tc.number SUB_DistributedData_RelationalStore_RdbStoreSetSetgetColumnNamesTest0008
     * @tc.desc   getDouble normal test
     * @tc.size   getColumnNames
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('LiteResultSetgetColumnIndexTrueTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* LiteResultSetgetColumnIndexTrueTest0008 start *************");
      try{
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        expect(rdbStore != undefined).assertTrue();
        if (rdbStore != undefined){
          await rdbStore!.executeSql(DROP_TEST1);
          await rdbStore!.executeSql(CREATE_ASSERT_TABLE_TEST1);
        };
      } catch (e) {
        console.error(`failed message:${e.message} code:${e.code}`);
        expect().assertFail();
      }
      let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test1");
      try {
        let name = resultSet?.getColumnNames()
        expect(name.length).assertEqual(1);
        expect(name[0]).assertEqual('');
        await rdbStore!.executeSql(DROP_TEST1);
      }catch (e){
        console.error(`LiteResultSetgetColumnIndexTrueTest0008 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        expect().assertFalse()
      }
      console.log(TAG + "************* LiteResultSetgetColumnIndexTrueTest0008 end *************");
    })

  })
}