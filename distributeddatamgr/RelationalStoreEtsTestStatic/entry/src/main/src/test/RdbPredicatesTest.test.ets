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
let tag: string = "[RdbPredicatesTest]";
const dbName = "RdbPredicatesTest.db";
const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " +
    "age INTEGER, " + "salary REAL, " + "email TEXT)";
const CREATE_INDEX_NAME = "CREATE INDEX idx_name ON test (name);"
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
}
let rdbStore: relationalStore.RdbStore | undefined;

export default function RdbPredicatesTest() {
  describe('RdbPredicatesTest', (): void => {
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
        "email": "alice@example.com"
      };
      const values2: relationalStore.ValuesBucket = {
        "name": "Bob",
        "age": 30 as long,
        "salary": 6000.00,
        "email": "bob@example.com"
      };
      const values3: relationalStore.ValuesBucket = {
        "name": "Charlie",
        "age": 35 as long,
        "salary": 7000.00,
        "email": "charlie@test.com"
      };
      await rdbStore!.insert("test", values1);
      await rdbStore!.insert("test", values2);
      await rdbStore!.insert("test", values3);
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
     * @tc.name   testEqualToNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_EQUALTO_0100
     * @tc.desc   Test equalTo with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqualToNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testEqualToNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Alice");
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testEqualToNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testEqualToNormal end *************");
      })

    /**
     * @tc.name   testEqualToWithNullField
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_EQUALTO_0200
     * @tc.desc   Test equalTo with null field name - abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEqualToWithNullField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testEqualToWithNullField start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("", "Alice");
          let resultSet = await rdbStore!.query(predicates, []);
          resultSet.close();
        } catch (err) {
          hilog.info(domain, tag, `testEqualToWithNullField expected error: ${err.code + ", " + err.message}`);
          expect(err.code !== 0).assertTrue();
        }
        hilog.info(domain, tag, "************* testEqualToWithNullField end *************");
        done();
      })

    /**
     * @tc.name   testNotEqualToNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_NOTEQUALTO_0100
     * @tc.desc   Test notEqualTo with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNotEqualToNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testNotEqualToNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.notEqualTo("name", "Alice");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testNotEqualToNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testNotEqualToNormal end *************");
      })

    /**
     * @tc.name   testBeginWrapEndWrap
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_WRAP_0100
     * @tc.desc   Test beginWrap and endWrap with normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBeginWrapEndWrap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBeginWrapEndWrap start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.beginWrap()
            .equalTo("name", "Alice")
            .or()
            .equalTo("name", "Bob")
            .endWrap();
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testBeginWrapEndWrap failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBeginWrapEndWrap end *************");
      })

    /**
     * @tc.name   testOrAnd
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_LOGICAL_0100
     * @tc.desc   Test or and and methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrAnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testOrAnd start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.beginWrap()
          .equalTo("name", "Alice")
          .or()
          .equalTo("name", "Bob")
          .endWrap()
          .and()
          .equalTo("age", 30 as long);
        let info = relationalStore.getQuerySqlInfo(predicates);

        let resultSet = await rdbStore!.query(predicates, []);
        expect(resultSet.rowCount).assertEqual(1);
        resultSet.goToFirstRow();
        expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Bob");
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testOrAnd failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testOrAnd end *************");
    })

    /**
     * @tc.name   testContainsNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_CONTAINS_0100
     * @tc.desc   Test contains with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testContainsNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testContainsNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.contains("email", "example");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testContainsNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testContainsNormal end *************");
      })

    /**
     * @tc.name   testContainsWithEmptyValue
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_CONTAINS_0200
     * @tc.desc   Test contains with empty value - boundary scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContainsWithEmptyValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testContainsWithEmptyValue start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.contains("email", "");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(3);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testContainsWithEmptyValue failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testContainsWithEmptyValue end *************");
      })

    /**
     * @tc.name   testBeginsWithNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_BEGINSWITH_0100
     * @tc.desc   Test beginsWith with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBeginsWithNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBeginsWithNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.beginsWith("name", "A");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Alice");
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testBeginsWithNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBeginsWithNormal end *************");
      })

    /**
     * @tc.name   testEndsWithNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_ENDSWITH_0100
     * @tc.desc   Test endsWith with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEndsWithNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testEndsWithNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.endsWith("email", ".com");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(3);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testEndsWithNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testEndsWithNormal end *************");
      })

    /**
     * @tc.name   testIsNull
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_ISNULL_0100
     * @tc.desc   Test isNull with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testIsNull start *************");
      try {
        // 插入一条含有null值的记录
        const values: relationalStore.ValuesBucket = {
          "name": "David",
          "age": 40 as long,
          "salary": 8000.00,
        };
        await rdbStore!.insert("test", values);

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.isNull("email");
        let resultSet = await rdbStore!.query(predicates, []);
        expect(resultSet.rowCount).assertEqual(1);
        resultSet.goToFirstRow();
        expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("David");
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testIsNull failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testIsNull end *************");
    })

    /**
     * @tc.name   testIsNotNull
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_ISNOTNULL_0100
     * @tc.desc   Test isNotNull with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsNotNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testIsNotNull start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.isNotNull("email");
        let resultSet = await rdbStore!.query(predicates, []);
        expect(resultSet.rowCount).assertEqual(3);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testIsNotNull failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testIsNotNull end *************");
    })

    /**
     * @tc.name   testLikeNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_LIKE_0100
     * @tc.desc   Test like with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLikeNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testLikeNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.like("name", "A%");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Alice");
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testLikeNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testLikeNormal end *************");
      })

    /**
     * @tc.name   testGlobNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_GLOB_0100
     * @tc.desc   Test glob with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGlobNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGlobNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.glob("name", "A*");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Alice");
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGlobNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGlobNormal end *************");
      })

    /**
     * @tc.name   testBetweenNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_BETWEEN_0100
     * @tc.desc   Test between with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBetweenNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testBetweenNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.between("age", 25 as long, 30 as long);
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testBetweenNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testBetweenNormal end *************");
      })

    /**
     * @tc.name   testNotBetweenNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_NOTBETWEEN_0100
     * @tc.desc   Test notBetween with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNotBetweenNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testNotBetweenNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.notBetween("age", 25 as long, 30 as long);
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getLong(resultSet.getColumnIndex("age"))).assertEqual(35);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testNotBetweenNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testNotBetweenNormal end *************");
      })

    /**
     * @tc.name   testGreaterThanNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_GREATERTHAN_0100
     * @tc.desc   Test greaterThan with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGreaterThanNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGreaterThanNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.greaterThan("age", 30 as long);
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getLong(resultSet.getColumnIndex("age"))).assertEqual(35);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGreaterThanNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGreaterThanNormal end *************");
      })

    /**
     * @tc.name   testLessThanNormal
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_LESSTHAN_0100
     * @tc.desc   Test lessThan with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLessThanNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testLessThanNormal start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.lessThan("age", 30 as long);
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.goToFirstRow();
          expect(resultSet.getLong(resultSet.getColumnIndex("age"))).assertEqual(25);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testLessThanNormal failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testLessThanNormal end *************");
      })

    /**
     * @tc.name   testGreaterThanOrEqualTo
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_GREATEROREQUAL_0100
     * @tc.desc   Test greaterThanOrEqualTo with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGreaterThanOrEqualTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testGreaterThanOrEqualTo start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.greaterThanOrEqualTo("age", 30 as long);
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testGreaterThanOrEqualTo failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testGreaterThanOrEqualTo end *************");
      })

    /**
     * @tc.name   testLessThanOrEqualTo
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_LESSOREQUAL_0100
     * @tc.desc   Test lessThanOrEqualTo with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLessThanOrEqualTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testLessThanOrEqualTo start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.lessThanOrEqualTo("age", 30 as long);
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testLessThanOrEqualTo failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testLessThanOrEqualTo end *************");
      })

    /**
     * @tc.name   testOrderByAsc
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_ORDERBYASC_0100
     * @tc.desc   Test orderByAsc with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrderByAsc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testOrderByAsc start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.orderByAsc("age");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(3);
          resultSet.goToFirstRow();
          expect(resultSet.getLong(resultSet.getColumnIndex("age"))).assertEqual(25);
          resultSet.goToNextRow();
          expect(resultSet.getLong(resultSet.getColumnIndex("age"))).assertEqual(30);
          resultSet.goToNextRow();
          expect(resultSet.getLong(resultSet.getColumnIndex("age"))).assertEqual(35);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testOrderByAsc failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testOrderByAsc end *************");
      })

    /**
     * @tc.name   testOrderByDesc
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_ORDERBYDESC_0100
     * @tc.desc   Test orderByDesc with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrderByDesc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testOrderByDesc start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.orderByDesc("age");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(3);
          resultSet.goToFirstRow();
          expect(resultSet.getLong(resultSet.getColumnIndex("age"))).assertEqual(35);
          resultSet.goToNextRow();
          expect(resultSet.getLong(resultSet.getColumnIndex("age"))).assertEqual(30);
          resultSet.goToNextRow();
          expect(resultSet.getLong(resultSet.getColumnIndex("age"))).assertEqual(25);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testOrderByDesc failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testOrderByDesc end *************");
      })

    /**
     * @tc.name   testDistinct
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_DISTINCT_0100
     * @tc.desc   Test distinct with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testDistinct start *************");
      try {
        // 插入重复数据
        const values: relationalStore.ValuesBucket = {
          "name": "Alice",
          "age": 25 as long,
          "salary": 5000.50,
          "email": "alice2@example.com"
        };
        await rdbStore!.insert("test", values);

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.distinct();
        let resultSet = await rdbStore!.query(predicates, ["name"]);
        // 验证去重效果
        let count = 0;
        while (resultSet.goToNextRow()) {
          count++;
        }
        expect(count).assertEqual(3);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testDistinct failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testDistinct end *************");
    })

    /**
     * @tc.name   testLimitAs
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_LIMITAS_0100
     * @tc.desc   Test limitAs with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLimitAs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testLimitAs start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.limitAs(2);
        let resultSet = await rdbStore!.query(predicates, []);
        expect(resultSet.rowCount).assertEqual(2);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testLimitAs failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testLimitAs end *************");
    })

    /**
     * @tc.name   testLimitAsBoundary
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_LIMITAS_0200
     * @tc.desc   Test limitAs with boundary value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLimitAsBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testLimitAsBoundary start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.limitAs(1);
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testLimitAsBoundary failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testLimitAsBoundary end *************");
      })

    /**
     * @tc.name   testOffsetAs
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_OFFSETAS_0100
     * @tc.desc   Test offsetAs with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOffsetAs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testOffsetAs start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.limitAs(2).offsetAs(1);
        let resultSet = await rdbStore!.query(predicates, []);
        expect(resultSet.rowCount).assertEqual(2);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testOffsetAs failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testOffsetAs end *************");
    })

    /**
     * @tc.name   testGroupBy
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_GROUPBY_0100
     * @tc.desc   Test groupBy with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGroupBy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testGroupBy start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.groupBy(["age"]);
        let resultSet = await rdbStore!.query(predicates, ["age", "COUNT(*) as count"]);
        expect(resultSet.rowCount).assertLarger(0);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testGroupBy failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testGroupBy end *************");
    })

    /**
     * @tc.name   testInDevices
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_INDEVICES_0100
     * @tc.desc   Test inDevices with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInDevices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testInDevices start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "Alice").inDevices(["device1", "device2"]);
        let resultSet = await rdbStore!.query(predicates, []);
        expect(resultSet.rowCount).assertEqual(1);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testInDevices failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testInDevices end *************");
    })

    /**
     * @tc.name   testInAllDevices
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_INALLDEVICES_0100
     * @tc.desc   Test inAllDevices with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInAllDevices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testInAllDevices start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice").inAllDevices();
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testInAllDevices failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testInAllDevices end *************");
      })

    /**
     * @tc.name   testComplexPredicates
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_COMPLEX_0100
     * @tc.desc   Test complex predicates with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComplexPredicates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testComplexPredicates start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.beginWrap()
            .equalTo("name", "Alice")
            .or()
            .equalTo("name", "Bob")
            .endWrap()
            .and()
            .greaterThanOrEqualTo("age", 25 as long)
            .and()
            .lessThan("salary", 7000.00)
            .orderByAsc("age")
            .limitAs(10);
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testComplexPredicates failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testComplexPredicates end *************");
      })

    /**
     * @tc.name   testIndexedByWithInvalidIndex
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_INDEXEDBY_0300
     * @tc.desc   Test indexedBy with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIndexedByWithInvalidIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testIndexedByWithInvalidIndex start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice").indexedBy("invalid_index");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(-1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testIndexedByWithInvalidIndex failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testIndexedByWithInvalidIndex end *************");
      })

    /**
     * @tc.name   testIndexedBy
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_INDEXEDBY_0100
     * @tc.desc   Test indexedBy with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIndexedBy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testIndexedBy start *************");
      try {
        await rdbStore!.executeSql(CREATE_INDEX_NAME);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "Alice").indexedBy("idx_name");
        let resultSet = await rdbStore!.query(predicates, []);
        expect(resultSet.rowCount).assertEqual(1);
        resultSet.close();
      } catch (err) {
        hilog.error(domain, tag, `testIndexedBy failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "************* testIndexedBy end *************");
      done();
    })

    /**
     * @tc.name   testInValues
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_INVALUES_0100
     * @tc.desc   Test inValues with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testInValues start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.inValues("name", ["Alice", "Bob"]);
        let resultSet = await rdbStore!.query(predicates, []);
        expect(resultSet.rowCount).assertEqual(2);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testInValues failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testInValues end *************");
    })

    /**
     * @tc.name   testNotInValues
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_NOTINVALUES_0100
     * @tc.desc   Test notInValues with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNotInValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testNotInValues start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.notInValues("name", ["Alice"]);
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testNotInValues failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testNotInValues end *************");
      })

    /**
     * @tc.name   testNotContains
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_NOTCONTAINS_0100
     * @tc.desc   Test notContains with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNotContains', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testNotContains start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.notContains("email", "test");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(2);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testNotContains failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testNotContains end *************");
      })

    /**
     * @tc.name   testNotLike
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_NOTLIKE_0100
     * @tc.desc   Test notLike with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNotLike', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testNotLike start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.notLike("name", "A%");
        let resultSet = await rdbStore!.query(predicates, []);
        expect(resultSet.rowCount).assertEqual(2);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testNotLike failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testNotLike end *************");
    })

    /**
     * @tc.name   testHaving
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_HAVING_0100
     * @tc.desc   Test having with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHaving', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "************* testHaving start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.groupBy(["age"]).having("COUNT(*) > 0");
        let resultSet = await rdbStore!.query(predicates, ["age", "COUNT(*) as count"]);
        expect(resultSet.rowCount).assertLarger(0);
        resultSet.close();
        done();
      } catch (err) {
        hilog.error(domain, tag, `testHaving failed: ${err.code + ", " + err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "************* testHaving end *************");
    })

    /**
     * @tc.name   testHavingWithArgs
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_HAVING_0200
     * @tc.desc   Test having with arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHavingWithArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testHavingWithArgs start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.groupBy(["age"]).having("COUNT(*) > ?", [0 as long]);
          let resultSet = await rdbStore!.query(predicates, ["age", "COUNT(*) as count"]);
          expect(resultSet.rowCount).assertLarger(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testHavingWithArgs failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testHavingWithArgs end *************");
      })

    /**
     * @tc.name   testInValuesEmpty
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_INVALUES_0200
     * @tc.desc   Test inValues with empty array - boundary scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInValuesEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testInValuesEmpty start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.inValues("name", []);
          let resultSet = await rdbStore!.query(predicates, []);
          // 空数组应该返回0结果
          expect(resultSet.rowCount).assertEqual(0);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testInValuesEmpty failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testInValuesEmpty end *************");
      })

    /**
     * @tc.name   testIndexedByEmpty
     * @tc.number SUB_DDM_RELATIONALSTORE_RDBPREDICATES_INDEXEDBY_0200
     * @tc.desc   Test indexedBy with empty index name - boundary scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexedByEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testIndexedByEmpty start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Alice").indexedBy("");
          let resultSet = await rdbStore!.query(predicates, []);
          expect(resultSet.rowCount).assertEqual(1);
          resultSet.close();
          done();
        } catch (err) {
          hilog.error(domain, tag, `testIndexedByEmpty failed: ${err.code + ", " + err.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, "************* testIndexedByEmpty end *************");
      })
  })
}
