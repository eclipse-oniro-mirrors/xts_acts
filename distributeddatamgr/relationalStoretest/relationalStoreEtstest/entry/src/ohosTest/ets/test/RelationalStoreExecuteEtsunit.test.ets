/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import common from "@ohos.app.ability.common";

const TAG = "[RELATIONAL_STORE_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, age INTEGER, salary REAL, blobType BLOB)";
const CREATE_TABLE_TEST2 = "CREATE TABLE IF NOT EXISTS test2 (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, age INTEGER, salary REAL, blobType BLOB)";
const TEST_TABLE_IS_EXIST = "SELECT COUNT(*) FROM sqlite_master WHERE type='table' AND name='test2'";

const STORE_CONFIG = {
  name: "executeTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let rdbStore = undefined;
let context: common.UIAbilityContext;

export default function rdbStoreExcuteTest(){
  describe('rdbStoreExcuteTest', function () {
    beforeAll(async function (done) {
      console.info(TAG + 'beforeAll')
	  context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      done();
    })

    beforeEach(async function (done) {
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      console.info(TAG + 'beforeEach')
      done();
    })

    afterEach(async function (done) {
      console.info(TAG + 'afterEach')
      await rdbStore.executeSql("DROP TABLE IF EXISTS test")
      done();
    })

    afterAll(async function (done) {
      console.info(TAG + 'afterAll')
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      rdbStore = null
      done();
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_1000
     * @tc.name testExecute0001
     * @tc.desc 1. Execute sql: PRAGMA integrity_check
     *          2. Check returned value
     */
    it('testExecute0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0001 start *************");
      try {
        let ret = await rdbStore.execute("PRAGMA integrity_check");
        expect("ok").assertEqual(ret);
      } catch (err) {
        expect(null).assertFail();
        console.error(`integrity_check failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0001 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_1100
     * @tc.name testExecute0002
     * @tc.desc 1. Execute sql: PRAGMA quick_check
     *          2. Check returned value
     */
    it('testExecute0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0002 start *************");
      try {
        let ret = await rdbStore.execute("PRAGMA quick_check");
        expect("ok").assertEqual(ret);
      } catch (err) {
        expect(null).assertFail();
        console.error(`integrity_check failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0002 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_1200
     * @tc.name testExecute0003
     * @tc.desc 1. Execute sql: PRAGMA user_version
     *          2. Check returned value
     */
    it('testExecute0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0003 start *************");
      try {
        rdbStore.version = 5;
        let ret = await rdbStore.execute("PRAGMA user_version");
        expect(5).assertEqual(ret);
      } catch (err) {
        expect(null).assertFail();
        console.error(`get user_version failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0003 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_1300
     * @tc.name testExecute0004
     * @tc.desc 1. Execute select sql
     *          2. Check returned value
     */
    it('testExecute0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0004 start *************");
      try {
        await rdbStore.execute("SELECT * FROM test");
        expect(null).assertFail();
      } catch (err) {
        expect(14800021).assertEqual(err.code);
        console.error(`execute select sql failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0004 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_1400
     * @tc.name testExecute0005
     * @tc.desc 1. Execute insert sql
     *          2. Check returned value
     */
    it('testExecute0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0005 start *************");
      try {
        let ret = await rdbStore.execute("INSERT INTO test(name, age, salary) VALUES ('tt', 28, 50000)");
        expect(1).assertEqual(ret);
      } catch (err) {
        expect(null).assertFail();
        console.error(`execute select sql failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0005 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_1500
     * @tc.name testExecute0006
     * @tc.desc 1. Execute insert sql
     *          2. Check returned value
     */
    it('testExecute0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0006 start *************");
      try {
        let ret = await rdbStore.execute("INSERT INTO test(name, age, salary) VALUES (?, ?, ?)", ['tt', 28, 50000]);
        expect(1).assertEqual(ret);
      } catch (err) {
        expect(null).assertFail();
        console.error(`execute insert sql failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0006 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_1600
     * @tc.name testExecute0007
     * @tc.desc 1. Execute batch insert sql
     *          2. Check returned value
     */
    it('testExecute0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0007 start *************");
      try {
        let ret = await rdbStore.execute("INSERT INTO test(name, age, salary) VALUES (?, ?, ?), (?, ? ,?)",
          ['tt', 28, 50000, 'ttt', 278, 500800]);
        expect(2).assertEqual(ret);
      } catch (err) {
        expect(null).assertFail();
        console.error(`execute insert sql failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0007 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_1700
     * @tc.name testExecute0008
     * @tc.desc 1. Execute update sql
     *          2. Check returned value
     */
    it('testExecute0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0008 start *************");
      try {
        let ret = await rdbStore.execute("INSERT INTO test(name, age, salary) VALUES (?, ?, ?), (?, ? ,?)",
          ['tt', 28, 50000, 'ttt', 278, 500800]);
        expect(2).assertEqual(ret);

        ret = await rdbStore.execute("UPDATE test SET name='dd' WHERE id = 1");
        expect(1).assertEqual(ret);
      } catch (err) {
        expect(null).assertFail();
        console.error(`execute update sql failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0008 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_1800
     * @tc.name testExecute0009
     * @tc.desc 1. Execute delete sql
     *          2. Check returned value
     */
    it('testExecute0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0009 start *************");
      try {
        let ret = await rdbStore.execute("INSERT INTO test(name, age, salary) VALUES (?, ?, ?), (?, ? ,?)",
          ['tt', 28, 50000, 'ttt', 278, 500800]);
        expect(2).assertEqual(ret);
        ret = await rdbStore.execute("DELETE FROM test");
        expect(2).assertEqual(ret);
      } catch (err) {
        expect(null).assertFail();
        console.error(`execute delete sql failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0009 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_1900
     * @tc.name testExecute0010
     * @tc.desc 1. Execute attach sql
     *          2. Execute detach sql
     *          3. Execute transaction sql
     *          4. Check returned value
     */
    it('testExecute0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0010 start *************");
      try {
        await rdbStore.execute("ATTACH DATABASE 'execute_attach_test.db' AS 'attach.db'");
        expect(null).assertFail();
      } catch (err) {

        expect(14800021).assertEqual(err.code);
        console.error(`execute attach sql failed, code:${err.code}, message: ${err.message}`);
      }

      try {
        await rdbStore.execute("DETACH DATABASE 'attach.db'");
        expect(null).assertFail();
      } catch (err) {

        expect(14800021).assertEqual(err.code);
        console.error(`execute detach sql failed, code:${err.code}, message: ${err.message}`);
      }

      try {
        await rdbStore.execute("BEGIN TRANSACTION");
        expect(null).assertFail();
      } catch (err) {

        expect(14800021).assertEqual(err.code);
        console.error(`execute begin transaction sql failed, code:${err.code}, message: ${err.message}`);
      }

      try {
        await rdbStore.execute("COMMIT");
        expect(null).assertFail();
      } catch (err) {

        expect(14800021).assertEqual(err.code);
        console.error(`execute commit sql failed, code:${err.code}, message: ${err.message}`);
      }

      try {
        await rdbStore.execute("ROLLBACK");
        expect(null).assertFail();
      } catch (err) {
        expect(14800021).assertEqual(err.code);
        console.error(`execute rollback sql failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0010 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_2000
     * @tc.name testExecute0011
     * @tc.desc 1. Create table
     *          2. Drop table
     */
    it('testExecute0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0011 start *************");
      try {
        let ret = await rdbStore.execute(CREATE_TABLE_TEST2);
        expect(null).assertEqual(ret);
        let resultSet = await rdbStore.querySql(TEST_TABLE_IS_EXIST);
        resultSet.goToFirstRow();

        expect(1).assertEqual(resultSet.getLong(0))
        resultSet.close();

        await rdbStore.execute("DROP TABLE test2");
        resultSet = await rdbStore.querySql(TEST_TABLE_IS_EXIST);
        resultSet.goToFirstRow();

        expect(0).assertEqual(resultSet.getLong(0))
        resultSet.close();
      } catch (err) {
        expect(null).assertFail();
        console.error(`execute ddl sql failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0011 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_2100
     * @tc.name testExecute0012
     * @tc.desc 1. Create table
     *          2. Insert data
     *          3. Query data
     *          4. Drop table
     */
    it('testExecute0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0012 start *************");
      try {
        await rdbStore.execute(CREATE_TABLE_TEST2);

        let ret = await rdbStore.execute(
          "INSERT INTO test2(name, age, salary) VALUES (?, ?, ?)", ['tt', 28, 50000]);

        expect(1).assertEqual(ret);

        let resultSet = await rdbStore.querySql("SELECT * FROM test2");

        expect(1).assertEqual(resultSet.rowCount)
        resultSet.close();
      } catch (err) {
        expect(null).assertFail();
        console.error(`execute sql failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0012 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_2200
     * @tc.name testExecute0013
     * @tc.desc 1. Execute sql: ""
     *          2. Check returned value
     */
    it('testExecute0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0013 start *************");
      try {
        await rdbStore.execute("");
        expect(null).assertFail();
      } catch (err) {
        expect("401").assertEqual(err.code);
        console.error(`execute attach sql failed, code:${err.code}, message: ${err.message}`);
      }

      done();
      console.info(TAG + "************* testExecute0013 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_2300
     * @tc.name testExecute0014
     * @tc.desc 1. Insert data
     *          2. Check returned value
     */
    it('testExecute0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0014 start *************");
      try {
        await rdbStore.execute("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)");
        expect(null).assertFail();
      } catch (err) {
        expect(14800000).assertEqual(err.code);
        console.error(`insert data failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0014 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_2400
     * @tc.name testExecute0015
     * @tc.desc 1. Insert data and set sql as null or undefined
     *          2. Check returned value
     */
    it('testExecute0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0015 start *************");
      try {
        await rdbStore.execute(null);
        expect(null).assertFail();
      } catch (err) {
        expect('401').assertEqual(err.code);
        console.error(`insert data failed, code:${err.code}, message: ${err.message}`);
      }

      try {
        await rdbStore.execute(undefined);
        expect(null).assertFail();
      } catch (err) {
        expect('401').assertEqual(err.code);
        console.error(`insert data failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0015 end   *************");
    })

    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_2500
     * @tc.name testExecute0016
     * @tc.desc 1. Insert data and set args as null or undefined
     *          2. Check returned value
     */
    it('testExecute0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* testExecute0016 start *************");
      try {
        await rdbStore.execute("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)", null);
        expect(null).assertFail();
      } catch (err) {
        expect(14800000).assertEqual(err.code);
        console.error(`insert data failed, code:${err.code}, message: ${err.message}`);
      }

      try {
        await rdbStore.execute("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)", undefined);
        expect(null).assertFail();
      } catch (err) {
        expect(14800000).assertEqual(err.code);
        console.error(`insert data failed, code:${err.code}, message: ${err.message}`);
      }
      done();
      console.info(TAG + "************* testExecute0016 end   *************");
    })


          /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_2600
     * @tc.name testExecute0017
     * @tc.desc 1. Insert data and set args as null or undefined
     *          2. Check returned value
     */

    it('testExecute0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testExecute0017 start *************");
        try {
            let ret = await rdbStore.execute("PRAGMA user_version=5");
            expect(null).assertEqual(ret);
        } catch (err) {
            expect(null).assertFail();
            console.error(`set user version failed, code:${err.code}, message: ${err.message}`);
        }
        done();
        console.info(TAG + "************* testExecute0017 end   *************");
    })



    /**
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteJsAPITest_2700
     * @tc.name testExecute0018
     * @tc.desc 1. Insert data and set args as null or undefined
     *          2. Check returned value
     */

    it('testExecute0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testExecute0018 start *************");
        try {
            await rdbStore.execute("PRAGMA table_info(test)");
            expect(null).assertFail();
        } catch (err) {
            expect(14800021).assertEqual(err.code);
            console.error(`get table info failed, code:${err.code}, message: ${err.message}`);
        }
        done();
        console.info(TAG + "************* testExecute0018 end   *************");
    })

    console.info(TAG + "*************Unit Test End*************");
  })
  
  
}
