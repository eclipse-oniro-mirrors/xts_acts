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
let tag: string = "[TransactionTest]";
const dbName = "TransactionTest.db";
const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " +
    "age INTEGER, " + "salary REAL)";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
}
let rdbStore: relationalStore.RdbStore | undefined;
let transaction: relationalStore.Transaction | undefined;

export default function TransactionTest() {
  describe('TransactionTest', (): void => {
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
     * @tc.name   testCommitNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_COMMIT_0100
     * @tc.desc   Test commit with normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCommitNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testCommitNormal start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          const values: relationalStore.ValuesBucket = {
            "name": "Charlie",
            "age": 35 as long,
            "salary": 7000.00,
          };
          await transaction!.insert("test", values);

          await transaction!.commit();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Charlie");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testCommitNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testCommitNormal end *************");
      })

    /**
     * @tc.name   testRollbackNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_ROLLBACK_0100
     * @tc.desc   Test rollback with normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRollbackNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testRollbackNormal start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          const values: relationalStore.ValuesBucket = {
            "name": "David",
            "age": 40 as long,
            "salary": 8000.00,
          };
          await transaction!.insert("test", values);

          await transaction!.rollback();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "David");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testRollbackNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testRollbackNormal end *************");
      })

    /**
     * @tc.name   testTransactionInsert
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_INSERT_0100
     * @tc.desc   Test insert within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionInsert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionInsert start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          const values: relationalStore.ValuesBucket = {
            "name": "Eve",
            "age": 28 as long,
            "salary": 5500.00,
          };
          let id = await transaction!.insert("test", values);

          expect(id).assertLarger(0);

          await transaction!.commit();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Eve");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionInsert failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionInsert end *************");
      })

    /**
     * @tc.name   testTransactionInsertSync
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_INSERTSYNC_0100
     * @tc.desc   Test insertSync within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionInsertSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionInsertSync start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          const values: relationalStore.ValuesBucket = {
            "name": "Frank",
            "age": 32 as long,
            "salary": 6500.00,
          };
          let id = transaction!.insertSync("test", values);

          expect(id).assertLarger(0);

          await transaction!.commit();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Frank");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionInsertSync failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionInsertSync end *************");
      })

    /**
     * @tc.name   testTransactionBatchInsert
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_BATCHINSERT_0100
     * @tc.desc   Test batchInsert within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionBatchInsert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionBatchInsert start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          const values: relationalStore.ValuesBucket[] = [
            { "name": "Grace", "age": 27 as long, "salary": 5700.00 },
            { "name": "Henry", "age": 33 as long, "salary": 6700.00 }
          ];
          let id = await transaction!.batchInsert("test", values);

          expect(id).assertLarger(0);

          await transaction!.commit();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Grace").or().equalTo("name", "Henry");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionBatchInsert failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionBatchInsert end *************");
      })

    /**
     * @tc.name   testTransactionBatchInsertSync
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_BATCHINSERTSYNC_0100
     * @tc.desc   Test batchInsertSync within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionBatchInsertSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionBatchInsertSync start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          const values: relationalStore.ValuesBucket[] = [
            { "name": "Iris", "age": 29 as long, "salary": 5900.00 },
            { "name": "Jack", "age": 31 as long, "salary": 6300.00 }
          ];
          let id = transaction!.batchInsertSync("test", values);

          expect(id).assertLarger(0);

          await transaction!.commit();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Iris").or().equalTo("name", "Jack");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionBatchInsertSync failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionBatchInsertSync end *************");
      })

    /**
     * @tc.name   testTransactionUpdate
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_UPDATE_0100
     * @tc.desc   Test update within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionUpdate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionUpdate start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          const values: relationalStore.ValuesBucket = {
            "age": 26 as long,
          };
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          let count = await transaction!.update(values, predicates);

          expect(count).assertEqual(1);

          await transaction!.commit();

          let predicates2 = new relationalStore.RdbPredicates("test");
          predicates2.equalTo("name", "Alice");
          let resultSet = await rdbStore!.query(predicates2, []);
          resultSet.goToFirstRow();
          expect(resultSet.getLong(resultSet.getColumnIndex("age"))).assertEqual(26);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionUpdate failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionUpdate end *************");
      })

    /**
     * @tc.name   testTransactionUpdateSync
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_UPDATESYNC_0100
     * @tc.desc   Test updateSync within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionUpdateSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionUpdateSync start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          const values: relationalStore.ValuesBucket = {
            "salary": 5100.00,
          };
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Bob");
          let count = transaction!.updateSync(values, predicates);

          expect(count).assertEqual(1);

          await transaction!.commit();

          let predicates2 = new relationalStore.RdbPredicates("test");
          predicates2.equalTo("name", "Bob");
          let resultSet = await rdbStore!.query(predicates2, []);
          resultSet.goToFirstRow();
          expect(resultSet.getDouble(resultSet.getColumnIndex("salary"))).assertEqual(5100.00);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionUpdateSync failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionUpdateSync end *************");
      })

    /**
     * @tc.name   testTransactionDelete
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_DELETE_0100
     * @tc.desc   Test delete within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionDelete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionDelete start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          let count = await transaction!.delete(predicates);

          expect(count).assertEqual(1);

          await transaction!.commit();

          let predicates2 = new relationalStore.RdbPredicates("test");
          predicates2.equalTo("name", "Alice");
          let resultSet = await rdbStore!.query(predicates2, []);
          expect(resultSet.rowCount).assertEqual(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionDelete failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionDelete end *************");
      })

    /**
     * @tc.name   testTransactionDeleteSync
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_DELETESYNC_0100
     * @tc.desc   Test deleteSync within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionDeleteSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionDeleteSync start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Bob");
          let count = transaction!.deleteSync(predicates);

          expect(count).assertEqual(1);

          await transaction!.commit();

          let predicates2 = new relationalStore.RdbPredicates("test");
          predicates2.equalTo("name", "Bob");
          let resultSet = await rdbStore!.query(predicates2, []);
          expect(resultSet.rowCount).assertEqual(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionDeleteSync failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionDeleteSync end *************");
      })

    /**
     * @tc.name   testTransactionQuery
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_QUERY_0100
     * @tc.desc   Test query within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionQuery start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          let resultSet = await transaction!.query(predicates, []);

          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Alice");
          resultSet.close();

          await transaction!.commit();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionQuery failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionQuery end *************");
      })

    /**
     * @tc.name   testTransactionQuerySync
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_QUERYSYNC_0100
     * @tc.desc   Test querySync within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionQuerySync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionQuerySync start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Bob");
          let resultSet = transaction!.querySync(predicates, []);

          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Bob");
          resultSet.close();

          await transaction!.commit();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionQuerySync failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionQuerySync end *************");
      })

    /**
     * @tc.name   testTransactionQuerySql
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_QUERYSQL_0100
     * @tc.desc   Test querySql within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionQuerySql', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionQuerySql start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          let resultSet = await transaction!.querySql("SELECT * FROM test WHERE name = ?", ["Alice"]);

          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Alice");
          resultSet.close();

          await transaction!.commit();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionQuerySql failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionQuerySql end *************");
      })

    /**
     * @tc.name   testTransactionQuerySqlSync
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_QUERYSQLSYNC_0100
     * @tc.desc   Test querySqlSync within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransactionQuerySqlSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionQuerySqlSync start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          let resultSet = transaction!.querySqlSync("SELECT * FROM test WHERE name = ?", ["Bob"]);

          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Bob");
          resultSet.close();

          await transaction!.commit();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionQuerySqlSync failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionQuerySqlSync end *************");
      })

    /**
     * @tc.name   testTransactionExecute
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_EXECUTE_0100
     * @tc.desc   Test execute within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransactionExecute', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionExecute start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          let result = await transaction!.execute("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)",
            ["Kate", 26 as long, 5200.00]);

          expect(result == null).assertFalse();

          await transaction!.commit();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Kate");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionExecute failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionExecute end *************");
      })

    /**
     * @tc.name   testTransactionExecuteSync
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_EXECUTESYNC_0100
     * @tc.desc   Test executeSync within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransactionExecuteSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionExecuteSync start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          let result = transaction!.executeSync("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)",
            ["Leo", 34 as long, 6800.00]);

          expect(result == null).assertFalse();

          await transaction!.commit();

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Leo");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionExecuteSync failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionExecuteSync end *************");
      })

    /**
     * @tc.name   testTransactionRollbackAfterMultipleOps
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_ROLLBACK_0200
     * @tc.desc   Test rollback after multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransactionRollbackAfterMultipleOps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionRollbackAfterMultipleOps start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          // 执行多个操作
          await transaction!.insert("test", { "name": "Mia", "age": 24 as long, "salary": 5400.00 });
          await transaction!.insert("test", { "name": "Noah", "age": 36 as long, "salary": 7200.00 });

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          await transaction!.update({ "age": 99 as long }, predicates);

          // 回滚所有操作
          await transaction!.rollback();

          // 验证数据未改变
          let predicates2 = new relationalStore.RdbPredicates("test");
          predicates2.equalTo("name", "Mia").or().equalTo("name", "Noah");
          let resultSet = await rdbStore!.query(predicates2, []);
          expect(resultSet.rowCount).assertEqual(0);
          resultSet.close();

          // Alice的age应该仍然是25
          let predicates3 = new relationalStore.RdbPredicates("test");
          predicates3.equalTo("name", "Alice");
          let resultSet3 = await rdbStore!.query(predicates3, []);
          resultSet3.goToFirstRow();
          expect(resultSet3.getLong(resultSet3.getColumnIndex("age"))).assertEqual(25);
          resultSet3.close();

          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionRollbackAfterMultipleOps failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionRollbackAfterMultipleOps end *************");
      })

    /**
     * @tc.name   testTransactionCommitAfterMultipleOps
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_COMMIT_0200
     * @tc.desc   Test commit after multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransactionCommitAfterMultipleOps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionCommitAfterMultipleOps start *************");
        try {
          transaction = await rdbStore!.createTransaction();
          // 执行多个操作
          await transaction!.insert("test", { "name": "Olivia", "age": 23 as long, "salary": 5300.00 });
          await transaction!.insert("test", { "name": "Peter", "age": 37 as long, "salary": 7300.00 });

          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Bob");
          await transaction!.update({ "age": 31 as long }, predicates);

          // 提交所有操作
          await transaction!.commit();

          // 验证所有操作都已生效
          let predicates2 = new relationalStore.RdbPredicates("test");
          predicates2.equalTo("name", "Olivia").or().equalTo("name", "Peter");
          let resultSet = await rdbStore!.query(predicates2, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();

          // Bob的age应该是31
          let predicates3 = new relationalStore.RdbPredicates("test");
          predicates3.equalTo("name", "Bob");
          let resultSet3 = await rdbStore!.query(predicates3, []);
          resultSet3.goToFirstRow();
          expect(resultSet3.getLong(resultSet3.getColumnIndex("age"))).assertEqual(31);
          resultSet3.close();

          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionCommitAfterMultipleOps failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionCommitAfterMultipleOps end *************");
      })

    /**
     * @tc.name   testTransactionQueryWithColumns
     * @tc.number SUB_DDM_RELATIONALSTORE_TRANSACTION_QUERY_0200
     * @tc.desc   Test query with specific columns within transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransactionQueryWithColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testTransactionQueryWithColumns start *************");
        try {
          transaction = await rdbStore!.createTransaction();

          let predicates = new relationalStore.RdbPredicates("test");
          let resultSet = await transaction!.query(predicates, ["name", "age"]);

          expect(resultSet.rowCount).assertEqual(2);
          expect(resultSet.columnCount).assertEqual(2);
          resultSet.close();

          await transaction!.commit();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testTransactionQueryWithColumns failed, err.code ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testTransactionQueryWithColumns end *************");
      })
  })
}
