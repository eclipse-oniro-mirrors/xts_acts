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
const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "testzb.db",
  securityLevel: data_relationalStore.SecurityLevel.S1
}
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 float32Array," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const dbName = "testzb.db"
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
let vbs :Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(2);
vbs[0] = valueBucket0
vbs[1] = valueBucket1

export default function ErrorCodeRdbStore21Test() {
  describe('ErrorCodeRdbStore21Test', (): void => {

    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(2000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
    })

    beforeEach(async (): Promise<void> => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
    })

    afterEach(async (): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    /**
     * @tc.name        RelationStoreError21Test0001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_0100
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0001 start *************');
      await rdbStore.insert("test", valueBucket0);
      await CreateCorruptDb();
      try {
        let num = await rdbStore.insert("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0001 ************* num ' + num);
        expect(num != 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0001 ************* err ' + err.code);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0001 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0002
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_0200
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0002 start *************');
      await rdbStore.insert("test", valueBucket0);
      await CreateCorruptDb();
      try {
        let num = await rdbStore.insert("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0002 ************* num ' + num);
        expect(num != 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0002 ************* err ' + err.code);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0002 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0003
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_0300
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0003 start *************');
      console.info(tag + "222")
      let path = context.databaseDir;
      console.info('testErrorCode14800027Test0001' + path);
      await rdbStore.insert("test", valueBucket0);
      await CreateCorruptDb();
      try {
        let num = await rdbStore.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0003 ************* num ' + num);
        expect(num != 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0003 ************* err ' + err.code);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0003 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0004
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_0400
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0004 start *************');
      console.info(tag + "222")
      let path = context.databaseDir;
      console.info('testErrorCode14800027Test0001' + path);
      await rdbStore.insert("test", valueBucket0);
      await CreateCorruptDb();
      try {
        let num = rdbStore.insertSync("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0004 ************* num ' + num);
        expect(num != 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0004 ************* err ' + err.code);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0004 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0005
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_0500
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0005 start *************');
      console.info(tag + "222")
      let path = context.databaseDir;
      console.info('testErrorCode14800027Test0001' + path);
      await rdbStore.insert("test", valueBucket0);
      await CreateCorruptDb();
      try {
        let num = rdbStore.insertSync("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0005 ************* num ' + num);
        expect(num != 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0005 ************* err ' + err.code);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0005 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0006
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_0600
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0006 start *************');
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await CreateCorruptDb();
      try {
        let rows: number = await rdbStore.update(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0006 *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0006 *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0006 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0007
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_0700
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0007 start *************');
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await CreateCorruptDb();
      try {
        let rows: number = rdbStore.updateSync(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0007 *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0007 *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0007 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0008
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_0800
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0008 start *************');
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await CreateCorruptDb();
      try {
        let rows:number = await rdbStore.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0008 *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0008 *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0008 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0009
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_0900
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0009 start *************');
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await CreateCorruptDb();
      try {
        let rows:number = rdbStore.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0009 *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0009 *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0009 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0010
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_1000
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0010 start *************');
      await rdbStore.insert("test", valueBucket0);
      await CreateCorruptDb();
      let predicates = new data_relationalStore.RdbPredicates("test");
      try {
        let rows = await rdbStore.delete(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0010 *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0010 *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0010 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0011
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_1100
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0011 start *************');
      await rdbStore.insert("test", valueBucket0);
      await CreateCorruptDb();
      let predicates = new data_relationalStore.RdbPredicates("test");
      try {
        let rows = rdbStore.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0011 *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0011 *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0011 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0012
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_1200
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0012 start *************');
      await rdbStore.insert("test", valueBucket0);
      await CreateCorruptDb();
      try {
        let rows = await rdbStore.execute("INSERT INTO test (data1, data2, data3)  VALUES  ('name',10,1.0)");
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0012 *************' + rows);
        expect(rows == "ok").assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0012 *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0012 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0013
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_1300
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0013 start *************');
      let num = await rdbStore.batchInsert("test", vbs);
      let trans = await rdbStore.createTransaction();
      await CreateCorruptDb();
      try {
        let rows = await trans.insert("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0013 rows *************' + rows);
        expect(rows).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0013 err *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      trans.rollback();
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0013 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0014
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_1400
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0014 start *************');
      let num = await rdbStore.batchInsert("test", vbs);
      let trans = await rdbStore.createTransaction();
      await CreateCorruptDb();
      try {
        let rows = await trans.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0014 rows *************' + rows);
        expect(rows).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0014 err *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      trans.rollback();
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0014 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0015
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_1500
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0015 start *************');
      let num = await rdbStore.batchInsert("test", vbs);
      let trans = await rdbStore.createTransaction();
      await CreateCorruptDb();
      try {
        let rows = trans.insertSync("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0015 rows *************' + rows);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0015 err *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      trans.rollback();
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0015 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0016
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_1600
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0016 start *************');
      let num = await rdbStore.batchInsert("test", vbs);
      let trans = await rdbStore.createTransaction();
      await CreateCorruptDb();
      try {
        let rows = trans.insertSync("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0016 rows *************' + rows);
        expect(rows).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0016 err *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      trans.rollback();
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0016 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0017
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_1700
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0017 start *************');
        await rdbStore.insert("test", valueBucket0);
        let trans = await rdbStore.createTransaction();
        let predicates = new data_relationalStore.RdbPredicates("test");
        await rdbStore.execute(DROP_TABLE_TEST);
        try {
          let rows: number = await trans.update(valueBucket1, predicates);
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0017 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0017 err *************' + err);
          expect(err.code == 14800021).assertEqual(true);
        }
        trans.rollback();
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0017 end *************');
      })

    /**
     * @tc.name        RelationStoreError21Test0018
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_1800
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0018 start *************');
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await rdbStore.execute(DROP_TABLE_TEST);
      try {
        let rows:number = await trans.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0018 rows *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0018 err *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      trans.rollback();
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0018 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0019
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_1900
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0019 start *************');
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await rdbStore.execute(DROP_TABLE_TEST);
      try {
        let rows: number = trans.updateSync(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0019 rows *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0019 err *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      trans.rollback();
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0019 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0020
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_2000
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0020 start *************');
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await rdbStore.execute(DROP_TABLE_TEST);
      try {
        let rows:number = trans.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0020 rows *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0020 err *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      trans.rollback();
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0020 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0021
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_2100
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0021 start *************');
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await rdbStore.execute(DROP_TABLE_TEST);
      try {
        let rows: number = trans.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0021 rows *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0021 err *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      trans.rollback();
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0021 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0022
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_2200
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0022 start *************');
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await rdbStore.execute(DROP_TABLE_TEST);
      try {
        let rows: number = trans.batchInsertSync("test", vbs);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0022 rows *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0022 err *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      trans.rollback();
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0022 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0023
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_2300
     * @tc.desc        insert
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0023 start *************');
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await rdbStore.execute(DROP_TABLE_TEST);
      try {
        let rows:number = await trans.batchInsert("test", vbs);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0023 rows *************' + rows);
        expect(rows == 3).assertFail();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0023 err *************' + err);
        expect(err.code == 14800021).assertEqual(true);
      }
      trans.rollback();
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0023 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0024
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_2400
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0024 start *************');
      await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goTo(resultSet.getColumnIndex("data7"))
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0024 res *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0024 end *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0024 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0025
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_2500
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0025 start *************');
      await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goToRow(-1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0025 *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0025 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0025 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0026
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_2600
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0026 start *************');
      await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goToFirstRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0026 *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0026 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0026 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0027
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_2700
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0027 start *************');
      await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("SELECT * FROM test1 where data3 = 20.0");
      try{
        let res = resultSet.goToLastRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0027 *************' +res);
        expect(res).assertEqual(false);
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0027 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0027 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0028
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_2800
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0028 start *************');
      await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goToNextRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0028 *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0028 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0028 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0029
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_2900
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0029 start *************');
      await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goToPreviousRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0029 *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0029 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0029 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0030
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_3000
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0030 start *************');
      await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goToPreviousRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0030 *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0030 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0030 end *************');
    })
    /**
     * @tc.name        RelationStoreError21Test0031
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_3100
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0031 start *************');
      await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.getColumnIndex("data1");
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0031 *************' + res);
        expect(res).assertEqual(-1);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0031 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0031 end *************');
    })

    /**
     * @tc.name        RelationStoreError21Test0032
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_Error21Test_3200
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationStoreError21Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0032 start *************');
      await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.getColumnName(0);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0032 *************' + res);
        expect(res).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0032 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0032 end *************');
    })
  })
}