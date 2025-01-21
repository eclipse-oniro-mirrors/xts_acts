/*
 * Copyright (C) 2021-2023 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import dataRdb from '@ohos.data.rdb';
import abilityFeatureAbility from '@ohos.ability.featureAbility';

var context = abilityFeatureAbility.getContext();
var contextApplication = context.getApplicationContext()
const TAG = "[RDB_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG = {
    name: "rdbstore.db",
}
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
export default function rdbStoreTest() {
describe('rdbStoreTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
    })

    beforeEach(function () {
        console.info(TAG + 'beforeEach')
    })

    afterEach(async function () {
        console.info(TAG + 'afterAll')
        rdbStore = null
        await dataRdb.deleteRdbStore("rdbstore.db");
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name rdb store getRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0010
     * @tc.desc rdb store getRdbStore test
     */
    it('testRdbStore0001', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0001 start *************");
        await dataRdb.getRdbStore(STORE_CONFIG, 1).then(async (store) => {
            try {
                console.info(TAG + "getRdbStore done: " + store);
            } catch (e) {
                expect(null).assertFail();
            }
        }).catch((err) => {
            expect(null).assertFail();
        })
        done();
        console.info(TAG + "************* testRdbStore0001 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStore and create table
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0020
     * @tc.desc rdb store getRdbStore and create table
     */
    it('testRdbStore0002', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0002 start *************");
        let storePromise = dataRdb.getRdbStore(STORE_CONFIG, 2);
        storePromise.then(async (store) => {
            try {
                console.info(TAG + "getRdbStore done: " + store);
                await store.executeSql(CREATE_TABLE_TEST);
            } catch (e) {
                expect(null).assertFail();
            }
        }).catch((err) => {
            expect(null).assertFail();
        })
        await storePromise
        storePromise = null
        done();
        console.info(TAG + "************* testRdbStore0002 end   *************");
    })

    /**
     * @tc.name rdb storegetRdbStore with wrong path
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0030
     * @tc.desc rdb store getRdbStore with wrong path
     */
    it('testRdbStore0003', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0003 start *************");

        let storeConfig = {
            name: "/wrong/rdbstore.db",
        }
        try{
            dataRdb.getRdbStore(storeConfig, 4).then(async (ret) => {
                console.info(TAG + "getRdbStore done" + ret);
                expect(null).assertFail();
            }).catch((err) => {
                console.info(TAG + "getRdbStore with wrong path");
            })
            expect(false).assertTrue();
        }catch(error){
            console.info(TAG + `catch err: failed: err: code= ${error.code}, message = ${error.message}`)
            expect(error.code).assertEqual("401")
            done();
            console.info(TAG + "************* testRdbStore0003 end   *************");
        }
    })

    /**
     * @tc.name rdb store deleteRdbStore
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0040
     * @tc.desc rdb store deleteRdbStore
     */
    it('testRdbStore0004', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0004 start *************");
        try{
            let store =  await dataRdb.getRdbStore(STORE_CONFIG, 1)
            await store.executeSql(CREATE_TABLE_TEST);
            await dataRdb.deleteRdbStore("rdbstore.db")
        }catch (e) {
            expect(null).assertFail();
        }
        done();
        console.info(TAG + "************* testRdbStore0004 end   *************");
    })

    /**
     * @tc.name rdb store deleteRdbStore
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0050
     * @tc.desc rdb store deleteRdbStore
     */
    it('testRdbStore0005', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0005 start *************");
        try {
            let store = await dataRdb.getRdbStore(STORE_CONFIG, 2);
            console.info(TAG + "Get rdbstore success")
            await store.executeSql(CREATE_TABLE_TEST);
            await dataRdb.deleteRdbStore("rdbstore.db")
        } catch (e) {
            expect(null).assertFail();
        }
        done();
        console.info(TAG + "************* testRdbStore0005 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0060
     * @tc.desc rdb store getRdbStore test
     */
     it('testRdbStore0006', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0006 start *************");
        let rdbstore = null;
        try{
            const STORE_CONFIG= {
                name: "rdbstorecontext.db",
            }
            rdbstore = await dataRdb.getRdbStore(context,STORE_CONFIG, 1)
            console.info(TAG + "Get rdbstore success")
            expect(rdbstore != null).assertTrue();
            await dataRdb.deleteRdbStore(STORE_CONFIG.name)
        }catch(err){
            console.info(TAG + "Get rdbstore fail catch err: " + err)
            expect(null).assertFail()
        }
        rdbstore = null;
        done();
        console.info(TAG + "************* testRdbStore0006 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0070
     * @tc.desc rdb store getRdbStore test
     */
    it('testRdbStore0007', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0007 start *************");
        let rdbstore = null;
        try{
            const STORE_CONFIG = {
                name: "rdbstorecontext.db",
            }
            rdbstore = await dataRdb.getRdbStore(contextApplication,STORE_CONFIG, 1)
            console.info(TAG + "Get rdbstore success")
            expect(rdbstore != null).assertTrue();
            await dataRdb.deleteRdbStore(STORE_CONFIG.name)
        }catch(err){
            console.info(TAG + "Get rdbstore fail catch err: " + err)
            expect(null).assertFail()
        }
        rdbstore = null;
        done();
        console.info(TAG + "************* testRdbStore0007 end   *************");
    })

    /**
     * @tc.name rdb store deleteRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0080
     * @tc.desc rdb store deleteRdbStore test
     */
    it('testRdbStore0008', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0008 start *************");
        dataRdb.getRdbStore(context,STORE_CONFIG, 1, async (err,data) => {
            console.info(TAG + "getRdbStore finish")
            console.info(TAG + "getRdbStore success: " + data)
            expect(data != null).assertTrue();
            await dataRdb.deleteRdbStore(contextApplication,STORE_CONFIG.name)
            done();
            console.info(TAG + "************* testRdbStore0008 end   *************");
        });
        await sleep(1000)
    })

    /**
     * @tc.name rdb store deleteRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0090
     * @tc.desc rdb store deleteRdbStore test
     */
    it('testRdbStore0009', 0, async function(done){
        console.info(TAG + "************* testRdbStore0009 start *************");
        dataRdb.getRdbStore(contextApplication,STORE_CONFIG, 1, async (err,data) => {
            console.info(TAG + "getRdbStore finish")
            console.info(TAG + "getRdbStore success: " + data)
            expect(data != null).assertTrue();
            await dataRdb.deleteRdbStore(contextApplication,STORE_CONFIG.name)
            done();
            console.info(TAG + "************* testRdbStore0009 end   *************");
        });
        await sleep(1000)
    })
    
    console.info(TAG + "*************Unit Test End*************");
})}
