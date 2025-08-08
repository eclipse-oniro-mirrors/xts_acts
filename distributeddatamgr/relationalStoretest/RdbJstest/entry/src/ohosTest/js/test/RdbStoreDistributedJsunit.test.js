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
import dataRdb from '@ohos.data.rdb';
import abilityFeatureAbility from '@ohos.ability.featureAbility';

let context = abilityFeatureAbility.getContext();
var sqlStatement = "CREATE TABLE IF NOT EXISTS employee (" +
"id INTEGER PRIMARY KEY AUTOINCREMENT," +
"name TEXT NOT NULL," +"age INTEGER)"
sqlStatement = "CREATE TABLE IF NOT EXISTS product (" +
"id INTEGER PRIMARY KEY AUTOINCREMENT," +
"name TEXT NOT NULL," +"price REAL," +
"vendor INTEGER," +"describe TEXT)"
const TAG = "[RDB_JSKITS_TEST_Distributed]"
const STORE_NAME = "distributed_rdb.db"
var rdbStore = undefined;
const config = {
    "name": STORE_NAME,
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
function storeObserver(devices) {
    console.info(TAG + devices + " dataChange");
    expect(devices).assertEqual(null)
}

export default function rdbStoreDistributedTest() {
describe('rdbStoreDistributedTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
        rdbStore = await dataRdb.getRdbStore(config, 1);
        console.info(TAG + "create rdb store success")
        await executeSql1()
        await executeSql2()
    })

    beforeEach(async function () {
        console.info(TAG + 'beforeEach')
    })

    afterEach(async function () {
        console.info(TAG + 'afterEach')
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
        await dataRdb.deleteRdbStore(STORE_NAME);
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name testRdbStoreDistributed0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_0100
     * @tc.desc rdb set distributed table using none table as argment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreDistributed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed002 start *************");
        try {
            await rdbStore.setDistributedTables([])
            console.info(TAG + "set none to be distributed table success");
            expect(rdbStore).assertEqual(rdbStore)
        } catch (err) {
            console.info(TAG + "set none to be distributed table failed");
            expect(null).assertFail();
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed002 end *************");
    })

    /**
     * @tc.name testRdbStoreDistributed0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_0200
     * @tc.desc set distributed table using one table name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreDistributed0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed003 start *************");
        try {
            await rdbStore.setDistributedTables(['employee'])
            console.info(TAG + "set employee to be distributed table success");
            expect(rdbStore).assertEqual(rdbStore)
        } catch (err) {
            console.info(TAG + "set employee to be distributed table failed");
            expect(null).assertFail();
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed003 end *************");
    })

    /**
     * @tc.name testRdbStoreDistributed0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_0300
     * @tc.desc set distributed table using two table name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreDistributed0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed004 start *************");
        try {
            await rdbStore.setDistributedTables(['employee', 'product'])
            console.info(TAG + "set employee and product to be distributed table success");
            expect(rdbStore).assertEqual(rdbStore)
        } catch (err) {
            console.info(TAG + "set employee and product to be distributed table failed");
            expect(null).assertFail();
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed004 end *************");
    })

    /**
     * @tc.name testRdbStoreDistributed0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_0400
     * @tc.desc insert record after setting distributed table
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
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
     * @tc.name testRdbStoreDistributed0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_0500
     * @tc.desc update record after setting distributed table
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreDistributed0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed006 start *************");
        const record = {
            "name": "Jim",
            "age": 30,
        }
        try {
            let predicate = new dataRdb.RdbPredicates("employee");
            predicate.equalTo("id", 1);
            try {
                let rowId = await rdbStore.update(record, predicate);
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
     * @tc.name testRdbStoreDistributed0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_0600
     * @tc.desc query record after setting distributed table
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreDistributed0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0007 start *************");
        try {
            let predicates = new dataRdb.RdbPredicates("employee")
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
     * @tc.name testRdbStoreDistributed0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_0700
     * @tc.desc delete record after setting distributed table
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreDistributed0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0008 start *************");
        let predicates = new dataRdb.RdbPredicates("employee")
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
     * @tc.name testRdbStoreDistributed0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_0800
     * @tc.desc predicates inDevice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreDistributed0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0009 start *************");
        let predicates = new dataRdb.RdbPredicates("employee")
        try {
            let pr = predicates.inDevices(['1234567890']);
            console.info(TAG + "inDevices success" + pr);
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
     * @tc.name testRdbStoreDistributed0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_0900
     * @tc.desc predicates inAllDevices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreDistributed0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0010 start *************");
        let predicates = new dataRdb.RdbPredicates("employee")
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
     * @tc.name testRdbStoreDistributed0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_1000
     * @tc.desc sync test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreDistributed0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0011 start *************");
        let predicates = new dataRdb.RdbPredicates("employee")
        let pr = predicates.inDevices(['12345678abcd']);
        console.info(TAG + "testRdbStoreDistributed0011" + pr);
        await rdbStore.sync(dataRdb.SyncMode.SYNC_MODE_PUSH, predicates).then(() => {
            console.info(TAG + "sync push success");
        }).catch((err) => {
            console.info(TAG + "err.code:" + err.code + "err.msg:" + err.message)
            expect(err.message).assertEqual("async error.")
        });
        await rdbStore.sync(dataRdb.SyncMode.SYNC_MODE_PULL, predicates).then(() => {
            console.info(TAG + "sync pull success");
        }).catch((err) => {
            console.info(TAG + "err.code:" + err.code + "err.msg:" + err.message)
            expect(err.message).assertEqual("async error.")
        });
        done();
        console.info(TAG + "************* testRdbStoreDistributed0011 end *************");
    })
	
	/**
     * @tc.name testRdbStoreDistributedCallback0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_1100
     * @tc.desc sync Callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreDistributedCallback0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributedCallback0011 start *************");
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        let predicates = new dataRdb.RdbPredicates("employee")
        let pr = predicates.inDevices(['12345678abcd']);
        console.info(TAG + " testRdbStoreDistributedCallback0011 pr = " + pr);
        await rdbStore.sync(dataRdb.SyncMode.SYNC_MODE_PUSH, predicates, async (err,ret)=>{
            if(err){
                console.info(TAG + "err.code:" + err.code + "err.msg:" + err.message)
                expect(err.message).assertEqual("async error.")
            }
            console.info(TAG + "sync push success");
            await rdbStore.sync(dataRdb.SyncMode.SYNC_MODE_PULL, predicates,(err,ret)=>{
                if(err){
                    console.info(TAG + "err.code:" + err.code + "err.msg:" + err.message)
                    expect(err.message).assertEqual("async error.")
                }
                console.info(TAG + "sync pull success");
                done();
            });
        });
        console.info(TAG + "************* testRdbStoreDistributedCallback0011 end *************");
    })

    /**
     * @tc.name testRdbStoreDistributed0012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_1200
     * @tc.desc subscribe test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
     it('testRdbStoreDistributed0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0012 start *************");
        try{
            rdbStore.on("dataChange", dataRdb.SubscribeType.SUBSCRIBE_TYPE_REMOTE, storeObserver);
            console.info(TAG + "on dataChange success ");
        }catch(err){
            console.info(TAG + "on dataChange " + err);
            expect(err !== null).assertFalse();
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed0012 end *************");
    })

    /**
     * @tc.name testRdbStoreDistributed0013
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_1300
     * @tc.desc subscribe test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
     it('testRdbStoreDistributed0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0013 start *************");
        try{
            rdbStore.off("dataChange", dataRdb.SubscribeType.SUBSCRIBE_TYPE_REMOTE, storeObserver);
            console.info(TAG + "off dataChange success ");
        }catch(err){
            console.info(TAG + "off dataChange " + err);
            expect(err !== null).assertFalse();
        }
        done()
        console.info(TAG + "************* testRdbStoreDistributed0013 end *************");
    })
	
    /**
     * @tc.name testRdbStoreDistributed0014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_1400
     * @tc.desc obtainDistributedTableName test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
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
     * @tc.name testRdbStoreDistributed0015
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBSyncJsAPITest_1500
     * @tc.desc obtainDistributedTableName test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
     it('testRdbStoreDistributed0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done){
        await dataRdb.deleteRdbStore(STORE_NAME);
        const config = {
            "name": STORE_NAME,
        }
        rdbStore = await dataRdb.getRdbStore(config, 1);
        let errInfo = undefined
        try{
            rdbStore.obtainDistributedTableName(["deviceId"], "EMPLOYEE")
        }catch(err){
            errInfo = err
        }
        expect(errInfo.code).assertEqual("401")
        done();
    })
	
    console.info(TAG + "*************Unit Test End*************");
})
}
