
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import data_relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG = "[RELATIONAL_STORE_JSKITS_RESULTSET_TEST]"
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
const STORE_CONFIG:data_relationalStore.StoreConfig = {
  name: "Resultset.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let rdbStore:data_relationalStore.RdbStore | undefined | null;

async function createTest() {
  console.log(TAG + "createTest data start");
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: data_relationalStore.ValuesBucket = {
      "data1": "hello",
      "data2": 10,
      "data3": 1.0,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array([3, 4, 5]);
    const valueBucket: data_relationalStore.ValuesBucket = {
      "data1": "2",
      "data2": -5,
      "data3": 2.5,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array(0);
    const valueBucket: data_relationalStore.ValuesBucket = {
      "data1": "hello world",
      "data2": 3,
      "data3": 1.8,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
  }
  console.log(TAG + "createTest data end");
}


export default function rdbResultSetSyncTest() {
  describe('rdbResultSetSyncTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await createTest();
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
    });
    afterEach(() => {
      console.info(TAG + 'afterEach');
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      rdbStore = null;
      await data_relationalStore.deleteRdbStore(context, "Resultset.db");
    });

    /**
     * @tc.name testgetColumnTypeSync0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0100
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync0100 start *************");
      try {
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
          "data1": "hello world",
          "data2": 3,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync001 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = data_relationalStore.ColumnType.NULL;
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("id"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data1"));
        expect(type).assertEqual(data_relationalStore.ColumnType.TEXT);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data2"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data3"));
        expect(type).assertEqual(data_relationalStore.ColumnType.REAL);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data4"));
        expect(type).assertEqual(data_relationalStore.ColumnType.BLOB);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data5"));
        expect(type).assertEqual(data_relationalStore.ColumnType.ASSET);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data6"));
        expect(type).assertEqual(data_relationalStore.ColumnType.ASSETS);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data7"));
        expect(type).assertEqual(data_relationalStore.ColumnType.FLOAT_VECTOR);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data8"));
        expect(type).assertEqual(data_relationalStore.ColumnType.UNLIMITED_INT);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0100  failed " + err.code + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync0100 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0200
     * @tc.desc querySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync0200 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
          "data2": null,
          "data3": null,
          "data4": null,
          "data5": null,
          "data6": null,
          "data7": null,
          "data8": null
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync002 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = data_relationalStore.ColumnType.NULL;
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("id"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data1"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data2"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data3"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data4"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data5"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data6"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data7"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("data8"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0200  failed " + err.code + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync0200 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0300
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync0300 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0300 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet?.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        resultSet?.close();
        resultSet?.getColumnTypeSync(resultSet?.getColumnIndex("id"));
        console.error(TAG + "testgetColumnTypeSync0300 getColumnTypeSync success");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0300 getColumnTypeSync failed. " + err);
        expect('14800014').assertEqual(err.code);
        done();

      }
      console.log(TAG + "************* testgetColumnTypeSync0300 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0400
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync0400 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0400 insert failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        resultSet?.getColumnTypeSync(0);
        console.error(TAG + "testgetColumnTypeSync0400 getColumnType success ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0400 getColumnType failed " + err);
        expect(14800012).assertEqual(err.code);
        resultSet?.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync0400 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0500
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync0500 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0500 insert failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        let count = resultSet?.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let columnCount = resultSet?.columnCount;
        expect(9).assertEqual(columnCount);
        resultSet?.getColumnTypeSync(columnCount);
        console.error(TAG + "testgetColumnTypeSync0500 getColumnType success ");
        expect(true).assertFail();
        done();
      } catch (err) {
        expect(14800013).assertEqual(err.code);
        resultSet?.close();
        done()
        console.error(TAG + "testgetColumnTypeSync0500 getColumnType failed " + err);
      }
      console.log(TAG + "************* testgetColumnTypeSync0500 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0600
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync0600 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0600 insert failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        let count = resultSet?.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        resultSet?.getColumnTypeSync(-1);
        console.error(TAG + "testgetColumnTypeSync0600 getColumnType success ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0600 getColumnType failed. " + err);
        expect('401').assertEqual(err.code);
        resultSet?.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync0600 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0700
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync0700 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0700 failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = resultSet.getColumnTypeSync(Number.MAX_SAFE_INTEGER);
        console.error(TAG + "testgetColumnTypeSync0700 failed type " + type);
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0700 success " + err);
        expect('401').assertEqual(err.code);
        resultSet?.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync0700 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync0800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0800
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync0800 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0800 failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = resultSet?.getColumnTypeSync(Number.MAX_VALUE);
        console.error(TAG + "testgetColumnTypeSync0800 success type " + type);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0800 failed " + err);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync0800 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync0900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0900
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync0900 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0900 failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = resultSet?.getColumnTypeSync(Number.MIN_VALUE);
        console.error(TAG + "testgetColumnTypeSync0900 success type " + type);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0900 failed " + err);
        expect().assertFail()
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync0900 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync1000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1000
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync1000 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1000 failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = resultSet?.getColumnTypeSync(Number.MIN_SAFE_INTEGER);
        console.error(TAG + "testgetColumnTypeSync1000 success type " + type);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1000 failed " + err);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync1000 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync1100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1100
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync1100 start *************");
      try {
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
          "data1": "hello world",
          "data2": 3,
          "data3": 100000,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1100 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = data_relationalStore.ColumnType.NULL;
        type = resultSet?.getColumnTypeSync("id");
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = resultSet?.getColumnTypeSync("data1");
        expect(type).assertEqual(data_relationalStore.ColumnType.TEXT);
        type = resultSet?.getColumnTypeSync("data2");
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = resultSet?.getColumnTypeSync("data3");
        expect(type).assertEqual(data_relationalStore.ColumnType.REAL);
        type = resultSet?.getColumnTypeSync("data4");
        expect(type).assertEqual(data_relationalStore.ColumnType.BLOB);
        type = resultSet?.getColumnTypeSync("data5");
        expect(type).assertEqual(data_relationalStore.ColumnType.ASSET);
        type = resultSet?.getColumnTypeSync("data6");
        expect(type).assertEqual(data_relationalStore.ColumnType.ASSETS);
        type = resultSet?.getColumnTypeSync("data7");
        expect(type).assertEqual(data_relationalStore.ColumnType.FLOAT_VECTOR);
        type = resultSet?.getColumnTypeSync("data8");
        resultSet?.close();
        expect(type).assertEqual(data_relationalStore.ColumnType.UNLIMITED_INT);
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1100 querySql failed " + err);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync1100 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync1200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1200
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync1200 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
          "data2": null,
          "data3": null,
          "data4": null,
          "data5": null,
          "data6": null,
          "data7": null,
          "data8": null
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync012 failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet.goToRow(count - 1));
        let type = data_relationalStore.ColumnType.NULL;
        type = resultSet?.getColumnTypeSync("id");
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = resultSet?.getColumnTypeSync("data1");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync("data2");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync("data3");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync("data4");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync("data5");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync("data6");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync("data7");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet?.getColumnTypeSync("data8");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1200 failed " + err);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync1200 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync1300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1300
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync1300 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1300 failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {

        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet.goToRow(count - 1));
        let columnCount = resultSet.columnCount;
        expect(9).assertEqual(columnCount);
        resultSet?.getColumnTypeSync("");
        console.error(TAG + "testgetColumnTypeSync1300 failed ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1300 success " + err);
        expect('401').assertEqual(err.code);
        resultSet.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync1300 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync1400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1400
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync1400 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1400 failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        let count = resultSet?.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let columnCount = resultSet?.columnCount;
        expect(9).assertEqual(columnCount);
        resultSet?.getColumnTypeSync("columnName");
        console.error(TAG + "testgetColumnTypeSync1400 failed ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1400 success " + err.code);
        expect(401).assertEqual(err.code);
        resultSet?.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync1400 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync1500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1500
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync1500 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1500 failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        resultSet?.close();
        resultSet?.getColumnTypeSync("id");
        console.error(TAG + "testgetColumnTypeSync1500 failed ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1500 success " + err);
        expect('14800014').assertEqual(err.code);
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync1500 end *************");
    });

    /**
     * @tc.name testgetColumnTypeSync1600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1600
     * @tc.desc uerySharingResource test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSync1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSync1600 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync1600 failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        resultSet?.getColumnTypeSync("id");
        console.error(TAG + "testgetColumnTypeSync1600 failed ");
        expect(true).assertFail();
        done();
      } catch (err) {
        expect(14800012).assertEqual(err.code);
        resultSet.close();
        console.error(TAG + "testgetColumnTypeSync1600 success " + err);
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync1600 end *************");
    });
    console.log(TAG + "*************Unit Test End*************");
  })
}
