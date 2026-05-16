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
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

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

export default function RdbStoreErrorCodeAdd4Test() {
  describe('RdbStoreErrorCodeAdd4Test', () => {
    beforeAll(async () => {
      try {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        console.info(TAG + 'contextDir' + context.databaseDir);

        expect(rdbStore != undefined).assertTrue();
        if (rdbStore != undefined) {
          await rdbStore.execute(CREATE_TABLE_TEST)
          const assets1 = [asset1];
          const valueBucket: relationalStore.ValuesBucket = {
            "data1": "hello world",
            "data2": 3,
            "data3": 10.5,
            "data4": new Uint8Array([1, 2, 3]),
            "data5": asset1,
            "data6": assets1,
            "data7": new Float32Array([1.5, 2.5]),
            "data8": 100n
          };
          await rdbStore.insert('test', valueBucket);
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
        await rdbStore.execute(DROP_TABLE_TEST)
        rdbStore.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch(error) {
        console.info(TAG + 'afterAll failed');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   LiteResultSet_traverse_normal_getColumnType_0001
     * @tc.number SUB_DistributedData_RelationalStore_traverse_getColumnType0001
     * @tc.desc   The getColumnType traverse and overwrite
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSet_traverse_normal_getColumnType_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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

          type = await resultSet.getColumnType(resultSet.getColumnIndex("data5"));
          expect(type).assertEqual(relationalStore.ColumnType.ASSET);
          type = await resultSet.getColumnType(resultSet.getColumnIndex("data6"));
          expect(type).assertEqual(relationalStore.ColumnType.ASSETS);
          type = await resultSet.getColumnType(resultSet.getColumnIndex("data7"));
          expect(type).assertEqual(relationalStore.ColumnType.FLOAT_VECTOR);
          type = await resultSet.getColumnType(resultSet.getColumnIndex("data8"));
          expect(type).assertEqual(relationalStore.ColumnType.UNLIMITED_INT);
        }
      } catch(err) {
        console.error(`LiteResultSet_001_normal_getColumnType failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet?.close();
        }
        expect().assertFail();
      }
    })

    /**
     * @tc.name   LiteResultSet_traverse_normal_getColumnTypeSync_0001
     * @tc.number SUB_DistributedData_RelationalStore_traverse_getColumnTypeSync0001
     * @tc.desc   The getColumnTypeSync traverse and overwrite
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('LiteResultSet_traverse_normal_getColumnTypeSync_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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

          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data5"));
          expect(type).assertEqual(relationalStore.ColumnType.ASSET);
          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data6"));
          expect(type).assertEqual(relationalStore.ColumnType.ASSETS);
          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data7"));
          expect(type).assertEqual(relationalStore.ColumnType.FLOAT_VECTOR);
          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data8"));
          expect(type).assertEqual(relationalStore.ColumnType.UNLIMITED_INT);
        }
      } catch(err) {
        console.error(`LiteResultSet_001_normal_getColumnType failed:${err.message} code:${err.code}`);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }
    })
  })
}