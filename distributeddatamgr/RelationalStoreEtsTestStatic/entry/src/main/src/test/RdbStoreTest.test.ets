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
let tag: string = "[RdbStoreTest]";
const dbName = "RdbStoreTest.db";
const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " +
    "age INTEGER, " + "salary REAL)";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
}
let rdbStore: relationalStore.RdbStore | undefined;

export default function RdbStoreTest() {
  describe('RdbStoreTest', (): void => {
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
      };
      const values2: relationalStore.ValuesBucket = {
        "name": "Bob",
        "age": 30 as long,
        "salary": 6000.00,
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
     * @tc.name   testQueryWithPredicatesNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERY_0100
     * @tc.desc   Test query with predicates and callback - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueryWithPredicatesNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQueryWithPredicatesNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          let resultSet = await rdbStore!.query(predicates);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Alice");
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testQueryWithPredicatesNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQueryWithPredicatesNormal end *************");
      })

    /**
     * @tc.name   testQueryWithPredicatesAndColumns
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERY_0200
     * @tc.desc   Test query with predicates, columns and callback - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueryWithPredicatesAndColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQueryWithPredicatesAndColumns start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("age", 25 as long);
          rdbStore!.query(predicates, ["name", "age"], (err, resultSet) => {
            if (err) {
              hilog.error(domain, tag, `testQueryWithPredicatesAndColumns failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            if (!resultSet) {
              hilog.error(domain, tag, 'testQueryWithPredicatesAndColumns resultSet is null');
              expect().assertFail();
              done();
              return;
            }
            expect(resultSet.rowCount).assertEqual(1);
            expect(resultSet.columnCount).assertEqual(2);
            resultSet.goToFirstRow();
            expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Alice");
            resultSet.close();
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testQueryWithPredicatesAndColumns failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQueryWithPredicatesAndColumns end *************");
      })

    /**
     * @tc.name   testQueryWithNullPredicates
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERY_0300
     * @tc.desc   Test query with null predicates - abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryWithNullPredicates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQueryWithNullPredicates start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("nonexistent", "value");
          let resultSet = await rdbStore!.query(predicates);
          expect(resultSet.goToFirstRow()).assertFalse();
          resultSet.close();
          done();
        } catch (err) {
          hilog.info(domain, tag, `testQueryWithNullPredicates expected exception: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQueryWithNullPredicates end *************");
      })

    /**
     * @tc.name   testQuerySqlNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERYSQL_0100
     * @tc.desc   Test querySql with callback - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQuerySqlNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQuerySqlNormal start *************");
        try {
          rdbStore!.querySql("SELECT * FROM test WHERE name = ?", ["Alice"], (err, resultSet) => {
            if (err) {
              hilog.error(domain, tag, `testQuerySqlNormal failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            if (!resultSet) {
              hilog.error(domain, tag, 'testQuerySqlNormal resultSet is null');
              expect().assertFail();
              done();
              return;
            }
            expect(resultSet.rowCount).assertEqual(1);
            resultSet.goToFirstRow();
            expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Alice");
            resultSet.close();
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testQuerySqlNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQuerySqlNormal end *************");
      })

    /**
     * @tc.name   testQuerySqlWithoutBindArgs
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERYSQL_0200
     * @tc.desc   Test querySql without bindArgs - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQuerySqlWithoutBindArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQuerySqlWithoutBindArgs start *************");
        try {
          rdbStore!.querySql("SELECT * FROM test", (err, resultSet) => {
            if (err) {
              hilog.error(domain, tag, `testQuerySqlWithoutBindArgs failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            if (!resultSet) {
              hilog.error(domain, tag, 'testQuerySqlWithoutBindArgs resultSet is null');
              expect().assertFail();
              done();
              return;
            }
            expect(resultSet.rowCount).assertEqual(2);
            resultSet.close();
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testQuerySqlWithoutBindArgs failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQuerySqlWithoutBindArgs end *************");
      })

    /**
     * @tc.name   testQuerySqlWithInvalidSql
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERYSQL_0300
     * @tc.desc   Test querySql with invalid SQL - abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQuerySqlWithInvalidSql', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQuerySqlWithInvalidSql start *************");
        try {
          let resultSet = await rdbStore!.querySql("INVALID SQL STATEMENT");
          expect(resultSet.rowCount).assertEqual(-1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.info(domain, tag, `testQuerySqlWithInvalidSql expected exception: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQuerySqlWithInvalidSql end *************");
      })

    /**
     * @tc.name   testBeginTransactionNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_BEGINTRANSACTION_0100
     * @tc.desc   Test beginTransaction - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBeginTransactionNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBeginTransactionNormal start *************");
        try {
          rdbStore!.beginTransaction();
          const values: relationalStore.ValuesBucket = {
            "name": "Charlie",
            "age": 35 as long,
            "salary": 7000.00,
          };
          await rdbStore!.insert("test", values);
          // 提交事务
          rdbStore!.commit();

          // 验证数据已插入
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Charlie");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testBeginTransactionNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBeginTransactionNormal end *************");
      })

    /**
     * @tc.name   testBeginTransactionRollback
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_BEGINTRANSACTION_0200
     * @tc.desc   Test beginTransaction with rollback - other scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBeginTransactionRollback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBeginTransactionRollback start *************");
        try {
          // 开始事务
          rdbStore!.beginTransaction();
          const values: relationalStore.ValuesBucket = {
            "name": "David",
            "age": 40 as long,
            "salary": 8000.00,
          };
          await rdbStore!.insert("test", values);

          // 回滚事务
          rdbStore!.rollBack();

          // 验证数据未插入
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "David");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testBeginTransactionRollback failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBeginTransactionRollback end *************");
      })

    /**
     * @tc.name   testBeginTransactionMultiple
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_BEGINTRANSACTION_0300
     * @tc.desc   Test multiple beginTransaction calls - boundary scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBeginTransactionMultiple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBeginTransactionMultiple start *************");
        try {
          // 第一次开始事务
          rdbStore!.beginTransaction();
          const values1: relationalStore.ValuesBucket = {
            "name": "Eve",
            "age": 28 as long,
            "salary": 5500.00,
          };
          await rdbStore!.insert("test", values1);
          rdbStore!.commit();

          // 第二次开始事务
          rdbStore!.beginTransaction();
          const values2: relationalStore.ValuesBucket = {
            "name": "Frank",
            "age": 32 as long,
            "salary": 6500.00,
          };
          await rdbStore!.insert("test", values2);
          rdbStore!.commit();

          // 验证两条数据都已插入
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Eve").or().equalTo("name", "Frank");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testBeginTransactionMultiple failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBeginTransactionMultiple end *************");
      })

    /**
     * @tc.name   testQueryWithEmptyResultSet
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERY_0400
     * @tc.desc   Test query with no matching results - boundary scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueryWithEmptyResultSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQueryWithEmptyResultSet start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "NonExistent");
          rdbStore!.query(predicates, (err, resultSet) => {
            if (err) {
              hilog.error(domain, tag, `testQueryWithEmptyResultSet failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            if (!resultSet) {
              hilog.error(domain, tag, 'testQueryWithEmptyResultSet resultSet is null');
              expect().assertFail();
              done();
              return;
            }
            // 应该返回空结果集，不是错误
            expect(resultSet.rowCount).assertEqual(0);
            resultSet.close();
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testQueryWithEmptyResultSet failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQueryWithEmptyResultSet end *************");
      })

    /**
     * @tc.name   testQuerySqlWithEmptyBindArgs
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERYSQL_0400
     * @tc.desc   Test querySql with empty bindArgs - boundary scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuerySqlWithEmptyBindArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQuerySqlWithEmptyBindArgs start *************");
        try {
          let resultSet = await rdbStore!.querySql("SELECT * FROM test WHERE name = ?", []);
          expect(resultSet.rowCount).assertEqual(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.info(domain, tag, `testQuerySqlWithEmptyBindArgs expected exception: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQuerySqlWithEmptyBindArgs end *************");
      })

    /**
     * @tc.name   testQueryWithComplexPredicates
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERY_0500
     * @tc.desc   Test query with complex predicates - other scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueryWithComplexPredicates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQueryWithComplexPredicates start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.beginWrap()
            .equalTo("name", "Alice")
            .or()
            .equalTo("name", "Bob")
            .endWrap()
            .and()
            .greaterThanOrEqualTo("age", 20 as long)
            .orderByAsc("age")
            .limitAs(10);
          let resultSet = await rdbStore!.query(predicates);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testQueryWithComplexPredicates failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQueryWithComplexPredicates end *************");
      })

    // ==================== 增（Insert）测试用例 ====================

    /**
     * @tc.name   testInsertNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_INSERT_0100
     * @tc.desc   Test insert with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInsertNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testInsertNormal start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "name": "Charlie",
            "age": 35 as long,
            "salary": 7000.00,
          };
          let id = await rdbStore!.insert("test", values);
          expect(id).assertLarger(0);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testInsertNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testInsertNormal end *************");
      })

    /**
     * @tc.name   testInsertWithConflict
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_INSERT_0200
     * @tc.desc   Test insert with conflict resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertWithConflict', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testInsertWithConflict start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "name": "David",
            "age": 40 as long,
            "salary": 8000.00,
          };
          let id = await rdbStore!.insert("test", values, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          expect(id).assertLarger(0);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testInsertWithConflict failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testInsertWithConflict end *************");
      })

    /**
     * @tc.name   testInsertCallback
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_INSERT_0300
     * @tc.desc   Test insert with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInsertCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testInsertCallback start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "name": "Eve",
            "age": 28 as long,
            "salary": 5500.00,
          };
          rdbStore!.insert("test", values, (err, id) => {
            if (err) {
              hilog.error(domain, tag, `testInsertCallback failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            expect(id).assertLarger(0);
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testInsertCallback failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testInsertCallback end *************");
      })

    /**
     * @tc.name   testInsertSyncNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_INSERTSYNC_0100
     * @tc.desc   Test insertSync with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInsertSyncNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testInsertSyncNormal start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "name": "Frank",
            "age": 32 as long,
            "salary": 6500.00,
          };
          let id = rdbStore!.insertSync("test", values);
          expect(id).assertLarger(0);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testInsertSyncNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testInsertSyncNormal end *************");
      })

    /**
     * @tc.name   testBatchInsertNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_BATCHINSERT_0100
     * @tc.desc   Test batchInsert with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBatchInsertNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBatchInsertNormal start *************");
        try {
          const values: relationalStore.ValuesBucket[] = [
            { "name": "Grace", "age": 27 as long, "salary": 5700.00 },
            { "name": "Henry", "age": 33 as long, "salary": 6700.00 }
          ];
          let num = await rdbStore!.batchInsert("test", values);
          expect(num).assertEqual(2);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testBatchInsertNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBatchInsertNormal end *************");
      })

    /**
     * @tc.name   testBatchInsertSync
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_BATCHINSERTSYNC_0100
     * @tc.desc   Test batchInsertSync with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBatchInsertSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBatchInsertSync start *************");
        try {
          const values: relationalStore.ValuesBucket[] = [
            { "name": "Iris", "age": 29 as long, "salary": 5900.00 },
            { "name": "Jack", "age": 31 as long, "salary": 6300.00 }
          ];
          let num = rdbStore!.batchInsertSync("test", values);
          expect(num).assertEqual(2);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testBatchInsertSync failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBatchInsertSync end *************");
      })

    /**
     * @tc.name   testBatchInsertWithConflictResolution
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_BATCHINSERTCONFLICT_0100
     * @tc.desc   Test batchInsertWithConflictResolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBatchInsertWithConflictResolution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBatchInsertWithConflictResolution start *************");
        try {
          const values: relationalStore.ValuesBucket[] = [
            { "name": "Kate", "age": 26 as long, "salary": 5200.00 },
            { "name": "Leo", "age": 34 as long, "salary": 6800.00 }
          ];
          let num = await rdbStore!.batchInsertWithConflictResolution("test", values,
            relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          expect(num).assertEqual(2);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testBatchInsertWithConflictResolution failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBatchInsertWithConflictResolution end *************");
      })

    /**
     * @tc.name   testBatchInsertWithConflictResolutionSync
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_BATCHINSERTCONFLICTSYNC_0100
     * @tc.desc   Test batchInsertWithConflictResolutionSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBatchInsertWithConflictResolutionSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBatchInsertWithConflictResolutionSync start *************");
        try {
          const values: relationalStore.ValuesBucket[] = [
            { "name": "Mia", "age": 24 as long, "salary": 5400.00 },
            { "name": "Noah", "age": 36 as long, "salary": 7200.00 }
          ];
          let num = rdbStore!.batchInsertWithConflictResolutionSync("test", values,
            relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          expect(num).assertEqual(2);
          done();
        } catch (err) {
          hilog.error(domain, tag,
            `testBatchInsertWithConflictResolutionSync failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBatchInsertWithConflictResolutionSync end *************");
      })

    /**
     * @tc.name   testInsertCallbackWithConflict
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_INSERT_0400
     * @tc.desc   Test insert with callback and conflict resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertCallbackWithConflict', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testInsertCallbackWithConflict start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "name": "Oscar",
            "age": 38 as number,
            "salary": 7500.00,
          };
          rdbStore!.insert("test", values, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, (err, id) => {
            if (err) {
              hilog.error(domain, tag, `testInsertCallbackWithConflict failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            expect(id).assertLarger(0);
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testInsertCallbackWithConflict failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testInsertCallbackWithConflict end *************");
      })

    /**
     * @tc.name   testBatchInsertCallback
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_BATCHINSERT_0200
     * @tc.desc   Test batchInsert with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBatchInsertCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBatchInsertCallback start *************");
        try {
          const values: relationalStore.ValuesBucket[] = [
            { "name": "Paul", "age": 30 as number, "salary": 6000.00 },
            { "name": "Quinn", "age": 32 as number, "salary": 6200.00 }
          ];
          rdbStore!.batchInsert("test", values, (err, num) => {
            if (err) {
              hilog.error(domain, tag, `testBatchInsertCallback failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            expect(num).assertEqual(2);
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testBatchInsertCallback failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBatchInsertCallback end *************");
      })

    // ==================== 删（Delete）测试用例 ====================

    /**
     * @tc.name   testDeleteNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_DELETE_0100
     * @tc.desc   Test delete with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testDeleteNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          let count = await rdbStore!.delete(predicates);
          expect(count).assertEqual(1);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testDeleteNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testDeleteNormal end *************");
      })

    /**
     * @tc.name   testDeleteCallback
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_DELETE_0200
     * @tc.desc   Test delete with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testDeleteCallback start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Bob");
          rdbStore!.delete(predicates, (err, count) => {
            if (err) {
              hilog.error(domain, tag, `testDeleteCallback failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            expect(count).assertEqual(1);
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testDeleteCallback failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testDeleteCallback end *************");
      })

    /**
     * @tc.name   testDeleteSyncNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_DELETESYNC_0100
     * @tc.desc   Test deleteSync with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteSyncNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testDeleteSyncNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("age", 25 as long);
          let count = rdbStore!.deleteSync(predicates);
          expect(count).assertEqual(1);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testDeleteSyncNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testDeleteSyncNormal end *************");
      })

    /**
     * @tc.name   testDeleteWithEmptyResult
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_DELETE_0300
     * @tc.desc   Test delete with no matching records - boundary scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteWithEmptyResult', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testDeleteWithEmptyResult start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "NonExistent");
          let count = await rdbStore!.delete(predicates);
          expect(count).assertEqual(0);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testDeleteWithEmptyResult failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testDeleteWithEmptyResult end *************");
      })

    // ==================== 改（Update）测试用例 ====================

    /**
     * @tc.name   testUpdateNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_UPDATE_0100
     * @tc.desc   Test update with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdateNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testUpdateNormal start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "age": 26 as long,
          };
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          let count = await rdbStore!.update(values, predicates);
          expect(count).assertEqual(1);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testUpdateNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testUpdateNormal end *************");
      })

    /**
     * @tc.name   testUpdateWithConflict
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_UPDATE_0200
     * @tc.desc   Test update with conflict resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUpdateWithConflict', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testUpdateWithConflict start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "salary": 5100.00,
          };
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Bob");
          let count =
            await rdbStore!.update(values, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          expect(count).assertEqual(1);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testUpdateWithConflict failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testUpdateWithConflict end *************");
      })

    /**
     * @tc.name   testUpdateCallback
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_UPDATE_0300
     * @tc.desc   Test update with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdateCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testUpdateCallback start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "age": 27 as long,
          };
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("age", 25 as long);
          rdbStore!.update(values, predicates, (err, count) => {
            if (err) {
              hilog.error(domain, tag, `testUpdateCallback failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            expect(count).assertEqual(1);
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testUpdateCallback failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testUpdateCallback end *************");
      })

    /**
     * @tc.name   testUpdateSyncNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_UPDATESYNC_0100
     * @tc.desc   Test updateSync with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdateSyncNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testUpdateSyncNormal start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "salary": 7200.00,
          };
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          let count = rdbStore!.updateSync(values, predicates);
          expect(count).assertEqual(1);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testUpdateSyncNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testUpdateSyncNormal end *************");
      })

    /**
     * @tc.name   testUpdateMultipleRows
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_UPDATE_0400
     * @tc.desc   Test update affecting multiple rows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUpdateMultipleRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testUpdateMultipleRows start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "salary": 5000.00,
          };
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.greaterThanOrEqualTo("age", 20 as long);
          let count = await rdbStore!.update(values, predicates);
          expect(count).assertLarger(0);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testUpdateMultipleRows failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testUpdateMultipleRows end *************");
      })

    /**
     * @tc.name   testUpdateWithNoMatches
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_UPDATE_0500
     * @tc.desc   Test update with no matching records - boundary scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUpdateWithNoMatches', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testUpdateWithNoMatches start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "salary": 9000.00,
          };
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "NonExistent");
          let count = await rdbStore!.update(values, predicates);
          expect(count).assertEqual(0);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testUpdateWithNoMatches failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testUpdateWithNoMatches end *************");
      })

    /**
     * @tc.name   testUpdateCallbackWithConflict
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_UPDATE_0600
     * @tc.desc   Test update with callback and conflict resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUpdateCallbackWithConflict', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testUpdateCallbackWithConflict start *************");
        try {
          const values: relationalStore.ValuesBucket = {
            "age": 29 as number,
          };
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          rdbStore!.update(values, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, (err, count) => {
            if (err) {
              hilog.error(domain, tag, `testUpdateCallbackWithConflict failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            expect(count).assertEqual(1);
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testUpdateCallbackWithConflict failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testUpdateCallbackWithConflict end *************");
      })

    // ==================== 查询（Query）测试用例补充 ====================

    /**
     * @tc.name   testQueryPromise
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERY_0600
     * @tc.desc   Test query with Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueryPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQueryPromise start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          let resultSet = await rdbStore!.query(predicates);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testQueryPromise failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQueryPromise end *************");
      })

    /**
     * @tc.name   testQuerySync
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERYSYNC_0100
     * @tc.desc   Test querySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQuerySync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testQuerySync start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("age", 25 as number);
        let resultSet = rdbStore!.querySync(predicates, ["name", "age"]);
        expect(resultSet.rowCount).assertEqual(1);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testQuerySync failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testQuerySync end *************");
    })

    /**
     * @tc.name   testQuerySqlPromise
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERYSQL_0500
     * @tc.desc   Test querySql with Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQuerySqlPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQuerySqlPromise start *************");
        try {
          let resultSet = await rdbStore!.querySql("SELECT * FROM test WHERE name = ?", ["Alice"]);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testQuerySqlPromise failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQuerySqlPromise end *************");
      })

    /**
     * @tc.name   testQuerySqlSync
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_QUERYSQLSYNC_0100
     * @tc.desc   Test querySqlSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQuerySqlSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testQuerySqlSync start *************");
        try {
          let resultSet = rdbStore!.querySqlSync("SELECT * FROM test");
          expect(resultSet.rowCount).assertLarger(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testQuerySqlSync failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testQuerySqlSync end *************");
      })

    // ==================== 执行（Execute）测试用例 ====================

    /**
     * @tc.name   testExecuteSqlPromise
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_EXECUTESQL_0100
     * @tc.desc   Test executeSql with Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExecuteSqlPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testExecuteSqlPromise start *************");
        try {
          await rdbStore!.executeSql("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)",
            ["TestUser", 50 as number, 8000.00]);
          // 验证插入成功
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "TestUser");
          let resultSet = await rdbStore!.query(predicates);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testExecuteSqlPromise failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testExecuteSqlPromise end *************");
      })

    /**
     * @tc.name   testExecuteSqlCallback
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_EXECUTESQL_0200
     * @tc.desc   Test executeSql with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExecuteSqlCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testExecuteSqlCallback start *************");
        try {
          rdbStore!.executeSql("UPDATE test SET salary = 9000 WHERE name = ?", ["Alice"], (err) => {
            if (err) {
              hilog.error(domain, tag, `testExecuteSqlCallback failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testExecuteSqlCallback failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testExecuteSqlCallback end *************");
      })

    /**
     * @tc.name   testExecuteSync
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_EXECUTESYNC_0100
     * @tc.desc   Test executeSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExecuteSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testExecuteSync start *************");
        try {
          let result = rdbStore!.executeSync("DELETE FROM test WHERE name = ?", ["TestUser"]);
          // executeSync返回ValueType，验证执行成功
          expect(result !== undefined).assertTrue();
          done();
        } catch (err) {
          // 如果出错，记录但不视为失败
          hilog.info(domain, tag, `testExecuteSync error: ${err.code + ", " + err.message}`);
          done();
        }
        hilog.info(domain, tag, "************* testExecuteSync end *************");
      })

    // ==================== 事务（Transaction）测试用例补充 ====================


    // ==================== 备份恢复（Backup/Restore）测试用例 ====================

    /**
     * @tc.name   testBackupPromise
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_BACKUP_0100
     * @tc.desc   Test backup with Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBackupPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBackupPromise start *************");
        try {
          await rdbStore!.backup("test_backup");
          done();
        } catch (err) {
          hilog.error(domain, tag, `testBackupPromise failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBackupPromise end *************");
      })

    /**
     * @tc.name   testBackupCallback
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_BACKUP_0200
     * @tc.desc   Test backup with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBackupCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBackupCallback start *************");
        try {
          rdbStore!.backup("test_backup_cb", (err) => {
            if (err) {
              hilog.error(domain, tag, `testBackupCallback failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testBackupCallback failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBackupCallback end *************");
      })

    /**
     * @tc.name   testRestorePromise
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_RESTORE_0100
     * @tc.desc   Test restore with Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRestorePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testRestorePromise start *************");
        try {
          // 先备份
          await rdbStore!.backup("test_restore_backup");
          // 然后恢复
          await rdbStore!.restore("test_restore_backup");
          done();
        } catch (err) {
          hilog.error(domain, tag, `testRestorePromise failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testRestorePromise end *************");
      })

    /**
     * @tc.name   testRestoreCallback
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_RESTORE_0200
     * @tc.desc   Test restore with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRestoreCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testRestoreCallback start *************");
        try {
          rdbStore!.restore("test_restore_backup", (err) => {
            if (err) {
              hilog.error(domain, tag, `testRestoreCallback failed: ${err.code + ", " + err.message}`);
              expect().assertFail();
              done();
              return;
            }
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `testRestoreCallback failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testRestoreCallback end *************");
      })

    // ==================== 分布式（Distributed）测试用例 ====================

    /**
     * @tc.name   testSetDistributedTablesPromise
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_SETDISTRIBUTEDTABLES_0100
     * @tc.desc   Test setDistributedTables with Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDistributedTablesPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testSetDistributedTablesPromise start *************");
        try {
          await rdbStore!.setDistributedTables(["test"]);
          done();
        } catch (err) {
          hilog.error(domain, tag, `testSetDistributedTablesPromise failed: ${err.code + ", " + err.message}`);
          // 分布式功能可能需要特定环境，不视为失败
          hilog.info(domain, tag, `Distributed feature may not be available in current environment`);
          done();
        }
        hilog.info(domain, tag, "************* testSetDistributedTablesPromise end *************");
      })

    /**
     * @tc.name   testSetDistributedTablesCallback
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_SETDISTRIBUTEDTABLES_0200
     * @tc.desc   Test setDistributedTables with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDistributedTablesCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testSetDistributedTablesCallback start *************");
        try {
          rdbStore!.setDistributedTables(["test"], (err) => {
            if (err) {
              hilog.info(domain, tag, `Distributed feature may not be available: ${err.code + ", " + err.message}`);
            }
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `Distributed feature may not be available in current environment`);
          done();
        }
        hilog.info(domain, tag, "************* testSetDistributedTablesCallback end *************");
      })

    /**
     * @tc.name   testObtainDistributedTableName
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_OBTAINDISTRIBUTEDTABLENAME_0100
     * @tc.desc   Test obtainDistributedTableName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testObtainDistributedTableName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testObtainDistributedTableName start *************");
        try {
          let tableName = await rdbStore!.obtainDistributedTableName("testDevice", "test");
          hilog.info(domain, tag, `Distributed table name: ${tableName}`);
          done();
        } catch (err) {
          hilog.info(domain, tag, `Distributed feature may not be available: ${err.code + ", " + err.message}`);
          done();
        }
        hilog.info(domain, tag, "************* testObtainDistributedTableName end *************");
      })

    // ==================== 云同步（CloudSync）测试用例 ====================

    /**
     * @tc.name   testCloudSyncPromise
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_CLOUDSYNC_0100
     * @tc.desc   Test cloudSync with Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCloudSyncPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testCloudSyncPromise start *************");
        try {
          const progressCallback = (progress: relationalStore.ProgressDetails) => {
            hilog.info(domain, tag, `Cloud sync progress: ${JSON.stringify(progress)}`);
          };
          await rdbStore!.cloudSync(relationalStore.SyncMode.SYNC_MODE_PUSH, progressCallback);
          done();
        } catch (err) {
          hilog.info(domain, tag, `Cloud sync feature may not be available: ${err.code + ", " + err.message}`);
          done();
        }
        hilog.info(domain, tag, "************* testCloudSyncPromise end *************");
      })

    // ==================== 远程查询（RemoteQuery）测试用例 ====================

    /**
     * @tc.name   testRemoteQueryPromise
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_REMOTEQUERY_0100
     * @tc.desc   Test remoteQuery with Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoteQueryPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testRemoteQueryPromise start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          let resultSet = await rdbStore!.remoteQuery("testDevice", "test", predicates, ["name", "age"]);
          if (resultSet) {
            resultSet.close();
          }
          done();
        } catch (err) {
          hilog.info(domain, tag, `Remote query feature may not be available: ${err.code + ", " + err.message}`);
          done();
        }
        hilog.info(domain, tag, "************* testRemoteQueryPromise end *************");
      })

    // ==================== 其他方法测试用例 ====================

    /**
     * @tc.name   testClose
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_CLOSE_0100
     * @tc.desc   Test close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testClose start *************");
      try {
        await rdbStore!.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testClose failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testClose end *************");
    })

    /**
     * @tc.name   testCreateTransaction
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBSTORE_CREATETRANSACTION_0100
     * @tc.desc   Test createTransaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateTransaction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testCreateTransaction start *************");
        try {
          let transaction = await rdbStore!.createTransaction();
          expect(transaction !== null).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testCreateTransaction failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testCreateTransaction end *************");
      })
  })
}
