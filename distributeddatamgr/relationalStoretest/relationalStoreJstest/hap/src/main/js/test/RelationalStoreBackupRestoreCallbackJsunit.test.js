/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import data_Rdb from '@ohos.data.relationalStore'
import ability_featureAbility from '@ohos.ability.featureAbility'
import fileio from '@ohos.fileio'

const TAG = "[RelationalStore_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS backupTest (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
+ "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)"
const DATABASE_DIR = "/data/storage/el2/database/entry/rdb/"
var RdbStore
var context = ability_featureAbility.getContext()
const STORE_CONFIG = {
    name: "BackupResotreTest.db",
    securityLevel: data_Rdb.SecurityLevel.S1
}
const DATABASE_BACKUP_NAME = "Backup.db"

async function CreatRdbStore(context, STORE_CONFIG) {
    let RdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG)
    await RdbStore.executeSql(CREATE_TABLE_TEST, null)
    let u8 = new Uint8Array([1, 2, 3])
    {
        const valueBucket = {
            "name": "zhangsan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
        }
        await RdbStore.insert("backupTest", valueBucket)
    }
    {
        const valueBucket = {
            "name": "lisi",
            "age": 28,
            "salary": 100.5,
            "blobType": u8,
        }
        await RdbStore.insert("backupTest", valueBucket)
    }
    {
        const valueBucket = {
            "name": "wangwu",
            "age": 38,
            "salary": 90.0,
            "blobType": u8,
        }
        await RdbStore.insert("backupTest", valueBucket)
    }
    return RdbStore
}

function BackupCallbackTest(backupName) {
    try {
        RdbStore.backup(backupName, (err, data) => {
            if(err != null){
                console.info(TAG + "Backup error: " + err)
                expect(true).assertTrue()
            }else{
                expect(false).assertTrue();
            }
        })
    } catch(errInfo){
        console.info(TAG + "BackupCallbackTest error: " + errInfo)
        expect(true).assertTrue()
    }

    RdbStore = null
}

function ReStoreCallbackTest(restoreName) {
    try {
        RdbStore.restore(restoreName, (err, data) => {
            if(err != null){
                console.info(TAG + "Restore error: " + err)
                expect(true).assertTrue()
            }else{
                expect(false).assertTrue();
            }
        })
    } catch(errInfo) {
        console.info(TAG + "ReStoreCallbackTest error: " + errInfo)
        expect(true).assertTrue()
    }

    RdbStore = null
}

export default function relationalStoreBackupRestoreCallbackTest() {
    describe('relationalStoreBackupRestoreCallbackTest', function () {


        beforeAll(async function () {
            console.info(TAG + 'beforeAll')
        })

        beforeEach(async function () {
            console.info(TAG + 'beforeEach')
            RdbStore = await CreatRdbStore(context, STORE_CONFIG)
        })

        afterEach(async function () {
            console.info(TAG + 'afterEach')
            try {
                await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name)
                await data_Rdb.deleteRdbStore(context, DATABASE_BACKUP_NAME)
                await data_Rdb.deleteRdbStore(context, "BackupTest003.db")
            } catch (err) {
                console.info(TAG + "deleteRdbStore err" + JSON.stringify(err))
            }
        })

        afterAll(async function () {
            console.info(TAG + 'afterAll')
        })

        console.info(TAG + "*************Unit Test Begin*************")

        /**
         * @tc.name RelationalStore Backup Restore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_0100
         * @tc.desc RelationalStore backup and restore function test
         */
        it('RdbBackupRestoreCallbackTest_0100', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0100 start *************")

            // RelationalStore backup function test
            await RdbStore.backup(DATABASE_BACKUP_NAME,async (err, data) => {
                if (err != null) {
                    console.info(TAG + 'backup err ttt:  ' + err)
                    expect(false).assertTrue()
                }else{
                    try {
                        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
                        fileio.accessSync(DATABASE_DIR + STORE_CONFIG.name)
                    } catch (err) {
                        expect(false).assertTrue()
                    }
                }

                // RelationalStore before restored, delete data
                let deleteData = new data_Rdb.RdbPredicates("backupTest")
                deleteData.equalTo("name", "zhangsan")
                RdbStore.delete(deleteData).then(()=> {
                    RdbStore.restore(DATABASE_BACKUP_NAME, async (err, data) => {
                        if(err != null){
                            expect(false).assertTrue()
                        }else{
                            try {
                                fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
                                expect(false).assertTrue()
                            } catch (err) {
                                console.info(TAG + " restore1 done ")
                            }

                            try {
                                fileio.accessSync(DATABASE_DIR + STORE_CONFIG.name)
                            } catch (err) {
                                expect(false).assertTrue()
                            }
                            let predicates = new data_Rdb.RdbPredicates("backupTest")
                            predicates.equalTo("name", "zhangsan")
                            let resultSet = await RdbStore.query(predicates)
                            try {
                                console.info(TAG + "After restore resultSet query done")
                                expect(true).assertEqual(resultSet.goToFirstRow())
                                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                                expect(1).assertEqual(id)
                                expect("zhangsan").assertEqual(name)
                                expect(1).assertEqual(blobType[0])
                            } catch (err) {
                                console.info(TAG + 'RdbBackupRestoreTest_0010 accessSync err4:  ' + err)
                                expect(false).assertTrue()
                            }
                            resultSet = null
                            RdbStore = null
                        }
                        done()
                        console.info(TAG + "************* RdbBackupRestoreCallbackTest_0100 end *************")
                    })
                })
            })
        })

        /**
         * @tc.name RelationalStore Backup test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_0200
         * @tc.desc RelationalStore backup function test
         */
        it('RdbBackupRestoreCallbackTest_0200', 0, function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0200 start *************")
            // RelationalStore backup function test, backup file name empty
            BackupCallbackTest("")

            // RelationalStore backup function test, backup file name already exists
            BackupCallbackTest(STORE_CONFIG.name)

            done()
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0200 end *************")
        })

        /**
         * @tc.name RelationalStore BackupRestore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_0300
         * @tc.desc RelationalStore restore function test
         */
        it('RdbBackupRestoreCallbackTest_0300', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0300 start *************")
            let backupName = "BackupTest003.db"
            await RdbStore.backup(backupName)

            // RelationalStore restore function test, backup file name empty
            ReStoreCallbackTest("")

            // RelationalStore restore function test, backup file is specified to database name
            ReStoreCallbackTest(STORE_CONFIG.name)

            done()
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0300 end *************")
        })

        /**
         * @tc.name RelationalStore BackupRestore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_0400
         * @tc.desc RelationalStore restore function test
         */
        it('RdbBackupRestoreCallbackTest_0400', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0400 start *************")
            let dbName = "notExistName.db"

            // RelationalStore restore function test, backup file does not exists
            try {
                fileio.accessSync(DATABASE_DIR + dbName)
                expect(false).assertTrue()
            } catch {
                ReStoreCallbackTest(dbName)
            }

            done()
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0400 end *************")
        })

        /**
         * @tc.name RelationalStore BackupRestore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_0500
         * @tc.desc RelationalStore restore function test
         */
        it('RdbBackupRestoreCallbackTest_0500', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0500 start *************")

            // RDB restore function test, backup file
            RdbStore.backup(DATABASE_BACKUP_NAME, (err, data) => {
                if(err != null){
                    expect(false).assertTrue()
                }else{
                    try{
                        console.info(TAG + 'Backup database success')
                        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
                    }catch(err){
                        expect(false).assertTrue();
                    }
                    data_Rdb .deleteRdbStore(context, DATABASE_BACKUP_NAME).then(() => {
                        try{
                            fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
                        }catch(err){
                            console.info(TAG + 'RdbBackupRestoreCallbackTest_0500 deleteRdbStore done')
                        }
                        RdbStore.backup(DATABASE_BACKUP_NAME, (err, data) => {
                            if(err != null){
                                console.info(`${TAG} Backup database second failed, error: message: ${err.message}`)
                            }else{
                                try{
                                    console.info(TAG + 'Backup database second success')
                                    fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
                                }catch(err){
                                    expect(false).assertTrue();
                                }
                                done();
                                console.info(TAG + "************* RdbBackupRestoreCallbackTest_0500 end *************")
                            }
                        })
                    })
                }
            })
        })

        /**
         * @tc.name RelationalStore BackupRestore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_0600
         * @tc.desc RelationalStore restore function test
         */
         it('RdbBackupRestoreCallbackTest_0600', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0600 start *************")

            // Backup file is specified to database name
            RdbStore.backup(STORE_CONFIG.name, (err, data) => {
                expect(err != null).assertTrue()
                console.info(TAG + "RdbBackupRestoreCallbackTest_0600 backup1 done")

                RdbStore.backup(STORE_CONFIG.name, (err, data) => {
                    expect(err != null).assertTrue()
                    console.info(TAG + "RdbBackupRestoreCallbackTest_0600 backup2 done")
                    done();
                    console.info(TAG + "************* RdbBackupRestoreCallbackTest_0600 end *************")
                })
            })
        })

        /**
         * @tc.name RelationalStore BackupRestore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_0700
         * @tc.desc RelationalStore restore function test
         */
        it('RdbBackupRestoreCallbackTest_0700', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0700 start *************")
            let DATABASE_BACKUP_TEST_NAME = "BackupTest.db"
            RdbStore.backup(DATABASE_BACKUP_TEST_NAME, async (err, data) => {
                if (err != null) {
                    expect(false).assertTrue()
                } else {
                    console.info(TAG + "RdbBackupRestoreCallbackTest_0700 backup done")
                }
                data_Rdb.deleteRdbStore(context, DATABASE_BACKUP_TEST_NAME, () => {
                    try {
                        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_TEST_NAME)
                    } catch (err) {
                        console.info(TAG + "RdbBackupRestoreCallbackTest_0700 deleteRdbStore done")
                    }
                    RdbStore.restore(DATABASE_BACKUP_TEST_NAME, (err, data) => {
                        expect(err != null).assertTrue()
                        console.info(TAG + "RdbBackupRestoreCallbackTest_0700 restore err " + err.code)
                        done();
                    })
                })
            })
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0700 end *************")
        })

        /**
         * @tc.name RelationalStore BackupRestore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_0800
         * @tc.desc RelationalStore restore function test
         */
        it('RdbBackupRestoreCallbackTest_0800', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0800 start *************")
            BackupCallbackTest()
            done();
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0800 end *************")
        })

        /**
         * @tc.name RelationalStore BackupRestore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_0900
         * @tc.desc RelationalStore restore function test
         */
        it('RdbBackupRestoreCallbackTest_0900', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0900 start *************")
            BackupCallbackTest([DATABASE_BACKUP_NAME])
            done();
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_0900 end *************")
        })

        /**
         * @tc.name RelationalStore BackupRestore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_1000
         * @tc.desc RelationalStore restore function test
         */
        it('RdbBackupRestoreCallbackTest_1000', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_1000 start *************")
            RdbStore.backup(DATABASE_BACKUP_NAME, (err, data) => {
                if(err != null){
                    expect(false).assertTrue()
                }
                ReStoreCallbackTest([DATABASE_BACKUP_NAME])
                done();
            })
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_1000 end *************")
        })
        /**
         * @tc.name RelationalStore BackupRestore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_1100
         * @tc.desc RelationalStore restore function test
         */
        it('RdbBackupRestoreCallbackTest_1100', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_1100 start *************")
            RdbStore.backup(DATABASE_BACKUP_NAME, (err, data) => {
                if (err != null) {
                    console.info(`[ttt] backup fail, sode is ${err.code},message is ${err.message}`)
                    expect(err != null).assertFalse();
                    done();
                }
                try {
                    RdbStore.restore((err, data) => {
                        if (err === undefined) {
                            console.info(TAG + `restore success`);
                            expect(err === undefined).assertFail();
                            done();
                        } else {
                            console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
                            expect(err !== null).assertFail();
                            done();
                        }
                    })
                } catch (errInfo) {
                    console.info(`[ttt] restore error, code is ${errInfo.code},message is ${errInfo.message}`)
                    expect(errInfo.code).assertEqual('401');
                    done();
                }
            })
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_1100 end *************")
        })

        /**
         * @tc.name RelationalStore BackupRestore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_1200
         * @tc.desc RelationalStore restore function test
         */
        it('RdbBackupRestoreCallbackTest_1200', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_1200 start *************")
            await RdbStore.backup(DATABASE_BACKUP_NAME);
            await RdbStore.backup(DATABASE_BACKUP_NAME, function(err) {
                if(err){
                    console.error(TAG + `Restore failed, code is ${err.code},message is ${err.message}`);
                    expect(err !== undefined).assertFail();
                    done();
                }
                console.info(TAG + `Restore success.`);
                expect(err === undefined).assertTrue();
                done();
            })
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_1200 end *************")
        })

        /**
         * @tc.name RelationalStore BackupRestore test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_1300
         * @tc.desc RelationalStore restore function test
         */
        it('RdbBackupRestoreCallbackTest_1300', 0, function (done) {
            console.info(TAG + "************* RdbBackupRestoreCallbackTest_1300 start *************")
            try {
                RdbStore.backup(DATABASE_BACKUP_NAME, (e) => {
                    console.info(TAG, `backup success`)
                    if (e != null) {
                        console.info(`[ttt] backup fail, sode is ${e.code},message is ${e.message}`)
                        expect(e != null).assertFalse();
                        done();
                    }
                    RdbStore.restore(DATABASE_BACKUP_NAME, function (err) {
                        if (err) {
                            console.error(`Restore failed, code is ${err.code},message is ${err.message}`);
                            expect(err != null).assertFail();
                            done();
                        }
                        console.info(`Restore1 success.`);
                        RdbStore.restore(DATABASE_BACKUP_NAME, function (error) {
                            if (error !== undefined) {
                                console.error(`Restore failed, code is ${error.code},message is ${error.message}`);
                                expect(error.code === 14800011).assertTrue();
                                done();
                            } else {
                                console.info(`Restore2 success.`);
                                expect(error !== undefined).assertFail();
                                done();
                            }
                        })
                    })
                })
            } catch (errInfo) {
                console.info(`[ttt] fail, code is ${errInfo.code},message is ${errInfo.message}`)
                expect(errInfo !== undefined).assertFail();
                done();
            }
        })
        console.info(TAG + "*************Unit Test End*************")
    })
}