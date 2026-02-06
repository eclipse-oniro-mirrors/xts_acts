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
import data_relationalStore from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common';

let context: common.UIAbilityContext;

const TAG = "[RELATIONAL_STORE_ESTKITS_ATTACH_TEST]  ";

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
"name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
"name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

let dataBaseDir : String;

const STORE_CONFIG = {
    name: "rdbstore.db",
    securityLevel: data_relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1 = {
    name: "rdbstore1.db",
    securityLevel: data_relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG2 = {
    name: "rdbstore2.db",
    encrypt: true,
    securityLevel: data_relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG3 = {
    name: "rdbstore3.db",
    encrypt: true,
    securityLevel: data_relationalStore.SecurityLevel.S1,
}

export default function rdbStoreAttachEtsunitTest() {
    describe('rdbStoreAttachEtsunitTest', function () {
        beforeAll(async function () {
            console.info(TAG + 'beforeAll');
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
        })
        
        beforeEach(async function () {
            console.info(TAG + 'beforeEach');
            try{
                let attachStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
                console.info(TAG + 'beforeEach context databasedir: ' + context.databaseDir);
                dataBaseDir = context.databaseDir + "/rdb/";
                console.info(TAG + 'beforeEach STORE_CONFIG1 success');
                await attachStore.executeSql(CREATE_TABLE_TEST1);
                let attachStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG2);
                await attachStore1.executeSql(CREATE_TABLE_TEST1);
            }catch{
                console.info(TAG + 'beforeEach STORE_CONFIG1 error:');
            }

        })
        
        afterEach(async function () {
            console.info(TAG + 'afterEach');
            await data_relationalStore.deleteRdbStore(context, "rdbstore.db");
            await data_relationalStore.deleteRdbStore(context, "rdbstore1.db");
            await data_relationalStore.deleteRdbStore(context, "rdbstore2.db");
            await data_relationalStore.deleteRdbStore(context, "rdbstore3.db");
            console.info(TAG + 'afterEach success');
        })
        
        afterAll(async function () {
            console.info(TAG + 'afterAll');
        })
        
        
        async function attachInsert(store, tableName) {   
            var u8 = new Uint8Array([1, 2, 3]);
            const valueBucket = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            };
            await store.insert(tableName, valueBucket);
        }
        
        async function attachBatchInsert(store, tableName) {
            var u8 = new Uint8Array([1, 2, 3]);
            const valueBucket = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            };
            let valueBucketArray = new Array();
            for (let i = 0; i < 10; i++) {
                valueBucketArray.push(valueBucket);
            }
            await store.batchInsert(tableName, valueBucketArray);
        }
        
        async function insertCheck(store, tableName, ret) {
            let predicates = new data_relationalStore.RdbPredicates(tableName);
            let resultSet = await store.query(predicates);
            let count = resultSet.rowCount;
            expect(ret).assertEqual(count);
            resultSet.close();
        }
        
        async function updateCheck(store, tableName) {
            var u8 = new Uint8Array([4, 5, 6]);
            const valueBucket = {
                "name": "lisi",
                "age": 20,
                "salary": 200.5,
                "blobType": u8,
            };
            let predicates = new data_relationalStore.RdbPredicates(tableName);
            predicates.equalTo("id", "1");
            let ret = await store.update(valueBucket, predicates);
            expect(1).assertEqual(ret);
        }
        
        async function deleteCheck(store, tableName, count) {
            let predicates = new data_relationalStore.RdbPredicates(tableName);
            let ret = await store.delete(predicates);
            expect(count).assertEqual(ret);
        }
        
        async function attachCheck(store) {
            await attachInsert(store, "test");
            await insertCheck(store, "test", 2);
            await updateCheck(store, "test");
            await attachBatchInsert(store, "test");
            await insertCheck(store, "test", 12);
            await deleteCheck(store, "test", 12);
        
            await attachInsert(store, "test1");
            await insertCheck(store, "test1", 1);
            await updateCheck(store, "test1");
            await attachBatchInsert(store, "test1");
            await insertCheck(store, "test1", 11);
            await deleteCheck(store, "test1", 11);
        }
        
        console.log(TAG + "*************Ets Test Begin*************");
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0010
         * @tc.desc non encrypted database attach non encrypted database
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0001 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachInsert(store, "test");
        
            let number = await store.attach(context, STORE_CONFIG1, "attachDB");
            expect(1).assertEqual(number);
        
            await attachCheck(store);
            expect(0).assertEqual(await store.detach("attachDB"))
            console.log(TAG + "************* testRdbStoreAttach0001 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0020
         * @tc.desc non encrypted database attach encrypted database
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0002 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachInsert(store, "test");
        
            let number = await store.attach(context, STORE_CONFIG2, "attachDB");
            expect(1).assertEqual(number);
        
            await attachCheck(store);
            expect(0).assertEqual(await store.detach("attachDB"));
            console.log(TAG + "************* testRdbStoreAttach0002 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0030
         * @tc.desc encrypted database attach encrypted database
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0003 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG3);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachInsert(store, "test");
        
            let number = await store.attach(context, STORE_CONFIG2, "attachDB");
            expect(1).assertEqual(number);
        
            await attachCheck(store);
            expect(0).assertEqual(await store.detach("attachDB"));
            console.log(TAG + "************* testRdbStoreAttach0003 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0040
         * @tc.desc encrypted databases are not supported for attaching non encrypted databases
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0004 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG3);
            try {
                await store.attach(context, STORE_CONFIG1, "attachDB");
                expect().assertFail();
            } catch(e) {
                console.log("attach err: failed, err: code=" + e.code + " message=" + e.message)
                expect(801).assertEqual(e.code);
            }
            console.log(TAG + "************* testRdbStoreAttach0004 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0050
         * @tc.desc non encrypted database attach non encrypted database
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0005 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachInsert(store, "test");
            try {
                let number = await store.attach(dataBaseDir + "rdbstore1.db", "attachDB");
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0005 err: failed, err: code=" + e.code + " message=" + e.message);
                expect().assertFail();
            }
            await attachCheck(store);
            expect(0).assertEqual(await store.detach("attachDB"));
            console.log(TAG + "************* testRdbStoreAttach0005 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0060
         * @tc.desc path error for non encrypted database
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0006 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachInsert(store, "test");
        
            let STORE_CONFIG4 = {
                name: "/wrong/rdbstore.db",
                securityLevel: data_relationalStore.SecurityLevel.S1,
            }
            try {
                await store.attach(context, STORE_CONFIG4, "attachDB");
                expect().assertFail();
            } catch (e) {
                console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
                expect("401").assertEqual(e.code);
            }
            console.log(TAG + "************* testRdbStoreAttach0006 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0070
         * @tc.desc non encrypted database attach non encrypted database with same table name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0007 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST1);
            await attachInsert(store, "test1");
        
            let number = await store.attach(context, STORE_CONFIG1, "attachDB");
            expect(1).assertEqual(number);
        
            await attachInsert(store, "test1");
            await insertCheck(store, "test1", 2);
            await updateCheck(store, "test1");
            await attachBatchInsert(store, "test1");
            await insertCheck(store, "test1", 12);
            await deleteCheck(store, "test1", 12);
        
            await attachInsert(store, "attachDB.test1");
            await insertCheck(store, "attachDB.test1", 1);
            await updateCheck(store, "attachDB.test1");
            await attachBatchInsert(store, "attachDB.test1");
            await insertCheck(store, "attachDB.test1", 11);
            await deleteCheck(store, "attachDB.test1", 11);
        
            expect(0).assertEqual(await store.detach("attachDB"));
            console.log(TAG + "************* testRdbStoreAttach0007 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0080
         * @tc.desc resultSet occupies connection, attach failed
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0008 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachBatchInsert(store, "test");
        
            let predicates = new data_relationalStore.RdbPredicates("test");
            let resultSet = await store.query(predicates);
            let count = resultSet.rowCount;
            expect(10).assertEqual(count);
            try {
                await store.attach(dataBaseDir + "rdbstore1.db", "attachDB");
                expect().assertFail();
            } catch(e) {
                console.log("testRdbStoreAttach0008 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(14800015).assertEqual(e.code);
            }
            resultSet.close();
            console.log(TAG + "************* testRdbStoreAttach0008 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0090
         * @tc.desc repeat attach using the same alias
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0009 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachBatchInsert(store, "test");
            try {
                let number = await store.attach(context, STORE_CONFIG1, 'attachDB');
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach00010: failed, err: code=" + e.code + " message=" + e.message);
                expect().assertFail();
            }
            try {
                await store.attach(context, STORE_CONFIG1, 'attachDB');
                expect().assertFail();
            } catch(e) {
                console.log("testRdbStoreAttach0009: failed, err: code=" + e.code + " message=" + e.message);
                expect(14800016).assertEqual(e.code);
            }
            expect(0).assertEqual(await store.detach("attachDB"));
        
            console.log(TAG + "************* testRdbStoreAttach0009 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0100
         * @tc.desc WaitTime exceeds maximum limit
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach00010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach00010 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachBatchInsert(store, "test");
            try {
                let number = await store.attach(context, STORE_CONFIG1, 'attachDB', 300);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach00010: failed, err: code=" + e.code + " message=" + e.message);
                expect().assertFail();
            }
            try {
                await store.attach(context, STORE_CONFIG1, 'attachDB', 301);
                expect().assertFail();
            } catch(e) {
                console.log("testRdbStoreAttach00010: failed, err: code=" + e.code + " message=" + e.message);
                expect("401").assertEqual(e.code);
            }
            expect(0).assertEqual(await store.detach("attachDB"));
        
            console.log(TAG + "************* testRdbStoreAttach00010 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0110
         * @tc.desc WaitTime exceeds the minimum limit
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach00011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach00011 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachBatchInsert(store, "test");
            try {
                let number = await store.attach(context, STORE_CONFIG1, 'attachDB', 1);
                console.log("testRdbStoreAttach00011: number= " + number);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach00010: failed, err: code=" + e.code + " message=" + e.message);
                expect().assertFail();
            }
            try {
                await store.attach(context, STORE_CONFIG1, 'attachDB', -1);
                expect().assertFail();
            } catch(e) {
                console.log("testRdbStoreAttach00011: failed, err: code=" + e.code + " message=" + e.message);
                expect('401').assertEqual(e.code);
            }
            expect(0).assertEqual(await store.detach("attachDB"));
        
            console.log(TAG + "************* testRdbStoreAttach00011 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0120
         * @tc.desc the alias cannot be empty
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach00012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach00012 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachBatchInsert(store, "test");
            try {
                await store.attach(context, STORE_CONFIG1, '');
                expect().assertFail();
            } catch(e) {
                console.log("testRdbStoreAttach00012 : failed, err: code=" + e.code + " message=" + e.message);
                expect('401').assertEqual(e.code);
            }
            console.log(TAG + "************* testRdbStoreAttach00012 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0130
         * @tc.desc input error path
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach00013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach00013 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachBatchInsert(store, "test");
            try {
                await store.attach("/path/errPath/attach.db", "attachDB");
                expect().assertFail();
            } catch(e) {
                console.log("testRdbStoreAttach00013 : failed, err: code=" + e.code + " message=" + e.message);
                expect(14800010).assertEqual(e.code);
            }
            console.log(TAG + "************* testRdbStoreAttach00013 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0140
         * @tc.desc input empty path
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach00014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach00014 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachBatchInsert(store, "test");
            try {
                await store.attach("", "attachDB");
                expect().assertFail();
            } catch(e) {
                console.log("testRdbStoreAttach00014 : failed, err: code=" + e.code + " message=" + e.message);
                expect('401').assertEqual(e.code);
            }
            console.log(TAG + "************* testRdbStoreAttach00014 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0010
         * @tc.desc non encrypted database attach non encrypted database
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0015 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachInsert(store, "test");
            try {
                let number = await store.attach(context, STORE_CONFIG1, "attachDB");
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0015 : failed, err: code=" + e.code + " message=" + e.message);
                expect('14801001').assertEqual(e.code);
            }
            await attachCheck(store);
            expect(0).assertEqual(await store.detach("attachDB"))
            console.log(TAG + "************* testRdbStoreAttach0015 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0010
         * @tc.desc non encrypted database attach non encrypted database
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0016 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachInsert(store, "test");
            try {
                let number = await store.attach(context, STORE_CONFIG1, "attachDB");
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0016 : failed, err: code=" + e.code + " message=" + e.message);
                expect('14800032').assertEqual(e.code);
            }
            await attachCheck(store);
            expect(0).assertEqual(await store.detach("attachDB"))
            console.log(TAG + "************* testRdbStoreAttach0016 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0010
         * @tc.desc non encrypted database attach non encrypted database
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0017 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachInsert(store, "test");
            try {
                let number = await store.attach(context, STORE_CONFIG1, "attachDB");
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0017 : failed, err: code=" + e.code + " message=" + e.message);
                expect('14800033').assertEqual(e.code);
            }
            await attachCheck(store);
            expect(0).assertEqual(await store.detach("attachDB"))
            console.log(TAG + "************* testRdbStoreAttach0017 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0050
         * @tc.desc non encrypted database attach non encrypted database
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0018 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachInsert(store, "test");
            try {
                let number = await store.attach(dataBaseDir + "rdbstore1.db", "attachDB");
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0018 err: failed, err: code=" + e.code + " message=" + e.message);
                expect('14800033').assertEqual(e.code);
            }
            await attachCheck(store);
            expect(0).assertEqual(await store.detach("attachDB"));
            console.log(TAG + "************* testRdbStoreAttach0018 end *************");
        })
        
        /**
         * @tc.name the attach function
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0050
         * @tc.desc non encrypted database attach non encrypted database
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreAttach0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log(TAG + "************* testRdbStoreAttach0018 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await attachInsert(store, "test");
            try {
                let number = await store.attach(dataBaseDir + "rdbstore1.db", "attachDB");
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0018 err: failed, err: code=" + e.code + " message=" + e.message);
                expect('14800032').assertEqual(e.code);
            }
            await attachCheck(store);
            expect(0).assertEqual(await store.detach("attachDB"));
            console.log(TAG + "************* testRdbStoreAttach0018 end *************");
        })
        
        console.log(TAG + "*************Ets Test End*************");
        })
}