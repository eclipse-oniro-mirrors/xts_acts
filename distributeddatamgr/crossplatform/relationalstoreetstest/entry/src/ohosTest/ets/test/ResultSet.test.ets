/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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
import relationalStore from "@ohos.data.relationalStore";
import { ValuesBucket } from '@ohos.data.ValuesBucket';
import common from "@ohos.app.ability.common";

let context: common.UIAbilityContext;
const TAG = "[RDB_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "data1 text," + "data2 long, " + "data3 double," + "data4 blob)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "Resultset.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};
const COLOUNM_NAMES = ["id", "data1", "data2", "data3", "data4"];
let rdbStore = undefined;

async function createTest() {
  console.info(TAG + "createTest data start");
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: ValuesBucket = {
      data1: "hello",
      data2: 10,
      data3: 1.0,
      data4: u8,
    };
    await rdbStore.insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array([3, 4, 5]);
    const valueBucket: ValuesBucket = {
      data1: "2",
      data2: -5,
      data3: 2.5,
      data4: u8,
    };
    await rdbStore.insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array(0);
    const valueBucket: ValuesBucket = {
      data1: "hello world",
      data2: 3,
      data3: 1.8,
      data4: u8,
    };
    await rdbStore.insert("test", valueBucket);
  }
  console.info(TAG + "createTest data end");
}

export default function rdbResultSetTest() {
  describe("rdbResultSetTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async () => {
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await createTest();
    });

    afterEach(async () => {
      console.info(TAG + "afterEach");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "Resultset.db");
    });

    afterAll(async () => {
      console.info(TAG + "afterAll");
    });

    /**
     * @tc.name   testResultSetColumnNames001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0550
     * @tc.desc   ResultSet columnNames test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetColumnNames001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetColumnNames001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.info("testResultSetColumnNames001 columnNames: " + JSON.stringify(resultSet.columnNames));
        expect(JSON.stringify(COLOUNM_NAMES)).assertEqual(JSON.stringify(resultSet.columnNames));
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetColumnNames001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetColumnCount001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0530
     * @tc.desc   ResultSet columnCount test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetColumnCount001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetColumnCount001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(5).assertEqual(resultSet.columnCount);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetColumnCount001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetColumnCount002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0540
     * @tc.desc   ResultSet columnCount test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetColumnCount002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetColumnCount002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(0).assertEqual(resultSet.columnCount);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetColumnCount002 end *************");
      }
    });

    /**
     * @tc.name   testResultSetRowCount001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_1070
     * @tc.desc   ResultSet rowCount test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetRowCount001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetRowCount001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
      expect(3).assertEqual(resultSet.rowCount);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetRowCount001 end *************");
    });

    /**
     * @tc.name   testResultSetRowCount002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0470
     * @tc.desc   ResultSet rowCount test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetRowCount002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetRowCount002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
      expect(-1).assertEqual(resultSet.rowCount);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetRowCount002 end *************");
    });

    /**
     * @tc.name   testResultSetRowCount003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0480
     * @tc.desc   ResultSet rowCount test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetRowCount003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetRowCount003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      let resultSet = await rdbStore.query(predicates);
      console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
      expect(1).assertEqual(resultSet.rowCount);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetRowCount003 end *************");
    });

    /**
     * @tc.name   testResultSetRowCount004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_1090
     * @tc.desc   ResultSet rowCount test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetRowCount004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetRowCount004 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      predicates.equalTo("data2", 3);
      let resultSet = await rdbStore.query(predicates);
      console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
      expect(0).assertEqual(resultSet.rowCount);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetRowCount004 end *************");
    });

    /**
     * @tc.name   testResultSetRowIndex001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0220
     * @tc.desc   ResultSet rowIndex test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetRowIndex001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetRowIndex001 *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
        expect("hello").assertEqual(data1);
        expect(10).assertEqual(data2);
        expect(1.0).assertEqual(data3);
        expect(1).assertEqual(data4[0]);
        expect(2).assertEqual(data4[1]);
        expect(3).assertEqual(data4[2]);
        expect(0).assertEqual(resultSet.rowIndex);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetRowIndex001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetRowIndex002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0310
     * @tc.desc   ResultSet rowIndex test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetRowIndex002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetRowIndex002 *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToLastRow());
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        expect("hello world").assertEqual(data1);
        expect(3).assertEqual(data2);
        expect(1.8).assertEqual(data3);
        expect(2).assertEqual(resultSet.rowIndex);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetRowIndex002 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsAtFirstRow001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0940
     * @tc.desc   ResultSet isAtFirstRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtFirstRow001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtFirstRow001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(true).assertEqual(resultSet.isAtFirstRow);
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
        expect("hello").assertEqual(data1);
        expect(10).assertEqual(data2);
        expect(1.0).assertEqual(data3);
        expect(1).assertEqual(data4[0]);
        expect(2).assertEqual(data4[1]);
        expect(3).assertEqual(data4[2]);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsAtFirstRow002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0450
     * @tc.desc   ResultSet isAtFirstRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtFirstRow002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtFirstRow002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        expect(false).assertEqual(resultSet.isAtFirstRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow002 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsAtFirstRow003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0160
     * @tc.desc   ResultSet isAtFirstRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtFirstRow003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtFirstRow003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(true).assertEqual(resultSet.goToNextRow());
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
        expect("2").assertEqual(data1);
        expect(-5).assertEqual(data2);
        expect(2.5).assertEqual(data3);
        expect(3).assertEqual(data4[0]);
        expect(4).assertEqual(data4[1]);
        expect(5).assertEqual(data4[2]);
        expect(false).assertEqual(resultSet.isAtFirstRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow003 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsAtFirstRow004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0290
     * @tc.desc   ResultSet isAtFirstRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtFirstRow004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtFirstRow004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToLastRow());
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        expect("hello world").assertEqual(data1);
        expect(3).assertEqual(data2);
        expect(1.8).assertEqual(data3);
        expect(false).assertEqual(resultSet.isAtFirstRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow004 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsAtFirstRow005
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0360
     * @tc.desc   ResultSet isAtFirstRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtFirstRow005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtFirstRow005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        resultSet.goToRow(1);
        resultSet.goToRow(0);
        expect(true).assertEqual(resultSet.isAtFirstRow);
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
        expect("hello").assertEqual(data1);
        expect(10).assertEqual(data2);
        expect(1.0).assertEqual(data3);
        expect(1).assertEqual(data4[0]);
        expect(2).assertEqual(data4[1]);
        expect(3).assertEqual(data4[2]);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow005 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsAtFirstRow006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0340
     * @tc.desc   ResultSet isAtFirstRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtFirstRow006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtFirstRow006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        resultSet.goToRow(1);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(true).assertEqual(resultSet.isAtFirstRow);
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
        expect("hello").assertEqual(data1);
        expect(10).assertEqual(data2);
        expect(1.0).assertEqual(data3);
        expect(1).assertEqual(data4[0]);
        expect(2).assertEqual(data4[1]);
        expect(3).assertEqual(data4[2]);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow006 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsAtLastRow001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0960
     * @tc.desc   ResultSet isAtLastRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtLastRow001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtLastRow001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToLastRow());
        expect(true).assertEqual(resultSet.isAtLastRow);
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        expect("hello world").assertEqual(data1);
        expect(3).assertEqual(data2);
        expect(1.8).assertEqual(data3);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtLastRow001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsAtLastRow002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0460
     * @tc.desc   ResultSet isAtLastRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtLastRow002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtLastRow002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        expect(false).assertEqual(resultSet.isAtLastRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtLastRow002 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsAtLastRow003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0140
     * @tc.desc   ResultSet isAtLastRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtLastRow003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtLastRow003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(true).assertEqual(resultSet.goToNextRow());
        expect(false).assertEqual(resultSet.isAtLastRow);
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
        expect("2").assertEqual(data1);
        expect(-5).assertEqual(data2);
        expect(2.5).assertEqual(data3);
        expect(3).assertEqual(data4[0]);
        expect(4).assertEqual(data4[1]);
        expect(5).assertEqual(data4[2]);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtLastRow003 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsAtLastRow004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0200
     * @tc.desc   ResultSet isAtLastRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtLastRow004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtLastRow004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(false).assertEqual(resultSet.isAtLastRow);
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
        expect("hello").assertEqual(data1);
        expect(10).assertEqual(data2);
        expect(1.0).assertEqual(data3);
        expect(1).assertEqual(data4[0]);
        expect(2).assertEqual(data4[1]);
        expect(3).assertEqual(data4[2]);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtLastRow004 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsAtLastRow005
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0370
     * @tc.desc   ResultSet isAtLastRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtLastRow005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtLastRow005 start *************");
      try {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        resultSet.goToRow(1);
        resultSet.goToRow(2);
        expect(true).assertEqual(resultSet.isAtLastRow);
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        expect("hello world").assertEqual(data1);
        expect(3).assertEqual(data2);
        expect(1.8).assertEqual(data3);
        resultSet.close();
        resultSet = null;
        done();
      } catch (e) {
        expect(!e).assertTrue();
        console.info(TAG + " querry failed: " + e);
        done();
      }
      console.info(TAG + "************* testResultSetIsAtLastRow005 end *************");
    });

    /**
     * @tc.name   testResultSetIsAtLastRow006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0350
     * @tc.desc   ResultSet isAtLastRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsAtLastRow006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsAtLastRow006 start *************");
      try {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        resultSet.goToRow(1);
        expect(true).assertEqual(resultSet.goToLastRow());
        expect(true).assertEqual(resultSet.isAtLastRow);
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        expect("hello world").assertEqual(data1);
        expect(3).assertEqual(data2);
        expect(1.8).assertEqual(data3);
        resultSet.close();
        resultSet = null;
        done();
      } catch (e) {
        expect(!e).assertTrue();
        console.info(TAG + " querry failed: " + e);
      }
      console.info(TAG + "************* testResultSetIsAtLastRow006 end *************");
    });

    /**
     * @tc.name   testResultSetIsEnded001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0210
     * @tc.desc   ResultSet isEnded test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsEnded001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      try {
        console.info(TAG + "************* testResultSetIsEnded001 start *************");
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(false).assertEqual(resultSet.isEnded);
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
        expect("hello").assertEqual(data1);
        expect(10).assertEqual(data2);
        expect(1.0).assertEqual(data3);
        expect(1).assertEqual(data4[0]);
        expect(2).assertEqual(data4[1]);
        expect(3).assertEqual(data4[2]);
        resultSet.close();
        resultSet = null;
        done();
      } catch (e) {
        expect(!e).assertTrue();
        console.info(TAG + " testResultSetIsEnded001 execute failed: " + e);
      }
      console.info(TAG + "************* testResultSetIsEnded001 end *************");
    });

    /**
     * @tc.name   testResultSetIsEnded002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0300
     * @tc.desc   ResultSet isEnded test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsEnded002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsEnded002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(false).assertEqual(resultSet.isEnded);
      const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
      const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
      const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
      expect("hello world").assertEqual(data1);
      expect(3).assertEqual(data2);
      expect(1.8).assertEqual(data3);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsEnded002 end *************");
    });

    /**
     * @tc.name   testResultSetIsEnded003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0330
     * @tc.desc   ResultSet isEnded test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsEnded003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsEnded003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      resultSet.goToRow(3);
      expect(true).assertEqual(resultSet.isEnded);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsEnded003 end *************");
    });

    /**
     * @tc.name   testResultSetIsStarted001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0500
     * @tc.desc   ResultSet isStarted test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsStarted001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsStarted001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.isStarted);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsStarted001 end *************");
    });

    /**
     * @tc.name   testResultSetIsStarted002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0120
     * @tc.desc   ResultSet isStarted test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsStarted002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsStarted002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      resultSet.goTo(1);
      expect(true).assertEqual(resultSet.isStarted);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsStarted002 end *************");
    });

    /**
     * @tc.name   testResultSetIsStarted003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0380
     * @tc.desc   ResultSet isStarted test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsStarted003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsStarted003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.isStarted);
      expect(true).assertEqual(resultSet.goToNextRow());
      expect(true).assertEqual(resultSet.isStarted);
      expect(true).assertEqual(resultSet.isStarted);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsStarted003 end *************");
    });

    /**
     * @tc.name   testResultSetIsClosed001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0110
     * @tc.desc   ResultSet isClosed test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsClosed001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsClosed001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);

      expect(3).assertEqual(resultSet.rowCount);
      resultSet.close();
      expect(true).assertEqual(resultSet.isClosed);

      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsClosed001 end *************");
    });

    /**
     * @tc.name   testResultSetIsClosed002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0490
     * @tc.desc   ResultSet isClosed test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsClosed002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsClosed002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.isClosed);
      resultSet.close();

      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsClosed002 end *************");
    });

    /**
     * @tc.name   testResultSetIsClosed003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0390
     * @tc.desc   ResultSet isClosed test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsClosed003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsClosed003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.isClosed);
      resultSet.close();

      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsClosed003 end *************");
    });

    /**
     * @tc.name   testResultSetGetColumnIndex001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0660
     * @tc.desc   ResultSet getColumnIndex test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetColumnIndex001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetColumnIndex001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(1).assertEqual(resultSet.getColumnIndex("data1"));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnIndex001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetColumnIndex002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0670
     * @tc.desc   ResultSet getColumnIndex test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetColumnIndex002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetColumnIndex002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        expect(-1).assertEqual(resultSet.getColumnIndex("data1"));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnIndex002 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetColumnIndex003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0650
     * @tc.desc   ResultSet getColumnIndex test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetColumnIndex003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetColumnIndex003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(-1).assertEqual(resultSet.getColumnIndex("dataX"));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnIndex003 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetColumnName001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0690
     * @tc.desc   ResultSet getColumnName test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetColumnName001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetColumnName001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);

        expect("data1").assertEqual(resultSet.getColumnName(1));
        expect("data4").assertEqual(resultSet.getColumnName(4));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnName001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetColumnName002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0710
     * @tc.desc   ResultSet getColumnName test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetColumnName002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetColumnName002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);

        expect("").assertEqual(resultSet.getColumnName(1));
        expect("").assertEqual(resultSet.getColumnName(4));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnName002 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetColumnName003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0680
     * @tc.desc   ResultSet getColumnName test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetColumnName003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetColumnName003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);

        expect("").assertEqual(resultSet.getColumnName(10));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnName003 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetColumnName004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0700
     * @tc.desc   ResultSet getColumnName test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetColumnName004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetColumnName004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);

        expect("").assertEqual(resultSet.getColumnName(10));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnName004 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGoTo001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0130
     * @tc.desc   ResultSet goTo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoTo001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoTo001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          resultSet.goTo(1);
          expect(1).assertEqual(resultSet.rowIndex);
          expect("2").assertEqual(resultSet.getString(0));
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoTo001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGoTo002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0100
     * @tc.desc   ResultSet goTo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoTo002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoTo002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goTo(1);
          expect(-1).assertEqual(resultSet.rowIndex);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoTo002 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGoTo003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0170
     * @tc.desc   ResultSet goTo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoTo003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoTo003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          expect(true).assertEqual(resultSet.goToNextRow());
          resultSet.goTo(1);
          expect(2).assertEqual(resultSet.rowIndex);
          expect("3").assertEqual(resultSet.getString(0));
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoTo003 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGoTo004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0240
     * @tc.desc   ResultSet goTo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoTo004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoTo004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToLastRow());
          resultSet.goTo(5);
          expect(3).assertEqual(resultSet.rowIndex);
          expect(5).assertEqual(resultSet.columnCount);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoTo004 end *************");
      }
    });


    /**
     * @tc.name   testResultSetGoToRow001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0190
     * @tc.desc   ResultSet goToRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToRow001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToRow001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          resultSet.goToRow(1);
          expect(1).assertEqual(resultSet.rowIndex);
          expect("2").assertEqual(resultSet.getString(0));
          resultSet.close();
        }
        resultSet = null;
        expect(resultSet == null).assertTrue();
        done();
        console.info(TAG + "************* testResultSetGoToRow001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGoToRow002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0440
     * @tc.desc   ResultSet goToRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToRow002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToRow002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(1);
          expect(-1).assertEqual(resultSet.rowIndex);
          expect(0).assertEqual(resultSet.columnCount);
          resultSet.close();
        }
        resultSet = null;
        expect(resultSet == null).assertTrue();
        done();
        console.info(TAG + "************* testResultSetGoToRow002 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGoToRow003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0230
     * @tc.desc   ResultSet goToRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToRow003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToRow003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          expect(true).assertEqual(resultSet.goToNextRow());
          expect(true).assertEqual(resultSet.goToNextRow());
          resultSet.goToRow(1);
          expect(1).assertEqual(resultSet.rowIndex);
          expect("2").assertEqual(resultSet.getString(0));
          resultSet.close();
        }
        resultSet = null;
        expect(resultSet == null).assertTrue();
        done();
        console.info(TAG + "************* testResultSetGoToRow003 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGoToRow004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0280
     * @tc.desc   ResultSet goToRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToRow004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToRow004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToLastRow());
          resultSet.goToRow(5);
          expect(3).assertEqual(resultSet.rowIndex);
          expect(5).assertEqual(resultSet.columnCount);
          resultSet.close();
        }
        resultSet = null;
        expect(resultSet == null).assertTrue();
        done();
        console.info(TAG + "************* testResultSetGoToRow004 end *************");
      }
    });


    /**
     * @tc.name   testResultSetGoToFirstRow001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0950
     * @tc.desc   ResultSet goToFirstRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToFirstRow001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToFirstRow001 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.isAtFirstRow);
      expect("1").assertEqual(resultSet.getString(0));
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToFirstRow001 end *************");
    });

    /**
     * @tc.name   testResultSetGoToFirstRow002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0400
     * @tc.desc   ResultSet goToFirstRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToFirstRow002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToFirstRow002 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToFirstRow());
      expect(false).assertEqual(resultSet.isAtFirstRow);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToFirstRow002 end *************");
    });

    /**
     * @tc.name   testResultSetGoToFirstRow003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0150
     * @tc.desc   ResultSet goToFirstRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToFirstRow003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToFirstRow003 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.goToNextRow());
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.isAtFirstRow);
      expect("1").assertEqual(resultSet.getString(0));
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToFirstRow003 end *************");
    });

    /**
     * @tc.name   testResultSetGoToLastRow001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0970
     * @tc.desc   ResultSet goToLastRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToLastRow001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToLastRow001 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(true).assertEqual(resultSet.isAtLastRow);
      expect("3").assertEqual(resultSet.getString(0));
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToLastRow001 end *************");
    });

    /**
     * @tc.name   testResultSetGoToLastRow002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0410
     * @tc.desc   ResultSet goToLastRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToLastRow002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToLastRow002 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToLastRow());
      expect(false).assertEqual(resultSet.isAtLastRow);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToLastRow002 end *************");
    });

    /**
     * @tc.name   testResultSetGoToLastRow003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0250
     * @tc.desc   ResultSet goToLastRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToLastRow003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToLastRow003 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(true).assertEqual(resultSet.isAtLastRow);
      expect("3").assertEqual(resultSet.getString(0));
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToLastRow003 end *************");
    });

    /**
     * @tc.name   testResultSetGoToNextRow001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0980
     * @tc.desc   ResultSet goToNextRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToNextRow001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToNextRow001 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToNextRow());
      expect("1").assertEqual(resultSet.getString(0));
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToNextRow001 end *************");
    });

    /**
     * @tc.name   testResultSetGoToNextRow002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0420
     * @tc.desc   ResultSet goToNextRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToNextRow002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToNextRow002 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToNextRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToNextRow002 end *************");
    });

    /**
     * @tc.name   testResultSetGoToNextRow003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_1080
     * @tc.desc   ResultSet goToNextRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToNextRow003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToNextRow003 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.goToNextRow());
      expect(true).assertEqual(resultSet.goToNextRow());
      expect(2).assertEqual(resultSet.rowIndex);
      expect("3").assertEqual(resultSet.getString(0));
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToNextRow003 end *************");
    });

    /**
     * @tc.name   testResultSetGoToNextRow004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0260
     * @tc.desc   ResultSet goToNextRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToNextRow004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToNextRow004 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(false).assertEqual(resultSet.goToNextRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToNextRow004 end *************");
    });

    /**
     * @tc.name   testResultSetGoToPreviousRow001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0510
     * @tc.desc   ResultSet goToPreviousRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToPreviousRow001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToPreviousRow001 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToPreviousRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToPreviousRow001 end *************");
    });

    /**
     * @tc.name   testResultSetGoToPreviousRow002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0430
     * @tc.desc   ResultSet goToPreviousRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToPreviousRow002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToPreviousRow002 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToPreviousRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToPreviousRow002 end *************");
    });

    /**
     * @tc.name   testResultSetGoToPreviousRow003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0180
     * @tc.desc   ResultSet goToPreviousRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToPreviousRow003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToPreviousRow003 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.goToNextRow());
      expect(true).assertEqual(resultSet.goToPreviousRow());
      expect(0).assertEqual(resultSet.rowIndex);
      expect("1").assertEqual(resultSet.getString(0));
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToPreviousRow003 end *************");
    });

    /**
     * @tc.name   testResultSetGoToPreviousRow004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0270
     * @tc.desc   ResultSet goToPreviousRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToPreviousRow004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToPreviousRow004 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(true).assertEqual(resultSet.goToPreviousRow());
      expect(1).assertEqual(resultSet.rowIndex);
      expect("2").assertEqual(resultSet.getString(0));
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToPreviousRow004 end *************");
    });

    /**
     * @tc.name   testResultSetGetBlob001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0600
     * @tc.desc   ResultSet getBlob test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetBlob001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetBlob001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = resultSet.getLong(resultSet.getColumnIndex("id"));
          const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
          console.info(TAG + "id=" + id + ", data4=" + data4);
          expect(1).assertEqual(data4[0]);
          expect(2).assertEqual(data4[1]);
          expect(3).assertEqual(data4[2]);
        }
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        expect(!e).assertTrue();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testGetBlob0001 end *************");
    });

    /**
     * @tc.name   testResultSetGetBlob002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0610
     * @tc.desc   ResultSet getBlob test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetBlob002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetBlob002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          resultSet.goToRow(1);
          const id = resultSet.getLong(resultSet.getColumnIndex("id"));
          const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
          console.info(TAG + "id=" + id + ", data4=" + data4);
          expect(3).assertEqual(data4[0]);
          expect(4).assertEqual(data4[1]);
          expect(5).assertEqual(data4[2]);
        }
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        expect(!e).assertTrue();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetBlob002 end *************");
    });


    /**
     * @tc.name   testResultSetGetString001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0850
     * @tc.desc   ResultSet getString test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetString001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetString001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      {
        expect(true).assertEqual(resultSet.goToFirstRow());
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        expect("hello").assertEqual(data1);
        resultSet.close();
      }
      resultSet = null;
      predicates.equalTo("name", "wangwu");
      resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToPreviousRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetString001 end *************");
    });

    /**
     * @tc.name   testResultSetGetString002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0860
     * @tc.desc   ResultSet getString test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetString002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetString002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      {
        expect(true).assertEqual(resultSet.goToFirstRow());
        const data2 = resultSet.getString(resultSet.getColumnIndex("data2"));
        expect("10").assertEqual(data2);
        resultSet.close();
      }
      resultSet = null;
      predicates.equalTo("name", "wangwu");
      resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToPreviousRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetString002 end *************");
    });

    /**
     * @tc.name   testResultSetGetString003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0880
     * @tc.desc   ResultSet getString test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetString003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetString003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      {
        resultSet.goToRow(1);
        const data3 = resultSet.getString(resultSet.getColumnIndex("data3"));
        expect("2.5").assertEqual(data3);
        resultSet.close();
      }
      resultSet = null;
      predicates.equalTo("name", "wangwu");
      resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToPreviousRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetString003 end *************");
    });

    /**
     * @tc.name   testResultSetGetString004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0870
     * @tc.desc   ResultSet getString test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetString004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetString004 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      {
        resultSet.goToRow(2);
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getString(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getString(resultSet.getColumnIndex("data3"));
        expect("hello world").assertEqual(data1);
        expect("3").assertEqual(data2);
        expect("1.8").assertEqual(data3);
        resultSet.close();
      }
      resultSet = null;
      predicates.equalTo("name", "wangwu");
      resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToPreviousRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetString004 end *************");
    });

    /**
     * @tc.name   testResultSetGetLong001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0840
     * @tc.desc   ResultSet getLong test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetLong001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetLong001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = resultSet.getLong(resultSet.getColumnIndex("id"));
          const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
          console.info(TAG + "id=" + id + ", data2=" + data2);
          expect(10).assertEqual(data2);
        }
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        expect(!e).assertTrue();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetLong001 end *************");
    });

    /**
     * @tc.name   testResultSetGetLong002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0790
     * @tc.desc   ResultSet getLong test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetLong002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetLong002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          expect(true).assertEqual(resultSet.goToNextRow());
          const data1 = resultSet.getLong(resultSet.getColumnIndex("data1"));
          expect(2).assertEqual(data1);
        }
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        expect(!e).assertTrue();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetLong002 end *************");
    });

    /**
     * @tc.name   testResultSetGetLong003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0800
     * @tc.desc   ResultSet getLong test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetLong003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetLong003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          expect(true).assertEqual(resultSet.goToNextRow());
          const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
          expect(-5).assertEqual(data2);
        }
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        expect(!e).assertTrue();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetLong003 end *************");
    });

    /**
     * @tc.name   testResultSetGetLong004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0820
     * @tc.desc   ResultSet getLong test null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetLong004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetLong004 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          const data2 = resultSet.getLong(null);
          expect(!data2).assertTrue();
        }
      } catch (e) {
        console.info(TAG + "************* testResultSetGetLong004 err " + e);
        expect('401').assertEqual(e.code);
      }
      resultSet.close();
      expect(true).assertEqual(resultSet.isClosed);
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetLong004 end *************");
    });

    /**
     * @tc.name   testResultSetGetLong005
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0810
     * @tc.desc   ResultSet getLong test err parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetLong005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetLong005 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          const data2 = resultSet.getLong(100);
          expect(!data2).assertTrue();
        }
      } catch (e) {
        console.info(TAG + "************* testResultSetGetLong005 err " + e);
        expect(e.code == 14800013).assertTrue();
      }
      resultSet.close();
      expect(true).assertEqual(resultSet.isClosed);
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetLong005 end *************");
    });

    /**
     * @tc.name   testResultSetGetLong006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0830
     * @tc.desc   ResultSet getLong test err typr parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetLong006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetLong006 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          let errType: ESObject = "errType";
          const data2 = resultSet.getLong(errType);
          expect(!data2).assertTrue();
        }
      } catch (e) {
        console.info(TAG + "************* testResultSetGetLong006 err " + e);
        expect('401').assertEqual(e.code);
      }
      resultSet.close();
      expect(true).assertEqual(resultSet.isClosed);
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetLong006 end *************");
    });

    /**
     * @tc.name   testResultSetGetDouble001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0730
     * @tc.desc   ResultSet getDouble test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetDouble001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetDouble001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(0);
          const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
          expect(1.0).assertEqual(data3);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetDouble001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetDouble002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0750
     * @tc.desc   ResultSet getDouble test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetDouble002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetDouble002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(1);
          const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
          expect(2.5).assertEqual(data3);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetDouble002 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetDouble003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0740
     * @tc.desc   ResultSet getDouble test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetDouble003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetDouble003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(2);
          const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
          expect(1.8).assertEqual(data3);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetDouble003 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetDouble004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0720
     * @tc.desc   ResultSet getDouble test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetDouble004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetDouble004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(0);
          const data2 = resultSet.getDouble(resultSet.getColumnIndex("data2"));
          expect(10).assertEqual(data2);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetDouble004 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetDouble005
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0770
     * @tc.desc   ResultSet getDouble test null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetDouble005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetDouble005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(0);
          try {
            const data = resultSet.getDouble(null);
            expect(!data).assertTrue();
          } catch (e) {
            console.info(TAG + "************* testResultSetGetDouble005 err " + e);
            expect('401').assertEqual(e.code);
          }
          expect(resultSet !== null).assertTrue();
          resultSet.close();
        }
        resultSet = null;
        expect(resultSet == null).assertTrue();
        done();
        console.info(TAG + "************* testResultSetGetDouble005 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetDouble006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0760
     * @tc.desc   ResultSet getDouble test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetDouble006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetDouble006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(0);
          try {
            const data = resultSet.getDouble(100);
            expect(!data).assertTrue();
          } catch (e) {
            console.info(TAG + "************* testResultSetGetDouble006 err " + e);
            expect(e.code == 14800013).assertTrue();
          }
          expect(resultSet !== null).assertTrue();
          resultSet.close();
        }
        resultSet = null;
        expect(resultSet == null).assertTrue();
        done();
        console.info(TAG + "************* testResultSetGetDouble006 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetDouble007
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0780
     * @tc.desc   ResultSet getDouble test err type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetDouble007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetDouble007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        let errType: ESObject = "errType";
        {
          resultSet.goToRow(0);
          try {
            const data = resultSet.getDouble(errType);
            expect(!data).assertTrue();
          } catch (e) {
            console.info(TAG + "************* testResultSetGetDouble007 err " + e);
            expect('401').assertEqual(e.code);
          }
          expect(resultSet !== null).assertTrue();
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetDouble007 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsColumnNull001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_1060
     * @tc.desc   ResultSet isColumnNull test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsColumnNull001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsColumnNull001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet: relationalStore.ResultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(2);
          const isColumnNull1 = resultSet.isColumnNull(resultSet.getColumnIndex("data1"));
          expect(false).assertEqual(isColumnNull1);
          console.info(TAG + "************* testResultSetIsColumnNull001 " + resultSet.getString(resultSet.getColumnIndex("data1")));
          expect("hello world").assertEqual(resultSet.getString(resultSet.getColumnIndex("data1")));
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsColumnNull001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsColumnNull002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_1010
     * @tc.desc   ResultSet isColumnNull test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsColumnNull002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsColumnNull002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(2);
          const isColumnNull4 = resultSet.isColumnNull(resultSet.getColumnIndex("data4"));
          expect(true).assertEqual(isColumnNull4);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsColumnNull002 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsColumnNull003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_1030
     * @tc.desc   ResultSet isColumnNull test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsColumnNull003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsColumnNull003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(2);
          expect(false).assertEqual(resultSet.isColumnNull(1));
          console.info(TAG + "************* testResultSetIsColumnNull001 " + resultSet.getString(1));
          expect("hello world").assertEqual(resultSet.getString(1));
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsColumnNull003 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsColumnNull004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_1040
     * @tc.desc   ResultSet isColumnNull test null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsColumnNull004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsColumnNull004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet: relationalStore.ResultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(2);
          try {
            const data = resultSet.isColumnNull(null);
            expect(!data).assertTrue();
          } catch (e) {
            console.info(TAG + "************* testResultSetIsColumnNull004 err " + e);
            expect('401').assertEqual(e.code);
          }
          expect(resultSet !== null).assertTrue();
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsColumnNull004 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsColumnNull005
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_1020
     * @tc.desc   ResultSet isColumnNull test err parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsColumnNull005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsColumnNull005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet: relationalStore.ResultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(2);
          try {
            const data = resultSet.isColumnNull(100);
            expect(!data).assertTrue();
          } catch (e) {
            console.info(TAG + "************* testResultSetIsColumnNull005 err " + e);
            expect(e.code == 14800013).assertTrue();
          }
          expect(resultSet !== null).assertTrue();
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsColumnNull005 end *************");
      }
    });

    /**
     * @tc.name   testResultSetIsColumnNull006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_1050
     * @tc.desc   ResultSet isColumnNull test err type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetIsColumnNull006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetIsColumnNull006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet: relationalStore.ResultSet = await rdbStore.query(predicates);
        let errType: ESObject = "errType";
        {
          resultSet.goToRow(2);
          try {
            const data = resultSet.isColumnNull(errType);
            expect(!data).assertTrue();
          } catch (e) {
            console.info(TAG + "************* testResultSetIsColumnNull005 err " + e);
            expect('401').assertEqual(e.code);
          }
          expect(resultSet !== null).assertTrue();
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsColumnNull006 end *************");
      }
    });

    /**
     * @tc.name   testResultSetClose001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0320
     * @tc.desc   ResultSet close test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetClose001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetClose001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        resultSet.goToRow(1);
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetClose001 end *************");
      }
    });

    /**
     * @tc.name   testResultSetClose002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0520
     * @tc.desc   ResultSet close test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetClose002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetClose002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetClose002 end *************");
      }
    });
  });
}
