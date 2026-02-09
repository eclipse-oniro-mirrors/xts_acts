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


import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach,afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

let context:common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()

let domain: int = 0x0000;
let tag: string = 'testTag';


let rdbStore:data_relationalStore.RdbStore;
let rdbStore1:data_relationalStore.RdbStore;
const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "testljj.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  customDir: "data/app/el2/100/database/bundleName/rdb"
}
const STORE_CONFI1: data_relationalStore.StoreConfig = {
  name: "testljj.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  encrypt: true
}

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 VARCHAR(10)," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 float32Array," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const dbName = "testljj.db"
// const dbPath = "/data/storage/el2/database/entry_test/rdb/" + dbName;
// const dbPathWal = "/data/storage/el2/database/entry_test/rdb/" + dbName + "-wal";
// const dbPathShm = "/data/storage/el2/database/entry_test/rdb/" + dbName + "-shm";
const dbPath = "/data/storage/el2/database/entry/rdb/" + dbName;
const dbPathWal = "/data/storage/el2/database/entry/rdb/" + dbName + "-wal";
const dbPathShm = "/data/storage/el2/database/entry/rdb/" + dbName + "-shm";

async function CreateCorruptDb() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(tag + "fileExist:"+fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4)
    fs.truncateSync(dbPathShm, 4)
    let file = fs.openSync(dbPath, fs.OpenMode.READ_ONLY | fs.OpenMode.SYNC | fs.OpenMode.TRUNC );
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
  } catch (err) {
    err = err as BusinessError;
    console.info(tag, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(tag, `quit create corrupt store`);
}
const valueBucket0 :data_relationalStore.ValuesBucket = {
  "data1": "hello 00000000",
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

let name = "a".repeat(10)
let vbs :Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(2);
vbs[0] = valueBucket0
vbs[1] = valueBucket1

let options:data_relationalStore.TransactionOptions = {
  transactionType:data_relationalStore.TransactionType.DEFERRED
}

export default function ErrorCodeRdbStore24Test() {
  describe('ErrorCodeRdbStore24Test', (): void => {

    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(2000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
    })
    afterAll(async (): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    afterEach(async (): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    /**
     * @tc.name        RelationStoreError24Test0001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0100
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0001 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = await rdbStore.insert("test", valueBucket2);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0001 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0001 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0001 end *************');
    })

    /**
     * @tc.name        RelationStoreError24Test0002
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0200
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0002 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = rdbStore.insertSync("test", valueBucket2);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0002 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0002 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0002 end *************');
    })

    /**
     * @tc.name        RelationStoreError24Test0003
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0300
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0003 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = await rdbStore.insert("test", valueBucket2, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0003 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0003 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0003 end *************');
    })

    /**
     * @tc.name        RelationStoreError24Test0004
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0400
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0004 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = rdbStore.insertSync("test", valueBucket2, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0004 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0004 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0004 end *************');
    })

    /**
     * @tc.name        RelationStoreError24Test0005
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0500
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0005 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let rows:number = await rdbStore.update(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0005 ************* rows ' + rows);
        expect(rows == 1).assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0005 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0005 end *************');
    })


    /**
     * @tc.name        RelationStoreError24Test0006
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0600
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0006 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let rows:number = rdbStore.updateSync(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0006 ************* rows ' + rows);
        expect(rows == 1).assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0006 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0006 end *************');
    })
    /**
     * @tc.name        RelationStoreError24Test0007
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0700
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0007 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = await rdbStore.update(valueBucket2, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0007 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0007 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0007 end *************');
    })
    /**
     * @tc.name        RelationStoreError24Test0008
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0800
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0008 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = rdbStore.updateSync(valueBucket2, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0008 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0008 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0008 end *************');
    })
    /**
     * @tc.name        RelationStoreError24Test0009
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0900
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0009 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = await rdbStore.delete(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0009 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0009 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0009 end *************');
    })
    /**
     * @tc.name        RelationStoreError24Test0010
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_1000
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0010 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = rdbStore.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0010 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0010 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0010 end *************');
    })
    /**
     * @tc.name        RelationStoreError24Test0011
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_1100
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0011 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = await rdbStore.execute("INSERT INTO test (data1, data2, data3)  VALUES  ('name',10,1.0)");
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0011 ************* num ' + num);
        expect(num == "ok").assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0011 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0011 end *************');
    })

    /**
     * @tc.name        RelationStoreError24Test0012
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_1200
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0012 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const rdbTrans = await rdbStore.createTransaction(options);
      const rdbTrans1 = await rdbStore.createTransaction();
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = await rdbTrans1.insert("test", valueBucket2);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0012 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0012 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0012 end *************');
    })

    /**
     * @tc.name        RelationStoreError24Test0013
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_1300
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0013 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const rdbTrans = await rdbStore.createTransaction(options);
      const rdbTrans1 = await rdbStore.createTransaction();
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = rdbTrans1.insertSync("test", valueBucket2);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0013 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0013 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans1.rollback();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0013 end *************');
    })

    /**
     * @tc.name        RelationStoreError24Test0014
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_1400
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0014 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const rdbTrans = await rdbStore.createTransaction(options);
      const rdbTrans1 = await rdbStore.createTransaction();
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = await rdbTrans1.insert("test", valueBucket2, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0014 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0014 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0014 end *************');
    })

    /**
     * @tc.name        RelationStoreError24Test0015
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_1500
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0015 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const rdbTrans = await rdbStore.createTransaction(options);
      const rdbTrans1 = await rdbStore.createTransaction();
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = rdbTrans1.insertSync("test", valueBucket2, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0015 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0015 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0015 end *************');
    })

    /**
     * @tc.name        RelationStoreError24Test0016
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_1600
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0016 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const rdbTrans1 = await rdbStore.createTransaction();
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let rows:number = await rdbTrans1.update(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0016 ************* rows ' + rows);
        expect(rows == 1).assertFail();
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0016 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0016 end *************');
    })


    /**
     * @tc.name        RelationStoreError24Test0017
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_1700
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0017 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const rdbTrans1 = await rdbStore.createTransaction();
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let rows:number = rdbTrans1.updateSync(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0017 ************* rows ' + rows);
        expect(rows == 1).assertFail();
        rdbTrans1.rollback();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0017 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans1.rollback();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0017 end *************');
    })
    /**
     * @tc.name        RelationStoreError24Test0018
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_1800
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0018 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const rdbTrans1 = await rdbStore.createTransaction();
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = await rdbTrans1.update(valueBucket2, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0018 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0018 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans1.rollback();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0018 end *************');
    })
    /**
     * @tc.name        RelationStoreError24Test0019
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_1900
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0019 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const rdbTrans1 = await rdbStore.createTransaction();
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = rdbTrans1.updateSync(valueBucket2, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0019 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0019 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0019 end *************');
    })
    /**
     * @tc.name        RelationStoreError24Test0020
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_2000
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0020 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const rdbTrans1 = await rdbStore.createTransaction();
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = await rdbTrans1.delete(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0020 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0020 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0020 end *************');
    })
    /**
     * @tc.name        RelationStoreError24Test0021
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_2100
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0021 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      const rdbTrans = await rdbStore.createTransaction(options);
      const rdbTrans1 = await rdbStore.createTransaction();
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = rdbTrans1.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0021 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0021 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0021 end *************');
    })
    /**
     * @tc.name        RelationStoreError24Test0022
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_2200
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0022 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      const rdbTrans = await rdbStore.createTransaction(options);
      const rdbTrans1 = await rdbStore.createTransaction();
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = await rdbStore.execute("INSERT INTO test (data1, data2, data3)  VALUES  ('name',10,1.0)");
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0022 ************* num ' + num);
        expect(num == "ok").assertFail();
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0022 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        rdbTrans1.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0022 end *************');
    })
    
    /**
     * @tc.name        RelationStoreError24Test0023
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0701
     * @tc.desc        batchInsert normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0023 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(CREATE_TABLE_TEST);
        await rdbStore.insert("test", valueBucket0);
        let predicates = new data_relationalStore.RdbPredicates("test");
        let values = new Array<data_relationalStore.ValuesBucket>();
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket2: data_relationalStore.ValuesBucket = {
          "data1": name,
          "data2": 10 as long,
          "data3": 1.0,
          "data4": new Uint8Array([1, 2, 3]),
        }
        values.push(valueBucket2);
        await rdbTrans.insert("test", valueBucket2);
        try {
          await rdbStore.batchInsert("test", values);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', 'batchInsert errCode: ' + err.code);
          expect(err.code).assertEqual(14800024);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0023 end *************');
      })

    /**
     * @tc.name        RelationStoreError24Test0024
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0702
     * @tc.desc        batchInsertSync normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0024 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(CREATE_TABLE_TEST);
        await rdbStore.insert("test", valueBucket0);
        let predicates = new data_relationalStore.RdbPredicates("test");
        let values = new Array<data_relationalStore.ValuesBucket>();
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket2: data_relationalStore.ValuesBucket = {
          "data1": name,
          "data2": 10 as long,
          "data3": 1.0,
          "data4": new Uint8Array([1, 2, 3]),
        }
        values.push(valueBucket2);
        await rdbTrans.insert("test", valueBucket2);
        try {
          rdbStore.batchInsertSync("test", values);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', 'batchInsertSync errCode: ' + err.code);
          expect(err.code).assertEqual(14800024);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0024 end *************');
      })


    /**
     * @tc.name        RelationStoreError24Test0025
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0707
     * @tc.desc        createTransaction normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0025 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(CREATE_TABLE_TEST);
        await rdbStore.insert("test", valueBucket0);
        let predicates = new data_relationalStore.RdbPredicates("test");
        let values = new Array<data_relationalStore.ValuesBucket>();
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket2: data_relationalStore.ValuesBucket = {
          "data1": name,
          "data2": 10 as long,
          "data3": 1.0,
          "data4": new Uint8Array([1, 2, 3]),
        }
        values.push(valueBucket2);
        await rdbTrans.insert("test", valueBucket2);
        try {
          await rdbStore.createTransaction();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', 'createTransaction errCode: ' + err.code);
          expect(err.code).assertEqual(14800024);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0025 end *************');
      })

    /**
     * @tc.name        RelationStoreError24Test0026
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0708
     * @tc.desc        createTransaction normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0026 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(CREATE_TABLE_TEST);
        await rdbStore.insert("test", valueBucket0);
        let predicates = new data_relationalStore.RdbPredicates("test");
        let values = new Array<data_relationalStore.ValuesBucket>();
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket2: data_relationalStore.ValuesBucket = {
          "data1": name,
          "data2": 10 as long,
          "data3": 1.0,
          "data4": new Uint8Array([1, 2, 3]),
        }
        values.push(valueBucket2);
        await rdbTrans.insert("test", valueBucket2);
        try {
          rdbTrans.batchInsertSync("test", values);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', 'rdbTrans.batchInsertSync errCode: ' + err.code);
          expect(err.code).assertEqual(14800024);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0026 end *************');
      })

    /**
     * @tc.name        RelationStoreError24Test0027
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error24Test_0709
     * @tc.desc        createTransaction normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError24Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0027 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(CREATE_TABLE_TEST);
        await rdbStore.insert("test", valueBucket0);
        let predicates = new data_relationalStore.RdbPredicates("test");
        let values = new Array<data_relationalStore.ValuesBucket>();
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket2: data_relationalStore.ValuesBucket = {
          "data1": name,
          "data2": 10 as long,
          "data3": 1.0,
          "data4": new Uint8Array([1, 2, 3]),
        }
        values.push(valueBucket2);
        await rdbTrans.insert("test", valueBucket2);
        try {
          await rdbTrans.batchInsert("test", values);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', 'rdbTrans.batchInsert errCode: ' + err.code);
          expect(err.code).assertEqual(14800024);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0027 end *************');
      })
  })
}