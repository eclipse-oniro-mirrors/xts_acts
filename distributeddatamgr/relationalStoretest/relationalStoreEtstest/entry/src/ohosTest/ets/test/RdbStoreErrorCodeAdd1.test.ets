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
  "data1 text," + "data2 long, " + "data3 real," + "data4 blob)";

const CREATE_ASSERT_TABLE_TEST = "CREATE TABLE IF NOT EXISTS asset_table (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 asset," + "data2 assets)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbQuery.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

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

async function checkResultSetForNormalGet(resultSet : relationalStore.LiteResultSet){
  try {
    resultSet.goToNextRow();

    let index = resultSet.getColumnIndex("id");
    expect(index).assertEqual(0);
    let id = resultSet.getLong(index);
    expect(id).assertEqual(1);
    index = resultSet.getColumnIndex("data1");
    let data1 = resultSet.getString(index);
    expect(data1).assertEqual('zhangsan');
    index = resultSet.getColumnIndex("data2");
    let data2 = resultSet.getLong(index);
    expect(data2).assertEqual(18);
    index = resultSet.getColumnIndex("data3");
    let data3 = resultSet.getDouble(index);
    expect(data3).assertEqual(25000.0);
    index = resultSet.getColumnIndex("data4");
    let data4 = resultSet.getBlob(index);
    expect(data4[0]).assertEqual(1);
    expect(data4[1]).assertEqual(2);
    expect(data4[2]).assertEqual(3);

    resultSet.goToNextRow();

    index = resultSet.getColumnIndex("id");
    expect(index).assertEqual(0);
    id  = resultSet.getLong(index);
    expect(id).assertEqual(2);
    index = resultSet.getColumnIndex("data1");
    data1 = resultSet.getString(index);
    expect(data1).assertEqual('lisi');
    index = resultSet.getColumnIndex("data2");
    data2 = resultSet.getLong(index);
    expect(data2).assertEqual(20);
    index = resultSet.getColumnIndex("data3");
    data3 = resultSet.getDouble(index);
    expect(data3).assertEqual(20000.0);
    index = resultSet.getColumnIndex("data4");
    data4 = resultSet.getBlob(index);
    expect(data4[0]).assertEqual(1);
    expect(data4[1]).assertEqual(2);
    expect(data4[2]).assertEqual(3);
    resultSet?.close();
  } catch(err) {
    console.error(`checkResultSetForNormalGet failed:${err.message} code:${err.code}`);

    console.error(`checkResultSetForNormalGet failed message: code:'%{public}d',`);
    expect().assertFail();
  }
}

export default function RdbStoreErrorCodeAdd1Test() {

  describe("RdbStoreErrorCodeAdd1Test", (): void => {
    console.info(TAG + 'describe start');
    beforeAll(async () => {
      try {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        console.info(TAG + 'contextDir' + context.databaseDir);

        expect(rdbStore != undefined).assertTrue();
        if (rdbStore != undefined) {
          await rdbStore.execute(CREATE_TABLE_TEST)
          await rdbStore.execute(CREATE_ASSERT_TABLE_TEST);
          let u8 = new Uint8Array([1, 2, 3])
          const valueBucket: relationalStore.ValuesBucket = {
            'data1': 'zhangsan',
            'data2': 18 ,
            'data3': 25000.0,
            'data4': u8,
          };
          const valueBucket1: relationalStore.ValuesBucket = {
            'data1': 'lisi',
            'data2': 20 ,
            'data3': 20000.0,
            'data4': u8,
          };
          const assets1 = [asset1];
          const assets2 = [asset1, asset2];
          const valueBucket2: relationalStore.ValuesBucket = {
            'data1': asset1,
            'data2': assets1
          };
          const valueBucket3: relationalStore.ValuesBucket = {
            'data1': asset2,
            'data2': assets2
          };
          await rdbStore.insert('test', valueBucket);
          await rdbStore.insert('test', valueBucket1);
          await rdbStore.insert('asset_table', valueBucket2);
          await rdbStore.insert('asset_table', valueBucket3);
        }
      } catch(error) {
        console.info(TAG + 'beforeEach failed');
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
        rdbStore?.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch(error) {
        console.info(TAG + 'afterAll failed');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   queryWithoutRowCount_001_normal_columns
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0001
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('queryWithoutRowCount_001_normal_columns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.error("************* queryWithoutRowCount_001_normal_columns start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch(err) {
        console.error(`queryWithoutRowCount_001_normal_columns failed:${err.message} code:${err.code}`);
        expect().assertFail();
      }

      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        resultSet.goToNextRow();
        let data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        expect(data1).assertEqual('zhangsan');
        resultSet?.close();
      } catch(err) {
        console.error(`queryWithoutRowCount_001_normal_columns failed:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      console.error("************* queryWithoutRowCount_001_normal_columns end *************");
    })

    /**
     * @tc.name   queryWithoutRowCount_002_Abnormal_columns
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0002
     * @tc.desc 1.Set columns to [].
     *          2.Set columns to [""].
     *          3.Set columns to ["", "data1"].
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('queryWithoutRowCount_002_Abnormal_columns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates, []);
        }
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch(err) {
        console.error(`queryWithoutRowCount_002_Abnormal_columns failed:${err.message} code:${err.code}`);
        expect().assertFail();
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates, [""]);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let data1 = resultSet.getString(0);
        }
      } catch(err) {
        console.error(`queryWithoutRowCount_002_Abnormal_columns failed:${err.message} code:${err.code}`);
        expect(err.code == 14800021).assertTrue();
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates, ["", "data1"]);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
          expect(data1).assertEqual('zhangsan');
          resultSet.close();
        }
      } catch(err) {
        console.error(`queryWithoutRowCount_002_Abnormal_columns failed:${err.message} code:${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   queryWithoutRowCount_003_abnormal_rdbStoreIsClose
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0003
     * @tc.desc   Query when the store is closed
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('queryWithoutRowCount_003_abnormal_rdbStoreIsClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      try {
        if (rdbStore) {
          await rdbStore.close();
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`queryWithoutRowCount_003_abnormal_rdbStoreIsClose failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800014).assertTrue();
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      }
    })

    /**
     * @tc.name querySqlWithoutRowCount_001_normal_bindArgs
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0004
     * @tc.desc 1.The optional parameters bindArgs are not transferred.
     *          2.Set bindArgs to [""], sql is select * from test where data2 = 20
     *          3.Set bindArgs to [18], sql is select * from test where data2 = ?
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('querySqlWithoutRowCount_001_normal_bindArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      const sql = "select * from test";
      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount(sql);
        }
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
          resultSet.close();
        }
      } catch(err) {
        console.error(`querySqlWithoutRowCount_001_normal_bindArgs failed:${err.message} code:${err.code}`);
        expect().assertFail();
      }

      const sql1 = "select * from test where data2 = 20";
      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount(sql1, []);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
          expect("lisi").assertEqual(data1);
          resultSet.close();
        }
      } catch(err) {
        console.error(`querySqlWithoutRowCount_001_normal_bindArgs failed:${err.message} code:${err.code}`);
        expect().assertFail();
      }

      const sql2 = "select * from test where data2 = ?";
      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount(sql2, [18 ]);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
          expect(18).assertEqual(data2);
          resultSet.close();
        }
      } catch(err) {
        console.error(`querySqlWithoutRowCount_001_normal_bindArgs failed:${err.message} code:${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name querySqlWithoutRowCount_002_Abnormal_bindArgs
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0005
     * @tc.desc 1.sql is select * from test where data2 = ?
     *          2.Set bindArgs to [null]
     *          3.Set bindArgs to [undefined]
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('querySqlWithoutRowCount_002_Abnormal_bindArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      const valueBucket: relationalStore.ValuesBucket = {
        'data1': "wangwu",
        'data2': null,
      };

      const sql = "select * from test where data2 = ?";
      try {
        if (rdbStore) {
          await rdbStore.insert('test', valueBucket);
          resultSet = await rdbStore.querySqlWithoutRowCount(sql, []);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        }
        expect().assertFail();
      } catch (err) {
        console.error(`querySqlWithoutRowCount_002_Abnormal_bindArgs failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue();
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("");
          expect().assertFail();
        }
      } catch(err) {
        console.error(`querySqlWithoutRowCount_002_Abnormal_bindArgs failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }
    })

    /**
     * @tc.name querySqlWithoutRowCount_004_abnormal_rdbStoreIsClose
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0006
     * @tc.desc Query when the store is closed
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('querySqlWithoutRowCount_004_abnormal_rdbStoreIsClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      const sql = "select * from test";
      try {
        if (rdbStore) {
          await rdbStore.close();
          resultSet = await rdbStore.querySqlWithoutRowCount(sql);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`querySqlWithoutRowCount_004_abnormal_rdbStoreIsClose failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800014).assertTrue();
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      }
    })

    /**
     * @tc.name LiteResultSet_001_Abnormal_gotoNextRow
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0007
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_Abnormal_gotoNextRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.goToNextRow();
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_gotoNextRow1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.goToNextRow();
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_gotoNextRow2 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.goToNextRow();
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_gotoNextRow3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_gotoNextRow4 failed:${err.message} code:${err.code}`);
        // console.error(`LiteResultSet_002_Abnormal_gotoNextRow failed message:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800021).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_001_Abnormal_getColumnIndex
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0009
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_Abnormal_getColumnIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnIndex("");
        }
        expect().assertFail();
      } catch (err){
        console.error(`LiteResultSet_001_Abnormal_getColumnIndex1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.getColumnIndex("data1");
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getColumnIndex2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnIndex("data5");
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getColumnIndex3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getColumnIndex("data1")
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getColumnIndex4 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.getColumnIndex("data1")
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getColumnIndex5 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnIndex("data1");
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getColumnIndex6 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800021).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_001_Abnormal_getColumnName
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0011
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_Abnormal_getColumnName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.getColumnName(1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getColumnName1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }


      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnName(-1);
        }
        expect().assertFail();
      } catch (err){
        console.error(`LiteResultSet_001_Abnormal_getColumnName2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnName(5);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getColumnName3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getColumnName(1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getColumnName4 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.getColumnName(1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getColumnName5 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnName(1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getColumnName6 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800021).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_001_Abnormal_getRows
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0013
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_Abnormal_getRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let rows = await resultSet.getRows(2);
          for (let i = 0; i < rows.length; i++) {
            if (i == 0) {
              let valueBucket_ret = rows[i] as relationalStore.ValuesBucket;
              expect(1).assertEqual(valueBucket_ret["id"]);
              expect('zhangsan').assertEqual(valueBucket_ret["data1"]);
              expect(18).assertEqual(valueBucket_ret["data2"]);
              expect(25000.0).assertEqual(valueBucket_ret["data3"]);
            }
            if (i == 1) {
              let valueBucket_ret = rows[i] as relationalStore.ValuesBucket;
              expect(2).assertEqual(valueBucket_ret["id"]);
              expect('lisi').assertEqual(valueBucket_ret["data1"]);
              expect(20).assertEqual(valueBucket_ret["data2"]);
              expect(20000.0).assertEqual(valueBucket_ret["data3"]);
            }
          }
        }
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getRows1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }

    })

    /**
     * @tc.name LiteResultSet_002_Abnormal_getRows
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0014
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_002_Abnormal_getRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          await resultSet.getRows(2);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getRows1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getRows(-1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getRows2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getRows(2, -1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getRows3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getRows(2, 3);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getRows4 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          await resultSet.getRows(2);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getRows5 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          await resultSet.getRows(2);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getRows6 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getRows(2);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getRows7 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800021).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_001_Abnormal_getRow
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0015
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_Abnormal_getRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.getRow();
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getRow1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getRow();
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getRow2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getRow();
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getRow3 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.getRow();
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getRow4 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getRow();
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getRow5 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800021).assertTrue()
      }
    })


    /**
     * @tc.name LiteResultSet_002_Abnormal_getRow
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0016
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_002_Abnormal_getRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let valueBucket_ret = resultSet.getRow();
          if (valueBucket_ret) {
            expect(1).assertEqual(valueBucket_ret["id"]);
            expect('zhangsan').assertEqual(valueBucket_ret["data1"]);
            expect(18).assertEqual(valueBucket_ret["data2"]);
            expect(25000.0).assertEqual(valueBucket_ret["data3"]);
          }
          resultSet.close();
        }
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getRow failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }

    })

    /**
     * @tc.name LiteResultSet_001_Abnormal_IsColumnNull
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0017
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_Abnormal_IsColumnNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.isColumnNull(0);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_IsColumnNull1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.isColumnNull(0);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_IsColumnNull2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.isColumnNull(-1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_IsColumnNull3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.isColumnNull(5);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_IsColumnNull4 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.isColumnNull(0);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_IsColumnNull5 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.isColumnNull(0);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_IsColumnNull6 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.isColumnNull(0);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_IsColumnNull7 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800021).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_001_Abnormal_getLong
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0018
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_Abnormal_getLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getLong(0);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getLong1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getLong(-1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getLong2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getLong(5);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getLong3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getLong(0);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getLong4 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_001_Abnormal_getString
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0019
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_Abnormal_getString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getString(1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getString1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getString(-1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getString2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getString(5);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getString3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getString(1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getString4 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_001_Abnormal_getDouble
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0020
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_Abnormal_getDouble', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getDouble(3);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getDouble1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getDouble(-1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getDouble2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {

          resultSet.goToNextRow();
          resultSet.getDouble(5);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getDouble3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getDouble(3);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getDouble4 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_001_Abnormal_getBlob
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0021
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_Abnormal_getBlob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getBlob(4);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getBlob1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getBlob(-1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getBlob2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getBlob(5);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getBlob3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getBlob(4);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getBlob4 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_001_Abnormal_getValue
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0022
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_Abnormal_getValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getValue(0);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getValue1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getValue(-1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getValue2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getValue(5);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getValue3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getValue(0);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_001_Abnormal_getValue4 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_002_Abnormal_getBlob
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0023
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_002_Abnormal_getBlob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getBlob(4);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getBlob failed1:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getBlob(-1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getBlob2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getBlob(5);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getBlob3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getBlob(4);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getBlob4 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_002_Abnormal_getValue
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0024
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_002_Abnormal_getValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getValue(0);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getValue1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getValue(-1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getValue2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getValue(5);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getValue3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getValue(0);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getValue4 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }
    })

    /**
     * @tc.name LiteResultSet_001_normal_getColumnType
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0025
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_normal_getColumnType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let type = await resultSet.getColumnType(resultSet.getColumnIndex("id"))
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = await resultSet.getColumnType(resultSet.getColumnIndex("data1"));
          expect(type).assertEqual(relationalStore.ColumnType.TEXT);
          type = await resultSet.getColumnType(resultSet.getColumnIndex("data2"));
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = await resultSet.getColumnType(resultSet.getColumnIndex("data3"));
          expect(type).assertEqual(relationalStore.ColumnType.REAL);
          type = await resultSet.getColumnType(resultSet.getColumnIndex("data4"));
          expect(type).assertEqual(relationalStore.ColumnType.BLOB);

          type = await resultSet.getColumnType("id")
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = await resultSet.getColumnType("data1");
          expect(type).assertEqual(relationalStore.ColumnType.TEXT);
          type = await resultSet.getColumnType("data2");
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = await resultSet.getColumnType("data3");
          expect(type).assertEqual(relationalStore.ColumnType.REAL);
          type = await resultSet.getColumnType("data4");
          expect(type).assertEqual(relationalStore.ColumnType.BLOB);
        }
      } catch(err) {
        console.error(`LiteResultSet_001_normal_getColumnType failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }
    })

    /**
     * @tc.name LiteResultSet_002_normal_getColumnType
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0026
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_002_normal_getColumnType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
          const valueBucket: relationalStore.ValuesBucket = {
            'data1': null,
            'data2': null,
            'data3': null,
            'data4': null,
          };
          await rdbStore.insert('test', valueBucket);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.goToNextRow();
          resultSet.goToNextRow();
          let type = await resultSet.getColumnType("id")
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = await resultSet.getColumnType("data2");
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          type = await resultSet.getColumnType("data3");
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          type = await resultSet.getColumnType("data4");
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
        }
      } catch(err) {
        console.error(`LiteResultSet_002_normal_getColumnType failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }
    })

    /**
     * @tc.name LiteResultSet_002_Abnormal_getColumnType
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0027
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_002_Abnormal_getColumnType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          await resultSet.getColumnType("id")
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getColumnType1 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          await resultSet.getColumnType(-1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getColumnType2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          await resultSet.getColumnType("");
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getColumnType3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getColumnType("id")
        }
        expect().assertFail();
      } catch (err){
        console.error(`LiteResultSet_002_Abnormal_getColumnType4 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getColumnType(0)
        }
        expect().assertFail();
      } catch (err){
        console.error(`LiteResultSet_002_Abnormal_getColumnType5 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          await resultSet.getColumnType(5);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getColumnType6 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          await resultSet.getColumnType("id");
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getColumnType7 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          await resultSet.getColumnType("id");
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getColumnType8 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getColumnType("id");
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_002_Abnormal_getColumnType9 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800021).assertTrue()
      }
    })


    /**
     * @tc.name LiteResultSet_001_normal_getColumnTypeSync
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0028
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_001_normal_getColumnTypeSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("id"))
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data1"));
          expect(type).assertEqual(relationalStore.ColumnType.TEXT);
          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data2"));
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data3"));
          expect(type).assertEqual(relationalStore.ColumnType.REAL);
          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data4"));
          expect(type).assertEqual(relationalStore.ColumnType.BLOB);

          type = resultSet.getColumnTypeSync("id")
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = resultSet.getColumnTypeSync("data1");
          expect(type).assertEqual(relationalStore.ColumnType.TEXT);
          type = resultSet.getColumnTypeSync("data2");
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = resultSet.getColumnTypeSync("data3");
          expect(type).assertEqual(relationalStore.ColumnType.REAL);
          type = resultSet.getColumnTypeSync("data4");
          expect(type).assertEqual(relationalStore.ColumnType.BLOB);
        }
      } catch(err) {
        console.error(`LiteResultSet_001_normal_getColumnTypeSync failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }
    })

    /**
     * @tc.name LiteResultSet_002_normal_getColumnTypeSync
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0029
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_002_normal_getColumnTypeSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
          const valueBucket: relationalStore.ValuesBucket = {
            'data1': null,
            'data2': null,
            'data3': null,
            'data4': null,
          };
          await rdbStore.insert('test', valueBucket);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.goToNextRow();
          resultSet.goToNextRow();
          let type = resultSet.getColumnTypeSync("id")
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = resultSet.getColumnTypeSync("data4");
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
        }
      } catch(err) {
        console.error(`LiteResultSet_002_normal_getColumnTypeSync failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }
    })

    /**
     * @tc.name LiteResultSet_003_Abnormal_getColumnTypeSync
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0030
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_003_Abnormal_getColumnTypeSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.getColumnTypeSync("id")
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_003_Abnormal_getColumnTypeSync failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getColumnTypeSync(-1);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_003_Abnormal_getColumnTypeSync2 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getColumnTypeSync("");
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_003_Abnormal_getColumnTypeSync3 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnTypeSync("id")
        }
        expect().assertFail();
      } catch (err){
        console.error(`LiteResultSet_003_Abnormal_getColumnTypeSync4 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnTypeSync(0)
        }
        expect().assertFail();
      } catch (err){
        console.error(`LiteResultSet_003_Abnormal_getColumnTypeSync5 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getColumnTypeSync(5);
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_003_Abnormal_getColumnTypeSync6 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getColumnTypeSync("id");
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_003_Abnormal_getColumnTypeSync7 failed:${err.message} code:${err.code}`);
        expect(err.code == 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.getColumnTypeSync("id");
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_003_Abnormal_getColumnTypeSync8 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnTypeSync("id");
        }
        expect().assertFail();
      } catch(err) {
        console.error(`LiteResultSet_003_Abnormal_getColumnTypeSync9 failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect(err.code == 14800021).assertTrue()
      }
    })

  })

}
