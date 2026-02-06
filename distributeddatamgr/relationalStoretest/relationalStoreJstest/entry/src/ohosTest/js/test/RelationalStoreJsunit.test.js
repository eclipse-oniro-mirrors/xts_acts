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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import data_Rdb from '@ohos.data.relationalStore';
import ability_featureAbility from '@ohos.ability.featureAbility';


var context = ability_featureAbility.getContext();
var contextApplication = context.getApplicationContext();
const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG = {
    name: "rdbstore.db",
    securityLevel: data_Rdb.SecurityLevel.S1
};
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
export default function relationalStoreTest() {
describe('relationalStoreTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll');
    })

    beforeEach(function () {
        console.info(TAG + 'beforeEach');
    })

    afterEach(async function () {
        console.info(TAG + 'afterAll');
        await data_Rdb.deleteRdbStore(context, "rdbstore.db");
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll');
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name testRdbStore0001
     * @tc.type Function
     * @tc.level Level 0
     * @tc.size MediumTest
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_0900
     * @tc.desc RelationalStore store getRdbStore test
     */
    it('testRdbStore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG + "************* testRdbStore0001 start *************");
        await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (store) => {
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
     * @tc.name testRdbStore0002
     * @tc.type Function
     * @tc.level Level 0
     * @tc.size MediumTest
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_1000
     * @tc.desc RelationalStore store getRdbStore and create table
     */
    it('testRdbStore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG + "************* testRdbStore0002 start *************");
        let storePromise = data_Rdb.getRdbStore(context, STORE_CONFIG);
        await storePromise.then(async (store) => {
            try {
                console.info(TAG + "getRdbStore done: " + store);
                await store.executeSql(CREATE_TABLE_TEST);
            } catch (e) {
                expect(null).assertFail();
            }
        }).catch((err) => {
            expect(null).assertFail();
        })
        done();
        console.info(TAG + "************* testRdbStore0002 end   *************");
    })

    /**
     * @tc.name testRdbStore0003
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_1100
     * @tc.desc RelationalStore store getRdbStore with wrong path
     */
    it('testRdbStore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStore0003 start *************");

        let storeConfig = {
            name: "/wrong/rdbstore.db",
            securityLevel: data_Rdb.SecurityLevel.S1
        };
        try {
            data_Rdb.getRdbStore(context, storeConfig).then(async (ret) => {
                console.info(TAG + "getRdbStore done" + ret);
                expect(null).assertFail();
            }).catch((err) => {
                console.info(TAG + "getRdbStore with wrong path");
            })
            expect(false).assertTrue();
        } catch (error) {
            console.info(TAG + `catch err: failed: err: code= ${error.code}, message = ${error.message}`);
            expect(error.code).assertEqual("401");
            done();
            console.info(TAG + "************* testRdbStore0003 end   *************");
        }
    })

    /**
     * @tc.name testRdbStore0004
     * @tc.type Function
     * @tc.level Level 0
     * @tc.size MediumTest
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_1200
     * @tc.desc RelationalStore store deleteRdbStore
     */
    it('testRdbStore0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG + "************* testRdbStore0004 start *************");
        try {
            let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
            await data_Rdb.deleteRdbStore(context, "rdbstore.db");
        } catch (e) {
            expect(null).assertFail();
        }
        done();
        console.info(TAG + "************* testRdbStore0004 end   *************");
    })

    /**
     * @tc.name testRdbStore0005
     * @tc.type Function
     * @tc.level Level 0
     * @tc.size MediumTest
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_1300
     * @tc.desc RelationalStore store deleteRdbStore
     */
    it('testRdbStore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG + "************* testRdbStore0005 start *************");
        try {
            let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            console.info(TAG + "Get rdbstore success");
            await store.executeSql(CREATE_TABLE_TEST);
            await data_Rdb.deleteRdbStore(context, "rdbstore.db");
        } catch (e) {
            expect(null).assertFail();
        }
        done();
        console.info(TAG + "************* testRdbStore0005 end   *************");
    })

    /**
     * @tc.name testRdbStore0006
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_1400
     * @tc.desc RelationalStore store getRdbStore test
     */
    it('testRdbStore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStore0006 start *************");
        let rdbstore = null;
        try {
            const STORE_CONFIG = {
                name: "rdbstorecontext.db",
                securityLevel: data_Rdb.SecurityLevel.S1
            };
            rdbstore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            console.info(TAG + "Get rdbstore success");
            expect(rdbstore != null).assertTrue();
            await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name);
        } catch (err) {
            console.info(TAG + "Get rdbstore fail catch err: " + err);
            expect(null).assertFail();
        }
        rdbstore = null;
        done();
        console.info(TAG + "************* testRdbStore0006 end   *************");
    })

    /**
     * @tc.name testRdbStore0007
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_1500
     * @tc.desc RelationalStore store getRdbStore test
     */
    it('testRdbStore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStore0007 start *************");
        let rdbstore = null;
        try {
            const STORE_CONFIG = {
                name: "rdbstorecontext.db",
                securityLevel: data_Rdb.SecurityLevel.S1
            };
            rdbstore = await data_Rdb.getRdbStore(contextApplication, STORE_CONFIG);
            console.info(TAG + "Get rdbstore success");
            expect(rdbstore != null).assertTrue();
            await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name);
        } catch (err) {
            console.info(TAG + "Get rdbstore fail catch err: " + err);
            expect(null).assertFail();
        }
        rdbstore = null;
        done();
        console.info(TAG + "************* testRdbStore0007 end   *************");
    })

    /**
     * @tc.name testRdbStore0008
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_1600
     * @tc.desc RelationalStore store deleteRdbStore test
     */
    it('testRdbStore0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStore0008 start *************");
        data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, data) => {
            console.info(TAG + "getRdbStore finish");
            console.info(TAG + "getRdbStore success: " + data);
            expect(data != null).assertTrue();
            await data_Rdb.deleteRdbStore(contextApplication, STORE_CONFIG.name);
            done();
            console.info(TAG + "************* testRdbStore0008 end   *************");
        });
        await sleep(500);
    })

    /**
     * @tc.name testRdbStore0009
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_1700
     * @tc.desc RelationalStore store deleteRdbStore test
     */
    it('testRdbStore0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testRdbStore0009 start *************");
        data_Rdb.getRdbStore(contextApplication, STORE_CONFIG, async (err, data) => {
            console.info(TAG + "getRdbStore finish");
            console.info(TAG + "getRdbStore success: " + data);
            expect(data != null).assertTrue();
            await data_Rdb.deleteRdbStore(contextApplication, STORE_CONFIG.name);
            done();
            console.info(TAG + "************* testRdbStore0009 end   *************");
        })
        await sleep(500);
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_1800
     * @tc.name SUB_DDM_RelationalStore_Version_0010
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Version_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Version_0010 start *************");
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);

        try {
            store.version = 5
            expect(5).assertEqual(store.version);
        } catch (err) {
            console.info("SUB_DDM_RelationalStore_Version_0010 failed: err: code=" + err.code + " message=" + err.message);
            expect(null).assertFail();
        }

        try {
            store.version = 2147483647
            expect(2147483647).assertEqual(store.version);
        } catch (err) {
            console.info(" SUB_DDM_RelationalStore_Version_0010 failed: err: code=" + err.code + " message=" + err.message);
            expect(null).assertFail();
        }

        await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name);
        done();
        console.info(TAG + "************* SUB_DDM_RelationalStore_Version_0010 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_1900
     * @tc.name SUB_DDM_RelationalStore_Version_0020
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Version_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Version_0020 start *************");
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);

        try {
            store.version = -2147483648;
        } catch (err) {
            console.info("SUB_DDM_RelationalStore_Version_0020 failed1: err: code=" + err.code + " message=" + err.message);
            expect("401").assertEqual(err.code);
        }

        try {
            store.version = 2147483647000;
        } catch (err) {
            console.info("SUB_DDM_RelationalStore_Version_0020 failed2: err: code=" + err.code + " message=" + err.message);
            expect("401").assertEqual(err.code);
        }

        try {
            store.version = 0;
        } catch (err) {
            console.info("SUB_DDM_RelationalStore_Version_0020 failed3: err: code=" + err.code + " message=" + err.message);
            expect("401").assertEqual(err.code);
        }

        await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name);
        done();
        console.info(TAG + "************* SUB_DDM_RelationalStore_Version_0020 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_2000
     * @tc.name SUB_DDM_RelationalStore_Different_Version_0010
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Different_Version_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0010 start *************");
        const STORE_CONFIGS1 = {
            name: "rdbstore10.db",
            securityLevel: data_Rdb.SecurityLevel.S1
        };
        const STORE_CONFIGS2 = {
            name: "rdbstore10.db",
            securityLevel: data_Rdb.SecurityLevel.S2
        };
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS1);
        console.info(`SUB_DDM_RelationalStore_Different_Version_0010 S1 Get RdbStore successfully.`);
        try {
            let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS2);
            await promise.then(async (rdbStore) => {
                store = rdbStore;
                console.info(`SUB_DDM_RelationalStore_Different_Version_0010 Get RdbStore successfully.`);
            }).catch((err) => {
                console.error(`SUB_DDM_RelationalStore_Different_Version_0010 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
            })
        } catch (error) {
            console.error(`SUB_DDM_RelationalStore_Different_Version_0010 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
            expect().assertFail();
        }
        await data_Rdb.deleteRdbStore(context, STORE_CONFIGS1.name);
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0010 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_2100
     * @tc.name SUB_DDM_RelationalStore_Different_Version_0020
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Different_Version_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0020 start *************");
        const STORE_CONFIGS1 = {
            name: "rdbstore20.db",
            securityLevel: data_Rdb.SecurityLevel.S1
        };
        const STORE_CONFIGS3 = {
            name: "rdbstore20.db",
            securityLevel: data_Rdb.SecurityLevel.S3
        };
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS1);
        console.info(`SUB_DDM_RelationalStore_Different_Version_0020 S1 Get RdbStore successfully.`);
        try {
            let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS3);
            await promise.then(async (rdbStore) => {
                store = rdbStore;
                console.info(`SUB_DDM_RelationalStore_Different_Version_0020 Get RdbStore successfully.`);
            }).catch((err) => {
                console.error(`SUB_DDM_RelationalStore_Different_Version_0020 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
            })
        } catch (error) {
            console.error(`SUB_DDM_RelationalStore_Different_Version_0020 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
            expect().assertFail();
        }
        await data_Rdb.deleteRdbStore(context, STORE_CONFIGS1.name);
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0020 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_2200
     * @tc.name SUB_DDM_RelationalStore_Different_Version_0030
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Different_Version_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0030 start *************");
        const STORE_CONFIGS1 = {
            name: "rdbstore30.db",
            securityLevel: data_Rdb.SecurityLevel.S1
        };
        const STORE_CONFIGS4 = {
            name: "rdbstore30.db",
            securityLevel: data_Rdb.SecurityLevel.S4
        };
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS1);
        console.info(`SUB_DDM_RelationalStore_Different_Version_0030 S1 Get RdbStore successfully.`);
        try {
            let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS4);
            await promise.then(async (rdbStore) => {
                store = rdbStore;
                console.info(`SUB_DDM_RelationalStore_Different_Version_0030 Get RdbStore successfully.`);
            }).catch((err) => {
                console.error(`SUB_DDM_RelationalStore_Different_Version_0030 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
            })
        } catch (error) {
            console.error(`SUB_DDM_RelationalStore_Different_Version_0030 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
            expect().assertFail();
        }
        await data_Rdb.deleteRdbStore(context, STORE_CONFIGS1.name);
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0030 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_2300
     * @tc.name SUB_DDM_RelationalStore_Different_Version_0040
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Different_Version_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0040 start *************");
        const STORE_CONFIGS2 = {
            name: "rdbstore40.db",
            securityLevel: data_Rdb.SecurityLevel.S2
        };
        const STORE_CONFIGS4 = {
            name: "rdbstore40.db",
            securityLevel: data_Rdb.SecurityLevel.S4
        };
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS2);
        console.info(`SUB_DDM_RelationalStore_Different_Version_0040 S2 Get RdbStore successfully.`);
        try {
            let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS4);
            await promise.then(async (rdbStore) => {
                store = rdbStore;
                console.info(`SUB_DDM_RelationalStore_Different_Version_0040 Get RdbStore successfully.`);
            }).catch((err) => {
                console.error(`SUB_DDM_RelationalStore_Different_Version_0040 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
            })
        } catch (error) {
            console.error(`SUB_DDM_RelationalStore_Different_Version_0040 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
            expect().assertFail();
        }
        await data_Rdb.deleteRdbStore(context, STORE_CONFIGS2.name);
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0040 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_2400
     * @tc.name SUB_DDM_RelationalStore_Different_Version_0050
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Different_Version_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0050 start *************");
        const STORE_CONFIGS2 = {
            name: "rdbstore50.db",
            securityLevel: data_Rdb.SecurityLevel.S2
        };
        const STORE_CONFIGS3 = {
            name: "rdbstore50.db",
            securityLevel: data_Rdb.SecurityLevel.S3
        };
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS2);
        console.info(`SUB_DDM_RelationalStore_Different_Version_0050 S2 Get RdbStore successfully.`);
        try {
            let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS3);
            await promise.then(async (rdbStore) => {
                store = rdbStore;
                console.info(`SUB_DDM_RelationalStore_Different_Version_0050 Get RdbStore successfully.`);
            }).catch((err) => {
                console.error(`SUB_DDM_RelationalStore_Different_Version_0050 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
            })
        } catch (error) {
            console.error(`SUB_DDM_RelationalStore_Different_Version_0050 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
            expect().assertFail();
        }
        await data_Rdb.deleteRdbStore(context, STORE_CONFIGS2.name);
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0050 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_2500
     * @tc.name SUB_DDM_RelationalStore_Different_Version_0060
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Different_Version_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0060 start *************");
        const STORE_CONFIGS1 = {
            name: "rdbstore60.db",
            securityLevel: data_Rdb.SecurityLevel.S1
        };
        const STORE_CONFIGS4 = {
            name: "rdbstore60.db",
            securityLevel: data_Rdb.SecurityLevel.S4
        };
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS4);
        console.info(`SUB_DDM_RelationalStore_Different_Version_0060 S4 Get RdbStore successfully.`);
        try {
            let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS1);
            await promise.then(async (rdbStore) => {
                store = rdbStore;
                console.info(`SUB_DDM_RelationalStore_Different_Version_0060 Get RdbStore successfully.`);
                expect().assertFail();
            }).catch((err) => {
                console.error(`SUB_DDM_RelationalStore_Different_Version_0060 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
                expect(err.code).assertEqual(14800017);
            })
        } catch (error) {
            console.error(`SUB_DDM_RelationalStore_Different_Version_0060 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
            expect().assertFail();
        }
        await data_Rdb.deleteRdbStore(context, STORE_CONFIGS1.name);
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0060 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_2600
     * @tc.name SUB_DDM_RelationalStore_Different_Version_0070
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Different_Version_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0070 start *************");
        const STORE_CONFIGS3 = {
            name: "rdbstore70.db",
            securityLevel: data_Rdb.SecurityLevel.S3
        };
        const STORE_CONFIGS2 = {
            name: "rdbstore70.db",
            securityLevel: data_Rdb.SecurityLevel.S2
        };
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS3);
        console.info(`SUB_DDM_RelationalStore_Different_Version_0070 S3 Get RdbStore successfully.`);
        try {
            let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS2);
            await promise.then(async (rdbStore) => {
                store = rdbStore;
                console.info(`SUB_DDM_RelationalStore_Different_Version_0070 Get RdbStore successfully.`);
                expect().assertFail();
            }).catch((err) => {
                console.error(`SUB_DDM_RelationalStore_Different_Version_0070 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
                expect(err.code).assertEqual(14800017);
            })
        } catch (error) {
            console.error(`SUB_DDM_RelationalStore_Different_Version_0070 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
            expect().assertFail();
        }
        await data_Rdb.deleteRdbStore(context, STORE_CONFIGS3.name);
        console.info(TAG + "************* SUB_DDM_RelationalStore_Different_Version_0070 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_2700
     * @tc.name SUB_DDM_RelationalStore_Same_Version_0010
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Same_Version_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Same_Version_0010 start *************");
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        console.info(`SUB_DDM_RelationalStore_Same_Version_0010 S1 Get RdbStore successfully.`);
        try {
            let promise = data_Rdb.getRdbStore(context, STORE_CONFIG);
            await promise.then(async (rdbStore) => {
                store = rdbStore;
                console.info(`SUB_DDM_RelationalStore_Same_Version_0010 Get RdbStore successfully.`);
                expect(rdbStore != null).assertTrue();
                await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name);
                console.error(`SUB_DDM_RelationalStore_Same_Version_0010 Get RdbStore  deleteRdbStore`);
                done();
            }).catch((err) => {
                console.error(`SUB_DDM_RelationalStore_Same_Version_0010 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
                done();
            })
        } catch (error) {
            console.error(`SUB_DDM_RelationalStore_Same_Version_0010 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
            expect().assertFail();
            done();
        }
        console.info(TAG + "************* SUB_DDM_RelationalStore_Same_Version_0010 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_2800
     * @tc.name SUB_DDM_RelationalStore_Same_Version_0020
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Same_Version_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Same_Version_0020 start *************");
        const STORE_CONFIGS2 = {
            name: "rdbstore.db",
            securityLevel: data_Rdb.SecurityLevel.S2
        };
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS2);
        console.info(`SUB_DDM_RelationalStore_Same_Version_0020 S2 Get RdbStore successfully.`);
        try {
            let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS2);
            await promise.then(async (rdbStore) => {
                store = rdbStore;
                console.info(`SUB_DDM_RelationalStore_Same_Version_0020 Get RdbStore successfully.`);
                expect(rdbStore != null).assertTrue();
                await data_Rdb.deleteRdbStore(context, STORE_CONFIGS2.name);
                console.error(`SUB_DDM_RelationalStore_Same_Version_0020 deleteRdbStore`);
                done();
            }).catch((err) => {
                console.error(`SUB_DDM_RelationalStore_Same_Version_0020 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
                done();
            })
        } catch (error) {
            console.error(`SUB_DDM_RelationalStore_Same_Version_0020 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
            expect().assertFail();
            done();
        }
        console.info(TAG + "************* SUB_DDM_RelationalStore_Same_Version_0020 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_2900
     * @tc.name SUB_DDM_RelationalStore_Same_Version_0030
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Same_Version_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Same_Version_0030 start *************");
        const STORE_CONFIGS3 = {
            name: "rdbstore.db",
            securityLevel: data_Rdb.SecurityLevel.S3
        };
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS3);
        console.info(`SUB_DDM_RelationalStore_Same_Version_0030 S3 Get RdbStore successfully.`);
        try {
            let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS3);
            await promise.then(async (rdbStore) => {
                store = rdbStore;
                console.info(`SUB_DDM_RelationalStore_Same_Version_0030 Get RdbStore successfully.`);
                expect(rdbStore != null).assertTrue();
                await data_Rdb.deleteRdbStore(context, STORE_CONFIGS3.name);
                done();
            }).catch((err) => {
                console.error(`SUB_DDM_RelationalStore_Same_Version_0030 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
                done();
            })
        } catch (error) {
            console.error(`SUB_DDM_RelationalStore_Same_Version_0030 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
            expect().assertFail();
            done();
        }
        console.info(TAG + "************* SUB_DDM_RelationalStore_Same_Version_0030 end   *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionJsAPITest_3000
     * @tc.name SUB_DDM_RelationalStore_Same_Version_0040
     * @tc.type Function
     * @tc.level Level 2
     * @tc.size MediumTest
     * @tc.desc relational version
     */
    it('SUB_DDM_RelationalStore_Same_Version_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* SUB_DDM_RelationalStore_Same_Version_0040 start *************");
        const STORE_CONFIGS4 = {
            name: "rdbstore.db",
            securityLevel: data_Rdb.SecurityLevel.S4
        };
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIGS4);
        console.info(`SUB_DDM_RelationalStore_Same_Version_0040 S4 Get RdbStore successfully.`);
        try {
            let promise = data_Rdb.getRdbStore(context, STORE_CONFIGS4);
            await promise.then(async (rdbStore) => {
                store = rdbStore;
                console.info(`SUB_DDM_RelationalStore_Same_Version_0040 Get RdbStore successfully.`);
                expect(rdbStore != null).assertTrue();
                await data_Rdb.deleteRdbStore(context, STORE_CONFIGS4.name);
                done();
            }).catch((err) => {
                console.error(`SUB_DDM_RelationalStore_Same_Version_0040 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
                done();
            })
        } catch (error) {
            console.error(`SUB_DDM_RelationalStore_Same_Version_0040 Get RdbStore failed error, code is ${error.code},message is ${error.message}`);
            expect().assertFail();
            done();
        }
        console.info(TAG + "************* SUB_DDM_RelationalStore_Same_Version_0040 end   *************");
    })

    console.info(TAG + "*************Unit Test End*************");
})
}
