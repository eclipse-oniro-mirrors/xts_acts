/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import data_relationalStore from '@ohos.data.relationalStore'
import common from "@ohos.app.ability.common";

let context: common.UIAbilityContext;
const TAG = "[RDB_JSKITS _TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 asset, " + "data2 asset, " + "data3 assets )";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "Asset.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
const asset1 = {
  name: "name1",
  uri: "uri1",
  createTime: "createTime1",
  modifyTime: "modifyTime1",
  size: "size1",
  path: "path1",
  status: data_relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2 = {
  name: "name2",
  uri: "uri2",
  createTime: "createTime2",
  modifyTime: "modifyTime2",
  size: "size2",
  path: "path2",
  status: data_relationalStore.AssetStatus.ASSET_INSERT,
}
const asset3 = {
  name: "name3",
  uri: "uri3",
  createTime: "createTime3",
  modifyTime: "modifyTime3",
  size: "size3",
  path: "path3",
  status: data_relationalStore.AssetStatus.ASSET_UPDATE,
}

let rdbStore = undefined;

async function createTest() {
  console.log(TAG + "createTest data start");
  const assets1 = [asset1];
  const assets2 = [asset1, asset2, asset3];
  let valuesBucket = {
    "data1": asset1,
    "data2": asset2,
    "data3": assets1,
  }
  await rdbStore.insert("test", valuesBucket);
  valuesBucket = {
    "data1": asset2,
    "data2": asset3,
    "data3": assets2,
  }
  await rdbStore.insert("test", valuesBucket);
  let valuesBucket1 = {
    "data1": asset1,
    "data3": new Array()
  }
  await rdbStore.insert("test", valuesBucket1);
  console.log(TAG + "createTest data end");
}

export default function relationalStoreAssetResultSetTest() {
  describe('relationalStoreAssetResultSetTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      console.info(TAG + 'Get context successful. context=' + context);
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
    })

    beforeEach(async () => {
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      console.info(TAG + 'beforeEach');
    })

    afterEach(async () => {
      await rdbStore.executeSql(DROP_TABLE_TEST, null);
      console.info(TAG + 'afterEach')
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll')
      rdbStore = null
      await data_relationalStore.deleteRdbStore(context, "Asset.db");
    })


    /**
     * @tc.name   testAssetResultSetGetAsset0001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0570
     * @tc.desc   AssetResultSet getAsset test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAssetResultSetGetAsset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await createTest();
      console.log(TAG + "************* testAssetResultSetGetAsset0001 start *************");
      let predicates = await new data_relationalStore.RdbPredicates("test")
      let resultSet = await rdbStore.query(predicates)
      try {
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
        const data1 = resultSet.getAsset(resultSet.getColumnIndex("data1"))
        console.log(TAG + "id=" + id + ", data1=" + data1);
        expect("name1").assertEqual(data1.name);
        expect("uri1").assertEqual(data1.uri);
        expect("createTime1").assertEqual(data1.createTime);
        expect("modifyTime1").assertEqual(data1.modifyTime);
        expect("size1").assertEqual(data1.size);
        expect("path1").assertEqual(data1.path);
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed)
      } catch (e) {
        expect(null).assertFail();
      }
      resultSet = null
      done();
      console.log(TAG + "************* testAssetResultSetGetAsset0001 end *************");
    })

    /**
     * @tc.name   testAssetResultSetGetAsset0002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0560
     * @tc.desc   AssetResultSet getAsset test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAssetResultSetGetAsset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await createTest();
      console.log(TAG + "************* testAssetResultSetGetAsset0002 start *************");
      let predicates = await new data_relationalStore.RdbPredicates("test")
      let resultSet = await rdbStore.query(predicates)
      try {
        expect(true).assertEqual(resultSet.goToFirstRow())
        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
        const data111 = resultSet.getAsset(resultSet.getColumnIndex("data111"))
        expect(true).assertFail();
      } catch (e) {
        console.info(TAG + " getAsset can not find item", e);
        expect('14800013').assertEqual(e.code);
      }
      resultSet.close();
      console.log(TAG + "************* testAssetResultSetGetAsset0002 end *************");
    })

    /**
     * @tc.name   testAssetResultSetGetAssets0001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0580
     * @tc.desc   AssetResultSet getAssets test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAssetResultSetGetAssets0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await createTest();
      console.log(TAG + "************* testAssetResultSetGetAssets0001 start *************");
      let predicates = await new data_relationalStore.RdbPredicates("test")
      let resultSet = await rdbStore.query(predicates)
      try {
        expect(true).assertEqual(resultSet.goToFirstRow())
        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
        const data3 = resultSet.getAssets(resultSet.getColumnIndex("data3"))
        console.log(TAG + "id=" + id + ", data3=" + data3);
        expect(1).assertEqual(data3.length);
        let asset = data3[0];
        expect("name1").assertEqual(asset.name);
        expect("uri1").assertEqual(asset.uri);
        expect("createTime1").assertEqual(asset.createTime);
        expect("modifyTime1").assertEqual(asset.modifyTime);
        expect("size1").assertEqual(asset.size);
        expect("path1").assertEqual(asset.path);
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed)
      } catch (e) {
        expect(null).assertFail();
      }
      resultSet = null
      done();
      console.log(TAG + "************* testAssetResultSetGetAssets0001 end *************");
    })


    /**
     * @tc.name   testAssetResultSetGetAssets0002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0590
     * @tc.desc   AssetResultSet getAssets test: wrong colname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAssetResultSetGetAssets0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await createTest();
      console.log(TAG + "************* testAssetResultSetGetAssets0002 start *************");
      let predicates = await new data_relationalStore.RdbPredicates("test")
      let resultSet = await rdbStore.query(predicates)
      try {
        expect(true).assertEqual(resultSet.goToFirstRow())
        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
        const data333 = resultSet.getAssets(resultSet.getColumnIndex("data333"))
        expect(true).assertFail();
      } catch (e) {
        console.info(TAG + " getAssets can not find item", e);
        expect('14800013').assertEqual(e.code);
      }
      resultSet.close();
      console.log(TAG + "************* testAssetResultSetGetAssets0002 end *************");
    })
  })
}