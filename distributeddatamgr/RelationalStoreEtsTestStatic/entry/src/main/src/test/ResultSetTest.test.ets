/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let context: common.UIAbilityContext | undefined;
let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let domain: int = 0x0000;
let tag: string = "[ResultSetTest]";
const dbName = "ResultSetTest.db";
const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " +
    "age INTEGER, " + "salary REAL, " + "email TEXT, " + "data BLOB)";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
}
let rdbStore: relationalStore.RdbStore | undefined;

export default function ResultSetTest() {
  describe('ResultSetTest', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, "beforeAll start");
      delegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
      hilog.info(domain, tag, 'beforeAll end');
    });

    beforeEach(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach start');
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      hilog.info(domain, tag, "create rdb store success")
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
      // 插入测试数据
      const values1: relationalStore.ValuesBucket = {
        "name": "Alice",
        "age": 25 as long,
        "salary": 5000.50,
        "email": "alice@example.com",
        "data": new Uint8Array([1, 2, 3])
      };
      const values2: relationalStore.ValuesBucket = {
        "name": "Bob",
        "age": 30 as long,
        "salary": 6000.00,
        "email": "bob@example.com",
        "data": new Uint8Array([4, 5, 6])
      };
      await rdbStore!.insert("test", values1);
      await rdbStore!.insert("test", values2);
      hilog.info(domain, tag, 'beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      hilog.info(domain, tag, 'afterEach start');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG)
      hilog.info(domain, tag, 'afterEach end');
    });

    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'afterAll start');
      hilog.info(domain, tag, 'afterAll end');
    });

    /**
     * @tc.name   testColumnNamesProperty
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_COLUMNNAMES_0100
     * @tc.desc   Test columnNames property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColumnNamesProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testColumnNamesProperty start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          let columnNames = resultSet.columnNames;
          hilog.info(domain, tag, `columnNames: ${JSON.stringify(columnNames)}`);
          expect(columnNames.length).assertLarger(0);
          expect(columnNames.indexOf("id")).assertLarger(-1);
          expect(columnNames.indexOf("name")).assertLarger(-1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testColumnNamesProperty failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testColumnNamesProperty end *************");
      })

    /**
     * @tc.name   testColumnCountProperty
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_COLUMNCOUNT_0100
     * @tc.desc   Test columnCount property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColumnCountProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testColumnCountProperty start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.columnCount).assertEqual(6); // id, name, age, salary, email, data
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testColumnCountProperty failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testColumnCountProperty end *************");
      })

    /**
     * @tc.name   testGetColumnNames
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETCOLUMNNAMES_0100
     * @tc.desc   Test getColumnNames method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetColumnNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGetColumnNames start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          let columnNames = resultSet.getColumnNames();
          expect(columnNames.length).assertLarger(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGetColumnNames failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGetColumnNames end *************");
      })

    /**
     * @tc.name   testGetColumnIndex
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETCOLUMNINDEX_0100
     * @tc.desc   Test getColumnIndex method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetColumnIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGetColumnIndex start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          let index = resultSet.getColumnIndex("name");
          expect(index).assertLarger(-1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGetColumnIndex failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGetColumnIndex end *************");
      })

    /**
     * @tc.name   testGetColumnName
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETCOLUMNNAME_0100
     * @tc.desc   Test getColumnName method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetColumnName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGetColumnName start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          let name = resultSet.getColumnName(1);
          expect(name.length).assertLarger(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGetColumnName failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGetColumnName end *************");
      })

    /**
     * @tc.name   testGetColumnType
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETCOLUMNTYPE_0100
     * @tc.desc   Test getColumnType method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetColumnType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGetColumnType start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          resultSet.goToFirstRow();
          let type = await resultSet.getColumnType(1);
          expect(type).assertEqual(relationalStore.ColumnType.TEXT);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGetColumnType failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGetColumnType end *************");
      })

    /**
     * @tc.name   testGetColumnTypeWhenCursorIsInvalid
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETCOLUMNTYPE_0200
     * @tc.desc   Test getColumnType method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetColumnTypeWhenCursorIsInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGetColumnTypeWhenCursorIsInvalid start *************");
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore!.query(predicates, []);
        try {
          let type = await resultSet.getColumnType(1);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, `testGetColumnTypeWhenCursorIsInvalid failed: ${err.code + ", " + err.message}`);
          expect(err.code).assertEqual(14800012);
          resultSet.close();
          done();
        }
        hilog.info(domain, tag, "************* testGetColumnTypeWhenCursorIsInvalid end *************");
      })

    /**
     * @tc.name   testGetColumnTypeSync
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETCOLUMNTYPESYNC_0100
     * @tc.desc   Test getColumnTypeSync method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetColumnTypeSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGetColumnTypeSync start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          resultSet.goToFirstRow();
          let type = resultSet.getColumnTypeSync(1);
          expect(type).assertEqual(relationalStore.ColumnType.TEXT);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGetColumnTypeSync failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGetColumnTypeSync end *************");
      })

    /**
     * @tc.name   testGoToFirstRow
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GOTOFIRSTROW_0100
     * @tc.desc   Test goToFirstRow method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGoToFirstRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGoToFirstRow start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          let result = resultSet.goToFirstRow();
          expect(result).assertTrue();
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGoToFirstRow failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGoToFirstRow end *************");
      })

    /**
     * @tc.name   testGoToLastRow
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GOTOLASTROW_0100
     * @tc.desc   Test goToLastRow method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGoToLastRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGoToLastRow start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          let result = resultSet.goToLastRow();
          expect(result).assertTrue();
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGoToLastRow failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGoToLastRow end *************");
      })

    /**
     * @tc.name   testGoToNextRow
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GOTONEXTROW_0100
     * @tc.desc   Test goToNextRow method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGoToNextRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGoToNextRow start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          resultSet.goToFirstRow();
          let result = resultSet.goToNextRow();
          expect(result).assertTrue();
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGoToNextRow failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGoToNextRow end *************");
      })

    /**
     * @tc.name   testGoToPreviousRow
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GOTOPREVIOUSROW_0100
     * @tc.desc   Test goToPreviousRow method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGoToPreviousRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGoToPreviousRow start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          resultSet.goToFirstRow();
          resultSet.goToNextRow();
          let result = resultSet.goToPreviousRow();
          expect(result).assertTrue();
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGoToPreviousRow failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGoToPreviousRow end *************");
      })

    /**
     * @tc.name   testGoTo
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GOTO_0100
     * @tc.desc   Test goTo method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGoTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testGoTo start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore!.query(predicates, []);
        let result = resultSet.goTo(1);
        expect(result).assertTrue();
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testGoTo failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testGoTo end *************");
    })

    /**
     * @tc.name   testGoToRow
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GOTOROW_0100
     * @tc.desc   Test goToRow method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGoToRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testGoToRow start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore!.query(predicates, []);
        let result = resultSet.goToRow(0);
        expect(result).assertTrue();
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testGoToRow failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testGoToRow end *************");
    })

    /**
     * @tc.name   testGetString
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETSTRING_0100
     * @tc.desc   Test getString method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testGetString start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore!.query(predicates, []);
        resultSet.goToFirstRow();
        let name = resultSet.getString(resultSet.getColumnIndex("name"));
        expect(name).assertEqual("Alice");
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testGetString failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testGetString end *************");
    })

    /**
     * @tc.name   testGetLong
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETLONG_0100
     * @tc.desc   Test getLong method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testGetLong start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore!.query(predicates, []);
        resultSet.goToFirstRow();
        let age = resultSet.getLong(resultSet.getColumnIndex("age"));
        expect(age).assertEqual(25);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testGetLong failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testGetLong end *************");
    })

    /**
     * @tc.name   testGetDouble
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETDOUBLE_0100
     * @tc.desc   Test getDouble method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDouble', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testGetDouble start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore!.query(predicates, []);
        resultSet.goToFirstRow();
        let salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        expect(salary).assertEqual(5000.50);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testGetDouble failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testGetDouble end *************");
    })

    /**
     * @tc.name   testGetBlob
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETBLOB_0100
     * @tc.desc   Test getBlob method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBlob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testGetBlob start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore!.query(predicates, []);
        resultSet.goToFirstRow();
        let data = resultSet.getBlob(resultSet.getColumnIndex("data"));
        expect(data.length).assertEqual(3);
        expect(data[0]).assertEqual(1);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testGetBlob failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testGetBlob end *************");
    })

    /**
     * @tc.name   testIsColumnNull
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_ISCOLUMNNULL_0100
     * @tc.desc   Test isColumnNull method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsColumnNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testIsColumnNull start *************");
        try {
          // 插入一条包含null值的记录
          const values: relationalStore.ValuesBucket = {
            "name": "Charlie",
            "age": 35 as long,
            "salary": 7000.00,
          };
          await rdbStore!.insert("test", values);

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Charlie");
          let resultSet = await rdbStore!.query(predicates, []);
          resultSet.goToFirstRow();
          let isNull = resultSet.isColumnNull(resultSet.getColumnIndex("email"));
          expect(isNull).assertTrue();
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testIsColumnNull failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testIsColumnNull end *************");
      })

    /**
     * @tc.name   testClose
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_CLOSE_0100
     * @tc.desc   Test close method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testClose start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore!.query(predicates, []);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testClose failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testClose end *************");
    })

    /**
     * @tc.name   testGetRow
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETROW_0100
     * @tc.desc   Test getRow method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testGetRow start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore!.query(predicates, []);
        resultSet.goToFirstRow();
        let row = resultSet.getRow();
        expect(row !== undefined).assertTrue();
        expect(row["name"]).assertEqual("Alice");
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testGetRow failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testGetRow end *************");
    })

    /**
     * @tc.name   testGetValue
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETVALUE_0100
     * @tc.desc   Test getValue method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testGetValue start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore!.query(predicates, []);
        resultSet.goToFirstRow();
        let value = resultSet.getValue(resultSet.getColumnIndex("name"));
        expect(value !== undefined).assertTrue();
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testGetValue failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testGetValue end *************");
    })

    /**
     * @tc.name   testGetRows
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETROWS_0100
     * @tc.desc   Test getRows method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testGetRows start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore!.query(predicates, []);
        let rows = await resultSet.getRows(10);
        expect(rows.length).assertEqual(2);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testGetRows failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testGetRows end *************");
    })

    /**
     * @tc.name   testGetCurrentRowData
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETCURRENTROWDATA_0100
     * @tc.desc   Test getCurrentRowData method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCurrentRowData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGetCurrentRowData start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          resultSet.goToFirstRow();
          let rowData = resultSet.getCurrentRowData();
          expect(rowData.length).assertLarger(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGetCurrentRowData failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGetCurrentRowData end *************");
      })

    /**
     * @tc.name   testGetRowsData
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETROWSDATA_0100
     * @tc.desc   Test getRowsData method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetRowsData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGetRowsData start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          let rowsData = await resultSet.getRowsData(10);
          expect(rowsData.length).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGetRowsData failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGetRowsData end *************");
      })

    /**
     * @tc.name   testGetRowsWithPosition
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETROWS_0200
     * @tc.desc   Test getRows with position parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetRowsWithPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGetRowsWithPosition start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          let rows = await resultSet.getRows(1, 0);
          expect(rows.length).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGetRowsWithPosition failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGetRowsWithPosition end *************");
      })

    /**
     * @tc.name   testGetRowsDataWithPosition
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GETROWSDATA_0200
     * @tc.desc   Test getRowsData with position parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetRowsDataWithPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGetRowsDataWithPosition start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          let rowsData = await resultSet.getRowsData(1, 0);
          expect(rowsData.length).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGetRowsDataWithPosition failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGetRowsDataWithPosition end *************");
      })

    /**
     * @tc.name   testRowCountProperty
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_ROWCOUNT_0100
     * @tc.desc   Test rowCount property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRowCountProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testRowCountProperty start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testRowCountProperty failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testRowCountProperty end *************");
      })

    /**
     * @tc.name   testRowIndexProperty
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_ROWINDEX_0100
     * @tc.desc   Test rowIndex property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRowIndexProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testRowIndexProperty start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          resultSet.goToFirstRow();
          expect(resultSet.rowIndex).assertEqual(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testRowIndexProperty failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testRowIndexProperty end *************");
      })

    /**
     * @tc.name   testIsAtFirstRowProperty
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_ISATFIRSTROW_0100
     * @tc.desc   Test isAtFirstRow property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsAtFirstRowProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testIsAtFirstRowProperty start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          resultSet.goToFirstRow();
          expect(resultSet.isAtFirstRow).assertTrue();
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testIsAtFirstRowProperty failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testIsAtFirstRowProperty end *************");
      })

    /**
     * @tc.name   testIsAtLastRowProperty
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_ISATLASTROW_0100
     * @tc.desc   Test isAtLastRow property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsAtLastRowProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testIsAtLastRowProperty start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          resultSet.goToLastRow();
          expect(resultSet.isAtLastRow).assertTrue();
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testIsAtLastRowProperty failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testIsAtLastRowProperty end *************");
      })

    /**
     * @tc.name   testIsEndedProperty
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_ISENDED_0100
     * @tc.desc   Test isEnded property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEndedProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testIsEndedProperty start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.isEnded).assertFalse();
          resultSet.goToLastRow();
          resultSet.goToNextRow();
          expect(resultSet.isEnded).assertTrue();
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testIsEndedProperty failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testIsEndedProperty end *************");
      })

    /**
     * @tc.name   testIsStartedProperty
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_ISSTARTED_0100
     * @tc.desc   Test isStarted property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsStartedProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testIsStartedProperty start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.isStarted).assertFalse();
          resultSet.goToFirstRow();
          expect(resultSet.isStarted).assertTrue();
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testIsStartedProperty failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testIsStartedProperty end *************");
      })

    /**
     * @tc.name   testGoToInvalidOffset
     * @tc.number SUB_DDM_RELATIONALSTORE_RESULTSET_GOTO_0200
     * @tc.desc   Test goTo with invalid offset - abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGoToInvalidOffset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGoToInvalidOffset start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore!.query(predicates, []);
          let result = resultSet.goTo(100);
          expect(result).assertFalse();
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGoToInvalidOffset failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGoToInvalidOffset end *************");
      })
  })
}
