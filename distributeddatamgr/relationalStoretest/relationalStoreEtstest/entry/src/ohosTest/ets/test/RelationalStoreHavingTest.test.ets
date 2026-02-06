/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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
import relationalStore from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "sal INTEGER)";


const STORE_CONFIG : relationalStore.StoreConfig= {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
let rdbStore:relationalStore.RdbStore;

async function createTest() {
  console.log(TAG + "createTest data start");
  let valuesBucket1 :relationalStore.ValuesBucket= {
    "name": "cathy",
    "age": 11,
    "sal": 90,
  }
  await rdbStore.insert("test", valuesBucket1);
  let valuesBucket2 :relationalStore.ValuesBucket= {
    "name": "zhangsan",
    "age": 12,
    "sal": 100
  }
  await rdbStore.insert("test", valuesBucket2);
  let valuesBucket3 :relationalStore.ValuesBucket= {
    "name": "zhangsan",
    "age": 11,
    "sal": 100,
  }
  await rdbStore.insert("test", valuesBucket3);
  console.log(TAG + "createTest data end");
}


export default function relationalStoreHavingTest() {
  describe('relationalStoreHavingTest', ()=> {
    beforeAll(async ()=> {
      console.info(TAG + "*************Unit Test Begin*************");
      console.info(TAG + 'beforeAll');
    })

    beforeEach(async ()=> {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await createTest();
    })

    afterEach(async ()=> {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context,"rdbStore.db");
    })

    afterAll(async ()=> {
      console.info(TAG + 'afterAll');

      console.info(TAG + "*************Unit Test end*************");
    })
    /**
     * @tc.name testHaving001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_havinsJsAPITest_0100
     * @tc.desc having success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHaving001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testHaving001 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.groupBy(["age"])
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
        console.log(TAG + " resultSet.rowCount " + resultSet.rowCount);
        predicates.having("max = ?",[100]);
        let resultSet1 = await (rdbStore as relationalStore.RdbStore).query(predicates, ["MAX(sal) AS max"])
        console.log(TAG + " resultSet1.rowCount " + resultSet1.rowCount);
        expect(resultSet1.rowCount).assertEqual(2)
        console.log(TAG + " testHaving001 having success");
        resultSet.close();
        done();
      } catch (e) {
        console.error(TAG + " testHaving001 having failed" + e);
        expect(true).assertFail();
      }
      console.log(TAG + "************* testHaving001 end   *************");
    })

    /**
     * @tc.name testHaving002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_havinsJsAPITest_0200
     * @tc.desc having success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHaving002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testHaving002 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.groupBy(["age"])
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
        console.log(TAG + "resultSet.rowCount " + resultSet.rowCount);
        predicates.having("min < 100");
        let resultSet1 = await (rdbStore as relationalStore.RdbStore).query(predicates, ["MIN(sal) AS min"])
        console.log(TAG + "resultSet1.rowCount " + resultSet1.rowCount);
        expect(resultSet1.rowCount).assertEqual(1)
        console.log(TAG + "testHaving001 having success");
        resultSet.close();
        done();
      } catch (e) {
        console.error(TAG + " testHaving002 having failed" + e);
        expect(true).assertFail();
      }
      console.log(TAG + "************* testHaving002 end   *************");
    })
    /**
     * @tc.name testHaving003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_havinsJsAPITest_0300
     * @tc.desc having conditions is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHaving003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testHaving003 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.groupBy(["age"]);
        predicates.having(null);
        console.log(TAG + "testHaving003 having success");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "testHaving003 having failed" + err.code + err.message);
        expect(err.code == 14800001).assertTrue();
        done();
      }
      console.log(TAG + "************* testHaving003 end   *************");
    })
    /**
     * @tc.name testHaving004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_havinsJsAPITest_0400
     * @tc.desc having errcode is 14800001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHaving004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testHaving004 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.having("name = zhangsan");
        console.log(TAG + "testHaving004 having success");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "testHaving004 having failed" + err.code + err.message);
        expect(err.code == 14800001).assertTrue();
        done();
      }
      console.log(TAG + "************* testHaving004 end   *************");
    })
    /**
     * @tc.name testHaving005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_havinsJsAPITest_0500
     * @tc.desc hvaing errcode is 14800001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHaving005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testHaving005 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.having("");
        console.log(TAG + "testHaving005 having success");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "testHaving005 having failed" + err.code + err.message);
        expect(err.code == 14800001).assertTrue();
        done();
      }
      console.log(TAG + "************* testHaving005 end   *************");
    })
    /**
     * @tc.name testHaving006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_havinsJsAPITest_0600
     * @tc.desc having args is []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHaving006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testHaving006 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.groupBy(["age"])
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
        console.log(TAG + "resultSet.rowCount " + resultSet.rowCount);
        predicates.having("max = 100",[]);
        let resultSet1 = await (rdbStore as relationalStore.RdbStore).query(predicates, ["MAX(sal) AS max"])
        console.log(TAG + "resultSet1.rowCount " + resultSet1.rowCount);
        expect(resultSet1.rowCount).assertEqual(2)
        console.log(TAG + "testHaving006 having success");
        resultSet.close();
        done();
      } catch (e) {
        console.error(TAG + "testHaving006 having failed" + e);
        expect(true).assertFail();
      }
      console.log(TAG + "************* testHaving006 end   *************");
    })
    /**
     * @tc.name testHaving007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_havinsJsAPITest_0700
     * @tc.desc having args is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHaving007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testHaving007 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.groupBy(["age"])
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
        console.log(TAG + "resultSet.rowCount " + resultSet.rowCount);
        predicates.having("max = 100",null);
        let resultSet1 = await (rdbStore as relationalStore.RdbStore).query(predicates, ["MAX(sal) AS max"])
        console.log(TAG + "resultSet1.rowCount " + resultSet1.rowCount);
        expect(resultSet1.rowCount).assertEqual(2)
        console.log(TAG + "testHaving007 having success");
        resultSet.close();
        done();
      } catch (e) {
        console.error(TAG + "testHaving007 having failed" + e);
        expect(true).assertFail();
      }
      console.log(TAG + "************* testHaving007 end   *************");
    })
    /**
     * @tc.name testHaving008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_havinsJsAPITest_0800
     * @tc.desc having args is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHaving008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testHaving008 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.groupBy(["age"])
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
        console.log(TAG + "resultSet.rowCount " + resultSet.rowCount);
        predicates.having("max = 100",undefined);
        let resultSet1 = await (rdbStore as relationalStore.RdbStore).query(predicates, ["MAX(sal) AS max"])
        console.log(TAG + "resultSet1.rowCount " + resultSet1.rowCount);
        expect(resultSet1.rowCount).assertEqual(2)
        console.log(TAG + "testHaving008 having success");
        resultSet.close();
        done();
      } catch (e) {
        console.error(TAG + "testHaving008 having failed" + e);
        expect(true).assertFail();
      }
      console.log(TAG + "************* testHaving008 end   *************");
    })
    /**
     * @tc.name testHaving009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_havinsJsAPITest_0900
     * @tc.desc having errcode is 14800001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHaving009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testHaving009 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.groupBy(["age"]);
        predicates.having(undefined);
        console.log(TAG + "testHaving009 having success");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "testHaving009 having failed" + err.code + err.message);
        expect(err.code == 14800001).assertTrue();
        done();
      }
      console.log(TAG + "************* testHaving009 end   *************");
    })
    /**
     * @tc.name testHaving010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_havinsJsAPITest_1000
     * @tc.desc having errcode is 14800021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testHaving010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testHaving010 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.groupBy(["age"]);
        predicates.having("if == 9000");
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
        resultSet.goToFirstRow()
        resultSet.getRow();
        console.log(TAG + "testHaving010 having success");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "testHaving010 having failed" + err.code + err.message);
        expect(err.code == 14800021).assertTrue();
        done();
      }
      console.log(TAG + "************* testHaving010 end   *************");
    })
  })
}