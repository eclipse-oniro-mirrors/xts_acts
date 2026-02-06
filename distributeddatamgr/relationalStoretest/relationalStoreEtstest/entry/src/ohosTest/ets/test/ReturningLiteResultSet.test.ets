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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size,TestType } from '@ohos/hypium'
import data_relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { contextConstant } from '@kit.AbilityKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const TAG = "[RDB_STORE_WITH_RETURNING_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB, " + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128))";

let storeConfig: data_relationalStore.StoreConfig = {
  name: "rdbStore.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let rdbStore:data_relationalStore.RdbStore | undefined = undefined;

export default function ReturningLiteResultSetTest() {
  describe('ReturningLiteResultSetTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      console.info(TAG + "getRdbStore successful")
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      console.info(TAG + "createtable successful")
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await data_relationalStore.deleteRdbStore(context,"rdbStore.db")
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    });

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_11800
     * @tc.name rdbStoreWithReturningTest0100
     * @tc.desc result.resultSet test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbStoreWithReturningTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* rdbStoreWithReturningTest0100 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      const asset:data_relationalStore.Asset = {
        name: "name4",
        uri: "uri4",
        createTime: "createTime4",
        modifyTime: "modifyTime4",
        size: "size4",
        path: "path4",
      };
      const assets = [asset];
      const valueBucket: data_relationalStore.ValuesBucket = {
        'name':"lisi",
        'age':21,
        'salary': 100.5,
        'blobType': u8,
        'data5': asset,
        'data6': assets,
        'data7': new Float32Array([1.5, 2.5])
      }
      const valueBucket1: data_relationalStore.ValuesBucket = {
        'name':"lisi1",
        'age':22,
        'salary': 101.5,
        'blobType': u8,
        'data5': asset,
        'data6': assets,
        'data7': new Float32Array([1.5, 2.5])
      }
      let config: data_relationalStore.ReturningConfig = {
        columns:['name','age','salary','blobType'],
        maxReturningCount:2
      }
      try {
        let result = await rdbStore?.batchInsertWithReturning("test",[valueBucket, valueBucket1],config,undefined);
        console.log(TAG + "result?.changed = " + result?.changed );
        expect(result?.changed).assertEqual(2);
        let bool1 = result?.resultSet.goToNextRow();
        console.log(TAG + "bool1:" + bool1);
        expect(bool1).assertEqual(true);
        let num = result?.resultSet.getColumnName(result?.resultSet.getColumnIndex("name")) as string;
        console.log(TAG + "num:" + num);
        expect(num).assertEqual("name")
        const name = result?.resultSet.getString(result?.resultSet.getColumnIndex("name"));
        console.log(TAG + "name:" + name);
        expect(name).assertEqual("lisi");
        const blo = result?.resultSet.getBlob(result?.resultSet.getColumnIndex("blobType"));
        console.log(TAG + "blo:" + blo);
        expect(blo?.length).assertEqual(3);
        const age  = result?.resultSet.getLong(result?.resultSet.getColumnIndex("age")) as number;
        console.log(TAG + "age:" + age);
        expect(age).assertEqual(21);
        let sal =  result?.resultSet.getDouble(result?.resultSet.getColumnIndex("salary")) as number;
        console.log(TAG + "sal:" + sal);
        expect(sal).assertEqual(100.5);
        let bool = result?.resultSet.isColumnNull(result?.resultSet.getColumnIndex("age"));
        console.log(TAG + "bool:" + bool);
        expect(bool).assertEqual(false);
        let value = result?.resultSet.getValue(result?.resultSet.getColumnIndex("salary")) as number;
        console.info(TAG + "value:" + value)
        expect(typeof(value)).assertEqual("number");
        let row: data_relationalStore.ValuesBucket;
        row = result?.resultSet.getRow() as data_relationalStore.ValuesBucket;
        console.log(TAG + "row['name']:" + row['name'] as string);
        console.log(TAG + "row['age']:" + row['age'] as string);
        expect(row['name']).assertEqual("lisi");
        expect(row['age']).assertEqual(21);
        result?.resultSet.close()
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* rdbStoreWithReturningTest0100 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_11900
     * @tc.name rdbStoreWithReturningTest0200
     * @tc.desc result.resultSet test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbStoreWithReturningTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* rdbStoreWithReturningTest0200 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      const asset:data_relationalStore.Asset = {
        name: "name4",
        uri: "uri4",
        createTime: "createTime4",
        modifyTime: "modifyTime4",
        size: "size4",
        path: "path4",
      };
      const assets = [asset];
      const valueBucket: data_relationalStore.ValuesBucket = {
        'name':"lisi",
        'age':21,
        'salary': 100.5,
        'blobType': u8,
        'data5': asset,
        'data6': assets,
        'data7': new Float32Array([1.5, 2.5])
      }
      const valueBucket1: data_relationalStore.ValuesBucket = {
        'name':"lisi1",
        'age':22,
        'salary': 101.5,
        'blobType': u8,
        'data5': asset,
        'data6': assets,
        'data7': new Float32Array([1.5, 2.5])
      }
      let config: data_relationalStore.ReturningConfig = {
        columns:['data5','data6','data7'],
        maxReturningCount:2
      }
      try {
        let result = await rdbStore?.batchInsertWithReturning("test",[valueBucket, valueBucket1],config,undefined);
        console.log(TAG + "result?.changed = " + result?.changed );
        expect(result?.changed).assertEqual(2);
        let bool1 = result?.resultSet.goToNextRow();

        let type = await result?.resultSet.getColumnType(result?.resultSet.getColumnIndex("data7"));
        console.log(TAG + "type:" + type);
        expect(type).assertEqual(data_relationalStore.ColumnType.FLOAT_VECTOR);
        let type1 = result?.resultSet.getColumnTypeSync(result?.resultSet.getColumnIndex("data7"));
        console.log(TAG + "type1:" + type1);
        expect(type1).assertEqual(data_relationalStore.ColumnType.FLOAT_VECTOR);

        let type2= result?.resultSet.getColumnTypeSync(result?.resultSet.getColumnIndex("data5"));
        console.log(TAG + "type2:" + type2);
        expect(type2).assertEqual(data_relationalStore.ColumnType.ASSET);

        let data  = result?.resultSet.getFloat32Array(result?.resultSet.getColumnIndex("data7"))
        console.log(TAG + "data:" + data + "data?.length" + data?.length);
        expect(data?.length).assertEqual(2);
        let asset = result?.resultSet.getAsset(result?.resultSet.getColumnIndex("data5"));
        console.log(TAG + "asset.name:" + asset?.name);
        expect(asset?.name).assertEqual("name4");
        let assets = result?.resultSet.getAssets(result?.resultSet.getColumnIndex("data6"))
        console.log(TAG + "assets.length" + assets?.length);
        expect(assets?.length).assertEqual(1);
        let rows: Array<data_relationalStore.ValuesBucket>;
        rows = await result?.resultSet.getRows(2,0) as Array<data_relationalStore.ValuesBucket>;
        console.log(TAG + "rows:" + rows.length);
        expect(rows.length).assertEqual(2);
        console.log(TAG + "rows:" + rows);
        result?.resultSet.close()
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* rdbStoreWithReturningTest0200 end *************");
    });
    console.log(TAG + "*************Unit Test End*************");
  })
}