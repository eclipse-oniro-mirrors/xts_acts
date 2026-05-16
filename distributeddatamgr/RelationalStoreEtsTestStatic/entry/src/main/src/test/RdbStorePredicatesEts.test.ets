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
} from "../../../hypium/index";
import relationalStore from '@ohos.data.relationalStore';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
const TAG = "[STAGE_RELATIONAL_STORE_JSKITS_TEST]";
let context: common.UIAbilityContext;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "Predicates.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};
const SQL_CREATE_TABLE =
  'CREATE TABLE IF NOT EXISTS orders (id INTEGER PRIMARY KEY AUTOINCREMENT, customer_id INTEGER, amount INTEGER)';
let rdbStore: relationalStore.RdbStore;

async function preData(rdbStore: relationalStore.RdbStore): Promise<void> {
  const INSERT_SQL =
    'INSERT INTO orders (customer_id, amount) VALUES' +
      '(1, 1500), (1, 2000), (1, 3000), (2, 800), (2, 1200), (3, 1500), (3, 2000), (3, 2500), (3, 1000)';
  await rdbStore.executeSql(INSERT_SQL);
}

export default function RdbPredicatesEtsTest() {
  describe('rdbPredicatesEtsTest', () => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      await Utils.msSleep(2000);
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
      hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      expect(rdbStore != undefined).assertTrue();
      console.info(TAG + 'beforeAll end');
    });
    beforeEach(async (): Promise<void> => {
      await rdbStore.executeSql(SQL_CREATE_TABLE);
      await preData(rdbStore);
      console.info(TAG + 'beforeEach');
    });
    afterEach(async (): Promise<void> => {
      await rdbStore.executeSql('DROP TABLE IF EXISTS orders');
      console.info(TAG + 'afterEach');
    });
    afterAll(async (): Promise<void> => {
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      console.info(TAG + 'afterAll');
    });

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number testHaving001
     * @tc.name testHaving001
     * @tc.desc 1.Execute having("total > 5000 AND count >= 3", [])
     *          2.Query data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHaving001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testHaving001 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("orders");
        predicates.groupBy(["customer_id"]);
        predicates.having("total > 5000 AND count >= 3", []);
        let resultSet: relationalStore.ResultSet =
          rdbStore.querySync(predicates, ["customer_id", "COUNT(*) AS count", "SUM(amount) AS total"]);
        console.info(TAG + 'testHaving001 rowCount ' + resultSet.rowCount);
        expect(2).assertEqual(resultSet.rowCount);
        expect(true).assertEqual(resultSet.goToNextRow());
        let row: relationalStore.ValuesBucket = resultSet.getRow();
        console.info(TAG + 'testHaving001 customer_id ' + row["customer_id"] + ' total ' + row["total"]);
        expect(row["customer_id"]).assertEqual(1);
        expect(row["total"]).assertEqual(6500);
        expect(true).assertEqual(resultSet.goToNextRow());
        row = resultSet.getRow() as relationalStore.ValuesBucket;
        console.info(TAG + 'testHaving001 customer_id ' + row["customer_id"] + ' total ' + row["total"]);
        expect(row["customer_id"]).assertEqual(3);
        expect(row["total"]).assertEqual(7000);
        resultSet.close();
        console.log(TAG + " testHaving001 having success");
      } catch (e: BusinessError) {
        console.error(TAG + " testHaving001 having failed" + e);
        expect(true).assertFail();
      }
      done();
      console.log(TAG + "************* testHaving001 end   *************");
    });

    /**
     * @tc.number testHaving002
     * @tc.name testHaving002
     * @tc.desc 1.Execute having("total > 5000 AND count >= 3")
     *          2.Query data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHaving002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testHaving002 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("orders");
        predicates.groupBy(["customer_id"]);
        predicates.having("total > 5000 AND count >= 3");
        let resultSet: relationalStore.ResultSet =
          rdbStore.querySync(predicates,
            ["customer_id", "COUNT(*) AS count", "SUM(amount) AS total"]) as relationalStore.ResultSet;
        console.info(TAG + 'testHaving002 rowCount ' + resultSet.rowCount);
        expect(2).assertEqual(resultSet.rowCount);
        expect(true).assertEqual(resultSet.goToNextRow());
        let row: relationalStore.ValuesBucket = resultSet.getRow() as relationalStore.ValuesBucket;
        console.info(TAG + 'testHaving002 customer_id ' + row["customer_id"] + ' total ' + row["total"]);
        expect(row["customer_id"]).assertEqual(1);
        expect(row["total"]).assertEqual(6500);
        expect(true).assertEqual(resultSet.goToNextRow());
        row = resultSet.getRow() as relationalStore.ValuesBucket;
        console.info(TAG + 'testHaving002 customer_id ' + row["customer_id"] + ' total ' + row["total"]);
        expect(row["customer_id"]).assertEqual(3);
        expect(row["total"]).assertEqual(7000);
        resultSet.close();
        console.log(TAG + " testHaving002 having success");
      } catch (e: BusinessError) {
        console.error(TAG + " testHaving002 having failed" + e);
        expect(true).assertFail();
      }
      done();
      console.log(TAG + "************* testHaving002 end   *************");
    });

    /**
     * @tc.number testHaving003
     * @tc.name testHaving003
     * @tc.desc 1.Execute having("SALARY = 1.2", null)
     *          2.Query data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHaving003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testHaving003 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("orders");
        predicates.groupBy(["customer_id"]);
        predicates.having("total > 5000 AND count >= 3", undefined);
        let resultSet: relationalStore.ResultSet =
          rdbStore.querySync(predicates,
            ["customer_id", "COUNT(*) AS count", "SUM(amount) AS total"]) as relationalStore.ResultSet;
        console.info(TAG + 'testHaving003 rowCount ' + resultSet.rowCount);
        expect(2).assertEqual(resultSet.rowCount);
        expect(true).assertEqual(resultSet.goToNextRow());
        let row: relationalStore.ValuesBucket = resultSet.getRow() as relationalStore.ValuesBucket;
        console.info(TAG + 'testHaving003 customer_id ' + row["customer_id"] + ' total ' + row["total"]);
        expect(row["customer_id"]).assertEqual(1);
        expect(row["total"]).assertEqual(6500);
        expect(true).assertEqual(resultSet.goToNextRow());
        row = resultSet.getRow() as relationalStore.ValuesBucket;
        console.info(TAG + 'testHaving003 customer_id ' + row["customer_id"] + ' total ' + row["total"]);
        expect(row["customer_id"]).assertEqual(3);
        expect(row["total"]).assertEqual(7000);
        resultSet.close();
        console.log(TAG + " testHaving003 having success");
      } catch (e: BusinessError) {
        console.error(TAG + " testHaving003 having failed" + e);
        expect(true).assertFail();
      }
      done();
      console.log(TAG + "************* testHaving003 end   *************");
    });

    /**
     * @tc.number testHaving004
     * @tc.name testHaving004
     * @tc.desc 1.Execute having("SALARY = 1.2", undefined)
     *          2.Query data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHaving004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testHaving004 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("orders");
        predicates.groupBy(["customer_id"]);
        predicates.having("total > 5000 AND count >= 3", undefined);
        let resultSet: relationalStore.ResultSet =
          rdbStore.querySync(predicates,
            ["customer_id", "COUNT(*) AS count", "SUM(amount) AS total"]) as relationalStore.ResultSet;
        console.info(TAG + 'testHaving004 rowCount ' + resultSet.rowCount);
        expect(2).assertEqual(resultSet.rowCount);
        expect(true).assertEqual(resultSet.goToNextRow());
        let row: relationalStore.ValuesBucket = resultSet.getRow() as relationalStore.ValuesBucket;
        console.info(TAG + 'testHaving004 customer_id ' + row["customer_id"] + ' total ' + row["total"]);
        expect(row["customer_id"]).assertEqual(1);
        expect(row["total"]).assertEqual(6500);
        expect(true).assertEqual(resultSet.goToNextRow());
        row = resultSet.getRow() as relationalStore.ValuesBucket;
        console.info(TAG + 'testHaving004 customer_id ' + row["customer_id"] + ' total ' + row["total"]);
        expect(row["customer_id"]).assertEqual(3);
        expect(row["total"]).assertEqual(7000);
        resultSet.close();
        console.log(TAG + " testHaving004 having success");
      } catch (e: BusinessError) {
        console.error(TAG + " testHaving004 having failed" + e);
        expect(true).assertFail();
      }
      done();
      console.log(TAG + "************* testHaving004 end   *************");
    });

    /**
     * @tc.number testHaving005
     * @tc.name testHaving005
     * @tc.desc 1.Execute having("")
     *          2.Query data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHaving005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testHaving005 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("orders");
        predicates.groupBy(["customer_id"]);
        predicates.having("");
        console.log(TAG + " testHaving005 having success");
        expect(true).assertFail();
      } catch (e: BusinessError) {
        console.error(TAG + " testHaving005 having failed" + e);
        expect(e.code == 14800001).assertTrue();
      }
      done();
      console.log(TAG + "************* testHaving005 end   *************");
    });

    /**
     * @tc.number testHaving006
     * @tc.name testHaving006
     * @tc.desc 1.Execute having("SALARY == 1.2")
     *          2.Query data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHaving006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testHaving006 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("orders");
        predicates.groupBy(["customer_id"]);
        predicates.having("SALARY == 1.2");
        let resultSet: relationalStore.ResultSet = rdbStore.querySync(predicates) as relationalStore.ResultSet;
        expect(false).assertEqual(resultSet.goToFirstRow());
        resultSet.getRow();
        console.log(TAG + " testHaving006 having success");
        resultSet.close();
        expect(true).assertFail();
      } catch (e: BusinessError) {
        console.error(TAG + " testHaving006 having failed. " + e.message + e.code);
        expect(e.code == 14800021).assertTrue();
      }
      done();
      console.log(TAG + "************* testHaving006 end   *************");
    });

    /**
     * @tc.number testHaving007
     * @tc.name testHaving007
     * @tc.desc 1.Execute having(total > ? AND count >= ?", [5000])
     *          2.Query data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHaving007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testHaving007 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("orders");
        predicates.groupBy(["customer_id"]);
        predicates.having("total > ? AND count >= ?");
        let resultSet: relationalStore.ResultSet =
          rdbStore.querySync(predicates, ["customer_id", "COUNT(*) AS count", "SUM(amount) AS total"]);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
        console.log(TAG + " testHaving007 having success");
      } catch (e: BusinessError) {
        console.error(TAG + " testHaving007 having failed " + e);
        expect(true).assertFail();
      }
      done();
      console.log(TAG + "************* testHaving007 end   *************");
    });

    /**
     * @tc.number testHaving008
     * @tc.name testHaving008
     * @tc.desc Execute having(total > ? AND count >= ?", [5000 as long, 3 as long])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHaving008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testHaving008 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("orders");
        predicates.having("total > ? AND count >= ?", [5000 as long, 3 as long]);
        console.log(TAG + " testHaving008 having success");
        expect(true).assertFail();
      } catch (e: BusinessError) {
        console.error(TAG + " testHaving008 having failed" + e);
        expect(e.code == 14800001).assertTrue();
      }
      done();
      console.log(TAG + "************* testHaving008 end   *************");
    });

    /**
     * @tc.number testHaving009
     * @tc.name testHaving009
     * @tc.desc 1.Execute having(total > ? AND count >= ?", [5000 as long, 3 as long])
     *          2.Query data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHaving009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testHaving009 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("orders");
        predicates.groupBy(["customer_id"]);
        predicates.having("total > ? AND count >= ?", [5000 as long, 3 as long]);
        let resultSet: relationalStore.ResultSet =
          rdbStore.querySync(predicates,
            ["customer_id", "COUNT(*) AS count", "SUM(amount) AS total"]) as relationalStore.ResultSet;
        console.info(TAG + 'testHaving009 rowCount ' + resultSet.rowCount);
        expect(2).assertEqual(resultSet.rowCount);
        expect(true).assertEqual(resultSet.goToNextRow());
        let row: relationalStore.ValuesBucket = resultSet.getRow() as relationalStore.ValuesBucket;
        console.info(TAG + 'testHaving009 customer_id ' + row["customer_id"] + ' total ' + row["total"]);
        expect(row["customer_id"]).assertEqual(1);
        expect(row["total"]).assertEqual(6500);
        expect(true).assertEqual(resultSet.goToNextRow());
        row = resultSet.getRow() as relationalStore.ValuesBucket;
        console.info(TAG + 'testHaving009 customer_id ' + row["customer_id"] + ' total ' + row["total"]);
        expect(row["customer_id"]).assertEqual(3);
        expect(row["total"]).assertEqual(7000);
        resultSet.close();
        console.log(TAG + " testHaving009 having success");
      } catch (e: BusinessError) {
        console.error(TAG + " testHaving009 having failed" + e);
        expect(true).assertFail();
      }
      done();
      console.log(TAG + "************* testHaving009 end   *************");
    });

    /**
     * @tc.number testHaving010
     * @tc.name testHaving010
     * @tc.desc Multi threaded testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHaving010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testHaving010 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("orders");
        predicates.groupBy(["customer_id"]);
        predicates.having("total > ? AND count >= ?", [5000 as long, 3 as long]);
        let count = 200;
        for (let i = 0; i < count; ++i) {
          let resultSet = await rdbStore.query(predicates, ["customer_id", "COUNT(*) AS count", "SUM(amount) AS total"]);
          expect(2).assertEqual(resultSet.rowCount);
          expect(true).assertEqual(resultSet.goToNextRow());
          let row: relationalStore.ValuesBucket = resultSet.getRow();
          expect(row["customer_id"]).assertEqual(1);
          expect(row["total"]).assertEqual(6500);
          expect(true).assertEqual(resultSet.goToNextRow());
          row = resultSet.getRow();
          expect(row["customer_id"]).assertEqual(3);
          expect(row["total"]).assertEqual(7000);
          resultSet.close();
          count--;
          if (count == 0) {
            done();
          }
        }
        console.log(TAG + " testHaving010 having success");
      } catch (e: BusinessError) {
        console.error(TAG + " testHaving010 having failed: " + e);
        expect().assertFail();
      }
      done();
      console.log(TAG + "************* testHaving010 end   *************");
    });
    console.log(TAG + "*************Unit Test End*************");
  })
}
