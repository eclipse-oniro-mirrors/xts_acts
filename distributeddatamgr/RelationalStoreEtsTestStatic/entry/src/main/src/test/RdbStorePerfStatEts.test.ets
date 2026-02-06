
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
} from "../../../hypium";
import relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

const TAG = "[STAGE_RELATIONAL_STORE_JSKITS_TEST]";
let rdbStore:relationalStore.RdbStore | undefined;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let context: common.UIAbilityContext | undefined;
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function PerfStatEtsTest() {
  describe('perfStatEtsTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll')
      delegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
    })
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      expect(rdbStore != undefined).assertTrue();
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18 as long,
        'salary': 25000 as long,
      };
      await rdbStore!.insert('test', valueBucket);
      await Utils.msSleep(1000);
    })
    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
      try {
        rdbStore!.offPerfStat();
        rdbStore!.offStatistics();
      } catch (err) {
        expect(err.code).assertEqual(14800014);
      }
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    })
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
    })


    /**
     * @tc.name testRdbStorePerfStat_0001
     * @tc.number testRdbStorePerfStat_0001
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0001 start *************");
      rdbStore!.onPerfStat((SqlExeInfo: relationalStore.SqlExecutionInfo) => {
        expect('INSERT INTO test(age,name,salary) VALUES (?,?,?)').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      })
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18 as long,
        'salary': 25000 as long,
      };
      let rowId = await rdbStore!.insert('test', valueBucket);
      expect(2).assertEqual(rowId);
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0001 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0002
     * @tc.number testRdbStorePerfStat_0002
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0002 start *************");
      rdbStore!.onPerfStat((SqlExeInfo: relationalStore.SqlExecutionInfo) => {
        expect('UPDATE test SET age=?,name=?,salary=? WHERE id = ? ').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      })

      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
        'age': 18 as long,
        'salary': 25000 as long,
      };
      let predicates = new relationalStore.RdbPredicates('test');
      predicates.equalTo('id', 1 as long);
      let rowId = await rdbStore!.update(valueBucket, predicates);
      expect(1).assertEqual(rowId);
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0002 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0003
     * @tc.number testRdbStorePerfStat_0003
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0003 start *************");
      rdbStore!.onPerfStat((SqlExeInfo: relationalStore.SqlExecutionInfo) => {
        expect('DELETE FROM test WHERE id = ? ').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      })
      let predicates = new relationalStore.RdbPredicates('test');
      predicates.equalTo('id', 1 as long);
      let rowId = await rdbStore!.delete(predicates);
      expect(1).assertEqual(rowId);
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0003 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0004
     * @tc.number testRdbStorePerfStat_0004
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0004 start *************");
      rdbStore!.onPerfStat((SqlExeInfo: relationalStore.SqlExecutionInfo) => {
        expect('CREATE TABLE IF NOT EXISTS EMPLOYEE (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      })

      const SQL_CREATE_TABLE1 = "CREATE TABLE IF NOT EXISTS EMPLOYEE (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "name TEXT NOT NULL)"; // 建表Sql语句
      await rdbStore!.executeSql(SQL_CREATE_TABLE1);
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0004 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0005
     * @tc.number testRdbStorePerfStat_0005
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0005 start *************");
      rdbStore!.onPerfStat((SqlExeInfo: relationalStore.SqlExecutionInfo) => {
        expect('PRAGMA quick_check').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      })
      await rdbStore!.execute("PRAGMA quick_check");
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0005 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0006
     * @tc.number testRdbStorePerfStat_0006
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0006 start *************");
      rdbStore!.onPerfStat((SqlExeInfo: relationalStore.SqlExecutionInfo) => {
        expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      })
      let predicates = new relationalStore.RdbPredicates('test');
      await rdbStore!.query(predicates);
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0006 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0007
     * @tc.number testRdbStorePerfStat_0007
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0007 start *************");
      rdbStore!.onPerfStat((SqlExeInfo: relationalStore.SqlExecutionInfo) => {
        expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      })
      await rdbStore!.querySql("SELECT * FROM test");
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0007 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0008
     * @tc.number testRdbStorePerfStat_0008
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0008 start *************");
      rdbStore!.onPerfStat((SqlExeInfo: relationalStore.SqlExecutionInfo) => {
        expect('with test1 as (select * from test) select * from test').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      })
      await rdbStore!.querySql("with test1 as (select * from test) select * from test");
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0008 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0009
     * @tc.number testRdbStorePerfStat_0009
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0009 start *************");
      let observer1 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
        done()
      };

      let observer2 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
      };

      rdbStore!.onPerfStat(observer1)
      await rdbStore!.querySql("SELECT * FROM test");
      done()
      console.log(TAG + "************* testRdbStorePerfStat_0009 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0010
     * @tc.number testRdbStorePerfStat_0010
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0010 start *************");
      let observer1 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
        await Utils.msSleep(2000);
      };

      let observer2 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
        await Utils.msSleep(2000);
      };

      rdbStore!.onPerfStat(observer1)
      rdbStore!.onPerfStat(observer2)
      await rdbStore!.querySql("SELECT * FROM test");
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0010 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0011
     * @tc.number testRdbStorePerfStat_0011
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0011 start *************");
      let observer = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect('INSERT INTO test(age,name,salary) VALUES (?,?,?)').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      };
      let observer1 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect('INSERT INTO test(age,name,salary) VALUES (?,?,?)').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      };
      rdbStore!.onPerfStat(observer)
      rdbStore!.onStatistics(observer1)
      const valueBucket1: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18 as long,
        "salary": 100.5 as long,
      }
      await rdbStore!.insert("test", valueBucket1)
      rdbStore!.offStatistics();
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0011 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0012
     * @tc.number testRdbStorePerfStat_0012
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0012 start *************");
      let observer = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect('INSERT INTO test(age,name,salary) VALUES (?,?,?)').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      };
      let observer1 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
      };
      rdbStore!.onStatistics(observer1)
      rdbStore!.offStatistics()
      await Utils.msSleep(1000);
      rdbStore!.onPerfStat(observer)
      const valueBucket1: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18 as long,
        "salary": 100.5 as long,
      }
      await rdbStore!.insert("test", valueBucket1);
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0012 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0013
     * @tc.number testRdbStorePerfStat_0013
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0013 start *************");
      let observer = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect(SqlExeInfo.sql.length > 0).assertTrue();
      };
      let observer1 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
      };
      rdbStore!.onPerfStat(observer1)
      rdbStore!.offPerfStat()
      rdbStore!.onStatistics(observer)
      const valueBucket1: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18 as long,
        "salary": 100.5 as long,
      }
      await rdbStore!.insert("test", valueBucket1)
      await Utils.msSleep(1000);
      rdbStore!.offStatistics();
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0013 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0014
     * @tc.number testRdbStorePerfStat_0014
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0014 start *************");
      let observer1 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
      };
      let observer2 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
      };

      rdbStore!.onPerfStat(observer1)
      rdbStore!.offPerfStat()
      rdbStore!.onPerfStat(observer2)
      rdbStore!.offPerfStat()
      await Utils.msSleep(1000);
      await rdbStore!.querySql("SELECT * FROM test");
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0014 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0015
     * @tc.number testRdbStorePerfStat_0015
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0015 start *************");
      let observer1 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
      };
      let observer2 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
      };

      rdbStore!.onPerfStat(observer1)
      rdbStore!.offPerfStat(observer1)
      rdbStore!.onPerfStat(observer2)
      await Utils.msSleep(1000);
      await rdbStore!.querySql("SELECT * FROM test");
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0015 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0016
     * @tc.number testRdbStorePerfStat_0016
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0016 start *************");
      let store2: relationalStore.RdbStore | undefined = undefined;
      let STORE_CONFIG2: relationalStore.StoreConfig = {
        name: 'test2.db',
        securityLevel: relationalStore.SecurityLevel.S1
      };
      store2 = await relationalStore.getRdbStore(context!, STORE_CONFIG2)
      await store2.executeSql(CREATE_TABLE_TEST);
      let timerId = -1;
      let observer1 = (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        expect('INSERT INTO test(age,name,salary) VALUES (?,?,?)').assertEqual(sqlExecutionInfo.sql[0]);
        expect(1).assertEqual(sqlExecutionInfo.sql.length);
        if (timerId > 0) {
          clearTimeout(timerId);
          expect().assertFail();
        }
        timerId = setTimeout(done, 2000);
      };
      rdbStore!.onPerfStat(observer1)

      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18 as long,
        'salary': 25000 as long,
      };
      let rowId = await rdbStore!.insert('test', valueBucket);
      expect(2).assertEqual(rowId);
      let rowId2 = await store2.insert('test', valueBucket);
      expect(1).assertEqual(rowId2);
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0016 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0017
     * @tc.number testRdbStorePerfStat_0017
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0017 start *************");
      let store2: relationalStore.RdbStore | undefined = undefined;
      let STORE_CONFIG2: relationalStore.StoreConfig = {
        name: 'test2.db',
        securityLevel: relationalStore.SecurityLevel.S1
      };
      let timerId = -1;
      let observer1 = (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        if (timerId = -1) {
          clearTimeout(timerId);
          expect().assertFail();
        }
      };
      rdbStore!.onPerfStat(observer1)
      store2 = await relationalStore.getRdbStore(context!, STORE_CONFIG2)
      timerId = setTimeout(done, 2000);
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0017 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0018
     * @tc.number testRdbStorePerfStat_0018
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0018 start *************");
      let observer1 = (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        expect(4).assertEqual(sqlExecutionInfo.sql.length);
      };
      rdbStore!.onPerfStat(observer1)

      const rdbTrans = await rdbStore!.createTransaction();
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18 as long,
        'salary': 25000 as long,
      };
      await rdbTrans.insert('test', valueBucket1)
      await rdbTrans.insert("test", valueBucket1)
      await rdbTrans.commit();
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0018 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0019
     * @tc.number testRdbStorePerfStat_0019
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0019 start *************");
      let observer = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
      };

      await rdbStore!.close();
      try {
        rdbStore!.onPerfStat(observer);
      } catch (err) {
        expect(err.code).assertEqual(14800014);
      }
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0019 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0020
     * @tc.number testRdbStorePerfStat_0020
     * @tc.desc 1. Register callback for perfStat
     *          2. Update data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0020 start *************");
      let observer = (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        expect(1).assertEqual(sqlExecutionInfo.sql.length);
      };
      rdbStore!.onPerfStat(observer);
      const valueBucket1: relationalStore.ValuesBucket = {
        'id': 1 as long,
        'name': 'zhangsan',
        'age': 13 as long,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'id': 2 as long,
        'name': 'zhangsan',
        'age': 13 as long,
      };
      const valueBucket3: relationalStore.ValuesBucket = {
        'id': 5 as long,
        'name': 'zhangsan',
        'age': 13 as long,
      };
      let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket1, valueBucket2, valueBucket3);
      await rdbStore!.batchInsert("test", valueBuckets);
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0020 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0021
     * @tc.number testRdbStorePerfStat_0021
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0021 start *************");
      let observer = (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        expect('INSERT OR REPLACE INTO test (age,id,name) VALUES (?,?,?),...,3').assertEqual(sqlExecutionInfo.sql[1]);
        expect(3).assertEqual(sqlExecutionInfo.sql.length);
      };
      rdbStore!.onPerfStat(observer);
      const rdbTrans = await rdbStore!.createTransaction();
      const valueBucket1: relationalStore.ValuesBucket = {
        'id': 1 as long,
        'name': 'zhangsan',
        'age': 13 as long,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'id': 2 as long,
        'name': 'zhangsan',
        'age': 13 as long,
      };
      const valueBucket3: relationalStore.ValuesBucket = {
        'id': 5 as long,
        'name': 'zhangsan',
        'age': 13 as long,
      };
      let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket1, valueBucket2, valueBucket3);
      await rdbTrans.batchInsert("test", valueBuckets);
      await rdbTrans.commit();
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0021 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0022
     * @tc.number testRdbStorePerfStat_0022
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0022 start *************");
      let observer = (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        expect('INSERT OR REPLACE INTO test (age,name) VALUES (?,?),...,30000').assertEqual(sqlExecutionInfo.sql[1]);
        expect(3).assertEqual(sqlExecutionInfo.sql.length);
      };
      rdbStore!.onPerfStat(observer);
      const rdbTrans = await rdbStore!.createTransaction();

      let valueBuckets : relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 13 as long,
      };
      for (let i = 0; i < 30000; i++) {
        valueBuckets.push(valueBucket1)
      }
      await rdbTrans.batchInsert("test", valueBuckets);
      await rdbTrans.commit();
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0022 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0023
     * @tc.number testRdbStorePerfStat_0023
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0023 start *************");
      if (!relationalStore.isVectorSupported()) {
        done()
        return
      }
      let observer = (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
      };
      let STORE_CONFIG1: relationalStore.StoreConfig = {
        name: 'rdbStore2.db',
        securityLevel: relationalStore.SecurityLevel.S1,
        vector: true,
      };
      let rdbStore1 = await relationalStore.getRdbStore(context!, STORE_CONFIG1)
      try{
        rdbStore1.onPerfStat(observer);
        expect().assertFail();
      } catch (err){
        expect(err.code).assertEqual(801);
      }
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0023 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat_0024
     * @tc.number testRdbStorePerfStat_0024
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorePerfStat_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStorePerfStat_0024 start *************");
      if (!relationalStore.isVectorSupported()) {
        done()
        return
      }
      let observer = (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
      };
      let STORE_CONFIG1: relationalStore.StoreConfig = {
        name: 'rdbStore2.db',
        securityLevel: relationalStore.SecurityLevel.S1,
        vector: true,
      };
      let rdbStore1 = await relationalStore.getRdbStore(context!, STORE_CONFIG1)
      try{
        rdbStore1.offPerfStat(observer);
        expect().assertFail();
      } catch (err){
        expect(err.code).assertEqual(801);
      }
      done();
      console.log(TAG + "************* testRdbStorePerfStat_0024 end *************");
    })
  })
}