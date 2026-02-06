/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium";
import relationalStore from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import hilog from '@ohos.hilog'

let context: common.UIAbilityContext | undefined;

let domain: int  = 0x0000;
let tag: string = "testTag";

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
"name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
"name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

let dataBaseDir: String;

const STORE_CONFIG: relationalStore.StoreConfig = {
    name: "rdbstore.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1: relationalStore.StoreConfig = {
    name: "rdbstore1.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG2: relationalStore.StoreConfig = {
    name: "rdbstore2.db",
    encrypt: true,
    securityLevel: relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG3: relationalStore.StoreConfig = {
    name: "rdbstore3.db",
    encrypt: true,
    securityLevel: relationalStore.SecurityLevel.S1,
}

export default function rdbStoreAttachEtsunitTest() {
    describe('rdbStoreAttachEtsunitTest', (): void => {
        beforeAll(async (): Promise<void> => {
            console.info(tag + 'beforeAll');
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
            await Utils.msSleep(5000);
            context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        })
        
        beforeEach(async (): Promise<void> => {
            console.info(tag + 'beforeEach');
            try{
                let attachStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
                console.info(tag + 'beforeEach context databasedir: ' + context!.databaseDir);
                dataBaseDir = context!.databaseDir + "/rdb/";
                console.info(tag + 'beforeEach STORE_CONFIG1 success');
                await attachStore.executeSql(CREATE_TABLE_TEST1);
                let attachStore1 = await relationalStore.getRdbStore(context!, STORE_CONFIG2);
                await attachStore1.executeSql(CREATE_TABLE_TEST1);
            } catch (e) {
                console.info(tag + 'beforeEach STORE_CONFIG1 error, err: code=' + e.code + ' message=' + e.message);
            }

        })
        
        afterEach(async (): Promise<void> => {
            console.info(tag + 'afterEach');
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG2);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
            console.info(tag + 'afterEach success');
        })
        
        afterAll(async (): Promise<void> => {
            console.info(tag + 'afterAll');
        })
        
        
        const attachInsert: (store: relationalStore.RdbStore, tableName: string) => Promise<void> =
            async (store: relationalStore.RdbStore, tableName: string): Promise<void> => {
            let u8 = new Uint8Array([1, 2, 3]);
            hilog.info(domain, tag, 'RA0104 u8:' + JSON.stringify(u8));
            const valueBucket: relationalStore.ValuesBucket = {
                "name": "zhangsan",
                "age": 18 as Long,
                "salary": 100.5,
                "blobType": u8,
            };
            hilog.info(domain, tag, 'RA0111 valueBucket:' + JSON.stringify(valueBucket));
            await store.insert(tableName, valueBucket);
            hilog.info(domain, tag, 'RA0113 ');
        }

        const attachBatchInsert: (store: relationalStore.RdbStore, tableName: string) => Promise<void> =
            async (store: relationalStore.RdbStore, tableName: string): Promise<void> => {
            let u8 = new Uint8Array([1, 2, 3]);
            const valueBucket: relationalStore.ValuesBucket = {
                "name": "zhangsan",
                "age": 18 as Long,
                "salary": 100.5,
                "blobType": u8,
            };
            let valueBucketArray = new Array<relationalStore.ValuesBucket>();
            for (let i = 0; i < 10; i++) {
                valueBucketArray.push(valueBucket);
            }
            await store.batchInsert(tableName, valueBucketArray);
        }
        
        const insertCheck: (store: relationalStore.RdbStore, tableName: string, ret: number) => Promise<void> =
            async (store: relationalStore.RdbStore, tableName: string, ret: number): Promise<void> => {
            let predicates = new relationalStore.RdbPredicates(tableName);
            let resultSet = await store.query(predicates);
            let count = resultSet.rowCount;
            expect(ret).assertEqual(count);
            resultSet.close();
        }

        const updateCheck: (store: relationalStore.RdbStore, tableName: string) => Promise<void> =
            async (store: relationalStore.RdbStore, tableName: string): Promise<void> => {
            let u8 = new Uint8Array([4, 5, 6]);
            const valueBucket: relationalStore.ValuesBucket = {
                "name": "lisi",
                "age": 20 as Long,
                "salary": 200.5,
                "blobType": u8,
            };
            let predicates = new relationalStore.RdbPredicates(tableName);
            predicates.equalTo("id", "1");
            let ret = await store.update(valueBucket, predicates);
            expect(1).assertEqual(ret);
        }
        
        const deleteCheck: (store: relationalStore.RdbStore, tableName: string, count: number) => Promise<void> =
            async (store: relationalStore.RdbStore, tableName: string, count: number): Promise<void> => {
            let predicates = new relationalStore.RdbPredicates(tableName);
            let ret = await store.delete(predicates);
            expect(count).assertEqual(ret);
        }
        
        const attachCheck: (store: relationalStore.RdbStore) => Promise<void> =
            async (store: relationalStore.RdbStore): Promise<void> => {
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
        
        console.log(tag + "*************Ets Test Begin*************");
        
        /**
         * @tc.name   testRdbStoreAttach0001
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0010
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttach0001 start *************");
            hilog.info(domain, tag, 'RA0186 testRdbStoreAttach0001');
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            hilog.info(domain, tag, 'RA0188 store:' + JSON.stringify(store));
            hilog.info(domain, tag, 'RA0189 CREATE_TABLE_TEST:' + JSON.stringify(CREATE_TABLE_TEST));
            await store.executeSql(CREATE_TABLE_TEST);
            hilog.info(domain, tag, 'RA0191 ');
            try {
                await attachInsert(store, "test");
            } catch (err){
                hilog.error(domain, tag, 'RA0198 err:' + JSON.stringify(err));
            }

            hilog.info(domain, tag, 'RA0193 ');
        
            let count: int = await store.attach(context!, STORE_CONFIG1, "attachDB");
            hilog.info(domain, tag, 'RA0196 count:' + JSON.stringify(count));
            expect(1).assertEqual(count);

            hilog.info(domain, tag, 'RA0199 ');
            await attachCheck(store);
            hilog.info(domain, tag, 'RA0201 ');
            expect(0).assertEqual(await store.detach("attachDB"))
            hilog.info(domain, tag, 'RA0203 ');
            console.log(tag + "************* testRdbStoreAttach0001 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttach0002
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0020
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttach0002 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            try {
                await store.attach("fullPath", "attachName", 0);
                expect(true).assertFail();
            } catch (err){
                hilog.error(domain, tag, 'testRdbStoreAttach0002 err:' + JSON.stringify(err));
                expect(err.code).assertEqual(401);
            }
            console.log(tag + "************* testRdbStoreAttach0002 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttach0003
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0030
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttach0003 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            try {
                await store.attach("fullPath", "attachName", 301);
                expect(true).assertFail();
            } catch (err){
                hilog.error(domain, tag, 'testRdbStoreAttach0002 err:' + JSON.stringify(err));
                expect(err.code).assertEqual(401);
            }
            console.log(tag + "************* testRdbStoreAttach0003 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttach0004
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0040
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttach0004 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            try {
                await store.attach(context!, STORE_CONFIG1, "attachName", 0);
                expect(true).assertFail();
            } catch (err){
                hilog.error(domain, tag, 'testRdbStoreAttach0004 err:' + JSON.stringify(err));
                expect(err.code).assertEqual(401);
            }
            console.log(tag + "************* testRdbStoreAttach0004 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttach0005
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0050
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttach0005 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            try {
                await store.attach(context!, STORE_CONFIG1, "attachName", 301);
                expect(true).assertFail();
            } catch (err){
                hilog.error(domain, tag, 'testRdbStoreAttach0005 err:' + JSON.stringify(err));
                expect(err.code).assertEqual(401);
            }
            console.log(tag + "************* testRdbStoreAttach0005 end *************");
        })

        console.log(tag + "*************Ets Test End*************");
        })
}