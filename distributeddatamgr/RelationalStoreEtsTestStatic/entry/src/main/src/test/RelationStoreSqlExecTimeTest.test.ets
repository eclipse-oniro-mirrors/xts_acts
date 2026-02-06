/*
 * Copyright (C) 2024-2026 Huawei Device Co., Ltd.
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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from "../../../hypium";
import relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';

let TAG = "testTag";
let rdbStore: relationalStore.RdbStore | undefined = undefined;
let context: common.UIAbilityContext | undefined;
const STORE_NAME = "statistics.db"
const CREATE_TABLE_SQL = "CREATE TABLE IF NOT EXISTS test (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const config: relationalStore.StoreConfig = {
  'name': STORE_NAME,
  securityLevel: relationalStore.SecurityLevel.S1,
};

export default function SqlExecutionTimeTest() {
  describe('SqlExecutionTimeTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext
      rdbStore = await relationalStore.getRdbStore(context!, config);

    })

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      if (rdbStore == undefined) {
        return;
      }
      await rdbStore!.executeSql(CREATE_TABLE_SQL);
      try {
        const valueBucket1: relationalStore.ValuesBucket = {
          'name': 'zhangSan',
          'age': 18 as Long,
          'salary': 25000 as Long,
          'blobType': new Uint8Array([1, 2, 3]),
        };
        let rowId: Long = await rdbStore!.insert('test', valueBucket1);
        expect(1).assertEqual(rowId);
      } catch (error) {
        console.error(TAG + `failed, code:${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
      if (rdbStore == undefined) {
        return;
      }
      try {
        rdbStore!.offStatistics();
      } catch (error) {
        console.error(TAG + `unRegister fail3, code:${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      await rdbStore!.executeSql("drop table test");
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      rdbStore = undefined;
      await relationalStore.deleteRdbStore(context!, config);
    })

    /**
     * @tc.name   testRdbStoreStatistics0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0110
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0001 start *************");
        if (rdbStore == undefined) {
          return;
        }
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            console.info(TAG + "totalTime is : " + SqlExeInfo.totalTime);
            console.info(TAG + "prepareTime is : " + SqlExeInfo.prepareTime);
            console.info(TAG + "waitTime is : " + SqlExeInfo.waitTime);
            console.info(TAG + "executeTime is : " + SqlExeInfo.executeTime);
            expect('INSERT INTO test(age,blobType,name,salary) VALUES (?,?,?,?)').assertEqual(SqlExeInfo.sql[0]);
            done();
          });
        } catch (error) {
          console.error(TAG + `on statistics fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        try {
          const valueBucket1: relationalStore.ValuesBucket = {
            'name': 'LiSi',
            'age': 18 as Long,
            'salary': 25000 as Long,
            'blobType': new Uint8Array([1, 2, 3]),
          };
          let rowId = await rdbStore!.insert('test', valueBucket1);
          expect(2).assertEqual(rowId);
        } catch (error) {
          console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        done();
        console.info(TAG + "************* testRdbStoreStatistics0001 end *************");
      })

    /**
     * @tc.name   testRdbStoreStatistics0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0120
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0002 start *************");
        if (rdbStore == undefined) {
          return;
        }
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            console.info(TAG + "totalTime is : " + SqlExeInfo.totalTime);
            console.info(TAG + "prepareTime is : " + SqlExeInfo.prepareTime);
            console.info(TAG + "waitTime is : " + SqlExeInfo.waitTime);
            console.info(TAG + "executeTime is : " + SqlExeInfo.executeTime);
            expect('INSERT INTO test(age,blobType,name,salary) VALUES (?,?,?,?)').assertEqual(SqlExeInfo.sql[0]);
            done();
          });
        } catch (error) {
          console.error(TAG + `on statistics fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        try {
          const valueBucket1: relationalStore.ValuesBucket = {
            'name': 'LiSi',
            'age': 18 as Long,
            'salary': 25000 as Long,
            'blobType': new Uint8Array([1, 2, 3]),
          };
          let rowId = rdbStore!.insertSync('test', valueBucket1);
          expect(2).assertEqual(rowId);
        } catch (error) {
          console.error(TAG + `insertSync fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        done();
        console.info(TAG + "************* testRdbStoreStatistics0002 end *************");
      })


    /**
     * @tc.name   testRdbStoreStatistics0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0130
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0003 start *************");
        if (rdbStore == undefined) {
          return;
        }
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            console.info(TAG + "totalTime is : " + SqlExeInfo.totalTime);
            console.info(TAG + "prepareTime is : " + SqlExeInfo.prepareTime);
            console.info(TAG + "waitTime is : " + SqlExeInfo.waitTime);
            console.info(TAG + "executeTime is : " + SqlExeInfo.executeTime);
            expect('UPDATE test SET age=?,blobType=?,name=?,salary=? WHERE id = ? ').assertEqual(SqlExeInfo.sql[0]);
            done();
          });
        } catch (error) {
          console.error(TAG + `on statistics fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        try {
          const valueBucket1: relationalStore.ValuesBucket = {
            'name': 'wangWu',
            'age': 18 as Long,
            'salary': 25000 as Long,
            'blobType': new Uint8Array([1, 2, 3]),
          };
          let predicates = new relationalStore.RdbPredicates('test');
          predicates.equalTo('id', 1 as Long);
          let rowId = await rdbStore!.update(valueBucket1, predicates);
          expect(1).assertEqual(rowId);
        } catch (error) {
          console.error(TAG + `update fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        done();
        console.info(TAG + "************* testRdbStoreStatistics0003 end *************");
      })

    /**
     * @tc.name   testRdbStoreStatistics0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0140
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0004 start *************");
        if (rdbStore == undefined) {
          return;
        }
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            console.info(TAG + "totalTime is : " + SqlExeInfo.totalTime);
            console.info(TAG + "prepareTime is : " + SqlExeInfo.prepareTime);
            console.info(TAG + "waitTime is : " + SqlExeInfo.waitTime);
            console.info(TAG + "executeTime is : " + SqlExeInfo.executeTime);
            expect('UPDATE test SET age=?,blobType=?,name=?,salary=? WHERE id = ? ').assertEqual(SqlExeInfo.sql[0]);
            done();
          });
        } catch (error) {
          console.error(TAG + `on statistics fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        try {
          const valueBucket1: relationalStore.ValuesBucket = {
            'name': 'wangWu',
            'age': 18 as Long,
            'salary': 25000 as Long,
            'blobType': new Uint8Array([1, 2, 3]),
          };
          let predicates = new relationalStore.RdbPredicates('test');
          predicates.equalTo('id', 1 as Long);
          let rowId = rdbStore!.updateSync(valueBucket1, predicates);
          expect(1).assertEqual(rowId);
        } catch (error) {
          console.error(TAG + `updateSync fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        done();
        console.info(TAG + "************* testRdbStoreStatistics0004 end *************");
      })

    /**
     * @tc.name   testRdbStoreStatistics0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0150
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0005 start *************");
        if (rdbStore == undefined) {
          return;
        }
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            console.info(TAG + "totalTime is : " + SqlExeInfo.totalTime);
            console.info(TAG + "prepareTime is : " + SqlExeInfo.prepareTime);
            console.info(TAG + "waitTime is : " + SqlExeInfo.waitTime);
            console.info(TAG + "executeTime is : " + SqlExeInfo.executeTime);
            expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
            done();
          });
        } catch (error) {
          console.error(TAG + `on statistics fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        try {
          let predicates = new relationalStore.RdbPredicates('test');
          let result: relationalStore.ResultSet = await rdbStore!.query(predicates);
          expect(1).assertEqual(result.rowCount);
        } catch (error) {
          console.error(TAG + `query fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        done();
        console.info(TAG + "************* testRdbStoreStatistics0005 end *************");
      })


    /**
     * @tc.name   testRdbStoreStatistics0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0160
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0006 start *************");
        if (rdbStore == undefined) {
          return;
        }
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            console.info(TAG + "totalTime is : " + SqlExeInfo.totalTime);
            console.info(TAG + "prepareTime is : " + SqlExeInfo.prepareTime);
            console.info(TAG + "waitTime is : " + SqlExeInfo.waitTime);
            console.info(TAG + "executeTime is : " + SqlExeInfo.executeTime);
            expect('SELECT * FROM test').assertEqual(SqlExeInfo.sql[0]);
            done();
          });
        } catch (error) {
          console.error(TAG + `on statistics fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        try {
          let predicates = new relationalStore.RdbPredicates('test');
          let result: relationalStore.ResultSet = rdbStore!.querySync(predicates);
          expect(1).assertEqual(result.rowCount);
        } catch (error) {
          console.error(TAG + `querySync fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        done();
        console.info(TAG + "************* testRdbStoreStatistics0006 end *************");
      })

    /**
     * @tc.name   testRdbStoreStatistics0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0170
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0007 start *************");
        if (rdbStore == undefined) {
          return;
        }
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            console.info(TAG + "totalTime is : " + SqlExeInfo.totalTime);
            console.info(TAG + "prepareTime is : " + SqlExeInfo.prepareTime);
            console.info(TAG + "waitTime is : " + SqlExeInfo.waitTime);
            console.info(TAG + "executeTime is : " + SqlExeInfo.executeTime);
            expect('DELETE FROM test').assertEqual(SqlExeInfo.sql[0]);
            done();
          });
        } catch (error) {
          console.error(TAG + `on statistics fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        try {
          let predicates = new relationalStore.RdbPredicates('test');
          let rowId = await rdbStore!.delete(predicates);
          expect(1).assertEqual(rowId);
        } catch (error) {
          console.error(TAG + `delete fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        done();
        console.info(TAG + "************* testRdbStoreStatistics0007 end *************");
      })

    /**
     * @tc.name   testRdbStoreStatistics0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0180
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0008 start *************");
        if (rdbStore == undefined) {
          return;
        }
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            console.info(TAG + "totalTime is : " + SqlExeInfo.totalTime);
            console.info(TAG + "prepareTime is : " + SqlExeInfo.prepareTime);
            console.info(TAG + "waitTime is : " + SqlExeInfo.waitTime);
            console.info(TAG + "executeTime is : " + SqlExeInfo.executeTime);
            expect('DELETE FROM test').assertEqual(SqlExeInfo.sql[0]);
            done();
          });
        } catch (error) {
          console.error(TAG + `on statistics fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        try {
          let predicates = new relationalStore.RdbPredicates('test');
          let rowId = rdbStore!.deleteSync(predicates);
          expect(1).assertEqual(rowId);
        } catch (error) {
          console.error(TAG + `deleteSync fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        done();
        console.info(TAG + "************* testRdbStoreStatistics0008 end *************");
      })

    /**
     * @tc.name   testRdbStoreStatistics0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0190
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0009 start *************");
        if (rdbStore == undefined) {
          return;
        }
        const CREATE_TABLE_SQL1 = "CREATE TABLE IF NOT EXISTS test1 (" +
          "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            console.info(TAG + "totalTime is : " + SqlExeInfo.totalTime);
            console.info(TAG + "prepareTime is : " + SqlExeInfo.prepareTime);
            console.info(TAG + "waitTime is : " + SqlExeInfo.waitTime);
            console.info(TAG + "executeTime is : " + SqlExeInfo.executeTime);
            expect(CREATE_TABLE_SQL1).assertEqual(SqlExeInfo.sql[0]);
            done();
          });
        } catch (error) {
          console.error(TAG + `register fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        try {
          await rdbStore!.executeSql(CREATE_TABLE_SQL1);
          rdbStore!.offStatistics();
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "Amy",
            "age": 18 as Long,
            "salary": 100.5,
            "blobType": new Uint8Array([1, 2, 3]),
          };
          let rowId = await rdbStore!.insert("test1", valueBucket);
          expect(1).assertEqual(rowId);
          await rdbStore!.executeSql("drop table test1");
        } catch (error) {
          console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        done();
        console.info(TAG + "************* testRdbStoreStatistics0009 end *************");
      })


    /**
     * @tc.name   testRdbStoreStatistics0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0200
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0010 start *************");
        if (rdbStore == undefined) {
          return;
        }
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            console.info(TAG + "totalTime is : " + SqlExeInfo.totalTime);
            console.info(TAG + "prepareTime is : " + SqlExeInfo.prepareTime);
            console.info(TAG + "waitTime is : " + SqlExeInfo.waitTime);
            console.info(TAG + "executeTime is : " + SqlExeInfo.executeTime);
            expect('select * from test').assertEqual(SqlExeInfo.sql[0]);
            done();
          })
        } catch (error) {
          console.error(TAG + `on statistics fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }

        await rdbStore!.querySql("select * from test");
        console.info(TAG + "************* testRdbStoreStatistics0010 end *************");
        done();
      })


    /**
     * @tc.name   testRdbStoreStatistics0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0210
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0011 start *************");
        if (rdbStore == undefined) {
          return;
        }
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            console.info(TAG + "totalTime is : " + SqlExeInfo.totalTime);
            console.info(TAG + "prepareTime is : " + SqlExeInfo.prepareTime);
            console.info(TAG + "waitTime is : " + SqlExeInfo.waitTime);
            console.info(TAG + "executeTime is : " + SqlExeInfo.executeTime);
            expect(SqlExeInfo.sql.length).assertEqual(1);
            done();
          });
        } catch (error) {
          console.error(TAG + `register fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        try {
          let u8 = new Uint8Array([1, 2, 3]);
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "LILI",
            "age": 18 as Long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: Array<relationalStore.ValuesBucket> = [];
          for (let i = 0; i < 1000; i++) {
            valueBucketArray.push(valueBucket);
          }
          let rowId = await rdbStore!.batchInsert("test", valueBucketArray);
          expect(1000).assertEqual(rowId);
        } catch (error) {
          console.error(TAG + `batchInsert fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        console.info(TAG + "************* testRdbStoreStatistics0011 end *************");
        done();
      })

    /**
     * @tc.name   testRdbStoreStatistics0012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SqlExeInfoJsAPITest_0220
     * @tc.desc   1. Register callback for statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRdbStoreStatistics0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreStatistics0012 start *************");
        if (rdbStore == undefined) {
          return;
        }
        try {
          rdbStore!.onStatistics((SqlExeInfo) => {
            expect().assertFail();
          });
        } catch (error) {
          console.error(TAG + `register fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        try {
          rdbStore!.offStatistics(undefined);
          console.info(TAG + 'off statistics is success')
        } catch (error) {
          expect().assertFail();
          done();
        }
        try {
          let u8 = new Uint8Array([1, 2, 3]);
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "LILI",
            "age": 18 as Long,
            "salary": 100.5,
            "blobType": u8,
          };
          let rowId = await rdbStore!.insert("test", valueBucket);
          expect(2).assertEqual(rowId);
        } catch (error) {
          console.error(TAG + `batchInsert fail, code:${error.code}, message: ${error.message}`);
          expect().assertFail();
          done();
        }
        done();
        console.info(TAG + "************* testRdbStoreStatistics0012 end *************");
      })
  })
}