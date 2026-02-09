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


import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import dataSharePredicates from '@ohos.data.dataSharePredicates';


let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let context: common.UIAbilityContext | undefined;
let domain: int = 0x0000;
let tag: string = 'testTag';
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG :data_relationalStore.StoreConfig = {
  name: "test.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
const CREATE_TABLE_TESTTRANS = "CREATE TABLE IF NOT EXISTS testTrans (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT" + ")";

const DROP_TABLE_TESTTRANS = "DROP TABLE IF EXISTS testTrans";

const TABLE_NAME = "testTrans"

let STORE_CONFIG1 :data_relationalStore.StoreConfig = {
  name: "test1.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  encrypt:false,
}
const CREATE_TABLE_TESTERRCODE = "CREATE TABLE IF NOT EXISTS testerrcode (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 TEXT NOT NULL," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TESTERRCODE = "DROP TABLE IF EXISTS testerrcode";

let STORE_CONFIG2 :data_relationalStore.StoreConfig = {
  name: "test2.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let rdbStore : data_relationalStore.RdbStore | undefined;
let rdbStore1 : data_relationalStore.RdbStore
let rdbStore2 : data_relationalStore.RdbStore
let vbs :Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(3);
const valueBucket0 :data_relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long,//
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket1 :data_relationalStore.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
const valueBucket2 :data_relationalStore.ValuesBucket = {
  "data1": "hello world",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}

const valueBucket4 :data_relationalStore.ValuesBucket = {
  "data1": "333",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}
vbs[0] = valueBucket0
vbs[1] = valueBucket1
vbs[2] = valueBucket2

const valueBucket3 :data_relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 100 as long,//
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}

let options:data_relationalStore.TransactionOptions = {
  transactionType:data_relationalStore.TransactionType.DEFERRED
}

const STORE_CONFIG3:data_relationalStore.StoreConfig  = {
  name: "rdbstore3.db",
  encrypt: true,
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

export default function RelationStoreRdbStoreTest() {
  describe('RelationStoreRdbStoreTest', ():void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000)
      context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
    })
    beforeEach(async (): Promise<void> => {
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(DROP_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_TEST);
    })

    afterAll(async ():Promise<void>  => {
      await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    })

    afterEach(async():Promise<void>  => {
      await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    })

    /**
     * @tc.name       testInsert0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_0100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testInsert0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testInsert0001 start *************');
      try{
        let num = await rdbStore!.insert("test", valueBucket0);
        expect(num == 1).assertEqual(true);
        done();
      }catch(err){
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testInsert0001 end *************');
    })

    /**
     * @tc.name       testInsert0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_0200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testInsert0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testInsert0003 start *************');
      try{
        let num = await rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(num == 1).assertEqual(true);
        done();
      }catch(err){
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testInsert0003 end *************');
    })
    /**
     * @tc.name       testInsert0003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_0300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testInsert0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testInsert0005 start *************');
      try {
        let num = await rdbStore!.insert("test", valueBucket0, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect(num == 1).assertEqual(true);
      } catch (err) {
        err = err as BusinessError;
        console.error(`Insert is failed, code is ${err.code},message is ${err.message}`);
        expect(err != null ).assertFail();
      }
      done();
    })

    /**
     * @tc.name       testInsert0004
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_0400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testInsert0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testInsert0004 start *************');
      try{
        let num = await rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_IGNORE );
        expect(num == 1).assertEqual(true);
        done();
      }catch(err){
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testInsert0004 end *************');
    })
    /**
     * @tc.name       testInsert0005
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_0500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testInsert0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testInsert0005 start *************');
      try{
        let num = await rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_FAIL );
        expect(num == 1).assertEqual(true);
        done();
      }catch(err){
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testInsert0005 end *************');
    })
    /**
     * @tc.name       testInsert0006
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_0600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testInsert0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testInsert0006 start *************');
      try{
        let num = await rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_ABORT );
        expect(num == 1).assertEqual(true);
        done();
      }catch(err){
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testInsert0006 end *************');
    })
    /**
     * @tc.name       testInsert0007
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_0700
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testInsert0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testInsert0007 start *************');
      try{
        let num = await rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        expect(num == 1).assertEqual(true);
        done();
      }catch(err){
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testInsert0007 end *************');
    })

    /**
     * @tc.name       testbatchInsert0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_0800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testbatchInsert0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testbatchInsert0001 start *************');
      try{
        let num = await rdbStore!.batchInsert("test", vbs);
        hilog.info(domain, tag, '%{public}s', '************* testbatchInsert0001 num *************'+num);
        expect(num == 3).assertEqual(true);
        done();
      }catch(err){
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testbatchInsert0001 end *************');
    })

    /**
     * @tc.name       testupdate0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_0900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testupdate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testupdate0001 start *************');
      let num = await rdbStore!.insert("test", valueBucket0);
      hilog.info(domain, tag, '%{public}s', '************* testupdate0001 end *************' +num);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rows:number = await rdbStore!.update(valueBucket3, predicates);
        expect(rows).assertEqual(1);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* testupdate0001 err *************' + err.code);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testupdate0001 end *************');
    })
    /**
     * @tc.name       testupdate0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_1000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testupdate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testupdate0002 start *************');
      let num =await rdbStore!.insert("test", valueBucket0);
      hilog.info(domain, tag, '%{public}s', '************* testupdate0002 end *************' +num);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rows:number = await rdbStore!.update(valueBucket3, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* testupdate0002 rows *************' + rows);
        expect(rows).assertEqual(1);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* testupdate0002 err *************' + err.code);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testupdate0002 end *************');
    })

    /**
     * @tc.name       testupdate0003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_1100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testupdate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testupdate0003 start *************');
      let num = await rdbStore!.insert("test", valueBucket0);
      hilog.info(domain, tag, '%{public}s', '************* testupdate0003 end *************' +num);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rows:number = await rdbStore!.update(valueBucket3, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* testupdate0003 rows *************' + rows);
        expect(rows).assertEqual(1);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* testupdate0003 err *************' + err.code);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testupdate0003 end *************');
    })

    /**
     * @tc.name       testdelete0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_1200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testdelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testdelete0001 start *************');
      let num = await rdbStore!.insert("test", valueBucket0);
      hilog.info(domain, tag, '%{public}s', '************* testdelete0001 end *************' +num);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rows =await rdbStore!.delete(predicates);
        hilog.info(domain, tag, '%{public}s', '************* testdelete0001 rows *************' + rows);
        expect(rows).assertEqual(1);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* testdelete0001 err *************' + err.code);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testInsert0028 end *************');
    })

    /**
     * @tc.name       testquery0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_1300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testquery0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testquery0001 start *************');
      let num = await rdbStore!.insert("test", valueBucket0);
      hilog.info(domain, tag, '%{public}s', '************* testquery0001 end *************' +num);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rows =await rdbStore!.query(predicates,["data1"]);
        hilog.info(domain, tag, '%{public}s', '************* testquery0001 rows.columnCount *************' + rows.columnCount);
        expect(rows.columnCount).assertEqual(1);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* testquery0001 err *************' + err.code);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testquery0001 end *************');
    })
    /**
     * @tc.name       testquery0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_1400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testquery0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testquery0002 start *************');
      let num = await rdbStore!.insert("test", valueBucket0);
      hilog.info(domain, tag, '%{public}s', '************* testquery0002 end *************' +num);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rows =await rdbStore!.query(predicates);
        hilog.info(domain, tag, '%{public}s', '************* testquery0002 rows.columnCount *************' + rows.rowCount);
        expect(rows.rowCount).assertEqual(1);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* testquery0002 err *************' + err.code);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testquery0002 end *************');
    })

    /**
     * @tc.name       tesquerySync0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_1500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('tesquerySync0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* tesquerySync0001 start *************');
      let num = await rdbStore!.insert("test", valueBucket0);
      hilog.info(domain, tag, '%{public}s', '************* tesquerySync0001 end *************' +num);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rows = rdbStore!.querySync(predicates, ["data1"]);
        hilog.info(domain, tag, '%{public}s', '************* tesquerySync0001 rows.columnCount *************' + rows.columnCount);
        expect(rows.columnCount).assertEqual(1);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* tesquerySync0001 err *************' + err.code);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* tesquerySync0001 end *************');
    })

    /**
     * @tc.name       tesquerySync0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_1600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('tesquerySync0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* tesquerySync0002 start *************');
      let num = await rdbStore!.insert("test", valueBucket0);
      hilog.info(domain, tag, '%{public}s', '************* tesquerySync0002 end *************' +num);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rows = rdbStore!.querySync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* tesquerySync0002 rows.columnCount *************' + rows.rowCount);
        expect(rows.rowCount).assertEqual(1);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* tesquerySync0002 err *************' + err.code);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* tesquerySync0002 end *************');
    })

    /**
     * @tc.name       testquerySql0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_1700
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testquerySql0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testquerySql0001 start *************');
      let num = await rdbStore!.insert("test", valueBucket0);
      hilog.info(domain, tag, '%{public}s', '************* testquerySql0001 end *************' +num);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rows = await rdbStore!.querySql("SELECT * FROM test WHERE data1 = ?", ['hello']);
        hilog.info(domain, tag, '%{public}s', '************* testquerySql0001 rows.rowCount *************' + rows.rowCount);
        expect(rows.rowCount).assertEqual(1);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* testquerySql0001 err *************' + err.code);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testquerySql0001 end *************');
    })

    /**
     * @tc.name       testexecute0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_1800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testexecute0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testexecute0001 start *************');
      let num =await rdbStore!.batchInsert("test", vbs);
      try{
        let rows = await rdbStore!.execute("PRAGMA integrity_check");
        hilog.info(domain, tag, '%{public}s', '************* testexecute0001 rows *************' + rows);
        expect(rows).assertEqual("ok");
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* testexecute0001 err *************' + err.code);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testexecute0001 end *************');
    })

    /**
     * @tc.name       testexecute0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_1900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testexecute0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testexecute0002 start *************');
      let num =await rdbStore!.batchInsert("test", vbs);
      try{
        let rows = await rdbStore!.execute("DELETE FROM test WHERE data1 = 'hello'")
        hilog.info(domain, tag, '%{public}s', '************* testexecute0002 rows *************' + rows);
        expect(rows == 1).assertEqual(true);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* testexecute0002 err *************' + err.code);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testexecute0002 end *************');
    })

    /**
     * @tc.name       testclose0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_2000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testclose0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testclose0001 start *************');
      let num =await rdbStore!.batchInsert("test", vbs);
      try{
        await rdbStore!.close();
        try{
          let rows = await rdbStore!.execute("PRAGMA integrity_check");
          hilog.info(domain, tag, '%{public}s', '************* testclose0001 rows *************' + rows);
          expect(rows == "ok").assertFail();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testclose0001 err2 *************' + err.code +err.message );
          expect(err.message).assertEqual("The RdbStore or ResultSet is already closed.");
          expect(err.code).assertEqual(14800014);
          done();
        }
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* testclose0001 err1 *************' + err.code +err.message );
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testclose0001 end *************');
    })


    /**
     * @tc.name       testRsultSetgoTo0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_2100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goTo(1)
        expect(res).assertEqual(true);
        done();
      }catch(err){
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0001 end *************');
    })
    /**
     * @tc.name       testRsultSetgoTo0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_2200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0002 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goTo(resultSet.rowCount);
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0002 resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(true);
        done();
      }catch(err){
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0002 end *************');
    })
    /**
     * @tc.name       testRsultSetgoTo0003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_2300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0003 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goTo(resultSet.rowCount + 1);
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0003 resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(false);
        done();
      }catch(err){
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0003 end *************');
    })
    /**
     * @tc.name       testRsultSetgoTo0004
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_2400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0004 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goTo(0);
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0004 resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(false);
        done();
      }catch(err){
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0004 end *************');
    })
    /**
     * @tc.name       testRsultSetgoTo0005
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_2500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoTo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0005 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goTo(-1);
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0005 resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(false);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0005 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0005 end *************');
    })

    /**
     * @tc.name       testRsultSetgoTo0006
     * @tc.number     testRsultSetgoTo0006
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoTo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0006 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.close();
        try {
          let res = resultSet.goTo(1)
          hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0006 res *************' + res);
          expect(res).assertEqual(false);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* testRsultSetgoTo0006 err *************' + err.code + err.message);
          expect(true).assertFail();
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoTo0006 end *************');
      })

    /**
     * @tc.name       testRsultSetgoToRow0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_2600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goToRow(-1);
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0001 resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(false);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0001 end *************');
    })
    /**
     * @tc.name       testRsultSetgoToRow0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_2700
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0002 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goToRow(0);
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0002  resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(true);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0002 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0002 end *************');
    })
    /**
     * @tc.name       testRsultSetgoToRow0003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_2800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0003 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goToRow(resultSet.rowCount);
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0003  resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(false);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0003 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0003 end *************');
    })
    /**
     * @tc.name       testRsultSetgoToRow0004
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_2900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToRow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0004 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goToRow(1);
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0004 resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(true);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0004 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0004 end *************');
    })
    /**
     * @tc.name       testRsultSetgoToRow0005
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_3000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToRow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0005 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goToRow(resultSet.rowCount + 1);
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0005 resultSet.rowCount *************' +resultSet.rowCount);
        expect(res).assertEqual(false);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0005 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0005 end *************');
    })
    /**
     * @tc.name       testRsultSetgoToRow0006
     * @tc.number     testRsultSetgoToRow0006
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToRow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0006 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.close();
        try {
          let res = resultSet.goToRow(-1);
          hilog.info(domain, tag, '%{public}s',
            '************* testRsultSetgoToRow0006 resultSet *************' + res);
          expect(res).assertEqual(false);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* testRsultSetgoToRow0006 err *************' + err.code + err.message);
          expect(true).assertFail();
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToRow0006 end *************');
      })

    /**
     * @tc.name       testRsultSetgoToFirstRow0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_3100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToFirstRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToFirstRow0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goToFirstRow();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToFirstRow0001 resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(true);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToFirstRow0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToFirstRow0001 end *************');
    })
    /**
     * @tc.name       testRsultSetgoToFirstRow0002
     * @tc.number     testRsultSetgoToFirstRow0002
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToFirstRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToFirstRow0002 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.close();
        try {
          let res = resultSet.goToFirstRow();
          hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToFirstRow0002 end *************' + res);
          expect(res).assertEqual(false);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* testRsultSetgoToFirstRow0002 end *************' + err.code + err.message);
          expect(true).assertFail();
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToFirstRow0002 end *************');
      })

    /**
     * @tc.name       testRsultSetgoToLastRow0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_3200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToLastRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToLastRow0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goToLastRow();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToLastRow0001 resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(true);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToLastRow0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToLastRow0001 end *************');
    })
    /**
     * @tc.name       testRsultSetgoToLastRow0002
     * @tc.number     testRsultSetgoToLastRow0002
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToLastRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToLastRow0002 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.close();
        try {
          let res = resultSet.goToLastRow();
          hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToLastRow0002 end *************' + res);
          expect(res).assertEqual(false);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* testRsultSetgoToLastRow0002 end *************' + err.code + err.message);
          expect(true).assertFail();
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToLastRow0002 end *************');
      })

    /**
     * @tc.name       testRsultSetgoToNextRow0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_3300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToNextRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToNextRow0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goToNextRow();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToNextRow0001 resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(true);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToNextRow0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToNextRow0001 end *************');
    })
    /**
     * @tc.name       testRsultSetgoToNextRow0002
     * @tc.number     testRsultSetgoToNextRow0002
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToNextRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToNextRow0002 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.close();
        try {
          let res = resultSet.goToNextRow();
          hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToNextRow0002 end *************' + res);
          expect(res).assertEqual(false);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* testRsultSetgoToNextRow0002 end *************' + err.code + err.message);
          expect(true).assertFail();
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToNextRow0002 end *************');
      })

    /**
     * @tc.name       testRsultSetgoToPreviousRow0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_3400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToPreviousRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.goToPreviousRow();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0001 resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(false);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0001  end *************');
    })
    /**
     * @tc.name       testRsultSetgoToPreviousRow0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_3500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToPreviousRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0002 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        resultSet.goTo(1);
        let res = resultSet.goToPreviousRow();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0002 resultSet.rowCount *************' + resultSet.rowCount);
        expect(res).assertEqual(false);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0002 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0002 end *************');
    })
    /**
     * @tc.name       testRsultSetgoToPreviousRow0003
     * @tc.number     testRsultSetgoToPreviousRow0003
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToPreviousRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0003 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.close();
        try {
          let res = resultSet.goToPreviousRow();
          hilog.info(domain, tag, '%{public}s',
            '************* testRsultSetgoToPreviousRow0003 resultSet *************' + res);
          expect(res).assertEqual(false);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* testRsultSetgoToPreviousRow0003 err *************' + err.code + err.message);
          expect(true).assertFail();
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0003 end *************');
      })
    /**
     * @tc.name       testRsultSetgoToPreviousRow0004
     * @tc.number     testRsultSetgoToPreviousRow0004
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgoToPreviousRow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0004 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.goTo(resultSet.rowCount);
        resultSet.close();
        try {
          let res = resultSet.goToPreviousRow();
          hilog.info(domain, tag, '%{public}s',
            '************* testRsultSetgoToPreviousRow0004 resultSet *************' + res);
          expect(res).assertEqual(false);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* testRsultSetgoToPreviousRow0004 err *************' + err.code + err.message);
          expect(true).assertFail();
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgoToPreviousRow0004 end *************');
      })

    /**
     * @tc.name       testRsultSetgetColumnIndex0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_3600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgetColumnIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetColumnIndex0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getColumnIndex("data1");
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetColumnIndex0001 end *************' +res);
        expect(res).assertEqual(1);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetColumnIndex0001 end *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetColumnIndex0001 end *************');
    })
    /**
     * @tc.name       testRsultSetgetColumnName0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_3700
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgetColumnName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetColumnName0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getColumnName(2);
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetColumnName0001 res *************' +res);
        expect(res).assertEqual("data2");
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetColumnName0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetColumnName0001 end *************');
    })

    /**
     * @tc.name       testRsultSetgetString0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_3800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgetString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetString0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        resultSet.goToFirstRow();
        let res = resultSet.getString(resultSet.getColumnIndex("data1"));
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetString0001 res *************' +res);
        expect(res).assertEqual("hello");
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetString0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetString0001 end *************');
    })

    /**
     * @tc.name       testRsultSetgetBlob0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_3900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgetBlob0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetBlob0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        resultSet.goToFirstRow();
        let res = resultSet.getBlob(resultSet.getColumnIndex("data4"));
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetBlob0001 res *************' +res);
        expect(JSON.stringify(res)).assertEqual('{"0":1,"1":2,"2":3}');
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetBlob0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetBlob0001 end *************');
    })

    /**
     * @tc.name       testRsultSetgetLong0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_4000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgetLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetLong0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        resultSet.goToFirstRow();
        let res = resultSet.getLong(resultSet.getColumnIndex("data2"));
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetLong0001 res *************' +res);
        expect(res).assertEqual(10);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetLong0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetLong0001 end *************');
    })
    /**
     * @tc.name       testRsultSetgetDouble0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_4100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgetDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetDouble0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        resultSet.goToFirstRow();
        let res = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetDouble0001 res *************' +res);
        expect(res).assertEqual(1);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetDouble0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetDouble0001 end *************');
    })

    /**
     * @tc.name       testRsultSetgetAsset0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_4200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgetAsset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetAsset0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        resultSet.goToFirstRow();
        let res = resultSet.getAsset(resultSet.getColumnIndex("data5"));
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetAsset0001 res *************' +res);
        expect(res.name).assertEqual("");
        expect(res.size).assertEqual("");
        expect(res.modifyTime).assertEqual("");
        expect(res.uri).assertEqual("");
        expect(res.path).assertEqual("");
        expect(res.createTime).assertEqual("");
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetAsset0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetAsset0001 end *************');
    })

    /**
     * @tc.name       testRsultSetgetAssets0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_4300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgetAssets0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetAssets0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        resultSet.goToFirstRow();
        let res = resultSet.getAssets(resultSet.getColumnIndex("data6"));
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetAssets0001 res.length *************' +res.length);
        expect(res.length == 0).assertEqual(true);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetAssets0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetAssets0001 end *************');
    })

    /**
     * @tc.name       testRsultSetgetValue0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_4400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgetValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetValue0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        resultSet.goToFirstRow();
        let res = resultSet.getValue(resultSet.getColumnIndex("data5"));
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetValue0001 res *************' +res);
        expect(res == null).assertEqual(true);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetValue0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetValue0001 end *************');
    })

    /**
     * @tc.name       testRsultSetgetRow0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_4500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetgetRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetRow0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        resultSet.goToFirstRow();
        let res = resultSet.getRow();
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetRow0001 JSON.stringify(res) *************' +JSON.stringify(res));
        expect(res["data1"]).assertEqual("hello");
        expect(res["data2"]).assertEqual(10);
        expect(res["data3"]).assertEqual(1);
        expect((res["data4"] as Uint8Array).length).assertEqual(3);
        expect(res["data5"]).assertEqual(null);
        expect(res["data6"]).assertEqual(null);
        expect(res["data7"]).assertEqual(null);
        expect(res["data8"]).assertEqual(null);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetRow0001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetgetRow0001 end *************');
    })

    /**
     * @tc.name       testRsultSetisColumnNull001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_4600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetisColumnNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetisColumnNull001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        resultSet.goToFirstRow();
        let res = resultSet.isColumnNull(resultSet.getColumnIndex("data5"));
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetisColumnNull001 res *************' +res);
        expect(res).assertEqual(true);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetisColumnNull001 err *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetisColumnNull001 end *************');
    })

    /**
     * @tc.name       testRsultSetclose001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_4800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRsultSetclose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetclose001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test");
      try{
        resultSet.close();
        try{
          let res = resultSet.goToFirstRow();
          expect(res != null  ).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testRsultSetclose001 end *************' + err );
          expect(err.message).assertEqual("The RdbStore or ResultSet is already closed.");
          expect(err.code).assertEqual(14800014);
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRsultSetclose001 end *************' + err );
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testRsultSetclose001 end *************');
    })


    /**
     * @tc.name       testPredicates0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_4900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0001 start *************');
      await rdbStore!.batchInsert("test", vbs);
      try{
        let predicates = new data_relationalStore.RdbPredicates("test");
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0001 end *************' + predicates);
        expect(predicates != null ).assertTrue();
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0001 end *************' + err);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0001 end *************');
    })
    /**
     * @tc.name       testPredicates0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_5000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0002 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.equalTo("data1", "hello");
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0002 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0002 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0002 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0002 end *************');
    })
    /**
     * @tc.name       testPredicates0003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_5100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0003 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.notEqualTo("data1", "hello");
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0003 end *************' + rows.rowCount);
          expect(rows.rowCount == 0).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0003 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0003 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0003 end *************');
    })

    /**
     * @tc.name       testPredicates0004
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_5200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0004 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.equalTo("data1", "hello"  ).beginWrap();
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0004 end *************' + rows.rowCount);
          expect(rows.rowCount == -1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0004 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0004 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0004 end *************');
    })

    /**
     * @tc.name       testPredicates0005
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_5300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0005 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.equalTo("data1", "hello").endWrap();
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0005 end *************' + rows.rowCount);
          expect(rows.rowCount == -1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0005 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0005 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0005 end *************');
    })


    /**
     * @tc.name       testPredicates0006
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_5400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0006 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.equalTo("data1", "hello").or().equalTo("data3", 1.0)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0006 rows *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0006 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0006 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0006 end *************');
    })

    /**
     * @tc.name       testPredicates0007
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_5500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0007 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.equalTo("data1", "hello").and().equalTo("data3", 1.0)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0007 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0007 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0007 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0007 end *************');
    })

    /**
     * @tc.name       testPredicates0008
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_5600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0008 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.contains("data1", "hello")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0008 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0008 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0008 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0008 end *************');
    })

    /**
     * @tc.name       testPredicates0009
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_5700
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0009 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.beginsWith("data1", "hello")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0009 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0009 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0009 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0009 end *************');
    })
    /**
     * @tc.name       testPredicates0010
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_5800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0010 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.endsWith("data1", "hello")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0010 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0010 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0010 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0009 end *************');
    })


    /**
     * @tc.name       testPredicates0011
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_5900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0011 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.isNull("data6")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0011 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0011 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0011 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0011 end *************');
    })

    /**
     * @tc.name       testPredicates0012
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_6000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0012 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.isNotNull("data2")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0012 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0012 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0012 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0012 end *************');
    })
    /**
     * @tc.name       testPredicates0013
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_6100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0013 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.like("data1", "%lo%");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0013 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0013 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0013 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0013 end *************');
    })
    /**
     * @tc.name       testPredicates0019
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_6150
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0019 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.like("data1", "%lo%");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0019 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0019 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0019 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0019 end *************');
    })

    /**
     * @tc.name       testPredicates0014
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_6200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0014 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.glob("data1", "*l?o");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0014 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0014 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0014 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0014 end *************');
    })

    /**
     * @tc.name       testPredicates0015
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_6300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0015 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.lessThan("data3", 2.0);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0015 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0015 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0015 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0015 end *************');
    })

    /**
     * @tc.name       testPredicates0016
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_6400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0016 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.between("data3", 0.0,20.0);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0016 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0016 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0016 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0016 end *************');
    })

    /**
     * @tc.name       testPredicates0017
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_6500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0017 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.notBetween("data3", 20.0,21.0);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0017 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0017 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0017 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0017 end *************');
    })

    /**
     * @tc.name       testPredicates0018
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_6600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.greaterThan("data2", "1");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 end *************');
    })
    /**
     * @tc.name       testPredicates0020
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_6700
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.greaterThanOrEqualTo("data3", 1.0);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 end *************');
    })
    /**
     * @tc.name       testPredicates0021
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_6800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0021 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.lessThanOrEqualTo("data3", 1.0);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0021 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0021 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 end *************');
    })
    /**
     * @tc.name       testPredicates0022
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_6900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0022 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.orderByAsc("data1");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0022 end *************' + rows.rowCount);
          expect(rows.rowCount == 3).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0022 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0022 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0018 end *************');
    })
    /**
     * @tc.name       testPredicates0023
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_7000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0023 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.orderByDesc("data1");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0023 end *************' + rows.rowCount);
          expect(rows.rowCount == 3).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0023 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0023 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0023 end *************');
    })

    /**
     * @tc.name       testPredicates0024
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_7100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0024 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.equalTo("data1", "hello").distinct();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0024 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0024 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0024 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0024 end *************');
    })

    /**
     * @tc.name       testPredicates0025
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_7200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0025 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.equalTo("data1", "hello").limitAs(3);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0025 end *************' + rows.rowCount);
          expect(rows.rowCount == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0025 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0025 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0025 end *************');
    })
    /**
     * @tc.name       testPredicates0026
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_7300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0026 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.equalTo("data1", "hello").limitAs(-1).offsetAs(3);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0026 end *************' + rows.rowCount);
          expect(rows.rowCount == 0).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0026 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0026 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0026 end *************');
    })

    /**
     * @tc.name       testPredicates0027
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_7400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0027 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.groupBy(["data1"]);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0027 end *************' + rows.rowCount);
          expect(rows.rowCount == 3).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0027 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0027 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0027 end *************');
    })

    /**
     * @tc.name       testPredicates0028
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_7500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0028 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.indexedBy("data2");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0028 end *************' + rows.rowCount);
          expect(rows.rowCount == -1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0028 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0028 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0028 end *************');
    })

    /**
     * @tc.name       testPredicates0029
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_7600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0029 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.inValues("data1",["hello", "2", "hello word"]);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0029 end *************' + rows.rowCount);
          expect(rows.rowCount == 2).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0029 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0029 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0029 end *************');
    })

    /**
     * @tc.name       testPredicates0030
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_7700
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testPredicates0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0030 start *************');
      await rdbStore!.batchInsert("test", vbs);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let res = predicates.notInValues("data1",["40", "50"]);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ;
        try{
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0030 end *************' + rows.rowCount);
          expect(rows.rowCount == 3).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* testPredicates0030 end *************' + err);
          expect(err != null ).assertFail();
          done();
        }
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testPredicates0030 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testPredicates0030 end *************');
    })

    /**
     * @tc.name       testTransaction0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_7800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        rdbTrans.delete(predicates).then((num:long)=>{
          expect(num == 1 ).assertTrue();
          await rdbTrans.commit();
          let num1 = await rdbStore!.query(predicates);
          expect(num1.rowCount == 0).assertTrue();
          done();
        }).catch((error) =>{
          hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 end *************' + error);
          expect(error != null ).assertFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 end *************');
    })


    /**
     * @tc.name       testTransaction0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_7900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0002 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        rdbTrans.delete(predicates).then((num:long)=>{
          expect(num == 1 ).assertTrue();
          await rdbTrans.rollback();
          let num1 = await rdbStore!.query(predicates);
          expect(num1.rowCount == 1).assertTrue();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 end *************' + err);
          expect(err != null ).assertFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0002 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0002 end *************');
    })

    /**
     * @tc.name       testTransaction0003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_8000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0003 start *************');
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        rdbTrans.insert("test", valueBucket0).then((num:long)=>{
          expect(num == 1 ).assertTrue();
          await rdbTrans.rollback();
          let num1 = await rdbStore!.querySql("select * from test");
          expect(num1.rowCount == 0 ).assertTrue();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 end *************' + err);
          expect(err != null ).assertFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0003 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0003 end *************');
    })

    /**
     * @tc.name       testTransaction0004
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_8100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0004 start *************');
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        rdbTrans.insert("test", valueBucket0).then((num:long)=>{
          expect(num == 1 ).assertTrue();
          await rdbTrans.commit();
          let num1 = await rdbStore!.query(predicates);
          expect(num1.rowCount == 1 ).assertTrue();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 end *************' + err);
          expect(err != null ).assertFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0004 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0004 end *************');
    })

    /**
     * @tc.name       testTransaction0005
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_8200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0005 start *************');
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        rdbTrans.batchInsert("test", vbs).then((num:long)=>{
          expect(num == 3 ).assertTrue();
          await rdbTrans.commit();
          let num1 =await rdbStore!.querySql("select * from test");
          expect(num1.rowCount == 3 ).assertTrue();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 end *************' + err);
          expect(err != null ).assertFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0005 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0005 end *************');
    })

    /**
     * @tc.name       testTransaction0006
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_8300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0006 start *************');
      rdbStore!.batchInsert("test", vbs);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        rdbTrans.update(valueBucket0,predicates).then((num:long)=>{
          expect(num == 1 ).assertTrue();
          await rdbTrans.commit();
          let num1 = await rdbStore!.querySql("select * from test");
          expect(num1.rowCount == 3 ).assertTrue();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 end *************' + err);
          expect(err != null ).assertFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0006 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0006 end *************');
    })
    /**
     * @tc.name       testTransaction0007
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_8400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0007 start *************');
      rdbStore!.batchInsert("test", vbs);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        rdbTrans.update(valueBucket0, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((num:long)=>{
          expect(num ==1 ).assertTrue();
          await rdbTrans.commit();
          let num1 =  await rdbStore!.querySql("select * from test");
          expect(num1.rowCount == 3 ).assertTrue();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 end *************' + err);
          expect(err != null ).assertFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0007 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0007 end *************');
    })

    /**
     * @tc.name       testTransaction0008
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_8500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0008 start *************');
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        rdbTrans.insert("test", valueBucket0, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((num:long)=>{
          expect(num == 1 ).assertTrue();
          await rdbTrans.commit();
          let num1 =await rdbStore!.query(predicates);
          expect(num1.rowCount == 1 ).assertTrue();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 end *************' + err);
          expect(err != null ).assertFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0008 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0008 end *************');
    })

    /**
     * @tc.name       testTransaction0009
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_8600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0009 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        let resultSet = await rdbTrans.query(predicates,['data1']);
        expect(resultSet.rowCount == 1 ).assertTrue();
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0009 num.rowCount *************' + resultSet.rowCount);
        await rdbTrans.commit();
        let num1 = await rdbStore!.query(predicates);
        expect(num1.rowCount == 1 ).assertTrue();
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0009 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0009 end *************');
    })

    /**
     * @tc.name       testTransaction0011
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_8700
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0011 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        let num =  rdbTrans.querySync(predicates,['data1']);
        expect(num.rowCount == 1 ).assertTrue();
        await rdbTrans.commit();
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0011 num.rowCount *************' + num.rowCount);
        let num1 = await rdbStore!.query(predicates);
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0011 num1.rowCount *************' + num1.rowCount);
        expect(num1.rowCount == 1 ).assertTrue();
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0011 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0011 end *************');
    })
    /**
     * @tc.name       testTransaction0012
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_8800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0012 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        let num = rdbTrans.querySync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0012 num *************' + num);
        expect(num.rowCount == 1 ).assertTrue();
        await rdbTrans.commit();
        let num1 = await rdbStore!.query(predicates);
        expect(num1.rowCount == 1 ).assertTrue();
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0012 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0012 end *************');
    })

    /**
     * @tc.name       testTransaction0013
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_8900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0013 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        rdbTrans.querySql("select * from test where data1 = 'hello'").then((resultSet:data_relationalStore.ResultSet)=>{
          expect(resultSet.rowCount == 1 ).assertTrue();
          await rdbTrans.commit();
          let num1 = await rdbStore!.query(predicates);
          expect(num1.rowCount == 1 ).assertTrue();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* testTransaction0013 end *************' + err);
          expect(err != null ).assertFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0013 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0013 end *************');
    })


    /**
     * @tc.name       testTransaction0015
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_9000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0013 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        rdbTrans.querySql("select * from test where data1 = 'hello'").then((resultSet:data_relationalStore.ResultSet)=>{
          expect(resultSet.rowCount == 1 ).assertTrue();
          await rdbTrans.commit();
          let num1 = await rdbStore!.query(predicates);
          expect(num1.rowCount == 1 ).assertTrue();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* testTransaction0001 end *************' + err);
          expect(err != null ).assertFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0013 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0013 end *************');
    })
    /**
     * @tc.name       testTransaction0014
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_9100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransaction0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0014 start *************');
      await rdbStore!.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      try{
        let rdbTrans = await rdbStore!.createTransaction(options);
        rdbTrans.querySql("select * from test where data1 = ?",['hello']).then((resultSet:data_relationalStore.ResultSet)=>{
          expect(resultSet.rowCount == 1 ).assertTrue();
          await rdbTrans.commit();
          let num1 = await rdbStore!.query(predicates);
          expect(num1.rowCount == 1 ).assertTrue();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* testTransaction0014 end *************' + err);
          expect(err != null ).assertFail();
          done();
        })
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testTransaction0014 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testTransaction0014 end *************');
    })
    /**
     * @tc.name       testVersion001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_9200
     * @tc.desc       rdbStore.version normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testVersion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testVersion001 start *************');
      try{
          rdbStore!.version = 1;
          hilog.info(domain, tag, '%{public}s', 'rdbStore.version' + rdbStore!.version);
          expect(rdbStore!.version).assertEqual(1);
          done();
        }catch(err){
          hilog.info(domain, tag, '%{public}s', '************* testVersion001 end *************' + err);
          expect().assertFail();
          done();
        }
      hilog.info(domain, tag, '%{public}s', '************* testVersion001 end *************');
    })
    /**
     * @tc.name       testVersion002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_9300
     * @tc.desc       rdbStore.version normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testVersion002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testVersion002 start *************');
      try{
        rdbStore!.version = -1;
        hilog.info(domain, tag, '%{public}s', 'rdbStore.version' + rdbStore!.version);
        expect(rdbStore!.version).assertEqual(-1);
        done();
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testVersion002 end *************' + err);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testVersion002 end *************');
    })
    /**
     * @tc.name       testGetRow001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_9400
     * @tc.desc       getRow 14800012
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testGetRow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetRow001 start *************');
      try{
        await rdbStore!.execute(CREATE_TABLE_TESTTRANS);
        hilog.info(domain, tag, '%{public}s', '777777');
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '7777777errrrrrrrr');
      }
      let resultSet = await rdbStore!.querySql("SELECT * FROM testTrans");
      try{
        resultSet.getRow();
        hilog.info(domain, tag, '%{public}s', '************* testGetRow001*************');
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* testGetRow001 end *************' + err + err.code);
        expect(err.code == 14800012).assertTrue();
      }
      await rdbStore!.execute(DROP_TABLE_TESTTRANS);
      done();
      hilog.info(domain, tag, '%{public}s', '************* testColumnNames001 end *************');
    })
    /**
     * @tc.name       testRowIndex001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_9500
     * @tc.desc       RowIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRowIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRowIndex001 start *************');
      try{
        await rdbStore!.execute(CREATE_TABLE_TESTTRANS);
        hilog.info(domain, tag, '%{public}s', '66666666');
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '66666666errrrrrrrr');
      }
      const valueBucket :data_relationalStore.ValuesBucket = {
       "name":"lisi"
      }
      try{
        await rdbStore!.insert("testTrans", valueBucket);
        hilog.info(domain, tag, '%{public}s', '************* testRowIndex001 insert success*************');
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRowIndex001 insert failed*************');
      }
      let resultSet = await rdbStore!.querySql("SELECT * FROM testTrans");
      resultSet.goToFirstRow();
      try{
        let res = resultSet.rowIndex;
        hilog.info(domain, tag, '%{public}s', '************* testRowIndex001 resultSet.rowIndex *************' + res);
        expect(res).assertEqual(0);
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testRowIndex001 end *************' + err);
        expect().assertFail();
      }
      await rdbStore!.execute(DROP_TABLE_TESTTRANS);
      done();
      hilog.info(domain, tag, '%{public}s', '************* testRowIndex001 end *************');
    })
    /**
     * @tc.name       testColumnNames001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_9600
     * @tc.desc       columnNames normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testColumnNames001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testColumnNames001 start *************');
      try{
        await rdbStore!.execute(CREATE_TABLE_TESTTRANS);
        hilog.info(domain, tag, '%{public}s', '777777');
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '7777777errrrrrrrr');
      }
      const valueBucket :data_relationalStore.ValuesBucket = {
        "name":"lisi"
      }
      try{
        await rdbStore!.insert("testTrans", valueBucket);
        hilog.info(domain, tag, '%{public}s', '************* testColumnNames001 insert success*************');
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testColumnNames001 insert failed*************');
      }
      let resultSet = await rdbStore!.querySql("SELECT * FROM testTrans");
      resultSet.goToFirstRow();
      try{
        let res = resultSet.columnNames;
        hilog.info(domain, tag, '%{public}s', '************* testColumnNames001 resultSet.columnNames *************' + res);
        expect(res.length).assertEqual(2);
        expect(res[0]).assertEqual("id");
        expect(res[1]).assertEqual("name");
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* testColumnNames001 end *************' + err);
        expect().assertFail();
      }
      await rdbStore!.execute(DROP_TABLE_TESTTRANS);
      done();
      hilog.info(domain, tag, '%{public}s', '************* testColumnNames001 end *************');
    })
    /**
     * @tc.name       testRdbStoreWithReturning001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_9800
     * @tc.desc       normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRdbStoreWithReturning001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testrdbStoreWithReturning001 start *************');
      const config: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results = await rdbStore!.batchInsertWithReturning("test", [valueBucket0], config, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(tag + "batchInsertWithReturning" + results.changed);
        expect(results.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `batchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      const valueBucket: data_relationalStore.ValuesBucket = {
        'data1': 'lisi',
        "data2": 10 as long,
        "data3": 1.0,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'hello');
      const config1: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results1 = await rdbStore!.updateWithReturning(valueBucket, predicates, config1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(tag + "updateWithReturning" + results1.changed);
        expect(results1.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      let predicates1 = new data_relationalStore.RdbPredicates("test");
      predicates1.equalTo('data2', 10 as long);
      const config2: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results2 = await rdbStore!.deleteWithReturning(predicates1, config2);
        console.log(tag + "deleteWithReturning" + results2.changed);
        expect(results2.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `deleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* testrdbStoreWithReturning001 end *************');
    })
    /**
     * @tc.name       testRdbStoreWithReturningSync001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_9900
     * @tc.desc       normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRdbStoreWithReturningSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRdbStoreWithReturningSync001 start *************');
      const config: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results = rdbStore!.batchInsertWithReturningSync("test", [valueBucket0], config, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(tag + "batchInsertWithReturninSync" + results.changed);
        expect(results.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `batchInsertWithReturninSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      const valueBucket: data_relationalStore.ValuesBucket = {
        'data1': 'lisi',
        "data2": 10 as long,
        "data3": 1.0,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'hello');
      const config1: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results1 = rdbStore!.updateWithReturningSync(valueBucket, predicates, config1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(tag + "updateWithReturningSync" + results1.changed);
        expect(results1.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      let predicates1 = new data_relationalStore.RdbPredicates("test");
      predicates1.equalTo('data2', 10 as long);
      const config2: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results2 = rdbStore!.deleteWithReturningSync(predicates1, config2);
        console.log(tag + "deleteWithReturningSync" + results2.changed);
        expect(results2.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `deleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* testRdbStoreWithReturningSync001 end *************');
    })
    /**
     * @tc.name       testTransWithReturning001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_10000
     * @tc.desc       normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransWithReturning001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransWithReturning001 start *************');
      let trans = await rdbStore!.createTransaction(options);
      const config: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results = await trans.batchInsertWithReturning("test", [valueBucket0], config, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(tag + "trans batchInsertWithReturning" + results.changed);
        expect(results?.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `trans batchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans.commit();
      let trans1 = await rdbStore!.createTransaction(options);
      const valueBucket: data_relationalStore.ValuesBucket = {
        'data1': 'lisi',
        "data2": 10 as long,
        "data3": 1.0,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'hello');
      const config1: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results1 = await trans1.updateWithReturning(valueBucket, predicates, config1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(tag + " trans updateWithReturning" + results1.changed);
        expect(results1.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `trans updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans1.commit();
      let trans2 = await rdbStore!.createTransaction(options);
      let predicates1 = new data_relationalStore.RdbPredicates("test");
      predicates1.equalTo('data2', 10 as long);
      const config2: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results2 = await trans2.deleteWithReturning(predicates1, config2);
        console.log(tag + "trans deleteWithReturning" + results2.changed);
        expect(results2.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `trans deleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans2.commit();
      done();
      hilog.info(domain, tag, '%{public}s', '************* testTransWithReturning001 end *************');
    })
    /**
     * @tc.name       testTransWithReturningSync001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RdbAPITest_10100
     * @tc.desc       normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testTransWithReturningSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testTransWithReturningSync001 start *************');
      let trans = await rdbStore!.createTransaction(options);
      const config: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results = trans.batchInsertWithReturningSync("test", [valueBucket0], config, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(tag + "trans batchInsertWithReturningSync" + results.changed);
        expect(results?.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `trans batchInsertWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans.commit();
      let trans1 = await rdbStore!.createTransaction(options);
      const valueBucket: data_relationalStore.ValuesBucket = {
        'data1': 'lisi',
        "data2": 10 as long,
        "data3": 1.0,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'hello');
      const config1: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results1 = trans1.updateWithReturningSync(valueBucket, predicates, config1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(tag + " trans updateWithReturningSync" + results1.changed);
        expect(results1.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `trans updateWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans1.commit();
      let trans2 = await rdbStore!.createTransaction(options);
      let predicates1 = new data_relationalStore.RdbPredicates("test");
      predicates1.equalTo('data2', 10 as long);
      const config2: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results2 = trans2.deleteWithReturningSync(predicates1, config2);
        console.log(tag + "trans deleteWithReturningSync" + results2.changed);
        expect(results2.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `trans deleteWithReturningSync failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      await trans2.commit();
      done();
      hilog.info(domain, tag, '%{public}s', '************* testTransWithReturningSync001 end *************');
    })
  })
}
