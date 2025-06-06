/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { BusinessError } from '@kit.BasicServicesKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER)";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 asset, " + "data2 asset, " + "data3 assets )";


const STORE_CONFIG : relationalStore.StoreConfig= {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
const asset1:relationalStore.Asset = {
  name: "name1",
  uri: "uri1",
  createTime: "createTime1",
  modifyTime: "modifyTime1",
  size: "size1",
  path: "path1",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2 :relationalStore.Asset= {
  name: "name2",
  uri: "uri2",
  createTime: "createTime2",
  modifyTime: "modifyTime2",
  size: "size2",
  path: "path2",
  status: relationalStore.AssetStatus.ASSET_INSERT,
}
const asset3:relationalStore.Asset = {
  name: "name3",
  uri: "uri3",
  createTime: "createTime3",
  modifyTime: "modifyTime3",
  size: "size3",
  path: "path3",
  status: relationalStore.AssetStatus.ASSET_UPDATE,
}
async function createTest() {
  console.log(TAG + "createTest data start");
  const assets1 = [asset1];
  const assets2 = [asset1, asset2, asset3];
  let valuesBucket :relationalStore.ValuesBucket= {
    "data1": asset1,
    "data2": asset2,
    "data3": assets1,
  }
  await rdbStore.insert("test", valuesBucket);
  valuesBucket = {
    "data1": asset2,
    "data2": asset3,
    "data3": assets2,
  }
  await rdbStore.insert("test", valuesBucket);
  let valuesBucket1 :relationalStore.ValuesBucket= {
    "data1": asset1,
    "data3": new Array()
  }
  await rdbStore.insert("test", valuesBucket1);
  console.log(TAG + "createTest data end");
}

let rdbStore:relationalStore.RdbStore;
let rdbStore1:relationalStore.RdbStore;

export default function relationalStoreErrorCodeTest() {
  describe('relationalStoreErrorCodeTest', ()=> {
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
     * @tc.name  getRows errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10000
     * @tc.desc getRows errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode001 start *************");
      let resultSet:relationalStore.ResultSet;
      let predicates = await new relationalStore.RdbPredicates("employee");
      resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
      console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
      try{
        resultSet.getRows(undefined);
        expect().assertFail();
        resultSet.close();
        done();
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(TAG + "************* errcode001 end *************");
    })
    /**
     * @tc.name offsetAs errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10100
     * @tc.desc offsetAs errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode002 start *************");
      let predicates = await new relationalStore.RdbPredicates("employee");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      }
      await (rdbStore as relationalStore.RdbStore).insert("employee", record);
      try{
        predicates.equalTo("name", "Jim").limitAs(-1).offsetAs(undefined);
        expect().assertFail();
        done();
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(TAG + "************* errcode002 end *************");
    })
    /**
     * @tc.name on errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10200
     * @tc.desc on errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode004 start *************");
      try {
        (rdbStore as relationalStore.RdbStore).on(undefined, undefined, undefined)
        expect().assertFail();
        done();
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message);
        expect(err.code == 401).assertTrue();
        done()
      }
      console.info(TAG + "************* errcode004 end *************");
    })
    /**
     * @tc.name off errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10300
     * @tc.desc off errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode005 start *************");
      try {
        (rdbStore as relationalStore.RdbStore).off(undefined, undefined, undefined)
        expect().assertFail();
        done();
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(TAG + "************* errcode005 end *************");
    })

    /**
     * @tc.name off_statistics errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10400
     * @tc.desc off_statistics errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode006 start *************");
      try {
        (rdbStore as relationalStore.RdbStore).off(undefined, undefined)
        expect().assertFail();
        done();
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message);
        expect(err.code == 401).assertTrue();
        done()
      }
      console.info(TAG + "************* errcode006 end *************");
    })
    /**
     * @tc.name transaction.querySql rrcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10500
     * @tc.desc transaction.querySql rrcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode007 start *************");
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction()
        await transaction.querySql(undefined,undefined)
        await transaction.commit();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 401).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode007 end *************");
    })

    /**
     * @tc.name transaction.execute rrcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10600
     * @tc.desc transaction.execute rrcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode008 start *************");
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
        await transaction.execute("DELETE FROM EMPLOYEE WHERE age = ?",["30"])
        await transaction.commit()
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 0).assertTrue()
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 401).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode008 end *************");
    })
    /**
     * @tc.name transaction.executeSync errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10700
     * @tc.desc transaction.executeSync errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode009 start *************");
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
        expect(err.code == 401).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode009 end *************");
    })
    /**

     /**
     * @tc.name transaction.executeSync errcode is 801
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10800
     * @tc.desc transaction.executeSync errcode is 801
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode010 start *************");
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
        expect(err.code == 801).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode010 end *************");
    })

    /**
     * @tc.name transaction.execute errcode is 801
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10900
     * @tc.desc transaction.execute errcode is 801
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode011 start *************");
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
        await transaction.execute("DELETE FROM EMPLOYEE WHERE age = ?",["30"])
        await transaction.commit()
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount == 0).assertTrue()
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 801).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode011 end *************");
    })
    /**
     * @tc.name  getColumnNamee errcode is 14800014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_11000
     * @tc.desc getColumnNamee errcode is 14800014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode012 start *************");
      let resultSet:relationalStore.ResultSet;
      let predicates = await new relationalStore.RdbPredicates("employee");
      resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
      console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
      try {
        const name1 = resultSet.getColumnName(1);
        console.log(TAG + "name1:" + name1);
        expect("name").assertEqual(name1)
        done()
      } catch (err) {
        console.log(TAG + "getColumnNamee.code:" + err.code);
        expect(err.code).assertEqual("14800014");
        done()
      }
      console.info(TAG + "************* errcode012 end *************");
    })

    /**
     * @tc.name  getAssets errcode is 14800032
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_11100
     * @tc.desc getAssets errcode is 14800032
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode013 start *************");
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await createTest();
      let resultSet:relationalStore.ResultSet;
      let predicates = await new relationalStore.RdbPredicates("test");
      resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
      console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
      try {
        resultSet.goToFirstRow()
        const data3 = resultSet.getAssets(resultSet.getColumnIndex("data3"))
        console.log(TAG + "data3=" + data3);
        expect(1).assertEqual(data3.length);
        done()
      } catch (err) {
        console.log(TAG + "getColumnNamee.code:" + err.code);
        expect(err.code).assertEqual("14800032");
        done()
      }
      console.info(TAG + "************* errcode013 end *************");
    })
    /**
     * @tc.name  getAssets errcode is 14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_11200
     * @tc.desc getAssets errcode is 14800033
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode014 start *************");
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await createTest();
      let resultSet:relationalStore.ResultSet;
      let predicates = await new relationalStore.RdbPredicates("test");
      resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
      console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
      try {
        resultSet.goToFirstRow()
        const data3 = resultSet.getAssets(resultSet.getColumnIndex("data3"))
        console.log(TAG + "data3=" + data3);
        expect(1).assertEqual(data3.length);
        done()
      } catch (err) {
        console.log(TAG + "getAssets.code:" + err.code);
        expect(err.code).assertEqual("14800033");
        done()
      }
      console.info(TAG + "************* errcode014 end *************");
    })
    /**
     * @tc.name  isColumnNull errcode is 14800032
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_11300
     * @tc.desc isColumnNull errcode is 14800032
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode015 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      const record1:relationalStore.ValuesBucket = {
        "name": "Jim1",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      await (rdbStore as relationalStore.RdbStore).insert("employee", record1)
      let resultSet:relationalStore.ResultSet;
      let predicates = await new relationalStore.RdbPredicates("employee");
      resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
      console.log(TAG + "resultSet:" + resultSet);
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount)
      try {
        resultSet.goToRow(1)
        const res = resultSet.isColumnNull(resultSet.getColumnIndex("name"))
        console.log(TAG + "res" + res);
        expect(false).assertEqual(res)
        done()
      } catch (err) {
        console.log(TAG + "isColumnNull.code:" + err.code);
        expect(err.code).assertEqual("14800032");
        done()
      }
      console.info(TAG + "************* errcode015 end *************");
    })
    /**
     * @tc.name  isColumnNull errcode is 14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_11400
     * @tc.desc isColumnNull errcode is 14800033
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode016 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      };
      const record1:relationalStore.ValuesBucket = {
        "name": "Jim1",
        "age": 30,
      };
      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      await (rdbStore as relationalStore.RdbStore).insert("employee", record1)
      let resultSet:relationalStore.ResultSet;
      let predicates = await new relationalStore.RdbPredicates("employee");
      resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
      console.log(TAG + "resultSet:" + resultSet);
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount)
      try {
        resultSet.goToRow(1)
        const res = resultSet.isColumnNull(resultSet.getColumnIndex("name"))
        console.log(TAG + "res" + res);
        expect(false).assertEqual(res)
        done()
      } catch (err) {
        console.log(TAG + "isColumnNull.code:" + err.code);
        expect(err.code).assertEqual("14800033");
        done()
      }
      console.info(TAG + "************* errcode016 end *************");
    })
    /**
     * @tc.name transaction.querySqlSync errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_11500
     * @tc.desc transaction.querySqlSync errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode017 start *************");
      try{
        let transaction:relationalStore.Transaction;
        transaction = await (rdbStore as relationalStore.RdbStore).createTransaction()
        await transaction.querySqlSync(undefined,undefined)
        await transaction.commit();
        expect().assertFail();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 401).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode017 end *************");
    })
    /**
     * @tc.name rdbStore.querySync errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_11600
     * @tc.desc rdbStore.querySync errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode018 start *************");
      try{
        await rdbStore.querySync(undefined,undefined)
        expect().assertFail();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 401).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode018 end *************");
    })
    /**
     * @tc.name rdbStore.querySql errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_11700
     * @tc.desc rdbStore.querySql errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode019 start *************");
      try{
        rdbStore.querySql(undefined,(err, resultSet: relationalStore.ResultSet)=>{
          console.log(TAG + "errcode019 error")
          expect(null).assertFail();
          done();
        })
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(TAG + "************* errcode019 end *************");
    })

    /**
     * @tc.name rdbStore.querySql errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_11800
     * @tc.desc rdbStore.querySql errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode020 start *************");
      try{
        await rdbStore.querySql(undefined,undefined);
        expect(null).assertFail();
        done();
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(TAG + "************* errcode020 end *************");
    })
    /**
     * @tc.name rdbStore.cloudSync errcode is 801
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_11900
     * @tc.desc rdbStore.cloudSync errcode is 801
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode022 start *************");
      try{
        await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST,(progressDetail: relationalStore.ProgressDetails) => {
        console.info(`progress: ${progressDetail}`);})
        console.log(TAG+"errcode022 error");
        expect(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST == 6).assertTrue();
        done();
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message);
        expect(err.code == 801).assertFail();
        done();
      }
      console.info(TAG + "************* errcode022 end *************");
    })
    /**
     * @tc.name rdbStore.remoteQuery errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_12000
     * @tc.desc rdbStore.remoteQuery errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode023 start *************");
      try{
        rdbStore.remoteQuery(undefined,undefined,undefined,undefined,(err,resultSet: relationalStore.ResultSet) => {
          console.log(TAG+"errcode023 error");
          expect().assertFail();
          done();
        })
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(TAG + "************* errcode023 end *************");
    })
    /**
     * @tc.name rdbStore.remoteQuery errcode is 401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_12100
     * @tc.desc rdbStore.remoteQuery errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('errcode024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode024 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      }
      await (rdbStore as relationalStore.RdbStore).insert("employee", record);
      let predicates = new relationalStore.RdbPredicates("employee");
      predicates.equalTo("name", "Jim")
      let localDeviceId = null;
      try{
        rdbStore.remoteQuery(localDeviceId, "employee", predicates,["ID","name","age"], (err, data) => {
          expect().assertFail();
          console.info(TAG + "Remote query fail");
          done();
        })
      }catch(err){
        console.info(TAG + "err.code" + err.code + "err.message"+ err.message)
        if(err.code == 401){
         expect(err.code == 401).assertTrue();
         done();           
        }else{
         expect(err.code == 801).assertTrue();
         done();  
        }
      }
      console.info(TAG + "************* errcode024 end *************");
    })

  })
}