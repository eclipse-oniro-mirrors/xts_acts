
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size,TestType } from '@ohos/hypium'
import relationalStore from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


const TAG = "[STAGE_RELATIONAL_STORE_JSKITS_TEST]";
let rdbStore:relationalStore.RdbStore | undefined = undefined;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL)";
const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL)";

const SQL_DELETE_TABLE = 'DELETE FROM test';
const SQL_DELETE_TABLE1 = 'DELETE FROM test1';

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

export default function PerfStatEtsTest() {
  describe('perfStatEtsTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore?.executeSql(CREATE_TABLE_TEST);
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000,
      };
      await rdbStore?.insert('test', valueBucket);
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      try {
        rdbStore?.off('perfStat');
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message)
      }
      await relationalStore.deleteRdbStore(context, "rdbStore.db");
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })


    /**
     * @tc.name testRdbStorePerfStat0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_0100
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0001 start *************");
      try{
        rdbStore?.on('perfStat', async (SqlExeInfo) => {
          expect('INSERT INTO test(age,name,salary) VALUES (?,?,?)').assertEqual(SqlExeInfo.sql[0]);
          console.log(TAG + "executeTime:" +SqlExeInfo.executeTime)
          console.log(TAG + "prepareTime:" +SqlExeInfo.prepareTime)
          console.log(TAG + "totalTime:" +SqlExeInfo.totalTime)
          console.log(TAG + "waitTime:" +SqlExeInfo.waitTime)
          console.log(TAG + "SqlExeInfo.sql[0]:" +SqlExeInfo.sql[0])
          expect(1).assertEqual(SqlExeInfo.sql.length);
          done()
        })
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000,
      };
      await rdbStore?.insert('test', valueBucket);
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0001 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_0200
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0002 start *************");
      try {
        rdbStore?.on('perfStat', async (SqlExeInfo) => {
          expect('UPDATE test SET age=?,name=?,salary=? WHERE id = ? ').assertEqual(SqlExeInfo.sql[0]);
          expect(1).assertEqual(SqlExeInfo.sql.length);
          done()
        })
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'lisi',
          'age': 18,
          'salary': 25000,
        };
        let predicates = new relationalStore.RdbPredicates('test');
        predicates.equalTo('id', 1);
        await rdbStore?.update(valueBucket, predicates);
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0002 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_0300
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0003 start *************");
      try{
      rdbStore?.on('perfStat', async (SqlExeInfo) => {
        expect('DELETE FROM test WHERE id = ? ').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
        done()
      })
      let predicates = new relationalStore.RdbPredicates('test');
      predicates.equalTo('id', 1);
        await rdbStore?.delete(predicates);
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0003 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_0400
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0004 start *************");
      try{
      rdbStore?.on('perfStat', async (SqlExeInfo) => {
        expect('CREATE TABLE IF NOT EXISTS EMPLOYEE (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
        done()
      })
      const SQL_CREATE_TABLE1 = "CREATE TABLE IF NOT EXISTS EMPLOYEE (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "name TEXT NOT NULL)";
      await rdbStore?.executeSql(SQL_CREATE_TABLE1)
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0004 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_0500
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0005 start *************");
      try {
        rdbStore?.on('perfStat', async (SqlExeInfo) => {
          expect('PRAGMA quick_check').assertEqual(SqlExeInfo.sql[0]);
          expect(1).assertEqual(SqlExeInfo.sql.length);
          done()
        })
        await rdbStore?.execute("PRAGMA quick_check")
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0005 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_0600
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0006 start *************");
      try {
        rdbStore?.on('perfStat', async (SqlExeInfo) => {
          expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
          expect(1).assertEqual(SqlExeInfo.sql.length);
          done()
        })
        let predicates = new relationalStore.RdbPredicates('test');
        await rdbStore?.query(predicates);
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0006 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_0700
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0007 start *************");
      try {
        rdbStore?.on('perfStat', async (SqlExeInfo) => {
          expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
          expect(1).assertEqual(SqlExeInfo.sql.length);
          done()
        })
        await rdbStore?.querySql("SELECT * FROM test");
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0007 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_0800
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0008 start *************");
      try {
        rdbStore?.on('perfStat', async (SqlExeInfo) => {
          expect('with test1 as (select * from test) select * from test').assertEqual(SqlExeInfo.sql[0]);
          expect(1).assertEqual(SqlExeInfo.sql.length);
          done()
        })
        await rdbStore?.querySql("with test1 as (select * from test) select * from test");
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0008 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_0900
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0009 start *************");
      try {
        let observer1 = (SqlExeInfo: relationalStore.SqlExecutionInfo) => {
          expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
          expect(1).assertEqual(SqlExeInfo.sql.length);
          done()
        };
        rdbStore?.on('perfStat', observer1)
        await rdbStore?.querySql("SELECT * FROM test");
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0009 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_1000
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0010 start *************");
      try{
      let observer1 = async (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
        await new Promise<void>(resolve => setTimeout(resolve, 2000));
        done()
      };

      let observer2 = async (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
        await new Promise<void>(resolve => setTimeout(resolve, 2000));
        done()
      };
      rdbStore?.on('perfStat', observer1)
      rdbStore?.on('perfStat', observer2)
      await rdbStore?.querySql("SELECT * FROM test");
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0010 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_1100
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0011 start *************");
      try {
        let observer = (SqlExeInfo: relationalStore.SqlExecutionInfo) => {
          expect('INSERT INTO test(age,name,salary) VALUES (?,?,?)').assertEqual(SqlExeInfo.sql[0]);
          expect(1).assertEqual(SqlExeInfo.sql.length);
          done()
        };
        let observer1 = (SqlExeInfo: relationalStore.SqlExecutionInfo) => {
          expect('INSERT INTO test(age,name,salary) VALUES (?,?,?)').assertEqual(SqlExeInfo.sql[0]);
          expect(1).assertEqual(SqlExeInfo.sql.length);
          done()
        };
        rdbStore?.on('perfStat', observer)
        rdbStore?.on('statistics', observer1)
        const valueBucket1: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
        }
        await rdbStore?.insert("test", valueBucket1)
        rdbStore?.off('statistics')
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0011 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_1200
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0012',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0012 start *************");
      try{
      let observer = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect('INSERT INTO test(age,name,salary) VALUES (?,?,?)').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
        done()
      };
      let observer1 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
        done()
      };
      rdbStore?.on('statistics', observer1)
      rdbStore?.off('statistics')
      await new Promise<void>(resolve => setTimeout(resolve, 1000));
      rdbStore?.on('perfStat', observer)
      const valueBucket1: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      await rdbStore?.insert("test", valueBucket1);
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0012 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0013
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_1300
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0013',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0013 start *************");
      try {
        let observer = (SqlExeInfo: relationalStore.SqlExecutionInfo) => {
          expect(SqlExeInfo.sql.length > 0).assertTrue();
          done()
        };
        let observer1 = (SqlExeInfo: relationalStore.SqlExecutionInfo) => {
          expect().assertFail();
          done()
        };
        rdbStore?.on('perfStat', observer1)
        rdbStore?.off('perfStat')
        rdbStore?.on('statistics', observer)
        const valueBucket1: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
        }
        await rdbStore?.insert("test", valueBucket1)
        await new Promise<void>(resolve => setTimeout(resolve, 1000));
        rdbStore?.off('statistics')
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0013 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_1400
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0014',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0014 start *************");
      try{
      let observer1 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
        done();
      };
      let observer2 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
        done();
      };

      rdbStore?.on('perfStat', observer1)
      rdbStore?.off('perfStat')
      rdbStore?.on('perfStat', observer2)
      rdbStore?.off('perfStat')
      await new Promise<void>(resolve => setTimeout(resolve, 1000));
        let resultSet = await rdbStore?.querySql("SELECT * FROM test");
        console.log(TAG + "resultSet.rowCount"+resultSet?.rowCount)
        expect(resultSet?.rowCount).assertEqual(1)
        done();
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0014 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0015
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_1500
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0015',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0015 start *************");
      try{
      let observer1 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
        done()
      };
      let observer2 = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
        expect(1).assertEqual(SqlExeInfo.sql.length);
        done()
      };
      rdbStore?.on('perfStat', observer1)
      rdbStore?.off('perfStat', observer1)
      rdbStore?.on('perfStat', observer2)
      await new Promise<void>(resolve => setTimeout(resolve, 1000));
      await rdbStore?.querySql("SELECT * FROM test");
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0015 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0016
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_1600
     * @tc.desc 1. Register callback for perfStat

     */
    it('testRdbStorePerfStat0016',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0016 start *************");
      try{
      let store2: relationalStore.RdbStore | undefined = undefined;
      let STORE_CONFIG2: relationalStore.StoreConfig = {
        name: 'test2.db',
        securityLevel: relationalStore.SecurityLevel.S1
      };
      store2 = await relationalStore.getRdbStore(context, STORE_CONFIG2)
      await store2?.executeSql(CREATE_TABLE_TEST);
      let timerId = -1;
      let observer1 = async (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        expect('INSERT INTO test(age,name,salary) VALUES (?,?,?)').assertEqual(sqlExecutionInfo.sql[0]);
        expect(1).assertEqual(sqlExecutionInfo.sql.length);
        if (timerId > 0) {
          clearTimeout(timerId);
          expect().assertFail();
        }
        timerId = setTimeout(done, 2000);
      };
      rdbStore?.on('perfStat',observer1)

      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000,
      };
      await rdbStore?.insert('test', valueBucket);
      await store2?.insert('test', valueBucket);
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0016 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0017
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_1700
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0017',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0017 start *************");
      try{
      let store2: relationalStore.RdbStore | undefined = undefined;
      let STORE_CONFIG2: relationalStore.StoreConfig = {
        name: 'test2.db',
        securityLevel: relationalStore.SecurityLevel.S1
      };
      let timerId = -1;
      let observer1 = async (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        if (timerId = -1) {
          clearTimeout(timerId);
          expect().assertFail();
        }
      };
      rdbStore?.on('perfStat',observer1)
      store2 = await relationalStore.getRdbStore(context, STORE_CONFIG2)
      timerId = setTimeout(done, 2000);
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0017 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0018
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_1800
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0018',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0018 start *************");
      try{
      let observer1 = async (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        expect(8).assertEqual(sqlExecutionInfo.sql.length);
        done()
      };
      rdbStore?.on('perfStat',observer1)
      const rdbTrans = await rdbStore?.createTransaction();
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18,
        'salary': 25000,
      };
        const valueBucket2: relationalStore.ValuesBucket = {
          'name': 'zhangsan1',
          'age': 18,
          'salary': 25000,
        };
        let valueBuckets = new Array(valueBucket1, valueBucket2);
        await rdbTrans?.insert('test', valueBucket1);
        await rdbTrans?.insertSync("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        await rdbTrans?.batchInsert("test", valueBuckets);
        await rdbTrans?.batchInsertSync("test", valueBuckets);
        await rdbTrans?.batchInsertWithConflictResolution("test", valueBuckets,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        await rdbTrans?.batchInsertWithConflictResolutionSync("test", valueBuckets,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        await rdbTrans?.commit();
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0018 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0019
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_1900
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0019',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0019 start *************");
      let observer = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
      };
      rdbStore?.close();
      try {
        rdbStore?.on('perfStat', observer);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message)
        expect(err.code).assertEqual("14800014");
        done();
      }
      console.log(TAG + "************* testRdbStorePerfStat0019 end *************");
    })

    /**
     * @tc.name testRdbStorePerfStat0020
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_2000
     * @tc.desc 1. Register callback for perfStat
     *          2. Update data
     */
    it('testRdbStorePerfStat0020',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0020 start *************");
      try{
      let observer = (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
        expect(1).assertEqual(sqlExecutionInfo.sql.length);
        done()
      };
      rdbStore?.on('perfStat', observer);
      const valueBucket1: relationalStore.ValuesBucket = {
        'id': 1,
        'name': 'zhangsan',
        'age': 13,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'id': 2,
        'name': 'zhangsan',
        'age': 13,
      };
      const valueBucket3: relationalStore.ValuesBucket = {
        'id': 5,
        'name': 'zhangsan',
        'age': 13,
      };
      let valueBuckets = new Array(valueBucket1, valueBucket2, valueBucket3);
      await rdbStore?.batchInsert("test", valueBuckets);
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRdbStorePerfStat0020 end *************");
    })
    /**
     * @tc.name testRdbStorePerfStat0021
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_2100
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0021',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0021 start *************");
      let observer = (SqlExeInfo : relationalStore.SqlExecutionInfo) => {
        expect().assertFail();
      };
      rdbStore?.close();
      try {
        rdbStore?.off('perfStat', observer);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err:" + err.code +err.message);
        expect(err.code).assertEqual("14800014");
        done();
      }
      console.log(TAG + "************* testRdbStorePerfStat0021 end *************");
    })
    /**
     * @tc.name testRdbStorePerfStat0022
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_2200
     * @tc.desc 1. Register callback for perfStat
     */
    it('testRdbStorePerfStat0022',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStorePerfStat0022 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST1);
      try{
        let observer1 = async (sqlExecutionInfo : relationalStore.SqlExecutionInfo) => {
          expect(13).assertEqual(sqlExecutionInfo.sql.length);
          done()
        };
        rdbStore?.on('perfStat',observer1)

        const rdbTrans = await rdbStore?.createTransaction();
        const valueBucket1: relationalStore.ValuesBucket = {
          'name': 'zhangsan',
          'age': 18,
          'salary': 25000,
        };
        await rdbTrans?.insert('test', valueBucket1)
        let predicates = new relationalStore.RdbPredicates('TEST');
        predicates.equalTo("NAME", "Lisa");
        await rdbTrans?.update(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        await rdbTrans?.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        await rdbTrans?.delete(predicates);
        await rdbTrans?.deleteSync(predicates);
        await rdbTrans?.query(predicates);
        await rdbTrans?.querySync(predicates);
        await rdbTrans?.querySql("SELECT * FROM TEST");
        await rdbTrans?.querySqlSync("SELECT * FROM TEST");
        await rdbTrans?.execute(SQL_DELETE_TABLE);
        await rdbTrans?.executeSync(SQL_DELETE_TABLE1);
        await rdbTrans?.rollback();
      }catch(err){
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStorePerfStat0022 end *************");
    })
  })
}