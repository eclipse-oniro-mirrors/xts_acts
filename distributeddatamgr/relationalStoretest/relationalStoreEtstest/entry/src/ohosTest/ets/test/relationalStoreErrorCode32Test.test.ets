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
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';
import { ValuesBucket } from '@kit.ArkData';


let context: common.UIAbilityContext;
const TAG = "[ttt]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";
const STORE_CONFIG : relationalStore.StoreConfig= {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
let rdbStore:relationalStore.RdbStore;

export default function relationalStoreErrorCode32Test() {
  describe('relationalStoreErrorCode32Test', ()=> {
    beforeAll(async ()=> {
      console.info(TAG + "*************Unit Test Begin*************");
      console.info(TAG + 'beforeAll');
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    })

    beforeEach(async ()=> {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      let u8 = new Uint8Array([3, 4, 5])
      const valueBucket :relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
        "salary":2000,
        "data4":u8
      }
      const valueBucket2 :relationalStore.ValuesBucket = {
        "name": "Lisa",
        "age": 31,
        "salary":2000,
        "data4":u8
      }
      await (rdbStore as relationalStore.RdbStore).insert("employee", valueBucket);
      await (rdbStore as relationalStore.RdbStore).insert("employee", valueBucket2)
    })

    afterEach(async ()=> {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context,"rdbStore.db");
    })

    afterAll(async ()=> {
      console.info(TAG + 'afterAll');
      console.info(TAG + "*************Unit Test end*************");
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const valueBucket :relationalStore.ValuesBucket = {
        "age": 30,
        "salary":2000
      }
      try{
        rdbStore!.insertSync("employee",valueBucket);
        expect().assertFail();
      }catch (e) {
        console.error(TAG + "relationalStoreTest001 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const valueBucket :relationalStore.ValuesBucket = {
        "age": 30,
        "salary":2000
      }
      try{
        rdbStore!.insertSync("employee",valueBucket,relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        expect().assertFail();
      }catch (e) {
        console.error(TAG + "relationalStoreTest002 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest003 start *************");
     let values: Array<ValuesBucket> = new Array<ValuesBucket>();
      const valueBucket :ValuesBucket = {
        "age": 30,
        "salary":2000
      }
      values.push(valueBucket)
      try{
        rdbStore!.batchInsertSync("employee",values);
        console.info(TAG + "relationalStoreTest003 success ");
      }catch (e) {
        console.error(TAG + "relationalStoreTest003 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
      console.info(TAG + "************* relationalStoreTest003 end *************");
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest004 start *************");
      let values: Array<ValuesBucket> = new Array<ValuesBucket>();
      const valueBucket :ValuesBucket = {
        "age": 30,
        "salary":2000
      }
      values.push(valueBucket)
      try{
        await rdbStore!.batchInsert("employee",values);
        console.info(TAG + "relationalStoreTest004 success ");
      }catch (e) {
        console.error(TAG + "relationalStoreTest004 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
      console.info(TAG + "************* relationalStoreTest004 end *************");
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      let values: Array<ValuesBucket> = new Array<ValuesBucket>();
      const valueBucket :ValuesBucket = {
        "age": 30,
        "salary":2000
      }
      values.push(valueBucket)
      rdbStore.batchInsert("employee", values, (err, insertNum) => {
        if (err) {
          console.error(TAG + `batchInsert is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800032);
        }
        console.info(TAG + `batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        done();
      })
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })


    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc update success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const valueBucket :ValuesBucket = {
        "age": 30,
        "salary":2000
      }
      try{
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        rdbStore!.updateSync(valueBucket,predicates);
        console.info(TAG + `relationalStoreTest006 updateSync is successful`);
      }catch (e) {
        console.error(TAG + "relationalStoreTest006 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc update success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const valueBucket :ValuesBucket = {
        "age": 30,
        "salary":2000
      }
      try{
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        await rdbStore!.update(valueBucket,predicates);
        console.info(TAG + `relationalStoreTest007 update is successful`);
      }catch (e) {
        console.error(TAG + "relationalStoreTest007 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc update success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const valueBucket :ValuesBucket = {
        "name": "zhangSan",
        "age": 30,
        "salary":2000
      }
      try{
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        await rdbStore!.update(valueBucket,predicates,relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.info(TAG + `relationalStoreTest008 update is successful`);
      }catch (e) {
        console.error(TAG + "relationalStoreTest008 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc update success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const valueBucket :ValuesBucket = {
        "name": "zhangSan",
        "age": 30,
        "salary":2000
      }
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("name", "Jim");
      rdbStore.update(valueBucket, predicates,(err, rows) => {
        if (err) {
          console.error(TAG + `relationalStoreTest009 Updated failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800032);
        }
        console.info(TAG + `relationalStoreTest009 Updated row count: ${rows}`);
        done()
      })
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc update success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const valueBucket :ValuesBucket = {
        "name": "zhangSan",
        "age": 30,
        "salary":2000
      }
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("name", "Jim");
      rdbStore.update(valueBucket, predicates,relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK,(err, rows) => {
        if (err) {
          console.error(TAG + `Updated failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800032);
        }
        console.info(TAG + `relationalStoreTest009 Updated row count: ${rows}`);
        done()
      })
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("name", "Jim");
      rdbStore.delete(predicates,(err, rows) => {
        if (err) {
          console.error(TAG + `Updated failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800032);
        }
        console.info(TAG + `Updated row count: ${rows}`);
        done();
      })
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      try{
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        rdbStore.deleteSync(predicates);
        console.info(TAG + "deleteSync success ");
      }catch (e) {
        console.error(TAG + "relationalStoreTest012 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      try{
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        await rdbStore.delete(predicates);
        console.info(TAG + "deleteSync success ");
      }catch (e) {
        console.error(TAG + "relationalStoreTest013 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc getModifyTime success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* relationalStoreTest014 start *************");
      try {
        rdbStore.getModifyTime("employee", "age", [30, 31], (err: BusinessError, data: relationalStore.ModifyTime) =>{
          console.log(TAG + 'modifyTime:' + JSON.stringify(data) );
          done();
        });
      } catch (err) {
        console.log(TAG + `relationalStoreTest014 get modify time fail, err code is ${err.code}, message is ${err.message}.`);
        expect(err.code).assertEqual(14800032);
        done();
      }
      console.log(TAG + "************* relationalStoreTest014 end *************");
    })


    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc getModifyTime success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* relationalStoreTest015 start *************");
      await rdbStore.setDistributedTables(
        ["employee"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, {autoSync: false});
      try {
        await rdbStore.getModifyTime("employee", "id", [1, 2]).then((data: relationalStore.ModifyTime) => {
          console.log(TAG + `modifyTime:` + JSON.stringify(data));
        });
      } catch (err) {
        console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
        expect(err.code).assertEqual(14800032);
      }
      console.log(TAG + "************* relationalStoreTest015 end *************");
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest016 start *************");
      try{
        rdbStore.cleanDirtyData('employee', (err) => {
          console.info(TAG +'clean dirty data succeeded');
          done();
        })
      }catch (e) {
        console.error(TAG + "relationalStoreTest016 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })


    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      try{
        await rdbStore.cleanDirtyData('employee',100).then(() => {
          console.info(TAG + 'clean dirty data  succeeded');
        }).catch ((err: BusinessError) => {
          console.error(TAG + `clean dirty data failed, code is ${err.code},message is ${err.message}`);
        });
      }catch (e) {
        console.error(TAG + "relationalStoreTest017 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })


    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest035 start *************");
      try{
        rdbStore.cleanDirtyData('employee',100, (err) => {
          console.info(TAG +'clean dirty data succeeded');
          done();
        })
      }catch (e) {
        console.error(TAG + "relationalStoreTest018 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc executeSync success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const SQL_DELETE_TABLE = 'select * FROM employee WHERE name = ?';
      try{
        rdbStore.executeSql(SQL_DELETE_TABLE,['Jim'], (err) => {
          console.info(TAG + 'Delete table done.');
          done();
        })
      }catch (e) {
        console.error(TAG + "relationalStoreTest019 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const SQL_DELETE_TABLE = 'select * FROM employee';
      try{
        await rdbStore.executeSql(SQL_DELETE_TABLE);
      }catch (e) {
        console.error(TAG + "relationalStoreTest020 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const SQL_DELETE_TABLE = 'select * FROM employee';
      try{
        rdbStore.executeSql(SQL_DELETE_TABLE, (err) => {
          console.info(TAG + 'select table done.');
          done();
        })
      }catch (e) {
        console.error(TAG + "relationalStoreTest021 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })


    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc executeSync success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const SQL_DELETE_TABLE = 'DELETE FROM employee';
      try{
        rdbStore.executeSync(SQL_DELETE_TABLE);
      }catch (e) {
        console.error(TAG + "relationalStoreTest022 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const SQL_DELETE_TABLE = 'DELETE FROM employee';
      try{
        await rdbStore.execute(SQL_DELETE_TABLE);
      }catch (e) {
        console.error(TAG + "relationalStoreTest023 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest024 start *************");
      try{
        const SQL_DELETE_TABLE = 'delete FROM employee WHERE name = ?';
        await rdbStore.execute(SQL_DELETE_TABLE,0,['Jim'])
      }catch (e) {
        console.error(TAG + "relationalStoreTest024 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const SQL_DELETE_TABLE = 'delete FROM employee';
      try{
        await rdbStore.execute(SQL_DELETE_TABLE);
      }catch (e) {
        console.error(TAG + "relationalStoreTest025 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      try{
        rdbStore.beginTransaction();
      }catch (e) {
        console.error(TAG + "relationalStoreTest026 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
      rdbStore.rollBack();
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      try{
        rdbStore.beginTrans();
      }catch (e) {
        console.error(TAG + "relationalStoreTest027 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      rdbStore.beginTransaction();
      try{
        rdbStore.commit();
      }catch (e) {
        console.error(TAG + "relationalStoreTest028 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      try{
        rdbStore.beginTrans().then(async (txId:number)=>{
          await rdbStore.execute("delete FROM TEST", txId).then(() => {
              rdbStore.commit(txId);
            });
        });
      }catch (e) {
        console.error(TAG + "relationalStoreTest029 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }

    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      rdbStore.beginTransaction();
      try{
        rdbStore.rollBack()
      }catch (e) {
        console.error(TAG + "relationalStoreTest030 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      try{
        rdbStore.beginTrans().then(async (txId:number)=>{
          await rdbStore.execute("delete FROM TEST", txId).then(async () => {
            await rdbStore.rollback(txId);
          });
        });
      }catch (e) {
        console.error(TAG + "relationalStoreTest031 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      try{
        await rdbStore.backup("backup.db");
      }catch (e) {
        console.error(TAG + "relationalStoreTest032 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      await rdbStore.backup("backup2.db");
      try{
        await rdbStore.restore("backup2.db");
      }catch (e) {
        console.error(TAG + "relationalStoreTest033 fail code is "+e.code + " message is "+ e.message);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      rdbStore.backup("backup3.db", (err) => {
        if (err) {
          console.error(TAG + `Backup failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800032);
        }
        console.info(TAG + 'Backup success.');
        done();
      })
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest035 start *************");
      await rdbStore.backup("backup4.db");
      rdbStore.restore("backup4.db", (err) => {
        if (err) {
          console.error(`Restore failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800032);
        }
        console.info('Restore success.');
      })
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetColumnIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getColumnIndex('id')
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getColumnIndex failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetColumnName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getColumnName(1)
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getColumnName failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgoToFirstRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);

      try {
        resultSet.goToFirstRow()
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `goToFirstRow failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgoToNextRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.goToNextRow()
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `goToNextRow failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgoToLastRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      try {
        resultSet.goToLastRow()
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `goToLastRow failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgoToRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.goToRow(0)
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `goToRow failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgoTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.goTo(0)
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `goTo failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgoToPreviousRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.goToPreviousRow()
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `goToPreviousRow failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetBlob0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getBlob(resultSet.getColumnIndex('data4'))
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getBlob failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getString(resultSet.getColumnIndex('name'))
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getString failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getLong(resultSet.getColumnIndex('age'))
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getLong failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getDouble(resultSet.getColumnIndex('salary'))
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getDouble failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetAsset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getAsset(resultSet.getColumnIndex('data5'));
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getAsset failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetAssets0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getAsset(resultSet.getColumnIndex('data6'));
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getAssets failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getValue(resultSet.getColumnIndex('salary'))
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getValue failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testgetRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getRow()
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getRow failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetRows0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getRows(50,50)
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getRow failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetSendableRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getSendableRow()
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        console.error(TAG + `getRow failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0300
     * @tc.name Abnormal test case of unlock, if TABLE name or column invalid
     * @tc.desc Configure predicates (TABLE name: "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreUnLockRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbStoreLockRow0003 start *************");
      await rdbStore.setDistributedTables(["employee"],relationalStore.DistributedType.DISTRIBUTED_CLOUD);
      try {
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        await rdbStore.unlockRow(predicates);
      } catch (e) {
        console.error(TAG + `unlockRow failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      console.log(TAG + "************* testRdbStoreLockRow0003 end   *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0300
     * @tc.name Abnormal test case of unlock, if TABLE name or column invalid
     * @tc.desc Configure predicates (TABLE name: "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreLockRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbStoreLockRow0003 start *************");
      await rdbStore.setDistributedTables(["employee"],relationalStore.DistributedType.DISTRIBUTED_CLOUD);
      try {
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("id", "1");
        await rdbStore.lockRow(predicates);
      } catch (e) {
        console.error(TAG + `lockRow failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      console.log(TAG + "************* testRdbStoreLockRow0003 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0300
     * @tc.name Abnormal test case of unlock, if TABLE name or column invalid
     * @tc.desc Configure predicates (TABLE name: "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreQueryLockedRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbStoreLockRow0003 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        await rdbStore.queryLockedRow(predicates,[]);
      } catch (e) {
        console.error(TAG + `lockRow failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800032);
      }
      console.log(TAG + "************* testRdbStoreLockRow0003 end   *************");
    });
  })

}

