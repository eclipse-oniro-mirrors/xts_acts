/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { sendableRelationalStore } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';

let num = "a".repeat((1024)*(1024)*30);
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER)";

const STORE_CONFIG : relationalStore.StoreConfig= {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let rdbStore:relationalStore.RdbStore;

export default function relationalStoreErrorCode47Test() {
  describe('relationalStoreErrorCode47Test', ()=> {
    beforeAll(async ()=> {
      console.info(TAG + "*************Unit Test Begin*************");
      console.info(TAG + 'beforeAll');
    })

    beforeEach(async ()=> {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE, null);
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
     * @tc.name   errcode001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_0100
     * @tc.desc   attach errcode is  14800010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* errcode001 start *************");
      const STORE_CONFIG  : relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      rdbStore = await relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1 : relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        encrypt:true,
        securityLevel: relationalStore.SecurityLevel.S1,
        customDir: "rdb",
        rootDir: "invalidPath"
      }
      try {
        let number = await rdbStore.attach(context, STORE_CONFIG1, "attachDB",8);
        console.log(TAG+"attach success,number:"+number)
        expect().assertFail();
        done()
      } catch (err) {
        await relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual("14800010");
        done();
      }
      console.log(TAG + "************* errcode001 end *************");
    })
    /**
     * @tc.name   errcode002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_0200
     * @tc.desc   errcode is 14800012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode002 start *************");
      let resultSet:relationalStore.ResultSet;
      let predicates = await new relationalStore.RdbPredicates("employee");
      resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
      console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
      try{
        resultSet.goTo(980);
        resultSet.goToRow(980);
        resultSet.goToFirstRow();
        resultSet.goToNextRow();
        resultSet.goToPreviousRow();
        resultSet.getBlob(5);
        resultSet.getString(5);
        resultSet.getLong(5);
        resultSet.getDouble(5);
        resultSet.getAsset(5);
        resultSet.getAssets(5);
        resultSet.getValue(5);
        resultSet.getRow();
        resultSet.getRows(5);
        resultSet.getSendableRow();
        resultSet.isColumnNull(-1);
        resultSet.close();
        expect().assertFail();
        resultSet.close();
        done();
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* errcode002 end *************");
    })
    /**
     * @tc.name   errcode004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_0400
     * @tc.desc   errcode is 14800018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode004 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      }
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet =  await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount);
        rdbStore.lockRow(predicates);
        rdbStore.unlockRow(predicates);
        expect(resultSet.rowCount==1).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code).assertEqual(14800018)
        done()
      }
      console.info(TAG + "************* errcode004 end *************");
    })
    /**
     * @tc.name   errcode005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_0500
     * @tc.desc   errcode is 14800012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode005 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      }
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      let resultSet =  await (rdbStore as relationalStore.RdbStore).query(predicates)
      console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
      try{
        resultSet.goToLastRow();
        expect(resultSet.rowCount == 1).assertTrue()
        resultSet.close()
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800012).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode005 end *************");
    })

    /**
     * @tc.name   errcode006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_0600
     * @tc.desc   errcode is 14800013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode006 start *************");
      const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY, " +
        "name TEXT NOT NULL, " + "age INTEGER, "  + "blobType BLOB)";
      await rdbStore.execute(CREATE_TABLE_TEST1, null);
      let u8 = new Uint8Array([1,2,3]);
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
        "blobType":u8,
      };
      await (rdbStore as relationalStore.RdbStore).insert("test1", record)
      let predicates = new relationalStore.RdbPredicates("test1");
      predicates.equalTo("age", 30);

      try{
         let resultSet =  await (rdbStore as relationalStore.RdbStore).query(predicates);
         console.log(TAG+"resultSet.rowCount"+resultSet.rowCount);
         resultSet.goToFirstRow();
         resultSet.getBlob(resultSet.getColumnIndex("blobType"));
         resultSet.getString(resultSet.getColumnIndex("name"));
         resultSet.getRow();
         resultSet.getRows(1);
         resultSet.getSendableRow();
        expect(resultSet.rowCount == 1).assertTrue();
        resultSet.close()
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800013).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode006 end *************");
    })
    /**
     * @tc.name   errcode007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_0700
     * @tc.desc   insert errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode007 1start *************");
      const record:relationalStore.ValuesBucket = {
        "name": num,
      }
      rdbStore.beginTransaction();
      for(let i =0;i<16;i++){
        await rdbStore.insert("employee", record);
      }
      rdbStore.insert("employee", record,async(err,rowid)=>{
        if(err == null){
          console.log(TAG+"insert success"+rowid)
          await rdbStore.commit();
          expect(rowid == 17).assertTrue()
          done()
        }else{
          console.log(TAG+"insert fail"+"err.code"+err.code)
          expect(err.code == 14800047).assertTrue()
          await rdbStore.commit();
          done()
        }
      })
      console.info(TAG + "************* errcode007 end *************");
    })
    /**
     * @tc.name   errcode008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_0800
     * @tc.desc   insert errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode008 1start *************");
      const record:relationalStore.ValuesBucket = {
        "name": num,
      }
      rdbStore.beginTransaction();
      for(let i =0;i<16;i++){
        await rdbStore.insert("employee", record);
      }
      rdbStore.insert("employee", record,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,async(err,rowid)=>{
        if(err == null){
          console.log(TAG+"insert success"+rowid)
          await rdbStore.commit();
          expect(rowid == 17).assertTrue()
          done()
        }else{
          console.log(TAG+"insert fail"+"err.code"+err.code)
          expect(err.code == 14800047).assertTrue()
          await rdbStore.commit();
          done()
        }
      })
      console.info(TAG + "************* errcode008end *************");
    })
    /**
     * @tc.name   errcode009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_0900
     * @tc.desc   insert errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode009 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": num,
      }
      rdbStore.beginTransaction();
      for(let i =0;i<16;i++){
        await rdbStore.insert("employee", record);
      }
      try{
        let rowid = await rdbStore.insert("employee", record)
        console.log(TAG+"insert success"+rowid)
        await rdbStore.commit();
        expect(rowid == 17).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"insert fail"+"err.code"+err.code)
        expect(err.code == 14800047).assertTrue()
        await rdbStore.commit();
        done()
      }
      console.info(TAG + "************* errcode009end *************");
    })

    /**
     * @tc.name   errcode010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1000
     * @tc.desc   insert errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode010 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": num,
      }
      rdbStore.beginTransaction();
      for(let i =0;i<16;i++){
        await rdbStore.insert("employee", record);
      }
      try{
        let rowid = await rdbStore.insert("employee", record,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
        console.log(TAG+"insert success"+rowid)
        await rdbStore.commit();
        expect(rowid == 17).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"insert fail"+"err.code"+err.code)
        expect(err.code == 14800047).assertTrue()
        await rdbStore.commit();
        done()
      }
      console.info(TAG + "************* errcode010 *************");
    })

    /**
     * @tc.name   errcode011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1100
     * @tc.desc   insertSync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode011 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": num,
      }
      rdbStore.beginTransaction();
      for(let i =0;i<16;i++){
        await rdbStore.insert("employee", record);
      }
      try{
        let rowid = await rdbStore.insertSync("employee", record,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
        console.log(TAG+"insert success"+rowid)
        await rdbStore.commit();
        expect(rowid == 17).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"insert fail"+"err.code"+err.code)
        expect(err.code == 14800047).assertTrue()
        await rdbStore.commit();
        done()
      }
      console.info(TAG + "************* errcode011 *************");
    })

    /**
     * @tc.name   errcode012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1200
     * @tc.desc   insertSync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode012 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": num,
      }
      const  sendableValuesBucket = sendableRelationalStore.toSendableValuesBucket(record);
      rdbStore.beginTransaction();
      for(let i =0;i<16;i++){
        await rdbStore.insert("employee", record);
      }
      try{
        let rowid = await rdbStore.insertSync("employee", sendableValuesBucket,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
        console.log(TAG+"insert success"+rowid)
        await rdbStore.commit();
        expect(rowid == 17).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"insert fail"+"err.code"+err.code)
        expect(err.code == 14800047).assertTrue()
        await rdbStore.commit();
        done()
      }
      console.info(TAG + "************* errcode012 *************");
    })

    /**
     * @tc.name   errcode013
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1300
     * @tc.desc   batchInsert errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode013 start *************");
      const record1:relationalStore.ValuesBucket = {
        "name": "zhangsan",
      }
      const record2:relationalStore.ValuesBucket = {
        "name": "lisi",
      }
      let valuebackets = new Array(record1, record2);
      rdbStore.beginTransaction();
      try{
        let rowid = await rdbStore.batchInsert("employee", valuebackets)
        console.log(TAG+"insert success"+rowid)
        await rdbStore.commit();
        expect(rowid == 2).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"insert fail"+"err.code"+err.code)
        expect(err.code == 14800047).assertTrue()
        await rdbStore.commit();
        done()
      }
      console.info(TAG + "************* errcode013 *************");
    })

    /**
     * @tc.name   errcode014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1400
     * @tc.desc   batchInsert errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode014 start *************");
      const record1:relationalStore.ValuesBucket = {
        "name": "zhangsan",
      }
      const record2:relationalStore.ValuesBucket = {
        "name": "lisi",
      }
      let valuebackets = new Array(record1, record2);
      rdbStore.beginTransaction();
      rdbStore.batchInsert("employee", valuebackets,async(err,rowid)=>{
        if(err==null)
        {
          console.log(TAG+"insert success"+rowid)
          await rdbStore.commit();
          expect(rowid == 2).assertTrue()
          done()
        }else{
          console.log(TAG+"insert fail"+"err.code"+err.code)
          expect(err.code == 14800047).assertTrue()
          await rdbStore.commit();
          done()
        }
      })
      console.info(TAG + "************* errcode014 *************");
    })
    /**
     * @tc.name   errcode015
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1500
     * @tc.desc   update errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode015 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      const record1:relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      (rdbStore as relationalStore.RdbStore).update(record1,predicates,async(err,rows)=>{
          if(err == null) {
            console.log(TAG + "rows" + rows);
            expect(rows == 1).assertTrue()
            done()
          }
          else{
            console.log(TAG+"err.code"+err.code + "err.message"+err.message)
            expect(err.code == 14800047).assertTrue()
            done()
          }
        })
      console.info(TAG + "************* errcode015 end *************");
    })
    /**
     * @tc.name   errcode016
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1600
     * @tc.desc   update is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode016 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      const record1:relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      (rdbStore as relationalStore.RdbStore).update(record1,predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,async(err,rows)=>{
          if(err == null){
            console.log(TAG+"rows"+rows);
            expect(rows == 1).assertTrue()
            done()
          }else{
            console.log(TAG+"err.code"+err.code + "err.message"+err.message)
            expect(err.code == 14800047).assertTrue()
            done()
          }
        })
      console.info(TAG + "************* errcode016 end *************");
    })

    /**
     * @tc.name   errcode017
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1700
     * @tc.desc   update errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode017 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      const record1:relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let rows = await (rdbStore as relationalStore.RdbStore).update(record1,predicates)
        console.log(TAG+"rows"+rows);
        expect(rows == 1).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode017 end *************");
    })
    /**
     * @tc.name   errcode018
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1800
     * @tc.desc   update errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode018 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      const record1:relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let rows = await (rdbStore as relationalStore.RdbStore).update(record1,predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
        console.log(TAG+"rows"+rows);
        expect(rows == 1).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode018 end *************");
    })
    /**
     * @tc.name   errcode019
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1900
     * @tc.desc   delete errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode019 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let rows = await (rdbStore as relationalStore.RdbStore).delete(predicates)
        console.log(TAG+"rows"+rows);
        expect(rows == 1).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode019 end *************");
    })

    /**
     * @tc.name   errcode020
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2000
     * @tc.desc   deleteSync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode020 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let rows = await (rdbStore as relationalStore.RdbStore).deleteSync(predicates)
        console.log(TAG+"rows"+rows);
        expect(rows == 1).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode020 end *************");
    })

    /**
     * @tc.name   errcode021
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2100
     * @tc.desc   delete errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode021 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      (rdbStore as relationalStore.RdbStore).delete(predicates,(err,rows)=>{
        if(err == null)
        {
          console.log(TAG+"rows"+rows);
          expect(rows == 1).assertTrue()
          done()
        }else{
          console.log(TAG+"err.code"+err.code + "err.message"+err.message)
          expect(err.code == 14800047).assertTrue()
          done()
        }
      })
      console.info(TAG + "************* errcode021 end *************");
    })
    /**
     * @tc.name   errcode022
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2200
     * @tc.desc   executeSql errcode is 14800013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode022 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      (rdbStore as relationalStore.RdbStore).executeSql("DELETE FROM EMPLOYEE",async (err)=>{
        if(err == null)
        {
          let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
          console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
          expect(resultSet.rowCount == 0).assertTrue()
          resultSet.close();
          done()
        }else{
          console.log(TAG+"err.code"+err.code + "err.message"+err.message)
          expect(err.code == 14800047).assertTrue()
          done()
        }
      })
      console.info(TAG + "************* errcode022 end *************");
    })

    /**
     * @tc.name   errcode023
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2300
     * @tc.desc   executeSql errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode023 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      (rdbStore as relationalStore.RdbStore).executeSql("DELETE FROM EMPLOYEE WHERE age = ?",["30"],async (err)=>{
        if(err == null)
        {
          let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
          console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
          expect(resultSet.rowCount == 0).assertTrue()
          resultSet.close();
          done()
        }else{
          console.log(TAG+"err.code"+err.code + "err.message"+err.message)
          expect(err.code == 14800047).assertTrue()
          done()
        }
      })
      console.info(TAG + "************* errcode023 end *************");
    })
    /**
     * @tc.name   errcode024
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2400
     * @tc.desc   executeSql errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode024 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
          await  (rdbStore as relationalStore.RdbStore).executeSql("DELETE FROM EMPLOYEE WHERE age = ?",["30"])
          let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
          console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
          expect(resultSet.rowCount == 0).assertTrue()
          resultSet.close();
          done()
        }catch(err){
          console.log(TAG+"err.code"+err.code + "err.message"+err.message)
          expect(err.code == 14800047).assertTrue()
          done()
        }
      console.info(TAG + "************* errcode024 end *************");
    })
    /**
     * @tc.name   errcode025
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2500
     * @tc.desc   execute errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode025 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        await  (rdbStore as relationalStore.RdbStore).execute("DELETE FROM EMPLOYEE WHERE age = ?",0,["30"])
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 0).assertTrue()
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode025 end *************");
    })

    /**
     * @tc.name   errcode026
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2600
     * @tc.desc   executeSync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode026 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        await  (rdbStore as relationalStore.RdbStore).executeSync("DELETE FROM EMPLOYEE WHERE age = ?",["30"])
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 0).assertTrue()
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode026 end *************");
    })

    /**
     * @tc.name   errcode027
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2700
     * @tc.desc   execute errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode027 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        await  (rdbStore as relationalStore.RdbStore).execute("DELETE FROM EMPLOYEE WHERE age = ?",["30"])
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 0).assertTrue()
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode027 end *************");
    })


    /**
     * @tc.name   errcode028
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2800
     * @tc.desc   batchInsertSync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode028 start *************");
      const record1:relationalStore.ValuesBucket = {
        "name": "zhangsan",
      }
      const record2:relationalStore.ValuesBucket = {
        "name": "lisi",
      }
      let valuebackets = new Array(record1, record2);
      rdbStore.beginTransaction();
      try{
        let rowid = await rdbStore.batchInsertSync("employee", valuebackets)
        console.log(TAG+"insert success"+rowid)
        await rdbStore.commit();
        expect(rowid == 2).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"insert fail"+"err.code"+err.code)
        expect(err.code == 14800047).assertTrue()
        await rdbStore.commit();
        done()
      }
      console.info(TAG + "************* errcode028 *************");
    })

    /**
     * @tc.name   errcode029
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2900
     * @tc.desc   updateSync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode029 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      const record1:relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let rows = await (rdbStore as relationalStore.RdbStore).updateSync(record1,predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
        console.log(TAG+"rows"+rows);
        expect(rows == 1).assertTrue()
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode029 end *************");
    })

    /**
     * @tc.name   errcode030
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_3000
     * @tc.desc   query errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode030 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates,["name","age"]);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 1).assertTrue()
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode030 end *************");
    })

    /**
     * @tc.name   errcode031
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_3100
     * @tc.desc   transaction.querySync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode031 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction()
        await transaction.insert("employee", record,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("age", 30);
        let resultSet = transaction.querySync(predicates,["name","age"]);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 1).assertTrue();
        await transaction.commit();
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode031 end *************");
    })

    /**
     * @tc.name   errcode032
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_3200
     * @tc.desc   transaction.querySql errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode032 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction();
        let resultSet = await transaction.querySql("SELECT *FROM employee WHERE age = ?",["30"]);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 1).assertTrue()
        transaction.commit()
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode032 end *************");
    })

    /**
     * @tc.name   errcode033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_3300
     * @tc.desc   transaction.querySqlSync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode033 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction()
        await transaction.insertSync("employee", record,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
        let resultSet = await transaction.querySqlSync("SELECT *FROM employee WHERE age = ?",["30"]);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 1).assertTrue()
        await transaction.commit();
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode033 end *************");
    })

    /**
     * @tc.name   errcode034
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_3400
     * @tc.desc   beginTransaction errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode034 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      try{
        (rdbStore as relationalStore.RdbStore).beginTransaction();
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        (rdbStore as relationalStore.RdbStore).commit();
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("age", 30);
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 1).assertTrue();
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue();
        done()
      }
      console.info(TAG + "************* errcode034 end *************");
    })

    /**
     * @tc.name   errcode036
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_3500
     * @tc.desc   transaction.insert errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode036 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction()
        await transaction.insert("employee", record,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        await transaction.commit();
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("age", 30);
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 1).assertTrue();
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue();
        done()
      }
      console.info(TAG + "************* errcode036 end *************");
    })

    /**
     * @tc.name   errcode037
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_3500
     * @tc.desc   transaction.insertSync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode037 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction()
        await transaction.insertSync("employee", record,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        await transaction.commit();
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("age", 30);
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 1).assertTrue();
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue();
        done()
      }
      console.info(TAG + "************* errcode037 end *************");
    })
    /**
     * @tc.name   errcode038
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_3500
     * @tc.desc   transaction.batchInsert errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode038 start *************");
      const record1:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      const record2:relationalStore.ValuesBucket = {
        "name": "Jim1",
        "age": 30,
      };
      let valuebackets = new Array(record1, record2);
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction()
        await transaction.batchInsert("employee", valuebackets);
        await transaction.commit();
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("age", 30);
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 2).assertTrue();
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue();
        done()
      }
      console.info(TAG + "************* errcode038 end *************");
    })
    /**
     * @tc.name   errcode039
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_3500
     * @tc.desc   transaction.batchInsertSync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode039 start *************");
      const record1:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      const record2:relationalStore.ValuesBucket = {
        "name": "Jim1",
        "age": 30,
      };
      let valuebackets = new Array(record1, record2);
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction()
        await transaction.batchInsertSync("employee", valuebackets);
        await transaction.commit();
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("age", 30);
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 2).assertTrue();
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue();
        done()
      }
      console.info(TAG + "************* errcode039 end *************");
    })

    /**
     * @tc.name   errcode040
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2600
     * @tc.desc   transaction.executeSync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode040 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction()
        await transaction.executeSync("DELETE FROM EMPLOYEE WHERE age = ?",["30"])
        await transaction.commit()
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 0).assertTrue()
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode040 end *************");
    })

    /**
     * @tc.name   errcode041
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2700
     * @tc.desc   transaction.execute errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode041 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction();
        await  transaction.execute("DELETE FROM EMPLOYEE WHERE age = ?",["30"]);
        await  transaction.commit();
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 0).assertTrue()
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode041 end *************");
    })
    /**
     * @tc.name   errcode042
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_2700
     * @tc.desc   transaction.query errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode042 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction();
        await transaction.insertSync("employee", record,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("age", 30);
        let resultSet = await transaction.query(predicates,["name","age"]);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 1).assertTrue()
        await transaction.commit();
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode042end *************");
    })
    /**
     * @tc.name   errcode043
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1700
     * @tc.desc   transaction.update errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode043 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      const record1:relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction();
        let rows = await transaction.update(record1,predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
        console.log(TAG+"rows"+rows);
        expect(rows == 1).assertTrue()
        transaction.commit();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode043 end *************");
    })

    /**
     * @tc.name   errcode044
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1700
     * @tc.desc   transaction.updateSync errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode044 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      const record1:relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction();
        let rows = await transaction.updateSync(record1,predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
        console.log(TAG+"rows"+rows);
        expect(rows == 1).assertTrue()
        await transaction.commit();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode044 end *************");
    })
    /**
     * @tc.name   errcode045
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1900
     * @tc.desc   delete errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode045 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction();
        let rows = await transaction.delete(predicates)
        console.log(TAG+"rows"+rows);
        expect(rows == 1).assertTrue()
        await transaction.commit()
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode045 end *************");
    })
    /**
     * @tc.name   errcode046
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_1900
     * @tc.desc   transaction.delete errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode046 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction();
        let rows = await transaction.deleteSync(predicates)
        console.log(TAG+"rows"+rows);
        expect(rows == 1).assertTrue()
        await transaction.commit()
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800047).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode046 end *************");
    })
  })
}