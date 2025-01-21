/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
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

export default function relationalStoreDistributedTest() {
describe('relationalStoreDistributedTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
        rdbStore = await data_Rdb.getRdbStore(context, config);
        console.info(TAG + "create RelationalStore store success")
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
        await data_Rdb.deleteRdbStore(context, STORE_NAME);
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name set_distributed_table_none_table
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_002
     * @tc.desc RelationalStore set distributed table using none table as argment
     */
    it('testRdbStoreDistributed0002', 0, async function (done) {
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
     * @tc.name set distributed table using one table name
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_003
     * @tc.desc set distributed table using one table name
     */
    it('testRdbStoreDistributed0003', 0, async function (done) {
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
     * @tc.name set distributed table using two table name
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_004
     * @tc.desc set distributed table using two table name
     */
    it('testRdbStoreDistributed0004', 0, async function (done) {
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
     * @tc.name insert record after setting distributed table
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_005
     * @tc.desc insert record after setting distributed table
     */
    it('testRdbStoreDistributed0005', 0, async function (done) {
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
     * @tc.name update record after setting distributed table
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_006
     * @tc.desc update record after setting distributed table
     */
    it('testRdbStoreDistributed0006', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed006 start *************");
        const record = {
            "name": "Jim",
            "age": 30,
        }
        try {
            let predicate = new data_Rdb.RdbPredicates("employee");
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
     * @tc.name query record after setting distributed table
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_007
     * @tc.desc query record after setting distributed table
     */
    it('testRdbStoreDistributed0007', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0007 start *************");
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
     * @tc.name delete record after setting distributed table
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_008
     * @tc.desc delete record after setting distributed table
     */
    it('testRdbStoreDistributed0008', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0008 start *************");
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
     * @tc.name predicates inDevice
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_009
     * @tc.desc predicates inDevice
     */
    it('testRdbStoreDistributed0009', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0009 start *************");
        let predicates = new data_Rdb.RdbPredicates("employee")
        try {
            predicates = predicates.inDevices("1234567890");
            console.info(TAG + "inDevices success");
            expect(predicates).assertEqual(predicates);
        } catch (err) {
            console.info(TAG + "inDevices failed");
            expect(null).assertFail();
        }
        done();
        console.info(TAG + "************* testRdbStoreDistributed0009 end *************");
    })

    /**
     * @tc.name predicates inAllDevices
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_010
     * @tc.desc predicates inAllDevices
     */
    it('testRdbStoreDistributed0010', 0, async function (done) {
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
     * @tc.name sync test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_011
     * @tc.desc sync test
     */
    it('testRdbStoreDistributed0011', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0011 start *************");
        let predicates = new data_Rdb.RdbPredicates("employee")
        predicates = predicates.inDevices("12345678abcd");
        rdbStore.sync(data_Rdb.SyncMode.SYNC_MODE_PUSH, predicates);
        console.info(TAG + "sync push success");
        expect(rdbStore).assertEqual(rdbStore);
        rdbStore.sync(data_Rdb.SyncMode.SYNC_MODE_PULL, predicates);
        console.info(TAG + "sync pull success");
        expect(rdbStore).assertEqual(rdbStore);
        done();
        console.info(TAG + "************* testRdbStoreDistributed0011 end *************");
    })
	
	/**
     * @tc.name sync Callback test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_Callback_011
     * @tc.desc sync Callback test
     */
    it('testRdbStoreDistributedCallback0011', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributedCallback0011 start *************");
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        let predicates = new data_Rdb.RdbPredicates("employee")
        predicates = predicates.inDevices("12345678abcd");
        rdbStore.sync(data_Rdb.SyncMode.SYNC_MODE_PUSH, predicates,(err,ret)=>{
            console.info(TAG + "sync push success");
            expect(rdbStore).assertEqual(rdbStore);
            rdbStore.sync(data_Rdb.SyncMode.SYNC_MODE_PULL, predicates,(err,ret)=>{
                console.info(TAG + "sync push success");
                expect(rdbStore).assertEqual(rdbStore);
            });
            done();
        });
        await sleep(2000)
        done();
        console.info(TAG + "************* testRdbStoreDistributedCallback0011 end *************");
    })

    /**
     * @tc.name subscribe test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_012
     * @tc.desc subscribe test
     */
    it('testRdbStoreDistributed0012', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0012 start *************");
        rdbStore.on("dataChange", (device) => {
            console.info(TAG + device + " dataChange");
        });
        console.info(TAG + "on dataChange success");
        expect(rdbStore).assertEqual(rdbStore);
        done()
        console.info(TAG + "************* testRdbStoreDistributed0012 end *************");
    })

    /**
     * @tc.name subscribe test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_013
     * @tc.desc subscribe test
     */
    it('testRdbStoreDistributed0013', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreDistributed0013 start *************");
        rdbStore.off("dataChange", (device) => {
            console.info(TAG + device + " dataChange");
        });
        console.info(TAG + "off dataChange success");
        expect(rdbStore).assertEqual(rdbStore);
        done()
        console.info(TAG + "************* testRdbStoreDistributed0013 end *************");
    })
	
    /**
     * @tc.name obtainDistributedTableName Callback interface test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_014
     * @tc.desc obtainDistributedTableName test
     */
    it('testRdbStoreDistributed0014', 0, async function (done){
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
     * @tc.name obtainDistributedTableName Promise interface test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Distributed_015
     * @tc.desc obtainDistributedTableName test
     */
     it('testRdbStoreDistributed0015',0,async function (done){
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
	
    console.info(TAG + "*************Unit Test End*************");
})
}
