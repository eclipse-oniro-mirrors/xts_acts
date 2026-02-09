/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../hypium";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

import deviceInfo from '@ohos.deviceInfo';

let context: common.UIAbilityContext | undefined;
let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let domain: int = 0x0000;
let tag: string = "[relationalStoreTest]";
const dbName = "rdbStoreTest.db";
const CREATE_TABLE_EMPLOYEE =
  "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " +
    "age INTEGER," + "salary  REAL," + "data BLOB)";
const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " +
    "age INTEGER, " + "salary REAL)";
let num = 'a'.repeat(1024 * 1024 * 2);
const valueBucket2m: relationalStore.ValuesBucket = {
  'name': num,
  'age': 122341465656 as long,
};
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
}
let rdbStore: relationalStore.RdbStore | undefined;

export default function relationalStoreTest() {
  describe('relationalStoreTest', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, "*************Unit Test Begin*************");
      delegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
      hilog.info(domain, tag, 'beforeAll');
    });

    beforeEach(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      hilog.info(domain, tag, "create rdb store success")
      await rdbStore!.executeSql(CREATE_TABLE_EMPLOYEE);
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
      hilog.info(domain, tag, 'beforeEach success');
    });

    afterEach(async (): Promise<void> => {
      hilog.info(domain, tag, 'afterEach');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG)
      hilog.info(domain, tag, 'afterEach success');
    });

    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'afterAll');

      hilog.info(domain, tag, "*************Unit Test end*************");
    });

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RDBFGAPIquerySqlSyncTest_0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPIquerySqlSyncTest_0500
     * @tc.desc   querySqlSync success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDBFGAPIquerySqlSyncTest_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "************* SUB_DistributedData_RelationalStore_SDK_RDBFGAPIquerySqlSyncTest_0500 start *************");
        const record: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": 30 as long,
        }
        try {
          await (rdbStore as relationalStore.RdbStore).insert("employee", record)
          let resultSet =
            (rdbStore as relationalStore.RdbStore).querySqlSync("SELECT * FROM EMPLOYEE  WHERE name = ?", ["Jim"])
          console.info(tag + "querysql success,resultSet.rowCount is " + resultSet.rowCount)
          expect(1).assertEqual(resultSet.rowCount)
          resultSet?.close();
          done()
        } catch (err) {
          console.log(tag + "querysql failed ")
          expect(null).assertFail();
          done()
        }
        hilog.info(domain, tag,
          "************* SUB_DistributedData_RelationalStore_SDK_RDBFGAPIquerySqlSyncTest_0500 end *************");
      })

    /**
     * @tc.name   relationalStoreTest007
     * @tc.number relationalStoreTest007
     * @tc.desc   relationalStoreTest007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(tag + "************* relationalStoreTest007 start *************");
        const valueBucket1: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 30 as long,
        }
        const valueBucket2: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 30 as long,
        }
        const valueBucket3: relationalStore.ValuesBucket = {
          "name": "zhoubiao",
          "age": 30 as long,
        }
        let valueBuckets: Array<relationalStore.ValuesBucket> =
          new Array<relationalStore.ValuesBucket>(valueBucket1, valueBucket2, valueBucket3);
        (rdbStore as relationalStore.RdbStore).batchInsertSync("employee", valueBuckets)
        console.info(tag + 'batchInsertSync successfully.');
        let predicates = new relationalStore.RdbPredicates('employee');
        predicates.equalTo("age", 30 as long);
        let resultSet = (rdbStore as relationalStore.RdbStore).querySync(predicates);
        console.info(tag + 'querySync successfully.');
        try {
          let rows: Array<relationalStore.ValuesBucket>
          let maxCount: int = 2
          let position: int = 0
          console.log(tag + "111111")
          rows = await (resultSet as relationalStore.ResultSet).getRows(maxCount, position)
          console.log(tag + "rows" + rows.length + JSON.stringify(rows[0]))
          resultSet?.close();
          expect(rows.length).assertEqual(2)
          done()
        } catch (err) {
          console.log(tag + err + "relationalStoreTest007 failed" + err.code);
          expect().assertFail()
          done();
        }
        done();
        console.log(tag + "************* relationalStoreTest007 end *************");
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RDBFGAPIquerySyncTest_0800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPIquerySyncTest_0800
     * @tc.desc   querySync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDBFGAPIquerySyncTest_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info(tag +
          "************* SUB_DistributedData_RelationalStore_SDK_RDBFGAPIquerySyncTest_0800 start *************");
        const record: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": 30 as long,
        };
        try {
          (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
          let predicates = new relationalStore.RdbPredicates("employee");
          predicates.equalTo("age", 30 as long);
          let resultSet: relationalStore.ResultSet =
            (rdbStore as relationalStore.RdbStore).querySync(predicates, ["ID", "NAME", "AGE"]);
          console.log(tag + "resultSet.rowCount" + resultSet.rowCount);
          expect(resultSet.rowCount).assertEqual(1)
          resultSet.close();
          done()
        } catch (err) {
          console.log(tag + "Query failed," + err.code + err.message)
          expect().assertFail()
          done()
        }
        done()
        console.info(tag +
          "************* SUB_DistributedData_RelationalStore_SDK_RDBFGAPIquerySyncTest_0800 end *************");
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RDBFGAPIexecuteSyncTest_0900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPIexecuteSyncTest_0900
     * @tc.desc   executesql success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDBFGAPIexecuteSyncTest_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info(tag +
          "************* SUB_DistributedData_RelationalStore_SDK_RDBFGAPIexecuteSyncTest_0900 start *************");
        const record: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": 30 as long,
        };
        try {
          (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
          let data = (rdbStore as relationalStore.RdbStore).executeSync("DELETE FROM EMPLOYEE WHERE name = ?", ["Jim"]);
          console.log(tag + "query success" + data);
          expect(data).assertEqual(1)
          done()
        } catch (err) {
          console.log(tag + "query failed" + err.code + err.message);
          expect().assertFail()
          done()
        }
        done();
        console.info(tag +
          "************* SUB_DistributedData_RelationalStore_SDK_RDBFGAPIexecuteSyncTest_0900 end *************");
      })

    /**
     * @tc.name   relationalStoreTest010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1000
     * @tc.desc   querySync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest010 start *************");
        const record: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": 30 as long,
        };
        try {
          (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
          let predicates = new relationalStore.RdbPredicates("employee where age = 30");
          let resultSet = (rdbStore as relationalStore.RdbStore).querySync(predicates);
          console.log(tag + "resultSet.rowCount" + resultSet.rowCount)
          expect(resultSet.rowCount).assertEqual(1)
          done()
        } catch (err) {
          console.log(tag + "query failed" + err.code + err.message);
          expect().assertFail()
          done()
        }
        console.info(tag + "************* relationalStoreTest010 end *************");
      })
    /**
     * @tc.name   relationalStoreTest011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1100
     * @tc.desc   query success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest011 start *************");
        const record: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": 30 as long,
        };
        try {
          (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
          let predicates = new relationalStore.RdbPredicates("employee where age = 30");
          let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
          console.log(tag + "resultSet.rowCount" + resultSet.rowCount)
          expect(resultSet.rowCount).assertEqual(1)
          done()
        } catch (err) {
          console.log(tag + "query failed" + err.code + err.message);
          expect().assertFail()
          done()
        }
        console.info(tag + "************* relationalStoreTest011 end *************");
      })
    /**
     * @tc.name   relationalStoreTest012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2300
     * @tc.desc   Number.MIN_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest012 start *************");
        let valueNum = Number.MIN_SAFE_INTEGER;
        const record: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": valueNum,
        };
        try {
          await (rdbStore as relationalStore.RdbStore).insert("employee", record);
          let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
          console.log(tag + "resultSet.rowCount" + resultSet.rowCount)
          expect(true).assertEqual(resultSet.goToFirstRow());
          let res = await resultSet.getColumnType("age") // Error: 14800000
          console.log(tag + "res:" + res + typeof (res))
          expect(res).assertEqual(relationalStore.ColumnType.INTEGER);
          let str = resultSet.getString(resultSet.getColumnIndex("age"))
          expect(String(valueNum)).assertEqual(str);
          console.log(tag + "str:" + str);
          done()
        } catch (err) {
          console.log(tag + "query failed" + err.code + err.message);
          expect().assertFail()
          done()
        }
        console.info(tag + "************* relationalStoreTest012 end *************");
      })
    /**
     * @tc.name   relationalStoreTest013
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2400
     * @tc.desc   Number.MIN_SAFE_INTEGER*10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest013 start *************");
        let valueNum = Number.MIN_SAFE_INTEGER * 10;
        const record: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": valueNum,
        };
        try {
          await (rdbStore as relationalStore.RdbStore).insert("employee", record);
          let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
          console.log(tag + "resultSet.rowCount" + resultSet.rowCount)
          expect(true).assertEqual(resultSet.goToFirstRow());
          let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
          console.log(tag + "res:" + res + typeof (res))
          expect(res).assertEqual(relationalStore.ColumnType.INTEGER);
          let str = resultSet.getString(resultSet.getColumnIndex("age"))
          console.log(tag + "str:" + str);
          console.log(tag + "valueNum:" + valueNum);
          expect(valueNum < Number.MIN_SAFE_INTEGER).assertTrue()
          done()
        } catch (err) {
          console.log(tag + "query failed" + err.code + err.message);
          expect().assertFail()
          done()
        }
        console.info(tag + "************* relationalStoreTest013 end *************");
      })
    /**
     * @tc.name   relationalStoreTest014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2500
     * @tc.desc   Number.MAX_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest014 start *************");
        let valueNum = Number.MAX_SAFE_INTEGER;
        const record: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": valueNum,
        };
        try {
          await (rdbStore as relationalStore.RdbStore).insert("employee", record);
          let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
          console.log(tag + "resultSet.rowCount" + resultSet.rowCount)
          expect(true).assertEqual(resultSet.goToFirstRow());
          let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
          console.log(tag + "res:" + res + typeof (res))
          expect(res).assertEqual(relationalStore.ColumnType.INTEGER);
          let str = resultSet.getString(resultSet.getColumnIndex("age"))
          expect(String(valueNum)).assertEqual(str);
          console.log(tag + "str:" + str);
          done()
        } catch (err) {
          console.log(tag + "query failed" + err.code + err.message);
          expect().assertFail()
          done()
        }
        console.info(tag + "************* relationalStoreTest014 end *************");
      })
    /**
     * @tc.name   relationalStoreTest015
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2600
     * @tc.desc   Number.MAX_SAFE_INTEGER*10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest015 start *************");
        let valueNum = Number.MAX_SAFE_INTEGER * 10;
        const record: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": valueNum,
        };
        try {
          await (rdbStore as relationalStore.RdbStore).insert("employee", record);
          let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
          console.log(tag + "resultSet.rowCount" + resultSet.rowCount)
          expect(true).assertEqual(resultSet.goToFirstRow());
          let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
          console.log(tag + "res:" + res + typeof (res))
          let str = resultSet.getString(resultSet.getColumnIndex("age"))
          console.log(tag + "str:" + str);
          console.log(tag + "valueNum:" + valueNum);
          expect(valueNum > Number.MIN_SAFE_INTEGER).assertTrue()
          done()
        } catch (err) {
          console.log(tag + "query failed" + err.code + err.message);
          expect().assertFail()
          done()
        }
        console.info(tag + "************* relationalStoreTest015 end *************");
      })
    /**
     * @tc.name   relationalStoreTest016
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2700
     * @tc.desc   getColumnType test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest016 start *************");
        let valueNum = -500 as long;
        const record: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": valueNum,
        };
        try {
          await (rdbStore as relationalStore.RdbStore).insert("employee", record);
          let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
          console.log(tag + "resultSet.rowCount" + resultSet.rowCount)
          expect(true).assertEqual(resultSet.goToFirstRow());
          let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
          console.log(tag + "res:" + res + typeof (res))
          expect(res).assertEqual(relationalStore.ColumnType.INTEGER);
          let str = resultSet.getLong(resultSet.getColumnIndex("age"))
          expect(valueNum).assertEqual(str);
          console.log(tag + "str:" + str);
          done()
        } catch (err) {
          console.log(tag + "query failed" + err.code + err.message);
          expect().assertFail()
          done()
        }
        console.info(tag + "************* relationalStoreTest016 end *************");
      })
    /**
     * @tc.name   relationalStoreTest017
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2800
     * @tc.desc   getColumnType test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest017 start *************");
        let valueNum = 500 as long;
        const record: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": valueNum,
        };
        try {
          await (rdbStore as relationalStore.RdbStore).insert("employee", record);
          let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
          console.log(tag + "resultSet.rowCount" + resultSet.rowCount)
          expect(true).assertEqual(resultSet.goToFirstRow());
          let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
          console.log(tag + "res:" + res + typeof (res))
          expect(res).assertEqual(relationalStore.ColumnType.INTEGER);
          let str = resultSet.getLong(resultSet.getColumnIndex("age"))
          expect(valueNum).assertEqual(str);
          console.log(tag + "str:" + str);
          done()
        } catch (err) {
          console.log(tag + "query failed" + err.code + err.message);
          expect().assertFail()
          done()
        }
        console.info(tag + "************* relationalStoreTest017 end *************");
      })

    /**
     * @tc.name   relationalStoreTest027
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1200
     * @tc.desc   insert para greater than 2MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest027 start *************");
        rdbStore!.insert("employee", valueBucket2m);
        let predicates = new relationalStore.RdbPredicates("employee")
        let resultSet: relationalStore.ResultSet = await rdbStore!.query(predicates);
        resultSet.goToFirstRow();
        try {
          const name = resultSet.getString(resultSet.getColumnIndex("name") as int)
          console.log(tag + "name:" + name);
          expect(null).assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.log(tag + "err" + err.code + err.message);
          expect(err.code == 14800012).assertTrue();
          done();
        }
        console.info(tag + "************* relationalStoreTest027 end *************");
      })

    /**
     * @tc.name   relationalStoreTest028
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1300
     * @tc.desc   insert para greater than 2MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest028 start *************");
        rdbStore!.insert("employee", valueBucket2m, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        let predicates = new relationalStore.RdbPredicates("employee")
        let resultSet: relationalStore.ResultSet = await rdbStore!.query(predicates);
        resultSet.goToFirstRow();
        try {
          const name = resultSet.getString(resultSet.getColumnIndex("name") as int)
          console.log(tag + "name:" + name);
          expect(null).assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.log(tag + "err" + err.code + err.message);
          expect(err.code == 14800012).assertTrue();
          done();
        }
        console.info(tag + "************* relationalStoreTest028 end *************");
      })

    /**
     * @tc.name   relationalStoreTest029
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1400
     * @tc.desc   insertSync para greater than 2MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest029 start *************");
        rdbStore!.insertSync("employee", valueBucket2m, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        let predicates = new relationalStore.RdbPredicates("employee")
        let resultSet: relationalStore.ResultSet = await rdbStore!.query(predicates);
        resultSet.goToFirstRow();
        try {
          const name = resultSet.getString(resultSet.getColumnIndex("name") as int)
          console.log(tag + "name:" + name);
          expect(null).assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.log(tag + "err" + err.code + err.message);
          expect(err.code == 14800012).assertTrue();
          done();
        }
        console.info(tag + "************* relationalStoreTest029 end *************");
      })

    /**
     * @tc.name   relationalStoreTest031
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1600
     * @tc.desc   insert para greater than 2MB queryLockedRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest031 start *************");
        rdbStore!.insert("employee", valueBucket2m);
        let predicates = new relationalStore.RdbPredicates("employee")
        let resultSet: relationalStore.ResultSet = await rdbStore!.queryLockedRow(predicates);
        resultSet.goToFirstRow();
        try {
          const name = resultSet.getString(resultSet.getColumnIndex("name") as int)
          console.log(tag + "name:" + name);
          expect(null).assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.log(tag + "err" + err.code + err.message);
          expect(err.code == 14800012).assertTrue();
          done();
        }
        console.info(tag + "************* relationalStoreTest031 end *************");
      })

    /**
     * @tc.name   testDataChange001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2100
     * @tc.desc   Register callback for dataChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDataChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(tag + "************* testDataChange001 start *************");
        let status1 = 0;
        let status2 = 0;
        let status3 = 0;
        let status4 = 0;
        let status5 = 0;
        let status6 = 0;
        let status7 = 0;
        let status8 = 0;
        let status9 = 0;
        let status10 = 0;
        let storeObserver1 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange storeObserver1 into");
          status1 = 1;
        };
        let storeObserver2 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange storeObserver2 into");
          status2 = 1;
        };
        let storeObserver3 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange storeObserver3 into");
          status3 = 1;
        };
        let storeObserver4 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange storeObserver4 into");
          status4 = 1;
        };
        let storeObserver5 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange storeObserver5 into");
          status5 = 1;
        };
        let storeObserver6 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange storeObserver6 into");
          status6 = 1;
        };
        let storeObserver7 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange storeObserver7 into");
          status7 = 1;
        };
        let storeObserver8 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange storeObserver8 into");
          status8 = 1;
        };
        let storeObserver9 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange storeObserver9 into");
          status9 = 1;
        };
        let storeObserver10 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange storeObserver10 into");
          status10 = 1;
        };
        let rdbStore2: relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(rdbStore2 != undefined).assertTrue();
        try {
          rdbStore?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver1);
          rdbStore?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver2);
          rdbStore?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver3);
          rdbStore?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver4);
          rdbStore?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver5);
          //
          rdbStore2?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver6);
          rdbStore2?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver7);
          rdbStore2?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver8);
          rdbStore2?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver9);
          rdbStore2?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver10);

          const valueBucket: relationalStore.ValuesBucket = {
            'name': 'zhangsan',
            'age': 18 as long,
            'salary': 25000 as long,
          };
          rdbStore?.insert("test", valueBucket);
          await Utils.msSleep(5000)
          expect(status1).assertEqual(1);
          expect(status2).assertEqual(1);
          expect(status3).assertEqual(1);
          expect(status4).assertEqual(1);
          expect(status5).assertEqual(1);
          expect(status6).assertEqual(1);
          expect(status7).assertEqual(1);
          expect(status8).assertEqual(1);
          expect(status9).assertEqual(1);
          expect(status10).assertEqual(1);
          rdbStore?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver1);
          rdbStore?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver2);
          rdbStore?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver3);
          rdbStore?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver4);
          rdbStore?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver5);
          rdbStore2?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver6);
          rdbStore2?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver7);
          rdbStore2?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver8);
          rdbStore2?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver9);
          rdbStore2?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver10);
          done();
        } catch (err) {
          console.log(tag + "err.code" + err.code + err.message);
          expect(null).assertFail();
          done();
        }
        console.log(tag + "************* testDataChange001 end *************");
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RDBFGAPItestDataChange002Test_2200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPItestDataChange002Test_2200
     * @tc.desc   Register callback for dataChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDBFGAPItestDataChange002Test_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.log(tag +
          "************* SUB_DistributedData_RelationalStore_SDK_RDBFGAPItestDataChange002Test_2200 start *************");
        let status1 = 0;
        let status2 = 0;
        let status3 = 0;
        let status4 = 0;
        let status5 = 0;
        let status6 = 0;
        let status7 = 0;
        let status8 = 0;
        let status9 = 0;
        let status10 = 0;
        let storeObserver1 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange1 storeObserver1 into");
          status1 = 1;
        };
        let storeObserver2 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange1 storeObserver2 into");
          status2 = 1;
        };
        let storeObserver3 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange1 storeObserver3 into");
          status3 = 1;
        };
        let storeObserver4 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange1 storeObserver4 into");
          status4 = 1;
        };
        let storeObserver5 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange1 storeObserver5 into");
          status5 = 1;
        };
        let storeObserver6 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange1 storeObserver6 into");
          status6 = 1;
        };
        let storeObserver7 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange1 storeObserver7 into");
          status7 = 1;
        };
        let storeObserver8 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange1 storeObserver8 into");
          status8 = 1;
        };
        let storeObserver9 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange1 storeObserver9 into");
          status9 = 1;
        };
        let storeObserver10 = (devices: Array<relationalStore.ChangeInfo>) => {
          console.info(tag + " dataChange1 storeObserver10 into");
          status10 = 1;
        };
        let rdbStore2: relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(rdbStore2 != undefined).assertTrue();
        try {
          rdbStore?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver1);
          rdbStore?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver2);
          rdbStore?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver3);
          rdbStore?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver4);
          rdbStore?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver5);
          //
          rdbStore2?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver6);
          rdbStore2?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver7);
          rdbStore2?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver8);
          rdbStore2?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver9);
          rdbStore2?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver10);
          await rdbStore2.close();
          const valueBucket: relationalStore.ValuesBucket = {
            'name': 'zhangsan',
            'age': 18 as long,
            'salary': 25000 as long,
          };
          rdbStore?.insert("test", valueBucket);
          await Utils.msSleep(5000)
          expect(status1).assertEqual(1);
          expect(status2).assertEqual(1);
          expect(status3).assertEqual(1);
          expect(status4).assertEqual(1);
          expect(status5).assertEqual(1);
          expect(status6).assertEqual(0);
          expect(status7).assertEqual(0);
          expect(status8).assertEqual(0);
          expect(status9).assertEqual(0);
          expect(status10).assertEqual(0);
          rdbStore?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver1);
          rdbStore?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver2);
          rdbStore?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver3);
          rdbStore?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver4);
          rdbStore?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver5);
          done();
        } catch (err) {
          console.log(tag + "err.code" + err.code + err.message);
          expect(null).assertFail();
          done();
        }
        console.log(tag +
          "************* SUB_DistributedData_RelationalStore_SDK_RDBFGAPItestDataChange002Test_2200 end *************");
      })


    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RDBFGAPItestEvent001Test_2300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPItestEvent001Test_2300
     * @tc.desc   Register callback for event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDBFGAPItestEvent001Test_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.log(tag +
          "************* SUB_DistributedData_RelationalStore_SDK_RDBFGAPItestEvent001Test_2300 start *************");
        let status1 = 0;
        let status2 = 0;
        let status3 = 0;
        let status4 = 0;
        let status5 = 0;
        let status6 = 0;
        let status7 = 0;
        let status8 = 0;
        let status9 = 0;
        let status10 = 0;
        let storeObserver1 = () => {
          console.info(tag + " event storeObserver1 into");
          status1 = 1;
        };
        let storeObserver2 = () => {
          console.info(tag + " event storeObserver2 into");
          status2 = 1;
        };
        let storeObserver3 = () => {
          console.info(tag + " event storeObserver3 into");
          status3 = 1;
        };
        let storeObserver4 = () => {
          console.info(tag + " event storeObserver4 into");
          status4 = 1;
        };
        let storeObserver5 = () => {
          console.info(tag + " event storeObserver5 into");
          status5 = 1;
        };
        let storeObserver6 = () => {
          console.info(tag + " event storeObserver6 into");
          status6 = 1;
        };
        let storeObserver7 = () => {
          console.info(tag + " event storeObserver7 into");
          status7 = 1;
        };
        let storeObserver8 = () => {
          console.info(tag + " event storeObserver8 into");
          status8 = 1;
        };
        let storeObserver9 = () => {
          console.info(tag + " event storeObserver9 into");
          status9 = 1;
        };
        let storeObserver10 = () => {
          console.info(tag + " event storeObserver10 into");
          status10 = 1;
        };
        let rdbStore2: relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(rdbStore2 != undefined).assertTrue();
        try {
          rdbStore?.on('event', true, storeObserver1);
          rdbStore?.on('event', true, storeObserver2);
          rdbStore?.on('event', true, storeObserver3);
          rdbStore?.on('event', true, storeObserver4);
          rdbStore?.on('event', true, storeObserver5);
          rdbStore2?.on('event', true, storeObserver6);
          rdbStore2?.on('event', true, storeObserver7);
          rdbStore2?.on('event', true, storeObserver8);
          rdbStore2?.on('event', true, storeObserver9);
          rdbStore2?.on('event', true, storeObserver10);
          rdbStore?.emit('event');
          await Utils.msSleep(5000)
          expect(status1).assertEqual(1);
          expect(status2).assertEqual(1);
          expect(status3).assertEqual(1);
          expect(status4).assertEqual(1);
          expect(status5).assertEqual(1);
          expect(status6).assertEqual(1);
          expect(status7).assertEqual(1);
          expect(status8).assertEqual(1);
          expect(status9).assertEqual(1);
          expect(status10).assertEqual(1);
          rdbStore?.off('event', true, storeObserver1);
          rdbStore?.off('event', true, storeObserver2);
          rdbStore?.off('event', true, storeObserver3);
          rdbStore?.off('event', true, storeObserver4);
          rdbStore?.off('event', true, storeObserver5);
          rdbStore2?.off('event', true, storeObserver6);
          rdbStore2?.off('event', true, storeObserver7);
          rdbStore2?.off('event', true, storeObserver8);
          rdbStore2?.off('event', true, storeObserver9);
          rdbStore2?.off('event', true, storeObserver10);
          done();
        } catch (err) {
          console.log(tag + "err.code" + err.code + err.message);
          expect(null).assertFail();
          done();
        }
        console.log(tag +
          "************* SUB_DistributedData_RelationalStore_SDK_RDBFGAPItestEvent001Test_2300 end *************");
        //
      })
    //
    /**
     * @tc.name   testEvent002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2400
     * @tc.desc   Register callback for event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEvent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(tag + "************* testEvent002 start *************");
      let status1 = 0;
      let status2 = 0;
      let status3 = 0;
      let status4 = 0;
      let status5 = 0;
      let status6 = 0;
      let status7 = 0;
      let status8 = 0;
      let status9 = 0;
      let status10 = 0;
      let storeObserver1 = () => {
        console.info(tag + " event1 storeObserver1 into");
        status1 = 1;
      };
      let storeObserver2 = () => {
        console.info(tag + " event1 storeObserver2 into");
        status2 = 1;
      };
      let storeObserver3 = () => {
        console.info(tag + " event1 storeObserver3 into");
        status3 = 1;
      };
      let storeObserver4 = () => {
        console.info(tag + " event1 storeObserver4 into");
        status4 = 1;
      };
      let storeObserver5 = () => {
        console.info(tag + " event1 storeObserver5 into");
        status5 = 1;
      };
      let storeObserver6 = () => {
        console.info(tag + " event1 storeObserver6 into");
        status6 = 1;
      };
      let storeObserver7 = () => {
        console.info(tag + " event1 storeObserver7 into");
        status7 = 1;
      };
      let storeObserver8 = () => {
        console.info(tag + " event1 storeObserver8 into");
        status8 = 1;
      };
      let storeObserver9 = () => {
        console.info(tag + " event1 storeObserver9 into");
        status9 = 1;
      };
      let storeObserver10 = () => {
        console.info(tag + " event1 storeObserver10 into");
        status10 = 1;
      };
      let rdbStore2: relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      expect(rdbStore2 != undefined).assertTrue();
      try {
        rdbStore?.on('event', true, storeObserver1);
        rdbStore?.on('event', true, storeObserver2);
        rdbStore?.on('event', true, storeObserver3);
        rdbStore?.on('event', true, storeObserver4);
        rdbStore?.on('event', true, storeObserver5);
        rdbStore2?.on('event', true, storeObserver6);
        rdbStore2?.on('event', true, storeObserver7);
        rdbStore2?.on('event', true, storeObserver8);
        rdbStore2?.on('event', true, storeObserver9);
        rdbStore2?.on('event', true, storeObserver10);
        await rdbStore2.close();
        rdbStore?.emit('event');
        await Utils.msSleep(5000)
        expect(status1).assertEqual(1);
        expect(status2).assertEqual(1)
        expect(status3).assertEqual(1)
        expect(status4).assertEqual(1)
        expect(status5).assertEqual(1)
        expect(status6).assertEqual(0);
        expect(status7).assertEqual(0);
        expect(status8).assertEqual(0);
        expect(status9).assertEqual(0);
        expect(status10).assertEqual(0);
        rdbStore?.off('event', true, storeObserver1);
        rdbStore?.off('event', true, storeObserver2);
        rdbStore?.off('event', true, storeObserver3);
        rdbStore?.off('event', true, storeObserver4);
        rdbStore?.off('event', true, storeObserver5);
        done();
      } catch (err) {
        console.log(tag + "err.code" + err.code + err.message);
        expect(null).assertFail();
        done();
      }
      console.log(tag + "************* testEvent002 end *************");
      //
    })
    //
    /**
     * @tc.name   testStatistics001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2500
     * @tc.desc   Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatistics001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(tag + "************* testStatistics001 start *************");
        let status1 = 0;
        let status2 = 0;
        let status3 = 0;
        let status4 = 0;
        let status5 = 0;
        let status6 = 0;
        let status7 = 0;
        let status8 = 0;
        let status9 = 0;
        let status10 = 0;
        let storeObserver1 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics storeObserver1 into");
          status1 = 1;
        };
        let storeObserver2 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics storeObserver2 into");
          status2 = 1;
        };
        let storeObserver3 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics storeObserver3 into");
          status3 = 1;
        };
        let storeObserver4 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics storeObserver4 into");
          status4 = 1;
        };
        let storeObserver5 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics storeObserver5 into");
          status5 = 1;
        };
        let storeObserver6 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics storeObserver6 into");
          status6 = 1;
        };
        let storeObserver7 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics storeObserver7 into");
          status7 = 1;
        };
        let storeObserver8 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics storeObserver8 into");
          status8 = 1;
        };
        let storeObserver9 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics storeObserver9 into");
          status9 = 1;
        };
        let storeObserver10 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics storeObserver10 into");
          status10 = 1;
        };
        //
        let rdbStore2: relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(rdbStore2 != undefined).assertTrue();
        try {
          rdbStore?.onStatistics(storeObserver1);
          rdbStore?.onStatistics(storeObserver2);
          rdbStore?.onStatistics(storeObserver3);
          rdbStore?.onStatistics(storeObserver4);
          rdbStore?.onStatistics(storeObserver5);
          rdbStore2?.onStatistics(storeObserver6);
          rdbStore2?.onStatistics(storeObserver7);
          rdbStore2?.onStatistics(storeObserver8);
          rdbStore2?.onStatistics(storeObserver9);
          rdbStore2?.onStatistics(storeObserver10);
          const valueBucket: relationalStore.ValuesBucket = {
            'name': 'zhangsan',
            'age': 18 as long,
            'salary': 25000 as long,
          };
          rdbStore?.insert("test", valueBucket);
          await Utils.msSleep(5000)
          expect(status1).assertEqual(1);
          expect(status2).assertEqual(1);
          expect(status3).assertEqual(1);
          expect(status4).assertEqual(1);
          expect(status5).assertEqual(1);
          expect(status6).assertEqual(1);
          expect(status7).assertEqual(1);
          expect(status8).assertEqual(1);
          expect(status9).assertEqual(1);
          expect(status10).assertEqual(1);
          rdbStore?.offStatistics(storeObserver1);
          rdbStore?.offStatistics(storeObserver2);
          rdbStore?.offStatistics(storeObserver3);
          rdbStore?.offStatistics(storeObserver4);
          rdbStore?.offStatistics(storeObserver5);
          rdbStore2?.offStatistics(storeObserver6);
          rdbStore2?.offStatistics(storeObserver7);
          rdbStore2?.offStatistics(storeObserver8);
          rdbStore2?.offStatistics(storeObserver9);
          rdbStore2?.offStatistics(storeObserver10);
          done();
        } catch (err) {
          console.log(tag + "err.code" + err.code + err.message);
          expect(null).assertFail();
          done();
        }
        console.log(tag + "************* testStatistics001 end *************");
      })
    //
    /**
     * @tc.name   testStatistics002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2600
     * @tc.desc   Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatistics002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(tag + "************* testStatistics002 start *************");
        let status1 = 0;
        let status2 = 0;
        let status3 = 0;
        let status4 = 0;
        let status5 = 0;
        let status6 = 0;
        let status7 = 0;
        let status8 = 0;
        let status9 = 0;
        let status10 = 0;
        let storeObserver1 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics1 storeObserver1 into");
          status1 = 1;
        };
        let storeObserver2 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics1 storeObserver2 into");
          status2 = 1;
        };
        let storeObserver3 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics1 storeObserver3 into");
          status3 = 1;
        };
        let storeObserver4 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics1 storeObserver4 into");
          status4 = 1;
        };
        let storeObserver5 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics1 storeObserver5 into");
          status5 = 1;
        };
        let storeObserver6 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics1 storeObserver6 into");
          status6 = 1;
        };
        let storeObserver7 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics1 storeObserver7 into");
          status7 = 1;
        };
        let storeObserver8 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics1 storeObserver8 into");
          status8 = 1;
        };
        let storeObserver9 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics1 storeObserver9 into");
          status9 = 1;
        };
        let storeObserver10 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(tag + " statistics1 storeObserver10 into");
          status10 = 1;
        };
        let rdbStore2: relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(rdbStore2 != undefined).assertTrue();
        try {
          rdbStore?.onStatistics(storeObserver1);
          rdbStore?.onStatistics(storeObserver2);
          rdbStore?.onStatistics(storeObserver3);
          rdbStore?.onStatistics(storeObserver4);
          rdbStore?.onStatistics(storeObserver5);
          rdbStore2?.onStatistics(storeObserver6);
          rdbStore2?.onStatistics(storeObserver7);
          rdbStore2?.onStatistics(storeObserver8);
          rdbStore2?.onStatistics(storeObserver9);
          rdbStore2?.onStatistics(storeObserver10);
          await rdbStore2.close();
          const valueBucket: relationalStore.ValuesBucket = {
            'name': 'zhangsan',
            'age': 18 as long,
            'salary': 25000 as long,
          };
          rdbStore?.insert("test", valueBucket);
          await Utils.msSleep(5000)
          expect(status1).assertEqual(1);
          expect(status2).assertEqual(1);
          expect(status3).assertEqual(1);
          expect(status4).assertEqual(1);
          expect(status5).assertEqual(1);
          expect(status6).assertEqual(0);
          expect(status7).assertEqual(0);
          expect(status8).assertEqual(0);
          expect(status9).assertEqual(0);
          expect(status10).assertEqual(0);
          rdbStore?.offStatistics(storeObserver1);
          rdbStore?.offStatistics(storeObserver2);
          rdbStore?.offStatistics(storeObserver3);
          rdbStore?.offStatistics(storeObserver4);
          rdbStore?.offStatistics(storeObserver5);
          done();
        } catch (err) {
          console.log(tag + "err.code" + err.code + err.message);
          expect(null).assertFail();
          done();
        }
        console.log(tag + "************* testStatistics002 end *************");
      })

    /**
     * @tc.name   relationalStoreTest054
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_4800
     * @tc.desc   getRows test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest054 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'lisi',
        }
        await rdbStore!.insert("employee", valueBucket);
        let predicates = new relationalStore.RdbPredicates("employee")
        predicates.equalTo("name", "lisi");
        let resultSet: relationalStore.ResultSet;
        resultSet = await rdbStore!.query(predicates);
        let res: boolean = resultSet.goToFirstRow();
        try {
          let Array1 = await resultSet.getRows(1);
          console.log(tag + res + "[][][]Array:" + Array1);
          console.log(tag + "Array1:" + Array1.length);
          expect(Array1.length).assertEqual(1);
        } catch (err) {
          console.log(tag + "err" + err.code + err.message);
          expect().assertFail();
        }
        resultSet.close();
        done();
        console.info(tag + "************* relationalStoreTest054 end *************");
      })
    /**
     * @tc.name   relationalStoreTest058
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_5200
     * @tc.desc   insertSync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest058 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'lisi',
        }
        const transaction = await rdbStore!.createTransaction();
        try {
          let rowId =
            transaction.insertSync('employee', valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          await transaction.commit();
          console.log(tag + "Insert is successful" + rowId);
          expect(rowId).assertEqual(1);
          done();
        } catch (err) {
          await transaction.rollback();
          console.log(tag + "err" + err.code + err.message);
          expect().assertFail();
          done();
        }
        console.info(tag + "************* relationalStoreTest058 end *************");
      })
    /**
     * @tc.name   relationalStoreTest059
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_5300
     * @tc.desc   isTokenizerSupported test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest059 start *************");
        let customType = relationalStore.Tokenizer.ICU_TOKENIZER;
        try {
          let customTypeSupported = relationalStore.isTokenizerSupported(customType);
          console.log(tag + "ICU tokenizer supported on current platform:" + customTypeSupported);
          expect(customTypeSupported).assertEqual(true);
          done();
        } catch (err) {
          console.log(tag + "err" + err.code + err.message);
          expect().assertFail();
          done();
        }
        console.info(tag + "************* relationalStoreTest059 end *************");
      })
    /**
     * @tc.name   relationalStoreTest060
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_5400
     * @tc.desc   isTokenizerSupported test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* relationalStoreTest060 start *************");
        let customType = relationalStore.Tokenizer.CUSTOM_TOKENIZER;
        try {
          let customTypeSupported = relationalStore.isTokenizerSupported(customType);
          if (customTypeSupported == false) {
            console.log(tag + "custom tokenizer supported on current platform:" + customTypeSupported);
            expect(customTypeSupported).assertEqual(false);
            done();
          } else {
            console.log(tag + "custom tokenizer supported on current platform:" + customTypeSupported);
            expect(customTypeSupported).assertEqual(true);
            done();
          }
        } catch (err) {
          console.log(tag + "err" + err.code + err.message);
          expect().assertFail();
          done();
        }
        console.info(tag + "************* relationalStoreTest060 end *************");
      })

    /**
     * @tc.name   deleteRdbStoreWithNamePromise
     * @tc.number deleteRdbStoreWithNamePromise001
     * @tc.desc   deleteRdbStoreWithNamePromise test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('deleteRdbStoreWithNamePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* deleteRdbStoreWithNamePromise start *************");
        try {
          await relationalStore.deleteRdbStore(context!, dbName);
        } catch (err) {
          console.log(tag + "deleteRdbStoreWithNamePromise err" + err.code + err.message);
          expect().assertFail();
        }
        done();
        console.info(tag + "************* deleteRdbStoreWithNamePromise end *************");
      })

    /**
     * @tc.name   deleteRdbStoreWithNameAsyncCallback
     * @tc.number deleteRdbStoreWithNameAsyncCallback001
     * @tc.desc   deleteRdbStoreWithNameAsyncCallback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('deleteRdbStoreWithNameAsyncCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* deleteRdbStoreWithNameAsyncCallback start *************");
        relationalStore.deleteRdbStore(context!, dbName, (err) => {
          if (err) {
            console.log(tag + "deleteRdbStoreWithNameAsyncCallback err" + err.code + err.message);
            expect().assertFail();
          }
          done();
        });
        console.info(tag + "************* deleteRdbStoreWithNameAsyncCallback end *************");
      })

    /**
     * @tc.name   deleteRdbStoreWithWrongNamePromise
     * @tc.number deleteRdbStoreWithWrongNamePromise001
     * @tc.desc   deleteRdbStoreWithWrongNamePromise test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('deleteRdbStoreWithWrongNamePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* deleteRdbStoreWithWrongNamePromise start *************");
        try {
          await relationalStore.deleteRdbStore(context!, "/");
          expect().assertFail();
        } catch (err) {
          console.log(tag + "deleteRdbStoreWithWrongNamePromise err" + err.code + err.message);
          expect(err.code).assertEqual(401);
        }
        done();
        console.info(tag + "************* deleteRdbStoreWithWrongNamePromise end *************");
      })

    /**
     * @tc.name   deleteRdbStoreWithWrongNameAsyncCallback
     * @tc.number deleteRdbStoreWithWrongNameAsyncCallback001
     * @tc.desc   deleteRdbStoreWithWrongNameAsyncCallback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('deleteRdbStoreWithWrongNameAsyncCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(tag + "************* deleteRdbStoreWithWrongNameAsyncCallback start *************");
        relationalStore.deleteRdbStore(context!, "/", (err) => {
          if (err) {
            console.log(tag + "deleteRdbStoreWithWrongNameAsyncCallback err" + err.code + err.message);
            expect(err.code).assertEqual(401);
          } else {
            expect().assertFail();
          }
          done();
        });
        console.info(tag + "************* deleteRdbStoreWithWrongNameAsyncCallback end *************");
      })
  })
}