/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import data_Rdb from '@ohos.data.relationalStore';
import ability_featureAbility from '@ohos.ability.featureAbility';

const ERRCODE = 801;
var context = ability_featureAbility.getContext();
var sqlStatement = "CREATE TABLE IF NOT EXISTS employee (" +
"id INTEGER PRIMARY KEY AUTOINCREMENT," +
"name TEXT NOT NULL," +"age INTEGER)"
sqlStatement = "CREATE TABLE IF NOT EXISTS product (" +
"id INTEGER PRIMARY KEY AUTOINCREMENT," +
"name TEXT NOT NULL," +"price REAL," +
"vendor INTEGER," +"describe TEXT)"
const TAG = "[RelationalStore_JSKITS_TEST_Distributed]"
const STORE_NAME = "distributed_rdb.db"
var rdbStore = undefined;
const config = {
    "name": STORE_NAME,
    securityLevel: data_Rdb.SecurityLevel.S1
}

async function executeSql1() {
    let sqlStatement = "CREATE TABLE IF NOT EXISTS employee (" +
    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
    "name TEXT NOT NULL," +
    "age INTEGER)"
try {
    await rdbStore.executeSql(sqlStatement, null)
    console.info(TAG + "create table employee success")
} catch (err) {
    console.info(TAG + "create table employee failed")
    expect(null).assertFail()
}
}

async function executeSql2() {
    let sqlStatement = "CREATE TABLE IF NOT EXISTS product (" +
    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
    "name TEXT NOT NULL," +
    "price REAL," +
    "vendor INTEGER," +
    "describe TEXT)"
try {
    await rdbStore.executeSql(sqlStatement, null)
    console.info(TAG + "create table product success")
} catch (err) {
    console.info(TAG + "create table product failed")
    expect(null).assertFail()
}
}
async function executeSql3() {
    let sqlStatement = "CREATE TABLE IF NOT EXISTS test (" +
    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
    "name TEXT NOT NULL," +
    "price REAL," +
    "vendor INTEGER," +
    "describe TEXT)"
    try {
        await rdbStore.executeSql(sqlStatement, null)
        console.info(TAG + "create table product success")
    } catch (err) {
        console.info(TAG + "create table product failed")
        expect(null).assertFail()
    }
}

function storeObserver(devices) {
    console.info(TAG + devices + " dataChange");
    expect(devices).assertEqual(null)
}

export default function relationalStoreDistributedTest() {
describe('relationalStoreDistributedTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
    })

    beforeEach(async function () {
        console.info(TAG + 'beforeEach')
        rdbStore = await data_Rdb.getRdbStore(context, config);
        console.info(TAG + "create RelationalStore store success")
        await executeSql1();
        await executeSql2();
        await executeSql3();
    })

    afterEach(async function () {
        console.info(TAG + 'afterEach')
        await data_Rdb.deleteRdbStore(context, STORE_NAME);
    })

    afterAll(async function () {
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
    it('testRdbStoreDistributed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed002 start *************");
        try {
            await rdbStore.setDistributedTables([])
            console.info(TAG + "set none to be distributed table success");
            expect(rdbStore).assertEqual(rdbStore)
        } catch (err) {
            console.info(TAG + "setDistributed002 failed"+ `, error code is ${err.code}, message is ${err.message}`);
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
    it('testRdbStoreDistributed0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed003 start *************");
        try {
            await rdbStore.setDistributedTables(['employee'])
            console.info(TAG + "set employee to be distributed table success");
            expect(rdbStore).assertEqual(rdbStore)
        } catch (err) {
            console.info(TAG + "setDistributed003 failed"+ `, error code is ${err.code}, message is ${err.message}`);
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
    it('testRdbStoreDistributed0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed004 start *************");
        try {
            await rdbStore.setDistributedTables(['employee', 'product'])
            console.info(TAG + "set employee and product to be distributed table success");
            expect(rdbStore).assertEqual(rdbStore)
        } catch (err) {
            console.info(TAG + "setDistributed004 failed"+ `, error code is ${err.code}, message is ${err.message}`);
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
    it('testRdbStoreDistributed0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed005 start *************");
        const record = {
            "name": "Jim",
            "age": 20,
        }
        try {
            let rowId = await rdbStore.insert("employee", record)
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
    it('testRdbStoreDistributed0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed006 start *************");
        const record1 = {
            "name": "Jim",
            "age": 20,
        }
        const record2 = {
            "name": "Jim",
            "age": 30,
        }
        await rdbStore.insert("employee", record1);
        try {
            let predicate = new data_Rdb.RdbPredicates("employee");
            predicate.equalTo("id", 1);
            try {
                let rowId = await rdbStore.update(record2, predicate);
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
    it('testRdbStoreDistributed0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0007 start *************");
        const record1 = {
            "name": "Jim",
            "age": 30,
        }
        await rdbStore.insert("employee", record1);
        try {
            let predicates = new data_Rdb.RdbPredicates("employee")
            let resultSet = await rdbStore.query(predicates)
            try {
                console.info(TAG + "product resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                const age = await resultSet.getLong(resultSet.getColumnIndex("age"))

                await expect(1).assertEqual(id);
                await expect("Jim").assertEqual(name);
                await expect(30).assertEqual(age);
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
            } catch (e) {
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
    it('testRdbStoreDistributed0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0008 start *************");
        const record1 = {
            "name": "Jim",
            "age": 20,
        }
        await rdbStore.insert("employee", record1);
        let predicates = new data_Rdb.RdbPredicates("employee")
        try {
            let number = await rdbStore.delete(predicates)
            console.info(TAG + "employee Delete done: " + number)
            expect(1).assertEqual(number)
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
    it('testRdbStoreDistributed0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
    it('testRdbStoreDistributed0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0010 start *************");
        let predicates = new data_Rdb.RdbPredicates("employee")
        try {
            predicates = predicates.inAllDevices();
            console.info(TAG + "inAllDevices success");
            expect(predicates).assertEqual(predicates);
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
    it('testRdbStoreDistributed0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0011 start *************");
        let predicates = new data_Rdb.RdbPredicates("employee")
        let pr = predicates.inDevices(["12345678abcd"]);
        await rdbStore.sync(data_Rdb.SyncMode.SYNC_MODE_PUSH, predicates).then(() => {
            console.info(TAG + "sync push success");
        }).catch((err) => {
            console.info(TAG + "err.code:" + err.code + "err.msg:" + err.message)
            expect(err.code).assertEqual(14800000)
        });
        await rdbStore.sync(data_Rdb.SyncMode.SYNC_MODE_PULL, predicates).then(() => {
            console.info(TAG + "sync pull success");
        }).catch((err) => {
            console.info(TAG + "err.code:" + err.code + "err.msg:" + err.message)
            expect(err.code).assertEqual(14800000)
        });
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
    it('testRdbStoreDistributedCallback0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributedCallback0011 start *************");
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        let predicates = new data_Rdb.RdbPredicates("employee")
        predicates = predicates.inDevices(["12345678abcd"]);
        await rdbStore.sync(data_Rdb.SyncMode.SYNC_MODE_PUSH, predicates, async (err,ret)=>{
            if(err){
                console.info(TAG + "err.code:" + err.code + "err.msg:" + err.message)
                expect(err.code).assertEqual(14800000)
            }
            console.info(TAG + "sync push success");
            await rdbStore.sync(data_Rdb.SyncMode.SYNC_MODE_PULL, predicates,(err,ret)=>{
                if(err){
                    console.info(TAG + "err.code:" + err.code + "err.msg:" + err.message)
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
     it('testRdbStoreDistributed0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0012 start *************");
        try{
            rdbStore.on("dataChange", data_Rdb.SubscribeType.SUBSCRIBE_TYPE_REMOTE, storeObserver);
            console.info(TAG + "on dataChange success ");
        }catch(err){
            console.info(TAG + "on dataChange " + err);
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
    it('testRdbStoreDistributed0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0013 start *************");
        try{
            rdbStore.off("dataChange", data_Rdb.SubscribeType.SUBSCRIBE_TYPE_REMOTE, storeObserver);
            console.info(TAG + "off dataChange success ");
        }catch(err){
            console.info(TAG + "off dataChange " + err);
            expect(err !== null).assertFalse();
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed0013 end *************");
    })
	
    /**
     * @tc.name   testRdbStoreDistributed0014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1400
     * @tc.desc   obtainDistributedTableName test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDistributed0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done){
        let errInfo = undefined;
        try{
            rdbStore.obtainDistributedTableName(["deviceId"], "EMPLOYEE", function (err, tableName) {
                expect(err != null).assertTrue();
                console.info('ObtainDistributedTableName failed, Unauthorized.' + err)
            })
        }catch(err){
            errInfo = err
        }
        expect(errInfo.code).assertEqual("401")
        done();
    })

     /**
      * @tc.name   testRdbStoreDistributed0015
      * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1500
      * @tc.desc   obtainDistributedTableName test
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('testRdbStoreDistributed0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async function (done){
        await data_Rdb.deleteRdbStore(context, STORE_NAME);
        const config = {
            "name": STORE_NAME,
            securityLevel: data_Rdb.SecurityLevel.S1
        }
        rdbStore = await data_Rdb.getRdbStore(context, config);
        let errInfo = undefined
        try{
            rdbStore.obtainDistributedTableName(["deviceId"], "EMPLOYEE")
        }catch(err){
            errInfo = err
        }
        expect(errInfo.code).assertEqual("401")
        done();
     })
    
    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_016
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1600
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        let predicates = new data_Rdb.RdbPredicates("employee")
        predicates = predicates.inDevices(["12345678abcd"]);
        console.info(TAG + `SYNC_MODE_TIME_FIRST = ` + data_Rdb.SyncMode.SYNC_MODE_TIME_FIRST);
        expect(data_Rdb.SyncMode.SYNC_MODE_TIME_FIRST).assertEqual(4);
        console.info(TAG + "DATA_CHANGE = " + data_Rdb.ChangeType.DATA_CHANGE);
        expect(data_Rdb.ChangeType.DATA_CHANGE).assertEqual(0);
        console.info(TAG + "ASSET_CHANGE = " + data_Rdb.ChangeType.ASSET_CHANGE);
        expect(data_Rdb.ChangeType.ASSET_CHANGE).assertEqual(1);
        try{
            rdbStore.sync(data_Rdb.SyncMode.SYNC_MODE_TIME_FIRST, predicates, function (err, result) {
                if (err) {
                    console.error(TAG + `Sync failed, code is ${err.code},message is ${err.message}`);
                    expect(err === null).assertFail();
                }
                console.info(TAG + `Sync done.` + result);
                expect(result !== null).assertFail();
            })
        }catch(error){
            console.error(TAG + `failed, code is ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_017
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1700
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        let predicates = new data_Rdb.RdbPredicates("employee")
        predicates = predicates.inDevices(["12345678abcd"]);
        console.info(TAG + `SYNC_MODE_NATIVE_FIRST = ` + data_Rdb.SyncMode.SYNC_MODE_NATIVE_FIRST);
        expect(data_Rdb.SyncMode.SYNC_MODE_NATIVE_FIRST).assertEqual(5);
        try{
            rdbStore.sync(data_Rdb.SyncMode.SYNC_MODE_NATIVE_FIRST, predicates, function (err, result) {
                if (err) {
                    console.error(TAG + `Sync failed, code is ${err.code},message is ${err.message}`);
                    expect(err === null).assertFail();
                }
                console.info(TAG + `Sync done.` + result);
                expect(result !== null).assertFail();
            })
        }catch(error){
            console.error(TAG + `failed, code is ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_018
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1800
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        let predicates = new data_Rdb.RdbPredicates("employee")
        predicates = predicates.inDevices(["12345678abcd"]);
        console.info(TAG + `SYNC_MODE_CLOUD_FIRST = ` + data_Rdb.SyncMode.SYNC_MODE_CLOUD_FIRST);
        expect(data_Rdb.SyncMode.SYNC_MODE_CLOUD_FIRST).assertEqual(6);
        try{
            rdbStore.sync(data_Rdb.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates, function (err, result) {
                if (err) {
                    console.error(TAG + `Sync failed, code is ${err.code},message is ${err.message}`);
                    expect(err === null).assertFail();
                }
                console.info(TAG + `Sync done.` + result);
                expect(result !== null).assertFail();
            })
        }catch(error){
            console.error(TAG + `failed, code is ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_019
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1900
     * @tc.desc   sync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            rdbStore.on("dataChange", data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD, function (devices) {
                console.info(TAG + devices + " dataChange");
                expect(devices).assertEqual(null);
            });
        }catch(err){
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
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            rdbStore.on('dataChange', data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS, function (table) {
                console.info(TAG + table + " dataChange");
                expect(table).assertEqual(null);
            });
        }catch(err){
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
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            rdbStore.on('dataChange', data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS, function (type) {
                console.info(TAG + type + " dataChange");
                expect(type).assertEqual(null);
            });
        }catch(err){
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
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        function Observer(inserted) {
            console.info(TAG + inserted + " dataChange");
            expect(inserted).assertEqual(null);
        }
        try{
            rdbStore.on('dataChange', data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS, Observer);
        }catch(err){
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
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            rdbStore.on('dataChange', data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS, function (updated) {
                console.info(TAG + updated + " dataChange");
                expect(updated).assertEqual(null);
            });
        }catch(err){
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
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            rdbStore.on('dataChange', data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS, function (deleted) {
                console.info(TAG + deleted + " dataChange");
                expect(deleted).assertEqual(null);
            });
        }catch(err){
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
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            await rdbStore.setDistributedTables(['employee'], data_Rdb.DistributedType.DISTRIBUTED_DEVICE, function (err){
                if (err) {
                    console.error(TAG + `SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(TAG + `SetDistributedTables successfully.`);
                expect(err == undefined).assertTrue();
                done();
            })
        } catch (err) {
            console.info(TAG + "set employee to be distributed table failed");
            expect(null).assertFail();
            done()
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
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            await rdbStore.setDistributedTables(['test'], data_Rdb.DistributedType.DISTRIBUTED_CLOUD, function (err){
                if (err) {
                    console.error(TAG + `SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(TAG + `SetDistributedTables successfully.`);
                expect(err == undefined).assertTrue();
                done();
            })
        } catch (err) {
            console.info(TAG + "set employee and product to be distributed table failed");
            expect(null).assertFail();
            done()
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
    it('SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try{
            rdbStore.on('dataChange', data_Rdb.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, function (table) {
                console.info(TAG + table + " dataChange");
                expect(table).assertEqual(null);
            });
        }catch(err){
            console.info(TAG + "on dataChange " + err);
            expect(err !== null).assertFalse();
        }
        done();

    })

	
    console.info(TAG + "*************Unit Test End*************");
})
}
