/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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
import relationalStore from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common';

let context: common.UIAbilityContext;
const TAG = "[VALUE_TYPE_TEST]"

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS bigint_table(id INTEGER PRIMARY KEY AUTOINCREMENT, value1 UNLIMITED INT NOT NULL, value2 UNLIMITED INT, name TEXT)";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS bigint_table";

const STORE_CONFIG = {
  name: 'value_type.db',
  securityLevel: relationalStore.SecurityLevel.S1,
}
var store = undefined;
export default function RdbStoreValueTypeTest() {
  describe('RdbStoreValueTypeTest', function () {
    beforeAll(async function () {
      console.info(TAG + 'beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
      store = await relationalStore.getRdbStore(context, STORE_CONFIG);
    })

    beforeEach(async function () {
      console.info(TAG + 'beforeEach');
      await store.execute(CREATE_TABLE_TEST);
    })

    afterEach(async function () {
      console.info(TAG + 'afterEach')
      await store.execute(DROP_TABLE_TEST);
    })

    afterAll(async function () {
      console.info(TAG + 'afterAll');
      store = null;
      await relationalStore.deleteRdbStore(context, "value_type.db");
    })

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   testValueType0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BigIntAPITest_0100
     * @tc.desc   the value type BigInt(45)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testValueType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.log(TAG + "************* testValueType0001 start *************");
      let bucket = {
        "value1":BigInt(45),
        "value2":BigInt(-45),
        "name":"zhangsan",
      };
      try {
        console.log(TAG + "insert(bigint_table," + bucket + ")");
        let rowid = await store.insert("bigint_table", bucket);
        console.log(TAG + "insert():=>" + rowid);
        let resultSet = await store.querySql("select value1, value2 from bigint_table");
        console.log(TAG + "query" + resultSet);
        let status = resultSet.goToNextRow();
        expect(status).assertTrue();
        console.log(TAG + "goToNextRow():=>" + status);
        let value1 = resultSet.getValue(0);
        let type = typeof value1;
        console.log(TAG + "getValue(0):=>" + value1 + " type:" + type);
        expect(type).assertEqual("bigint");
        expect(value1).assertEqual(bucket["value1"]);
        let value2 = resultSet.getValue(1);
        type = typeof value2;
        console.log(TAG + "getValue(1):=>" + value2 + " type:" + type);
        expect(type).assertEqual("bigint");
        expect(value2).assertEqual(bucket["value2"]);
        done()
      } catch (err) {
        expect(false).assertFail();
        console.error(TAG + `failed, code:${err.code}, message: ${err.message}`);
        done()
      }
      console.log(TAG + "************* testValueType0001 end *************");
    })

    /**
     * @tc.name   testValueType0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BigIntAPITest_0200
     * @tc.desc   the value BigInt "15822401018187971961171"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testValueType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.log(TAG + "************* testValueType0002 start *************");
      let bucket = {
        "value1":BigInt("15822401018187971961171"),
        "value2":BigInt("-15822401018187971961171"),
        "name":"zhangsan",
      };
      try {
        console.log(TAG + "insert(bigint_table," + bucket + ")");
        let rowid = await store.insert("bigint_table", bucket);
        console.log(TAG + "insert():=>" + rowid);
        let resultSet = await store.querySql("select value1, value2 from bigint_table");
        console.log(TAG + "query" + resultSet);
        let status = resultSet.goToNextRow();
        expect(status).assertTrue();
        console.log(TAG + "goToNextRow():=>" + status);
        let value1 = resultSet.getValue(0);
        let type = typeof value1;
        console.log(TAG + "getValue(0):=>" + value1 + " type:" + type);
        expect(type).assertEqual("bigint");
        expect(value1).assertEqual(bucket["value1"]);
        let value2 = resultSet.getValue(1);
        type = typeof value2;
        console.log(TAG + "getValue(1):=>" + value2 + " type:" + type);
        expect(type).assertEqual("bigint");
        expect(value2).assertEqual(bucket["value2"]);
        done()
      } catch (err) {
        expect(false).assertFail();
        console.error(TAG + `failed, code:${err.code}, message: ${err.message}`);
        done()
      }
      console.log(TAG + "************* testValueType0002 end *************");
    })
    /**
     * @tc.name   testValueType0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BigIntAPITest_0300
     * @tc.desc   the value update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testValueType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.log(TAG + "************* testValueType0003 start *************");
      let bucket = {
        "value1":BigInt("15822401018187971961171"),
        "value2":BigInt("-15822401018187971961171"),
        "name":"zhangsan",
      };
      let bucket1 = {
        "value1":BigInt("15322401018187971961171"),
        "value2":BigInt("-15822401018187971961171"),
        "name":"lisi",
      };

      try {
        console.log(TAG + "insert (bigint_table," + bucket + ")");
        let rowid = await store.insert("bigint_table", bucket);
        console.log(TAG + "insert success,rowid is:" + rowid);
        let predicates = new relationalStore.RdbPredicates("bigint_table");
        predicates.equalTo("value1", bucket["value1"]);
        await store.update(bucket1, predicates).then(async (rows) => {
          console.info(TAG + "update start");
          console.info(TAG + "Updated row count:" + rows);
          expect(1).assertEqual(rows);
          console.info(TAG + "update end");
        }).catch((err) => {
          console.info("update error " + err);
          expect(null).assertFail();
        })
        let resultSet = await store.querySql("select value1, value2 from bigint_table");
        console.log(TAG + "query" + resultSet);
        let status = resultSet.goToNextRow();
        expect(status).assertTrue();
        console.log(TAG + "goToNextRow():=>" + status);
        let value1 = resultSet.getValue(0);
        let type = typeof value1;
        console.log(TAG + "getValue(0):=>" + value1 + " type:" + type);
        expect(type).assertEqual("bigint");
        expect(value1).assertEqual(bucket1["value1"]);
        let value2 = resultSet.getValue(1);
        type = typeof value2;
        console.log(TAG + "getValue(1):=>" + value2 + " type:" + type);
        expect(type).assertEqual("bigint");
        expect(value2).assertEqual(bucket1["value2"]);
        done()
      } catch (err) {
        expect(false).assertFail();
        console.error(TAG + `failed, code:${err.code}, message: ${err.message}`);
        done()
      }
      console.log(TAG + "************* testValueType0003 end *************");
    })
    /**
     * @tc.name   testValueType0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BigIntAPITest_0400
     * @tc.desc   the value delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testValueType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.log(TAG + "************* testValueType0004 start *************");
      let bucket = {
        "value1":BigInt("15822401018187971961171"),
        "value2":BigInt("-15822401018187971961171"),
        "name":"zhangsan",
      };
      let bucket1 = {
        "value1":BigInt("15322401018187971961171"),
        "value2":BigInt("-15322401018187971961171"),
        "name":"lisi",
      };

      try {
        console.log(TAG + "insert (bigint_table," + bucket + ")");
        await store.insert("bigint_table", bucket);
        await store.insert("bigint_table", bucket1);
        let predicates = new relationalStore.RdbPredicates("bigint_table");
        predicates.equalTo("value1", bucket["value1"]);
        await store.query(predicates).then(async (resultSet) => {
          console.log(TAG + "query start")
          console.log(TAG+"query result:"+resultSet.rowCount);
          expect(1).assertEqual(resultSet.rowCount);
          resultSet.close();
          resultSet = null;
        }).catch((err) => {
          console.log("query error " + err);
          expect(null).assertFail();
        })
        await store.delete(predicates).then(async (rows) => {
          console.log(TAG + "delete start")
          console.log(TAG + "delete done:"+rows);
          expect(1).assertEqual(rows);
        }).catch((err) => {
          console.info("delete error " + err)
          expect(null).assertFail();
        })
        await store.query(predicates).then(async (resultSet) => {
          console.log(TAG + "query start")
          console.log(TAG+"query result:"+resultSet.rowCount);
          expect(0).assertEqual(resultSet.rowCount);
          resultSet.close();
          resultSet = null;
        }).catch((err) => {
          console.log("query error " + err);
          expect(null).assertFail();
        })
        done()
      } catch (err) {
        expect(false).assertFail();
        console.log(TAG + `failed, code:${err.code}, message: ${err.message}`);
        done()
      }
      console.log(TAG + "************* testValueType0004 end *************");
    })
    /**
     * @tc.name   testValueType0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BigIntAPITest_0500
     * @tc.desc   close database open database query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testValueType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.log(TAG + "************* testValueType0005 start *************");
      let bucket = {
        "value1":BigInt(40),
        "value2":BigInt(-40),
        "name":"zhangsan",
      };
      try {
        await store.insert("bigint_table", bucket);
        store = null;
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let resultSet = await store.querySql("select value1, value2 from bigint_table");
        console.log(TAG + "query" + resultSet);
        let status = resultSet.goToNextRow();
        expect(status).assertTrue();
        console.log(TAG + "goToNextRow():=>" + status);
        let value1 = resultSet.getValue(0);
        let type = typeof value1;
        console.log(TAG + "getValue(0):=>" + value1 + " type:" + type);
        expect(type).assertEqual("bigint");
        expect(value1).assertEqual(bucket["value1"]);
        let value2 = resultSet.getValue(1);
        type = typeof value2;
        console.log(TAG + "getValue(1):=>" + value2 + " type:" + type);
        expect(type).assertEqual("bigint");
        expect(value2).assertEqual(bucket["value2"]);
        done()
      } catch (err) {
        expect(false).assertFail();
        console.error(TAG + `failed, code:${err.code}, message: ${err.message}`);
        done()
      }
      console.log(TAG + "************* testValueType0005 end *************");
    })
    /**
     * @tc.name   testValueType0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BigIntAPITest_0600
     * @tc.desc   executesql update delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testValueType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.log(TAG + "************* testValueType0006 start *************");
      let bucket = {
        "value1":BigInt("15822401018187971961171"),
        "value2":BigInt("-15822401018187971961171"),
        "name":"zhangsan",
      };
      try {
        console.log(TAG + "insert (bigint_table," + bucket + ")");
        await store.insert("bigint_table", bucket);
        let bucket1 = {
          "value1":BigInt("15322401018187971961171"),
          "value2":BigInt("-15322401018187971961171"),
          "name":"zhangsan",
        };
        await store.executeSql("update bigint_table set value1=? where name=?",[bucket1['value1'],'zhangsan']).then(() => {
          console.info(TAG+'update table done.');
        }).catch((err) => {
          console.log(TAG+`ExecuteSql failed, code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
        })
        let resultSet1 = await store.querySql("select value1 from bigint_table");
        console.log(TAG + "query" + resultSet1);
        let status1 = resultSet1.goToNextRow();
        expect(status1).assertTrue();
        console.log(TAG + "goToNextRow():=>" + status1);
        let value1 = resultSet1.getValue(0);
        let type1 = typeof value1;
        console.log(TAG + "getValue(0):=>" + value1 + " type:" + type1);
        expect(type1).assertEqual("bigint");
        expect(value1).assertEqual(bucket1["value1"]);

        await store.executeSql("delete from bigint_table where value1=?",[bucket1['value1']]).then(() => {
          console.info(TAG+'Delete table done.');
        }).catch((err) => {
          console.log(TAG+`ExecuteSql failed, code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
        })

        let resultSet2 = await store.querySql("select value1 from bigint_table");
        console.log(TAG + "query" + resultSet2 + "resultSet2.rowCount"+ resultSet2.rowCount);
        expect(resultSet2.rowCount==0).assertTrue()
        done()
      } catch (err) {
        expect(false).assertFail();
        console.log(TAG + `failed, code:${err.code}, message: ${err.message}`);
        done()
      }
      console.log(TAG + "************* testValueType0006 end *************");
    })
    console.log(TAG + "*************Unit Test End*************");
  })

}