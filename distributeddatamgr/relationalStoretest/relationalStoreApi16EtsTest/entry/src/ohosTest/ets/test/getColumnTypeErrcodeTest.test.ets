
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

const STORE_CONFIG1:data_relationalStore.StoreConfig = {
  name: "Resultset.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  isReadOnly:true
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


export default function getColumnTypeErrcodeTest() {
  describe('getColumnTypeErrcodeTest', () => {
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
     * @tc.name getColumnTypeSync errcode is 14800032
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5000
     * @tc.desc getColumnTypeSync errcode is 14800032
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSyncErrcode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSyncErrcode0100 start *************");
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
        console.error(TAG + "testgetColumnTypeSyncErrcode0100 insert failed " + err);
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
        console.error(TAG + "testgetColumnTypeSyncErrcode0100" + err.code + err.message);
        expect(err.code == 14800032).assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSyncErrcode0100 end *************");
    });


    /**
     * @tc.name getColumnTypeSync errcode is 14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5100
     * @tc.desc getColumnTypeSync errcode is 14800033
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSyncErrcode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSyncErrcode0200 start *************");
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
        console.error(TAG + "testgetColumnTypeSyncErrcode0200 insert failed " + err);
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
        expect(err.code == 14800033).assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSyncErrcode0200 end *************");
    });
    /**
     * @tc.name getColumnTypeSync errcode is 14800027
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5200
     * @tc.desc getColumnTypeSync errcode is 14800027
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeSyncErrcode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeSyncErrcode0300 start *************");
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
        console.error(TAG + "testgetColumnTypeSyncErrcode0200 insert failed " + err);
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
        expect(err.code == 14800027).assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSyncErrcode0300 end *************");
    });

    /**
     * @tc.name getColumnType errcode is 14800032
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5300
     * @tc.desc getColumnType errcode is 14800032
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeErrcode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeErrcode0100 start *************");
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
        console.error(TAG + "testgetColumnTypeErrcode0100 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
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
        console.error(TAG + "testgetColumnTypeErrcode0100" + err.code + err.message);
        expect(err.code == 14800032).assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeErrcode0100 end *************");
    });


    /**
     * @tc.name getColumnType errcode is 14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5400
     * @tc.desc getColumnType errcode is 14800033
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeErrcode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeErrcode0200 start *************");
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
        console.error(TAG + "testgetColumnTypeErrcode0200 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
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
        console.error(TAG + "testgetColumnTypeErrcode0200  failed " + err.code + err.message);
        expect(err.code == 14800033).assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeErrcode0200 end *************");
    });
    /**
     * @tc.name getColumnType errcode is 14800027
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5500
     * @tc.desc getColumnType errcode is 14800027
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetColumnTypeErrcode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testgetColumnTypeErrcode0300 start *************");
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
        console.error(TAG + "testgetColumnTypeErrcode0200 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
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
        console.error(TAG + "testgetColumnTypeErrcode0300  failed " + err.code + err.message);
        expect(err.code == 14800027).assertFail();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeErrcode0300 end *************");
    });

    console.log(TAG + "*************Unit Test End*************");
  })
}
