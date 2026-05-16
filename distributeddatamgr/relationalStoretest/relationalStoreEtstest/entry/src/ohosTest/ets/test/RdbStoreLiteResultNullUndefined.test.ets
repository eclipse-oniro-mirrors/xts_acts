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
export default function RdbStoreLiteResultNullUndefinedTest() {
  describe('RdbStoreLiteResultNullUndefinedTest', (): void => {
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
      rdbStore.close();
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0001
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0001
     * @tc.desc     1.The first parameter is ""
     *              2.The first parameter is null
     *              3.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0001 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getString(resultSet.getColumnIndex(""));
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0001 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getString(resultSet.getColumnIndex(null));
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0001 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getString(resultSet.getColumnIndex(undefined));
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0001 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0001 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0002
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0002
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0002 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getColumnName(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0002 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getColumnName(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0002 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0002 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0003
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0003
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0003 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getColumnType(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0003 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getColumnType(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0003 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0003 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0004
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0004
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0004 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getColumnTypeSync(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0004 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getColumnTypeSync(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0004 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0004 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0005
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0005
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0005 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getBlob(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0005 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getBlob(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0005 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0005 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0006
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0006
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0006 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getString(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0006 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getString(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0006 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0006 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0007
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0007
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0007 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getLong(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0007 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getLong(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0007 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0007 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0008
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0008
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0008 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getDouble(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0008 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getDouble(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0008 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0008 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0009
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0009
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0009 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getAsset(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0009 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getAsset(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0009 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0009 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0010
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0010
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0010 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getAssets(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0010 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getAssets(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0010 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0010 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0011
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0011
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0011 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getValue(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0011 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getValue(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0011 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0011 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0012
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0012
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0012 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getRows(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0012 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getRows(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0012 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0011 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0013
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0013
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     *              3.The second parameter is null
     *              4.The second parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0013 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getRows(null, 3);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0013 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getRows(undefined, 3);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0013 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getRows(1, null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0013 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getRows(1, undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0013 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0011 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0014
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0014
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0014 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getRowsData(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0014 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        let data1 = resultSet.getRowsData(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0014 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0014 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0015
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0015
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     *              3.The second parameter is undefined
     *              4.The secong parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0015 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test");
        let asRowsData = await resultSet.getRowsData(null, 3);
        expect().assertFail();
      } catch(err) {
        console.error(TAG + `LiteResultSet_Null_Undefind_Test_0015 failed1:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test");
        let asRowsData = await resultSet.getRowsData(undefined, 3);
        expect().assertFail();
      } catch(err) {
        console.error(TAG + `LiteResultSet_Null_Undefind_Test_0015 failed1:${err.message} code:${err.code}`);
        expect(err.code == 14800001).assertTrue();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test");
        let asRowsData = await resultSet.getRowsData(1, null);
        expect(asRowsData.length > 0).assertTrue();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0015 failed1:${err.message} code:${err.code}`);
        expect().assertFail();
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test");
        let asRowsData = await resultSet.getRowsData(1, undefined);
        expect(asRowsData.length > 0).assertTrue();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0015 failed2:${err.message} code:${err.code}`);
        expect().assertFail();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0015 end *************");
    })

    /**
     * @tc.name     LiteResultSet_Null_Undefind_Test_0016
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSet_Null_Undefind_Test_0016
     * @tc.desc     1.The first parameter is null
     *              2.The first parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSet_Null_Undefind_Test_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* LiteResultSet_Null_Undefind_Test_0016 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
      try {
        let data1 = resultSet.isColumnNull(null);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0016 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      try {
        let data1 = resultSet.isColumnNull(undefined);
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_Null_Undefind_Test_0016 failed:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
        resultSet?.close();
      }
      console.error("************* LiteResultSet_Null_Undefind_Test_0016 end *************");
    })

    /**
     * @tc.name     LiteResultSetgetColumnIndexTrueTest0002
     * @tc.number   SUB_DistributedData_RelationalStore_LiteResultSetgetColumnIndexTrueTest0002
     * @tc.desc     1.The Return value is true
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('LiteResultSetgetColumnIndexTrueTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* LiteResultSetgetColumnIndexTrueTest0002 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore?.queryWithoutRowCount(predicates);
        resultSet?.goToNextRow()
        let data = resultSet?.isColumnNull(resultSet!.getColumnIndex("data6"));
        resultSet?.close();
        expect(data).assertEqual(true);
      }catch (e){
        console.error(`LiteResultSetgetColumnIndexTrueTest0002 failed message:${e.message} code:${e.code}`);
        expect().assertFail();
      }
      console.log(TAG + "************* LiteResultSetgetColumnIndexTrueTest0002 end *************");
    })

  })
}
