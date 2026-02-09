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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import data_relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[+]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
const STORE_CONFIG:data_relationalStore.StoreConfig = {
  name: "Resultset.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

let rdbStore:data_relationalStore.RdbStore | undefined | null;


async function createTest() {
  console.log(TAG + "createTest data start");
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket:data_relationalStore.ValuesBucket = {
      "data1": "hello",
      "data2": 10,
      "data3": 1.0,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array([3, 4, 5]);
    const valueBucket:data_relationalStore.ValuesBucket = {
      "data1": "2",
      "data2": -5,
      "data3": 100000.5,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array(0);
    const valueBucket:data_relationalStore.ValuesBucket = {
      "data1": "hello world",
      "data2": 3,
      "data3": 100000,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
  }
  console.log(TAG + "createTest data end");
}

function createUint8Array(length:number) {
  let i = 0
  let index = 0
  let temp:number
  let u8 = new Uint8Array(length)
  length = typeof (length) === 'undefined' ? 9 : length
  for (i = 1; i <= length; i++) {
    u8[i - 1] = i
  }
  for (i = 1; i <= length; i++) {
    index = parseInt((Math.random() * (length - i)).toString()) + i
    if (index != i) {
      temp = u8[i - 1]
      u8[i - 1] = u8[index - 1]
      u8[index - 1] = temp
    }
  }
  return u8;
}

export default function rdbResultSetSJsTest() {
  describe('rdbResultSetSJsTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);

    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await createTest();
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await rdbStore.executeSql(DROP_TABLE_TEST, null);
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      rdbStore = null;
      await data_relationalStore.deleteRdbStore(context, "Resultset.db");
    });


    /**
     * @tc.name   testgetColumnTypeJsTest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0100
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest0100 start *************");
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
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0100 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet.goToRow(count - 1));
        let type = data_relationalStore.ColumnType.NULL;
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("id"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data1"));
        expect(type).assertEqual(data_relationalStore.ColumnType.TEXT);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data2"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data3"));
        expect(type).assertEqual(data_relationalStore.ColumnType.REAL);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data4"));
        expect(type).assertEqual(data_relationalStore.ColumnType.BLOB);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data5"));
        expect(type).assertEqual(data_relationalStore.ColumnType.ASSET);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data6"));
        expect(type).assertEqual(data_relationalStore.ColumnType.ASSETS);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data7"));
        expect(type).assertEqual(data_relationalStore.ColumnType.FLOAT_VECTOR);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data8"));
        expect(type).assertEqual(data_relationalStore.ColumnType.UNLIMITED_INT);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0100 getColumnType failed " + err);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest0100 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0200
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest0200 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
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
        console.error(TAG + "testgetColumnTypeJsTest0200 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet?.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = data_relationalStore.ColumnType.NULL;
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("id"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data1"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data2"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data3"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data4"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data5"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data6"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data7"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType(resultSet?.getColumnIndex("data8"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0200 getColumnType failed " + err.code + err.message );
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest0200 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0300
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest0300 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0300 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet?.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        resultSet?.close();
        await resultSet?.getColumnType(resultSet?.getColumnIndex("id"));
        console.error(TAG + "testgetColumnTypeJsTest0300 getColumnType success ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0300 getColumnType failed. " + err);
        expect('14800014').assertEqual(err.code);
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest0300 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0400
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest0400 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0400 insert failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        await resultSet?.getColumnType(0);
        console.error(TAG + "testgetColumnTypeJsTest0400 getColumnType success ");
        expect(true).assertFail();
        done();
      } catch (err) {
        expect(14800012).assertEqual(err.code);
        resultSet.close();
        done();
        console.error(TAG + "testgetColumnTypeJsTest0400 getColumnType failed " + err);
      }
      console.log(TAG + "************* testgetColumnTypeJsTest0400 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0500
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest0500 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0500 insert failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        let count = resultSet?.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let columnCount = resultSet?.columnCount;
        expect(9).assertEqual(columnCount);
        await resultSet?.getColumnType(columnCount);
        console.error(TAG + "testgetColumnTypeJsTest0500 getColumnType success ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0500 getColumnType failed " + err.code + err.message);
        expect(14800013).assertEqual(err.code);
        resultSet?.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest0500 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0600
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest0600 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0600 insert failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        let count = resultSet?.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        await resultSet?.getColumnType(-1);
        console.error(TAG + "testgetColumnTypeJsTest0600 getColumnType success ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0600 getColumnType failed. " + err.code + err.message );
        expect('401').assertEqual(err.code);
        resultSet?.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest0600 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0700
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest0700 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0700 failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = await resultSet.getColumnType(Number.MAX_SAFE_INTEGER);
        console.error(TAG + "testgetColumnTypeJsTest0700 failed type " + type);
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0700 success " + err.code + err.message );
        expect('401').assertEqual(err.code);
        resultSet?.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest0700 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest0800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0800
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest0800 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0800 failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = await resultSet?.getColumnType(Number.MAX_VALUE);
        console.error(TAG + "testgetColumnTypeJsTest0800 success type " + type);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0800 failed " + err.code + err.message );
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest0800 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest0900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0900
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest0900 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0900 failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet.goToRow(count - 1));
        let type = await resultSet?.getColumnType(Number.MIN_VALUE);
        console.error(TAG + "testgetColumnTypeJsTest0900 success type " + type);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0900 failed " + err.code + err.message );
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest0900 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest1000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1000
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest1000 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1000 failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = await resultSet?.getColumnType(Number.MIN_SAFE_INTEGER);
        console.error(TAG + "testgetColumnTypeJsTest1000 success type " + type);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1000 failed " + err.code + err.message );
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest1000 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest1100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1100
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest1100 start *************");
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
        const valueBucket:data_relationalStore.ValuesBucket = {
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
        console.error(TAG + "testgetColumnTypeJsTest1100 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet.goToRow(count - 1));
        let type = data_relationalStore.ColumnType.NULL;
        type = await resultSet?.getColumnType("id");
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = await resultSet?.getColumnType("data1");
        expect(type).assertEqual(data_relationalStore.ColumnType.TEXT);
        type = await resultSet?.getColumnType("data2");
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = await resultSet?.getColumnType("data3");
        expect(type).assertEqual(data_relationalStore.ColumnType.REAL);
        type = await resultSet?.getColumnType("data4");
        expect(type).assertEqual(data_relationalStore.ColumnType.BLOB);
        type = await resultSet?.getColumnType("data5");
        expect(type).assertEqual(data_relationalStore.ColumnType.ASSET);
        type = await resultSet?.getColumnType("data6");
        expect(type).assertEqual(data_relationalStore.ColumnType.ASSETS);
        type = await resultSet?.getColumnType("data7");
        expect(type).assertEqual(data_relationalStore.ColumnType.FLOAT_VECTOR);
        type = await resultSet?.getColumnType("data8");
        resultSet?.close();
        expect(type).assertEqual(data_relationalStore.ColumnType.UNLIMITED_INT);
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1100 querySql failed " + err.code + err.message );
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest1100 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest1200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1200
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest1200 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
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
        console.error(TAG + "testgetColumnTypeJsTest1200 failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type = data_relationalStore.ColumnType.NULL;
        type = await resultSet?.getColumnType("id");
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = await resultSet?.getColumnType("data1");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType("data2");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType("data3");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType("data4");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType("data5");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType("data6");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType("data7");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet?.getColumnType("data8");
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1200 failed " + err.code + err.message );
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest1200 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest1300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1300
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest1300 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1300 failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        let count = resultSet?.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let columnCount = resultSet?.columnCount;
        expect(9).assertEqual(columnCount);
        await resultSet?.getColumnType("");
        console.error(TAG + "testgetColumnTypeJsTest1300 failed ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1300 success " + err.code + err.message );
        expect('401').assertEqual(err.code);
        resultSet?.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest1300 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest1400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1400
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest1400 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1400 failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        let count = resultSet?.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let columnCount = resultSet?.columnCount;
        expect(9).assertEqual(columnCount);
        await resultSet?.getColumnType("columnName");
        console.error(TAG + "testgetColumnTypeJsTest1400 failed ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1400 success " + err.code + err.message );
        expect(401).assertEqual(err.code);
        resultSet?.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest1400 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest1500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1500
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest1500 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1500 failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        resultSet?.close();
        await resultSet?.getColumnType("id");
        console.error(TAG + "testgetColumnTypeJsTest1500 failed ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1500 success " + err.code + err.message );
        expect('14800014').assertEqual(err.code);
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest1500 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest1600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1600
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest1600 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1600 failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        await resultSet?.getColumnType("id");
        console.error(TAG + "testgetColumnTypeJsTest1600 failed ");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1600 success " + err.code + err.message );
        expect(14800012).assertEqual(err.code);
        resultSet?.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest1600 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest1700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1700
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeJsTest1700 start *************");
      try {
        let predicates = new data_relationalStore.RdbPredicates("test");
        await rdbStore?.delete(predicates);
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore?.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1700 insert failed " + err);
      }
      try {
        for (let i = 0; i < 500; ++i) {
          let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT data1 FROM test");
          let count = resultSet.rowCount;
          expect(true).assertEqual(resultSet?.goToRow(count - 1));
          resultSet?.getColumnType(0);
          resultSet?.close();
          done();
        }
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1700 success " + err.code + err.message );
        expect('14800014').assertEqual(err.code);
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest1700 end *************");
    });
    console.log(TAG + "*************Unit Test End*************");
  })
}