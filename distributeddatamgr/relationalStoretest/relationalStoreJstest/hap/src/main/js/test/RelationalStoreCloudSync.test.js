/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import relationalStore from '@ohos.data.relationalStore';
import ability_featureAbility from '@ohos.ability.featureAbility';

const TAG = "[RELATIONAL_STORE_JSKITS_TEST]";
const STORE_NAME = "cloud_sync_rdb.db";
let rdbStore = undefined;
let context = ability_featureAbility.getContext();
let syncProgressDetail = undefined;

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function Progess(ProgressDetail) {
    console.log(TAG + ` Progess:` + JSON.stringify(ProgressDetail));
    syncProgressDetail = ProgressDetail;
}

export default function relationalStoreCloudSyncTest() {
    describe('relationalStoreCloudSyncTest', function () {
        beforeAll(async function (done) {
            console.info(TAG + 'beforeAll')
            const config = {
                "name": STORE_NAME,
                securityLevel: relationalStore.SecurityLevel.S1,
            }
            try {
                console.log(TAG + "create rdb store before");
                try{
                    rdbStore = await relationalStore.getRdbStore(context, config);
                    console.log(TAG + "create rdb store success");
                }catch(err){
                    console.log(TAG + "create rdb store failed" + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                    done();
                }

                let sql_text = "CREATE TABLE IF NOT EXISTS cloud_text (" +
                "data TEXT, " +
                "recycled BOOLEAN, " +
                "recycledTime INTEGER, " +
                "num TEXT PRIMARY KEY)";
                let sql_int = "CREATE TABLE IF NOT EXISTS cloud_int (" +
                "data TEXT, " +
                "recycled BOOLEAN, " +
                "recycledTime INTEGER, " +
                "num INTEGER PRIMARY KEY)";
                let sql_integer = "CREATE TABLE IF NOT EXISTS cloud_integer (" +
                "data TEXT, " +
                "recycled BOOLEAN, " +
                "recycledTime INTEGER, " +
                "num INTEGER PRIMARY KEY)";
                try {
                    await rdbStore.executeSql(sql_text, null);
                    await rdbStore.executeSql(sql_int, null);
                    await rdbStore.executeSql(sql_integer, null);
                    console.log(TAG + "create table cloud_text cloud_int cloud_integer success");
                } catch (err) {
                    console.log(TAG + "create table cloud_text cloud_int cloud_integer failed" + `, error code is ${err.code}, message is ${err.message}`)
                    expect(null).assertFail();
                }

                let tableArray = ["cloud_text", "cloud_integer"];
                const setConfig = {
                    autoSync: false,
                }
                let promise = rdbStore.setDistributedTables(
                    tableArray, relationalStore.DistributedType.DISTRIBUTED_CLOUD, setConfig);
                await promise.then(() => {
                    console.log(TAG + "set disTable success");
                }).catch((err) => {
                    console.log(TAG + "set disTable fail" + `, error code is ${err.code}, message is ${err.message}`);
                })
                let vBucketArray1 = new Array();
                for (let i = 0; i < 5; i++) {
                    let valueBucket = {
                        "data": "cloud_sync_insert",
                        "recycled": true,
                        "recycledTime": 12345,
                        "num": "test_key" + i.toString(),
                    }
                    vBucketArray1.push(valueBucket);
                }
                await rdbStore.batchInsert("cloud_text", vBucketArray1);
                let vBucketArray2 = new Array();
                for (let i = 0; i < 5; i++) {
                    let valueBucket = {
                        "data": "cloud_sync_insert",
                        "recycled": true,
                        "recycledTime": 12345,
                        "num": i,
                    }
                    vBucketArray2.push(valueBucket);
                }
                await rdbStore.batchInsert("cloud_integer", vBucketArray2);
                console.log(TAG + "create rdb store success");
            } catch (err) {
                console.log(TAG + "create rdb store failed" + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            }
            done();
        })

        beforeEach(async function () {
            console.info(TAG + 'beforeEach');
        })

        afterEach(async function () {
            console.info(TAG + 'afterEach');
        })

        afterAll(async function () {
            console.info(TAG + 'afterAll');
            rdbStore = null;
            await rdbStore.deleteRdbStore(context, STORE_NAME);
        })

        console.log(TAG + "*************Unit Test Begin*************");


        /**
         * @tc.name get modify time using wrong table null
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_0100
         * @tc.desc rdb get modify time using wrong table null
         */
        it('testRdbStoreGetModifyTime0001', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreGetModifyTime0001 start *************");
            try {
                let PRIKey = ["test_key1", "test_key2"];
                rdbStore.getModifyTime(null, "num", PRIKey, function (err, data) {
                    console.log(TAG + 'modifyTime success');
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code).assertEqual('401');
                done();
            }
            console.log(TAG + "************* testRdbStoreGetModifyTime0001 end *************");
        })

        /**
         * @tc.name get modify time using wrong table undefined
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_0200
         * @tc.desc rdb get modify time using wrong table undefined
         */
        it('testRdbStoreGetModifyTime0002', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreGetModifyTime0002 start *************");
            try {
                let PRIKey = ["test_key1", "test_key2"];
                rdbStore.getModifyTime(undefined, "num", PRIKey, function (err, data) {
                    console.log(TAG + 'modifyTime success');
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code).assertEqual('401');
                done();
            }
            console.log(TAG + "************* testRdbStoreGetModifyTime0002 end *************");
        })

        /**
         * @tc.name get modify time using wrong table 123456
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_0300
         * @tc.desc rdb get modify time using wrong table 123456
         */
        it('testRdbStoreGetModifyTime0003', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreGetModifyTime0003 start *************");
            try {
                let PRIKey = ["test_key1", "test_key2"];
                rdbStore.getModifyTime(123456, "num", PRIKey, function (err, data) {
                    console.log(TAG + 'modifyTime success');
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code).assertEqual('401');
                done();
            }
            console.log(TAG + "************* testRdbStoreGetModifyTime0003 end *************");
        })
        /**
         * @tc.name get modify time using wrong columnName null
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_0400
         * @tc.desc rdb get modify time using wrong columnName null
         */
        it('testRdbStoreGetModifyTime0004', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreGetModifyTime0004 start *************");
            try {
                let PRIKey = ["test_key1", "test_key2"];
                rdbStore.getModifyTime("cloud_text", null, PRIKey, function (err, data) {
                    console.log(TAG + 'modifyTime success');
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code).assertEqual('401');
                done();
            }
            console.log(TAG + "************* testRdbStoreGetModifyTime0004 end *************");
        })

        /**
         * @tc.name get modify time using wrong columnName undefined
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_0500
         * @tc.desc rdb get modify time using wrong columnName undefined
         */
        it('testRdbStoreGetModifyTime0005', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreGetModifyTime0005 start *************");
            try {
                let PRIKey = ["test_key1", "test_key2"];
                rdbStore.getModifyTime("cloud_text", undefined, PRIKey, function (err, data) {
                    console.log(TAG + 'modifyTime success');
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code).assertEqual('401');
                done();
            }
            console.log(TAG + "************* testRdbStoreGetModifyTime0005 end *************");
        })

        /**
         * @tc.name get modify time using wrong columnName 123456
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_0600
         * @tc.desc rdb get modify time using wrong columnName 123456
         */
        it('testRdbStoreGetModifyTime0006', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreGetModifyTime0006 start *************");
            try {
                let PRIKey = ["test_key1", "test_key2"];
                rdbStore.getModifyTime("cloud_text", 123456, PRIKey, function (err, data) {
                    console.log(TAG + 'modifyTime success');
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code).assertEqual('401');
                done();
            }
            console.log(TAG + "************* testRdbStoreGetModifyTime0006 end *************");
        })

        /**
         * @tc.name get modify time using wrong PRIKey null
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_0700
         * @tc.desc rdb get modify time using wrong PRIKey null
         */
        it('testRdbStoreGetModifyTime0007', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreGetModifyTime0007 start *************");
            try {
                let PRIKey = ["test_key1", "test_key2"];
                rdbStore.getModifyTime("cloud_text", "num", null, function (err, data) {
                    console.log(TAG + 'modifyTime success');
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code).assertEqual('401');
                done();
            }
            console.log(TAG + "************* testRdbStoreGetModifyTime0007 end *************");
        })

        /**
         * @tc.name get modify time using wrong PRIKey undefined
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_0800
         * @tc.desc rdb get modify time using wrong PRIKey undefined
         */
        it('testRdbStoreGetModifyTime0008', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreGetModifyTime0008 start *************");
            try {
                let PRIKey = ["test_key1", "test_key2"];
                rdbStore.getModifyTime("cloud_text", "num", undefined, function (err, data) {
                    console.log(TAG + 'modifyTime success');
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code).assertEqual('401');
                done();
            }
            console.log(TAG + "************* testRdbStoreGetModifyTime0008 end *************");
        })

        /**
         * @tc.name get modify time using wrong PRIKey 123
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_0900
         * @tc.desc rdb get modify time using wrong PRIKey 123
         */
        it('testRdbStoreGetModifyTime0009', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreGetModifyTime0009 start *************");
            try {
                let PRIKey = ["test_key1", "test_key2"];
                rdbStore.getModifyTime("cloud_text", "num", 123, function (err, data) {
                    console.log(TAG + 'modifyTime success');
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code).assertEqual('401');
                done();
            }
            console.log(TAG + "************* testRdbStoreGetModifyTime0009 end *************");
        })


        /**
         * @tc.name get modify time using wrong primary key type
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_1000
         * @tc.desc rdb get modify time using wrong primary key type
         */
        it('testRdbStoreCloudSync0001', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0001 start *************");
            try {
                let key = new Array();
                let PRIKey = [key, "test_key1", "test_key2"];
                rdbStore.getModifyTime("cloud_text", "num", PRIKey, function (err, modifyTime) {
                    console.log(TAG + 'modifyTime:' + JSON.stringify(modifyTime));
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code).assertEqual('401');
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0001 end *************");
        })

        /**
         * @tc.name get modify time using string primary key type and callback method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_1100
         * @tc.desc get modify time using string primary key type and callback method
         */
        it('testRdbStoreCloudSync0002', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0002 start *************");
            try {
                let PRIKey = ["test_key1", "test_key2"];
                rdbStore.getModifyTime("cloud_text", "num", PRIKey, function (err, data) {
                    console.log(TAG + 'modifyTime:' + JSON.stringify(data) );
                    expect(err == undefined).assertTrue();
                    let size = Object.keys(data).length ;
                    console.log(TAG + 'size=' + size);
                    expect( size == 2 ).assertTrue();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0002 end *************");
        })

        /**
         * @tc.name get modify time using string primary key type and promise method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_1200
         * @tc.desc get modify time using string primary key type and promise method
         */
        it('testRdbStoreCloudSync0003', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0003 start *************");
            try {
                let PRIKey = ["test_key1", "test_key2"];
                await rdbStore.getModifyTime("cloud_text", "num", PRIKey).then((data) => {
                    console.log(TAG + `modifyTime:` + JSON.stringify(data));
                    let size = Object.keys(data).length ;
                    console.log(TAG + 'size=' + size);
                    expect( size == 2 ).assertTrue();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0003 end *************");
        })

        /**
         * @tc.name get modify time using rowid and callback method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_1300
         * @tc.desc get modify time using rowid and callback method
         */
        it('testRdbStoreCloudSync0004', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0004 start *************");
            try {
                let PRIKey = [1, 3, 4];
                rdbStore.getModifyTime("cloud_text", "rowid", PRIKey, function (err, data) {
                    console.log(TAG + `modifyTime:` + JSON.stringify(data));
                    expect(err == undefined).assertTrue();
                    let size = Object.keys(data).length ;
                    console.log(TAG + 'size=' + size);
                    expect( size == 3 ).assertTrue();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0004 end *************");
        })

        /**
         * @tc.name get modify time using rowid and promise method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_1400
         * @tc.desc get modify time using rowid and promise method
         */
        it('testRdbStoreCloudSync0005', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0005 start *************");
            try {
                let PRIKey = [2, 4];
                await rdbStore.getModifyTime("cloud_text", "roWId", PRIKey).then((data) => {
                    console.log(TAG + `modifyTime:` + JSON.stringify(data));
                    let size = Object.keys(data).length ;
                    console.log(TAG + 'size=' + size);
                    expect( size == 2 ).assertTrue();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0005 end *************");
        })

        /**
         * @tc.name get modify time, but not set distributed table
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_1500
         * @tc.desc get modify time, but not set distributed table
         */
        it('testRdbStoreCloudSync0006', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0006 start *************");
            try {
                for (let i = 0; i < 5; i++) {
                    let valueBucket = {
                        "data": "cloud_sync_insert",
                        "recycled": true,
                        "recycledTime": 12345,
                        "uuid": i,
                    }
                    let vBucketArray = new Array();
                    vBucketArray.push(valueBucket);
                    await rdbStore.batchInsert("cloud_int", vBucketArray);
                }
                let PRIKey = [0, 1, 2];
                await rdbStore.getModifyTime("cloud_int", "num", PRIKey).then((data) => {
                    console.log(TAG + `modifyTime:` + JSON.stringify(data));
                    expect(null).assertFail();
                    done();
                })
            } catch (err) {
                console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 14800000).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0006 end *************");
        })

        /**
         * @tc.name get modify time using int primary key type and callback method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_1600
         * @tc.desc get modify time using int primary key type and callback method
         */
        it('testRdbStoreCloudSync0007', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0007 start *************");
            try {
                let PRIKey = [1, 2, 4];
                rdbStore.getModifyTime("cloud_integer", "num", PRIKey, function (err, data) {
                    console.log(TAG + `modifyTime:` + JSON.stringify(data));
                    expect(err == undefined).assertTrue();
                    let size = Object.keys(data).length ;
                    console.log(TAG + 'size=' + size);
                    expect( size == 3 ).assertTrue();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0007 end *************");
        })

        /**
         * @tc.name get modify time using int primary key type and promise method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_1700
         * @tc.desc get modify time using int primary key type and promise method
         */
        it('testRdbStoreCloudSync0008', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0008 start *************");
            try {
                let PRIKey = [2, 4];
                await rdbStore.getModifyTime("cloud_integer", "num", PRIKey).then((data) => {
                    console.log(TAG + `modifyTime:` + JSON.stringify(data));
                    let size = Object.keys(data).length ;
                    console.log(TAG + 'size=' + size);
                    expect( size == 2 ).assertTrue();
                    done();
                });
            } catch (err) {
                console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0008 end *************");
        })

        /**
         * @tc.name cloud sync with no table, SyncMode is SYNC_MODE_TIME_FIRST and callback method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_1800
         * @tc.desc cloud sync with no table, SyncMode is SYNC_MODE_TIME_FIRST and callback method
         */
        it('testRdbStoreCloudSync0009', 0, async function (done) {
            console.log(TAG + "************* 1111  testRdbStoreCloudSync0009 start *************");
            try {
                rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, Progess , function (err) {
                    console.log(TAG + `cloud sync success:`);
                    expect(err == undefined).assertTrue();
                });
                await sleep(500);
                expect( syncProgressDetail["schedule"] == relationalStore.Progress.SYNC_FINISH ).assertTrue();
                expect( syncProgressDetail["code"] != 0 ).assertTrue();
                done();
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0009 end *************");
        })

        /**
         * @tc.name cloud sync with no table, SyncMode is SYNC_MODE_TIME_FIRST and promise method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_1900
         * @tc.desc cloud sync with no table, SyncMode is SYNC_MODE_TIME_FIRST and promise method
         */
        it('testRdbStoreCloudSync0010', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0010 start *************");
            try {
                await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                });
                await sleep(500);
                expect( syncProgressDetail["schedule"] == relationalStore.Progress.SYNC_FINISH ).assertTrue();
                expect( syncProgressDetail["code"] != 0 ).assertTrue();
                done();
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0010 end *************");
        })

        /**
         * @tc.name cloud sync with table, SyncMode is SYNC_MODE_TIME_FIRST and callback method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_2000
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_TIME_FIRST and callback method
         */
        it('testRdbStoreCloudSync0011', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0011 start *************");
            try {
                let tableArray = ["cloud_text"];
                rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, tableArray, Progess , function (err) {
                    console.log(TAG + `cloud sync success:` + err);
                    expect(err == undefined).assertTrue();
                });
                await sleep(500);
                expect( syncProgressDetail["schedule"] == relationalStore.Progress.SYNC_FINISH ).assertTrue();
                expect( syncProgressDetail["code"] != 0 ).assertTrue();
                done();
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0011 end *************");
        })

        /**
         * @tc.name cloud sync with table, SyncMode is SYNC_MODE_TIME_FIRST and promise method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_2100
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_TIME_FIRST and promise method
         */
        it('testRdbStoreCloudSync0012', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0012 start *************");
            try {
                let tableArray = ["cloud_text"];
                await rdbStore.cloudSync(
                    relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, tableArray, Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                });
                await sleep(500);
                expect( syncProgressDetail["schedule"] == relationalStore.Progress.SYNC_FINISH ).assertTrue();
                expect( syncProgressDetail["code"] != 0 ).assertTrue();
                done();
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0012 end *************");
        })

        /**
         * @tc.name cloud sync with table, SyncMode is SYNC_MODE_NATIVE_FIRST and promise method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_2200
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_NATIVE_FIRST and promise method
         */
        it('testRdbStoreCloudSync0013', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0013 start *************");
            try {
                let tableArray = ["cloud_text"];
                await rdbStore.cloudSync(
                    relationalStore.SyncMode.SYNC_MODE_NATIVE_FIRST, tableArray, Progess).then(() => {
                    console.log(TAG + `cloud sync success`);
                });
                await sleep(500);
                expect( syncProgressDetail["schedule"] == relationalStore.Progress.SYNC_FINISH ).assertTrue();
                expect( syncProgressDetail["code"] != 0 ).assertTrue();
                done();
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0013 end *************");
        })

        /**
         * @tc.name cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_2300
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSync0014', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0014 start *************");
            try {
                let tableArray = ["cloud_text"];
                await rdbStore.cloudSync(
                    relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, tableArray, Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                });
                await sleep(500);
                expect( syncProgressDetail["schedule"] == relationalStore.Progress.SYNC_FINISH ).assertTrue();
                expect( syncProgressDetail["code"] != 0 ).assertTrue();
                done();
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(null).assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0014 end *************");
        })

        /**
         * @tc.name cloud sync with wrong no SyncMode
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_2400
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSync0015', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0015 start *************");
            try {
                await rdbStore.cloudSync( Progess ).then(() => {
                    console.log(TAG + `cloud sync success`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0015 end *************");
        })

        /**
         * @tc.name cloud sync with wrong SyncMode err
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_2500
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSync0016', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSync0016 start *************");
            try {
                let tableArray = ["cloud_text"];
                await rdbStore.cloudSync(
                    relationalStore.SyncMode.SYNC_MODE, tableArray, Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSync0016 end *************");
        })
        /**
         * @tc.name cloud sync with wrong SyncMode null
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_2600
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0001', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0001 start *************");
            try {
                let tableArray = ["cloud_text"];
                await rdbStore.cloudSync(null, tableArray, Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0001 end *************");
        })

        /**
         * @tc.name cloud sync with wrong SyncMode undefined
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_2700
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0002', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0002 start *************");
            try {
                let tableArray = ["cloud_text"];
                await rdbStore.cloudSync(undefined, tableArray, Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0002 end *************");
        })

        /**
         * @tc.name cloud sync with wrong SyncMode 123
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_2800
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0003', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0003 start *************");
            try {
                let tableArray = ["cloud_text"];
                await rdbStore.cloudSync(123, tableArray, Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0003 end *************");
        })

        /**
         * @tc.name cloud sync with wrong table null
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_2900
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0004', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0004 start *************");
            try {
                await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, null, Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0004 end *************");
        })

        /**
         * @tc.name cloud sync with wrong table undefined
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_3000
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0005', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0005 start *************");
            try {
                await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, undefined, Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0005 end *************");
        })

        /**
         * @tc.name cloud sync with wrong table 123
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_3100
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0006', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0006 start *************");
            try {
                await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, 123, Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0006 end *************");
        })

        /**
         * @tc.name cloud sync with wrong table ""
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_3200
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0007', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0007 start *************");
            try {
                await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, "", Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0007 end *************");
        })

        /**
         * @tc.name cloud sync with wrong table "table123"
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_3300
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0008', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0008 start *************");
            try {
                await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, "table123", Progess).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0008 end *************");
        })

        /**
         * @tc.name cloud sync with wrong Progess null
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_3400
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0009', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0009 start *************");
            try {
                let tableArray = ["cloud_text"];
                await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, tableArray, null).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0009 end *************");
        })

        /**
         * @tc.name cloud sync with wrong Progess undefined
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_3500
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0010', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0010 start *************");
            try {
                let tableArray = ["cloud_text"];
                await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, tableArray, undefined).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0010 end *************");
        })

        /**
         * @tc.name cloud sync with wrong Progess "progess"
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_3600
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0011', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0011 start *************");
            try {
                let tableArray = ["cloud_text"];
                await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, tableArray, "progess").then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0011 end *************");
        })

        /**
         * @tc.name cloud sync with wrong Progess no
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_3700
         * @tc.desc cloud sync with table, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbStoreCloudSyncTable0012', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreCloudSyncTable0012 start *************");
            try {
                let tableArray = ["cloud_text"];
                await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, tableArray).then(() => {
                    console.log(TAG + `cloud sync success:`);
                    expect(null).assertFail();
                    done();
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, err code is ${err.code}, message is ${err.message}.`);
                expect(err.code == 401).assertTrue();
                done();
            }
            console.log(TAG + "************* testRdbStoreCloudSyncTable0012 end *************");
        })

        /**
         * @tc.name cloud sync with RdbPredicates, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_3800
         * @tc.desc cloud sync with RdbPredicates, SyncMode is SYNC_MODE_CLOUD_FIRST and promise method
         */
        it('testRdbCloudSyncFirst0001', 0, async function (done) {
        console.log(TAG + "************* testRdbCloudSyncFirst0001 start *************");

        function Progress(detail) {
            console.log(TAG + `Progress:` + JSON.stringify(detail));
            done();
        }
        let predicates = new relationalStore.RdbPredicates("cloud_text")
        predicates.in("num", ["1","2"]);
        try {
            await rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates, Progress)
        } catch (err) {
            console.log(TAG + `cloud sync fail, errcode:${JSON.stringify(err)}.`);
            expect("202").assertEqual(err.code);
            done();
        }
        console.log(TAG + "************* testRdbCloudSyncFirst0001 end *************");
        })

        /**
         * @tc.name cloud sync with RdbPredicates, SyncMode is SYNC_MODE_CLOUD_FIRST and callback method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_3900
         * @tc.desc cloud sync with RdbPredicates, SyncMode is SYNC_MODE_CLOUD_FIRST and callback method
         */
        it('testRdbCloudSyncFirst0002', 0, async function (done) {
            console.log(TAG + "************* testRdbCloudSyncFirst0002 start *************");
            try {

                function Progress(detail) {
                    console.log(TAG + `Progress:` + JSON.stringify(detail));
                }
                let predicates = new relationalStore.RdbPredicates("cloud_text")
                predicates.in("num", ["1","2"]);
                rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, predicates, Progress, () => {
                    expect(false).assertTrue()
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, errcode:${JSON.stringify(err)}.`);
                expect("202").assertEqual(err.code)
                done();
            }
            console.log(TAG + "************* testRdbCloudSyncFirst0002 end *************");
        })

        /**
         * @tc.name cloud sync with exception parameter, SyncMode is SYNC_MODE_CLOUD_FIRST and callback method
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_4000
         * @tc.desc cloud sync with exception parameter, SyncMode is SYNC_MODE_CLOUD_FIRST and callback method
         */
        it('testRdbCloudSyncFirst0003', 0, async function (done) {
            console.log(TAG + "************* testRdbCloudSyncFirst0003 start *************");
            try {

                function Progress(detail) {
                    console.log(TAG + `Progress:` + JSON.stringify(detail));
                }
                rdbStore.cloudSync(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, 1410, Progress, () => {
                    expect(false).assertTrue()
                });
            } catch (err) {
                console.log(TAG + `cloud sync fail, errcode:${JSON.stringify(err)}.`);
                expect('401').assertEqual(err.code);
                done();
            }
            console.log(TAG + "************* testRdbCloudSyncFirst0003 end *************");
        })

    /**
     * @tc.name subscribe test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_4100
     * @tc.desc normal testcase for autoSyncProgress of interface 'on'
     */
     it('testRdbCloudAutoSyncProgress0001', 0, async function (done) {
        console.log(TAG + "************* testRdbCloudAutoSyncProgress0001 start *************");
        try {
            rdbStore.on("autoSyncProgress", function (detail) {
                console.log(TAG + `Progress:` + JSON.stringify(detail));
                expect(detail).notEquel(null);
                done();
            });
            console.log(TAG + "on autoSyncProgress success");
        } catch (err) {
            console.log(TAG + "on autoSyncProgress" + err);
            expect().assertFail();
            done();
        }
        console.log(TAG + "************* testRdbCloudAutoSyncProgress0001 end *************");
        done()
    })

    /**
     * @tc.name subscribe test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_4200
     * @tc.desc normal testcase for autoSyncProgress of interface 'off'
     */
    it('testRdbCloudAutoSyncProgress0002', 0, async function (done) {
        console.log(TAG + "************* testRdbCloudAutoSyncProgress0002 start *************");
        try {
            rdbStore.off("autoSyncProgress", function (detail) {
                console.log(TAG + `Progress:` + JSON.stringify(detail));
                expect(detail).notEquel(null);
                done();
            });
            console.log(TAG + "off autoSyncProgress success");
        } catch (err) {
            console.log(TAG + "off autoSyncProgress" + err);
            expect().assertFail();
            done();
        }
        console.log(TAG + "************* testRdbCloudAutoSyncProgress0002 end *************");
        done()
    })

    /**
     * @tc.name subscribe test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_4300
     * @tc.desc normal testcase for autoSyncProgress of interface 'off'
     */
    it('testRdbCloudAutoSyncProgress0003', 0, async function (done) {
        console.log(TAG + "************* testRdbCloudAutoSyncProgress0003 start *************");
        try {
            rdbStore.off("autoSyncProgress", null);
            done();
            console.log(TAG + "off autoSyncProgress success");
        } catch (err) {
            console.log(TAG + "off autoSyncProgress" + err);
            expect().assertFail();
            done();
        }
        console.log(TAG + "************* testRdbCloudAutoSyncProgress0003 end *************");
    })

    /**
     * @tc.name subscribe test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_4400
     * @tc.desc normal testcase for autoSyncProgress of interface 'off'
     */
    it('testRdbCloudAutoSyncProgress0004', 0, async function (done) {
        console.log(TAG + "************* testRdbCloudAutoSyncProgress0004 start *************");
        try {
            rdbStore.off("autoSyncProgress", undefined);
            done();
            console.log(TAG + "off autoSyncProgress success");
        } catch (err) {
            console.log(TAG + "off autoSyncProgress" + err);
            expect().assertFail();
            done();
        }
        console.log(TAG + "************* testRdbCloudAutoSyncProgress0004 end *************");
    })

    /**
     * @tc.name subscribe test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_4500
     * @tc.desc normal testcase for autoSyncProgress of interface 'off'
     */
    it('testRdbCloudAutoSyncProgress0005', 0, async function (done) {
        console.log(TAG + "************* testRdbCloudAutoSyncProgress0005 start *************");
        try {
            rdbStore.off("autoSyncProgress");
            done();
            console.log(TAG + "off autoSyncProgress success");
        } catch (err) {
            console.log(TAG + "off autoSyncProgress" + err);
            expect().assertFail();
            done();
        }
        console.log(TAG + "************* testRdbCloudAutoSyncProgress0005 end *************");
    })

    /**
     * @tc.name lockCloudContainer with RdbPredicates, SyncMode is relationalStore.RdbPredicates and promise method
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_4600
     * @tc.desc lockCloudContainer with RdbPredicates, SyncMode is relationalStore.RdbPredicates and promise method
     */
    it('testRdbCloudlockCloudContainer0001', 0, async function (done) {
        console.log(TAG + "************* testRdbCloudlockCloudContainer0001 start *************");
        let predicates = new relationalStore.RdbPredicates("cloud_text")
        predicates.in("num", ["1","2"]);
        try {
            let time = await rdbStore.lockCloudContainer();
            console.info("testRdbCloudlockCloudContainer0001 lockCloudContainer succeeded time:" + time);
            expect(time != null).assertFail();
        } catch (err) {
            console.log(TAG + `relationalStore.RdbPredicates fail, errcode:${JSON.stringify(err)}.`);
            expect("202").assertEqual(err.code);
            done();
        }
        console.log(TAG + "************* testRdbCloudlockCloudContainer0001 end *************");
    })
    
    /**
     * @tc.name unlockCloudContainer with RdbPredicates, relationalStore.RdbPredicates promise method
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncJsAPITest_4700
     * @tc.desc unlockCloudContainer RdbPredicates, relationalStore.RdbPredicates and promise method
     */
     it('testRdbCloudUnlockCloudContainer0001', 0, async function (done) {
        console.log(TAG + "************* testRdbCloudUnlockCloudContainer0001 start *************");
        let predicates = new relationalStore.RdbPredicates("cloud_text")
        predicates.in("num", ["1","2"]);
        try {
            let time = await rdbStore.unlockCloudContainer();
            console.info("testRdbCloudUnlockCloudContainer0001 unlockCloudContainer succeeded time:" + time);
            expect(time != null).assertFail();
        } catch (err) {
            console.log(TAG + `rdbStore.unlockCloudContainer fail, errcode:${JSON.stringify(err)}.`);
            expect("202").assertEqual(err.code);
            done();
        }
        console.log(TAG + "************* testRdbCloudUnlockCloudContainer0001 end *************");
    }) 
    console.log(TAG + "*************Unit Test End*************");
})}
