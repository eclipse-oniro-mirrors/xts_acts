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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import data_relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';

let context: common.UIAbilityContext;

const TAG = "[RELATIONAL_STORE_ESTKITS_Corrupt_TEST]  ";

var rdbStore = undefined;
const dbName = "LockRowTest.db";
const TABLE = 'lockrowtest';
const LOG_TABLE = "naturalbase_rdb_aux_" + TABLE + "_log";
const CHECK_STATUS = "SELECT " + LOG_TABLE + ".status FROM " + LOG_TABLE + " INNER JOIN " + TABLE + " ON " +
    LOG_TABLE + ".data_key = " + TABLE + ".ROWID WHERE " + TABLE + ".name = '";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS " + TABLE + " (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
    "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB, data1 asset, data2 assets )";
let STORE_CONFIG = {
    name: dbName,
    securityLevel: data_relationalStore.SecurityLevel.S1,
}
const asset1 = {
    name: "name1",
    uri: "uri1",
    createTime: "createTime1",
    modifyTime: "modifyTime1",
    size: "size1",
    path: "path1",
    status: data_relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2 = {
    name: "name2",
    uri: "uri2",
    createTime: "createTime2",
    modifyTime: "modifyTime2",
    size: "size2",
    path: "path2",
    status: data_relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset3 = {
    name: "name3",
    uri: "uri3",
    createTime: "createTime3",
    modifyTime: "modifyTime3",
    size: "size3",
    path: "path3",
    status: data_relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset4 = {
    name: "name4",
    uri: "uri4",
    createTime: "createTime4",
    modifyTime: "modifyTime4",
    size: "size4",
    path: "path4",
    status: data_relationalStore.AssetStatus.ASSET_NORMAL,
}

var rdbStore = undefined;
var checkName = 'zhangsan';
var checkName2 = 'lisi';
const UNLOCK = 0;
const UNLOCKING = 1;
const LOCKED = 2;
const LOCK_CHANGE = 3;

export default function rdbstoreLockRowJsunitTest() {
    describe('rdbstoreLockRowJsunitTest', function () {
        
        beforeAll(async function () {
            console.log(TAG + 'beforeAll');
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig = {
                    autoSync: false,
                }
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect(null).assertFail();
            }
        })

        beforeEach(async function () {
            console.log(TAG + 'beforeEach');
        })

        afterEach(async function () {
            console.log(TAG + 'afterEach');
            rdbStore = null;
        })

        afterAll(async function () {
            console.log(TAG + 'afterAll');
            await data_relationalStore.deleteRdbStore(context, "LockRowTest.db");
        })
        async function checkStatus(name, status) {
            try {
                let sql = CHECK_STATUS + name + "'";
                let resultSet = await rdbStore.querySql(sql);
                expect(true).assertEqual(resultSet.goToNextRow());
                expect(status).assertEqual(resultSet.getLong(0));
                console.log(TAG + `checkStatus success, status: `+ resultSet.getLong(0) + ', expert is ' + status);
                resultSet.close();
            } catch (err) {
                console.log(TAG + `checkStatus failed, err: ${JSON.stringify(err)}`);
                expect().assertFail();
            }
        }
    
        async function queryLockedData(count, name) {
            console.log(TAG + `queryLockedData start`);
            try {
                let predicates = new data_relationalStore.RdbPredicates(TABLE);
                predicates.equalTo("name", name);
                let resultSet = await rdbStore.queryLockedRow(predicates);
                expect(count).assertEqual(resultSet.rowCount);
                resultSet.close();
                console.log(TAG + `query all columns success`);
            } catch (err) {
                console.log(TAG + `query all columns failed, err: ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            try {
                let predicates = new data_relationalStore.RdbPredicates(TABLE);
                predicates.equalTo("name", name);
                let resultSet = await rdbStore.queryLockedRow(predicates, ['name', 'age']);
                expect(count).assertEqual(resultSet.rowCount);
                resultSet.close();
                console.log(TAG + `query specified columns success`);
            } catch (err) {
                console.log(TAG + `query specified columns failed, err: ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            console.log(TAG + `queryLockedData end`);
        }

        console.log(TAG + "*************JS Test Begin*************");

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0100
     * @tc.name Normal test case of original state
     * @tc.desc 1.Insert data, check status
     *          2.Update data, check status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreLockRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
        console.log(TAG + "************* testRdbStoreLockRow0001 start *************");
        var u8 = new Uint8Array([1, 2, 3]);
        const assets = [asset1, asset2];
        try {
            const valueBucket = {
                "name": checkName,
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
                "data1": asset3,
                "data2": assets
            }
            let ret = await rdbStore.insert(TABLE, valueBucket);
            console.log(TAG + `insert end: ` + ret);
            expect(1).assertEqual(ret);
            checkStatus(checkName, UNLOCK);
            console.log(TAG + `checkStatus end`);
        } catch (err) {
            console.log(TAG + `init failed, err: ${JSON.stringify(err)}`);
            expect().assertFail();
        }
        queryLockedData(0, checkName);
        try {
            var u8 = new Uint8Array([4, 5, 6]);
            const valueBucket = {
                "name": checkName,
                "age": 20,
                "salary": 200.5,
                "blobType": u8,
                "data1": asset3,
                "data2": assets
            }
            let predicates = new data_relationalStore.RdbPredicates(TABLE);
            predicates.equalTo("name", checkName);
            let ret = await rdbStore.update(valueBucket, predicates);
            await expect(1).assertEqual(ret);
            checkStatus(checkName, UNLOCK);
        } catch (err) {
            console.log(TAG + `failed, err: ${JSON.stringify(err)}`);
            expect().assertFail();
        }
        queryLockedData(0, checkName);

        console.log(TAG + "************* testRdbStoreLockRow0001 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0200
     * @tc.name Abnormal test case of lock, if TABLE name or column invalid
     * @tc.desc Configure predicates (TABLE name: "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreLockRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
        console.log(TAG + "************* testRdbStoreLockRow0002 start *************");
        try {
            let predicates = new data_relationalStore.RdbPredicates("");
            await rdbStore.lockRow(predicates);
            expect().assertFail();
        } catch (err) {
            console.log(TAG + `failed, err: ${JSON.stringify(err)}`);
            expect("401").assertEqual(err.code);
        }
        console.log(TAG + "************* testRdbStoreLockRow0002 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0300
     * @tc.name Abnormal test case of unlock, if TABLE name or column invalid
     * @tc.desc Configure predicates (TABLE name: "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreLockRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
        console.log(TAG + "************* testRdbStoreLockRow0003 start *************");
        try {
            let predicates = new data_relationalStore.RdbPredicates("");
            await rdbStore.unlockRow(predicates);
            expect().assertFail();
        } catch (err) {
            console.log(TAG + `failed, err: ${JSON.stringify(err)}`);
            expect("401").assertEqual(err.code);
        }
        console.log(TAG + "************* testRdbStoreLockRow0003 end   *************");
    })
        console.log(TAG + "*************Unit Test End*************");
    })
}
