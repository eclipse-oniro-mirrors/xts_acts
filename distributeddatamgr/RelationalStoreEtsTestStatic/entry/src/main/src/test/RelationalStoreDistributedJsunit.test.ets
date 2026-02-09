/*
 * Copyright (C) 2021-2025 Huawei Device Co., Ltd.
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
import data_Rdb from '@ohos.data.relationalStore';
import common from "@ohos.app.ability.common";
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const ERRCODE = 801;
let context: common.UIAbilityContext;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let sqlStatement = "CREATE TABLE IF NOT EXISTS employee (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT," +
  "name TEXT NOT NULL," + "age INTEGER)"
sqlStatement = "CREATE TABLE IF NOT EXISTS product (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT," +
  "name TEXT NOT NULL," + "price REAL," +
  "vendor INTEGER," + "describe TEXT)"
const TAG = "testTag"
const STORE_NAME = "distributed_rdb.db"
let rdbStore: data_Rdb.RdbStore;
let config: data_Rdb.StoreConfig = {
  "name": STORE_NAME,
  securityLevel: data_Rdb.SecurityLevel.S1
}

async function executeSql1(rdbStore: data_Rdb.RdbStore) {
  let sqlStatement = "CREATE TABLE IF NOT EXISTS employee (" +
    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
    "name TEXT NOT NULL," +
    "age INTEGER)"
  try {
    await rdbStore.executeSql(sqlStatement)
    console.info(TAG + "create table employee success")
  } catch (err) {
    console.info(TAG + "create table employee failed")
    expect(null).assertFail()
  }
}

async function executeSql2(rdbStore: data_Rdb.RdbStore) {
  let sqlStatement = "CREATE TABLE IF NOT EXISTS product (" +
    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
    "name TEXT NOT NULL," +
    "price REAL," +
    "vendor INTEGER," +
    "describe TEXT)"
  try {
    await rdbStore!.executeSql(sqlStatement)
    console.info(TAG + "create table product success")
  } catch (err) {
    console.info(TAG + "create table product failed")
    expect(null).assertFail()
  }
}

async function executeSql3(rdbStore: data_Rdb.RdbStore) {
  let sqlStatement = "CREATE TABLE IF NOT EXISTS test (" +
    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
    "name TEXT NOT NULL," +
    "price REAL," +
    "vendor INTEGER," +
    "describe TEXT)"
  try {
    await rdbStore!.executeSql(sqlStatement)
    console.info(TAG + "create table product success")
  } catch (err) {
    console.info(TAG + "create table product failed")
    expect(null).assertFail()
  }
}

function storeObserver(devices: Array<string>) {
  console.info(TAG + devices + " dataChange");
  expect(devices).assertEqual(null)
}

function detailsObserver(progressDetails: data_Rdb.ProgressDetails) {
  console.info(TAG + progressDetails + " AutoSyncProgress");
  expect(progressDetails).assertEqual(null)
}

function sqlObserver(sqlExecutionInfo: data_Rdb.SqlExecutionInfo) {
  console.info(TAG + sqlExecutionInfo + " onStatistics");
  expect(sqlExecutionInfo).assertEqual(null)
}

function Observer() {
  console.info(TAG + " Observer");
}

export default function relationalStoreDistributedTest() {
  describe('relationalStoreDistributedTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
    })

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await data_Rdb.getRdbStore(context, config);
      console.info(TAG + "create RelationalStore store success");
      await executeSql1(rdbStore);
      await executeSql2(rdbStore);
      await executeSql3(rdbStore);
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach')
      await data_Rdb.deleteRdbStore(context, config);
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll')
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   testRdbStoreDistributed0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0100
     * @tc.desc   RelationalStore set distributed table using none table as argment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributed002 start *************");
        try {
          await rdbStore!.setDistributedTables([])
          console.info(TAG + "set none to be distributed table success");
          expect(rdbStore !== null).assertTrue();
        } catch (err) {
          console.info(TAG + "setDistributed002 failed" + `, error code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(ERRCODE);
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed002 end *************");
      })

    /**
     * @tc.name   testRdbStoreDistributed0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0200
     * @tc.desc   set distributed table using one table name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributed003 start *************");
        try {
          await rdbStore!.setDistributedTables(['employee'])
          console.info(TAG + "set employee to be distributed table success");
          expect(rdbStore !== null).assertTrue();
        } catch (err) {
          console.info(TAG + "setDistributed003 failed" + `, error code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(ERRCODE);
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed003 end *************");
      })

    /**
     * @tc.name   testRdbStoreDistributed0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0300
     * @tc.desc   set distributed table using two table name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributed004 start *************");
        try {
          await rdbStore!.setDistributedTables(['employee', 'product'])
          console.info(TAG + "set employee and product to be distributed table success");
          expect(rdbStore !== null).assertTrue();
        } catch (err) {
          console.info(TAG + "setDistributed004 failed" + `, error code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(ERRCODE);
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed004 end *************");
      })

    /**
     * @tc.name   testRdbStoreDistributed0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0400
     * @tc.desc   insert record after setting distributed table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributed005 start *************");
        const record: data_Rdb.ValuesBucket = {
          "name": "Jim",
          "age": 20 as Long,
        }
        try {
          let rowId = await rdbStore!.insert("employee", record)
          console.info(TAG + "insert one record success " + rowId)
          expect(1).assertEqual(rowId)
        } catch (err) {
          console.info(TAG + "insert one record failed" + err);
          expect(null).assertFail();
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed005 end *************");
      })

    /**
     * @tc.name   testRdbStoreDistributed0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0500
     * @tc.desc   update record after setting distributed table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributed006 start *************");
        const record1: data_Rdb.ValuesBucket = {
          "name": "Jim",
          "age": 20 as Long,
        }
        const record2: data_Rdb.ValuesBucket = {
          "name": "Jim",
          "age": 30 as Long,
        }
        await rdbStore!.insert("employee", record1);
        try {
          let predicate = new data_Rdb.RdbPredicates("employee");
          predicate.equalTo("id", 1 as Long);
          try {
            let rowId = await rdbStore!.update(record2, predicate);
            console.info(TAG + "update one record success " + rowId)
            expect(1).assertEqual(rowId)
          } catch (err) {
            console.info(TAG + "update one record failed" + err);
            expect(null).assertFail();
          }
        } catch (err) {
          console.info(TAG + "construct predicate failed");
          expect(null).assertFail();
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed006 end *************");
      })

    /**
     * @tc.name   testRdbStoreDistributed0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0600
     * @tc.desc   query record after setting distributed table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributed0007 start *************");
        const record1: data_Rdb.ValuesBucket = {
          "name": "Jim",
          "age": 30 as Long,
        }
        await rdbStore!.insert("employee", record1);
        try {
          let predicates = new data_Rdb.RdbPredicates("employee")
          let resultSet = await rdbStore!.query(predicates)
          try {
            console.info(TAG + "product resultSet query done");
            expect(true).assertEqual(resultSet.goToFirstRow())
            const id: Long = resultSet.getLong(resultSet.getColumnIndex("id"))
            const name: string = resultSet.getString(resultSet.getColumnIndex("name"))
            const age: Long = resultSet.getLong(resultSet.getColumnIndex("age"))

            expect(1).assertEqual(id);
            expect("Jim").assertEqual(name);
            expect(30).assertEqual(age);
            resultSet.close();
            // expect(true).assertEqual(resultSet.isClosed)
          } catch (err) {
            console.info(TAG + "result get value failed")
            expect(null).assertFail();
          }
        } catch (err) {
          console.info("query failed");
          expect(null).assertFail();
        }
        done();
        console.info(TAG + "************* testRdbStoreDistributed0007 end *************");
      })


    /**
     * @tc.name   testRdbStoreDistributed0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0700
     * @tc.desc   delete record after setting distributed table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributed0008 start *************");
        const record1: data_Rdb.ValuesBucket = {
          "name": "Jim",
          "age": 20 as Long,
        }
        await rdbStore!.insert("employee", record1);
        let predicates = new data_Rdb.RdbPredicates("employee")
        try {
          let numberr: Long = await rdbStore!.delete(predicates)
          console.info(TAG + "employee Delete done: " + numberr)
          expect(1).assertEqual(numberr)
        } catch (err) {
          console.info(TAG + "delete record failed");
          expect(null).assertFail()
        }
        done();
        console.info(TAG + "************* testRdbStoreDistributed0008 end *************");
      })

    /**
     * @tc.name   testRdbStoreDistributed0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0800
     * @tc.desc   predicates inDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributed0009 start *************");
        let predicates = new data_Rdb.RdbPredicates("employee")
        try {
          let pr = predicates.inDevices(["1234567890"]);
          console.info(TAG + "inDevices success");
          expect(pr !== null).assertTrue();
          done();
        } catch (err) {
          console.info(TAG + "inDevices failed");
          expect(null).assertFail();
          done();
        }
        console.info(TAG + "************* testRdbStoreDistributed0009 end *************");
      })

    /**
     * @tc.name   testRdbStoreDistributed0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0900
     * @tc.desc   predicates inAllDevices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributed0010 start *************");
        let predicates = new data_Rdb.RdbPredicates("employee")
        try {
          predicates = predicates.inAllDevices();
          console.info(TAG + "inAllDevices success");
          expect(predicates !== null).assertTrue();
        } catch (err) {
          console.info(TAG + "inAllDevices failed");
          expect(null).assertFail();
        }
        done();
        console.info(TAG + "************* testRdbStoreDistributed0010 end *************");
      })

    /**
     * @tc.name   testRdbStoreDistributed0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1000
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributed0011 start *************");
        let predicates: data_Rdb.RdbPredicates = new data_Rdb.RdbPredicates("employee");
        let pr = predicates.inDevices(["12345678abcd"]);
        await rdbStore!.sync(data_Rdb.SyncMode.SYNC_MODE_PUSH, predicates).then((res)=>{
          console.info(TAG + "testRdbStoreDistributed0011-111 err.code:");
          expect(true).assertFail();
        }).catch((err:Error)=>{
          console.info(TAG + "testRdbStoreDistributed0011-2222 err.code:" + err.code + " err.msg:" + err.message);
          expect(err.code).assertEqual(14800000);
        });

        try {
          await rdbStore!.sync(data_Rdb.SyncMode.SYNC_MODE_PULL, predicates);
          expect(true).assertFail();
        } catch(err:BusinessError) {
          console.info(TAG + "testRdbStoreDistributed0011-2 err.code:" + err.code + " err.msg:" + err.message);
          expect(err.code).assertEqual(14800000);
        }
        done();
        console.info(TAG + "************* testRdbStoreDistributed0011 end *************");
      })

    /**
     * @tc.name   testRdbStoreDistributedCallback0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1100
     * @tc.desc   sync Callback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributedCallback0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributedCallback0011 start *************");
        let predicates: data_Rdb.RdbPredicates = new data_Rdb.RdbPredicates("employee");
        predicates = predicates.inDevices(["12345678abcd"]);
        rdbStore!.sync(data_Rdb.SyncMode.SYNC_MODE_PUSH, predicates,
          (err: BusinessError|null, ret: Array<[String, Int]>|undefined) => {
            if (err != undefined) {
              console.info(TAG + "testRdbStoreDistributedCallback0011-1 err.code:" + err.code + "err.msg:" + err.message)
              expect(err.code).assertEqual(14800000)
            }
            console.info(TAG + "sync push success");
            rdbStore!.sync(data_Rdb.SyncMode.SYNC_MODE_PULL, predicates,
              (err: BusinessError|null, ret: Array<[String, Int]>|undefined) => {
                if (err != undefined) {
                  console.info(TAG + "testRdbStoreDistributedCallback0011-2 err.code:" + err.code + "err.msg:" + err.message)
                  expect(err.code).assertEqual(14800000)
                }
                console.info(TAG + "sync push success");
                done();
              });
          });
        console.info(TAG + "************* testRdbStoreDistributedCallback0011 end *************");
      })

    /**
     * @tc.name   testRdbStoreDistributed0012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1200
     * @tc.desc   subscribe test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbStoreDistributed0012 start *************");
        try {
          rdbStore!.onDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_REMOTE, storeObserver);
          console.info(TAG + "on onDataChange success ");
        } catch (err) {
          console.info(TAG + "on onDataChange " + err);
          expect(err !== null).assertFalse();
        }
        try {
          rdbStore!.onAutoSyncProgress(detailsObserver);
          console.info(TAG + "on onAutoSyncProgress success ");
        } catch (err) {
          console.info(TAG + "on onAutoSyncProgress " + err);
          expect(err !== null).assertFalse();
        }
        try {
          rdbStore!.onStatistics(sqlObserver);
          console.info(TAG + "on onStatistics success ");
        } catch (err) {
          console.info(TAG + "on onStatistics " + err);
          expect(err !== null).assertFalse();
        }

        try {
          rdbStore!.on('test', false, Observer);
          console.info(TAG + "on success ");
        } catch (err) {
          console.info(TAG + "on " + err);
          expect(err !== null).assertFalse();
        }

        try {
          rdbStore!.offDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_REMOTE, storeObserver);
          console.info(TAG + " offDataChange success ");
        } catch (err) {
          console.info(TAG + " offDataChange " + err);
          expect(err !== null).assertFalse();
        }
        try {
          rdbStore!.offAutoSyncProgress(detailsObserver);
          console.info(TAG + " offAutoSyncProgress success ");
        } catch (err) {
          console.info(TAG + " offAutoSyncProgress " + err);
          expect(err !== null).assertFalse();
        }
        try {
          rdbStore!.offStatistics(sqlObserver);
          console.info(TAG + "offStatistics success ");
        } catch (err) {
          console.info(TAG + "offStatistics " + err);
          expect(err !== null).assertFalse();
        }
        try {
          rdbStore!.off('test', false, Observer);
          console.info(TAG + "off success ");
        } catch (err) {
          console.info(TAG + "off " + err);
          expect(err !== null).assertFalse();
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed0012 end *************");
      })

    /**
     * @tc.name   testRdbStoreDistributed0013
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1300
     * @tc.desc   subscribe test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      console.info(TAG + "************* testRdbStoreDistributed0013 start *************");
      try {
        rdbStore!.offDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_REMOTE, storeObserver);
        console.info(TAG + "off dataChange success ");
      } catch (err) {
        console.info(TAG + "off dataChange " + err);
        expect(err !== null).assertFalse();
      }
      done()
      console.info(TAG + "************* testRdbStoreDistributed0013 end *************");
    })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_016
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1600
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void): void => {
        let predicates = new data_Rdb.RdbPredicates("employee");
        predicates = predicates.inDevices(["12345678abcd"]);
        console.info(TAG + `SYNC_MODE_TIME_FIRST = ` + data_Rdb.SyncMode.SYNC_MODE_TIME_FIRST);
        expect(data_Rdb.SyncMode.SYNC_MODE_TIME_FIRST).assertEqual(4);
        console.info(TAG + "DATA_CHANGE = " + data_Rdb.ChangeType.DATA_CHANGE);
        expect(data_Rdb.ChangeType.DATA_CHANGE).assertEqual(0);
        console.info(TAG + "ASSET_CHANGE = " + data_Rdb.ChangeType.ASSET_CHANGE);
        expect(data_Rdb.ChangeType.ASSET_CHANGE).assertEqual(1);
        try {
          rdbStore!.sync(data_Rdb.SyncMode.SYNC_MODE_TIME_FIRST, predicates,
            (err, result) => {
              expect(true).assertFail();
            })
        } catch (error) {
          console.error(TAG + `failed, code is ${error.code},message is ${error.message}`);
          expect(error.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_017
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1700
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void): void => {
        let predicates = new data_Rdb.RdbPredicates("employee")
        predicates = predicates.inDevices(["12345678abcd"]);
        console.info(TAG + `SYNC_MODE_NATIVE_FIRST = ` + data_Rdb.SyncMode.SYNC_MODE_NATIVE_FIRST);
        expect(data_Rdb.SyncMode.SYNC_MODE_NATIVE_FIRST).assertEqual(5);
        try {
          rdbStore!.sync(data_Rdb.SyncMode.SYNC_MODE_NATIVE_FIRST, predicates, (err, result) => {
            expect(true).assertFail();
          })
        } catch (error) {
          console.error(TAG + `failed, code is ${error.code},message is ${error.message}`);
          expect(error.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_018
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1800
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void): void => {
        let predicates = new data_Rdb.RdbPredicates("employee")
        predicates = predicates.inDevices(["12345678abcd"]);
        console.info(TAG + `SYNC_MODE_CLOUD_FIRST = ` + data_Rdb.SyncMode.SYNC_MODE_CLOUD_FIRST);
        expect(data_Rdb.SyncMode.SYNC_MODE_CLOUD_FIRST).assertEqual(6);
        try {
          rdbStore!.sync(data_Rdb.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates, (err, result) => {
            expect(true).assertFail();
          })
        } catch (error) {
          console.error(TAG + `failed, code is ${error.code},message is ${error.message}`);
          expect(error.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_019
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1900
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void): void => {
        try {
          rdbStore!.onDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD, (devices) => {
            console.info(TAG + devices + " dataChange");
            expect(devices).assertEqual(null);
          });
        } catch (err) {
          console.info(TAG + "on dataChange " + err);
          expect(err !== null).assertFalse();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_020
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_2000
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void): void => {
        try {
          rdbStore!.onDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS, (table) => {
            console.info(TAG + table + " dataChange");
            expect(table).assertEqual(null);
          });
        } catch (err) {
          console.info(TAG + "on dataChange " + err);
          expect(err !== null).assertFalse();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_021
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_2100
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void): void => {
        try {
          rdbStore!.onDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS, (type) => {
            console.info(TAG + type + " dataChange");
            expect(type).assertEqual(null);
          });
        } catch (err) {
          console.info(TAG + "on dataChange " + err);
          expect(err !== null).assertFalse();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_022
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_2200
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void): void => {
        const Observer: (inserted: string[]) => void = (inserted: string[]) => {
          console.info(TAG + inserted + " dataChange");
          expect(inserted).assertEqual(null);
        }
        try {
          rdbStore!.onDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS, Observer);
        } catch (err) {
          console.info(TAG + "on dataChange " + err);
          expect(err !== null).assertFalse();
        }
        done();
      })


    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_023
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_023
     * @tc.desc   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void): void => {
        try {
          rdbStore!.onDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS, (updated) => {
            console.info(TAG + updated + " dataChange");
            expect(updated).assertEqual(null);
          });
        } catch (err) {
          console.info(TAG + "on dataChange " + err);
          expect(err !== null).assertFalse();
        }
        done();
      })


    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_024
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_024
     * @tc.desc   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void): void => {
        try {
          rdbStore!.onDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS, (deleted) => {
            console.info(TAG + deleted + " dataChange");
            expect(deleted).assertEqual(null);
          });
        } catch (err) {
          console.info(TAG + "on dataChange " + err);
          expect(err !== null).assertFalse();
        }
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_025
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_2500
     * @tc.desc   set distributed table type DISTRIBUTED_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + '************* SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_025 start *************');
        try {
          rdbStore!.setDistributedTables(['employee'], data_Rdb.DistributedType.DISTRIBUTED_DEVICE,
            (err: BusinessError | null, ret: Array<[String, Int]> | undefined) => {
              if (err) {
                console.error(TAG + `SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                expect(null).assertFail();
                console.log(TAG + '************* SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_025 end *************');
                done();
              }
              console.info(TAG + `SetDistributedTables successfully.`);
              expect(err == undefined).assertTrue();
              console.log(TAG + '************* SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_025 end *************');
              done();
            })
        } catch (err) {
          console.info(TAG + "set employee to be distributed table failed");
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_026
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_2600
     * @tc.desc   set distributed table type DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + '************* SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_026 start *************');
        try {
          rdbStore!.setDistributedTables(['test'], data_Rdb.DistributedType.DISTRIBUTED_CLOUD,
            (err: BusinessError | null, ret: Array<[String, Int]> | undefined) => {
              if (err) {
                console.error(TAG + `SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                expect(null).assertFail();
                console.log(TAG + '************* SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_026 end *************');
                done();
              }
              console.info(TAG + `SetDistributedTables successfully.`);
              expect(err == undefined).assertTrue();
              console.log(TAG + '************* SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_026 end *************');
              done();
            })
        } catch (err) {
          console.info(TAG + "set employee and product to be distributed table failed");
          expect(null).assertFail();
        }
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_027
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_2700
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          rdbStore!.onDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, (table) => {
            console.info(TAG + table + " dataChange");
            expect(table).assertEqual(null);
          });
        } catch (err) {
          console.info(TAG + "on dataChange " + err);
          expect(err !== null).assertFalse();
        }
        done();

      })
    console.info(TAG + "*************Unit Test End*************");
  })
}
