/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import dataRdb from '@ohos.data.rdb';
import { BusinessError } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { sendableRelationalStore } from '@kit.ArkData';
import deviceInfo from '@ohos.deviceInfo';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[ttt]";
const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER," + "salary  REAL," + "data BLOB)";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL)";

const STORE_CONFIG: dataRdb.StoreConfig = {
    name: "rdbStoreTest.db",
}
let rdbStore: dataRdb.RdbStore;

function sleep(ms: number): Promise<void> {
    return new Promise((resolve) => {
        setTimeout(resolve, ms);
    })
}

export default function RDBStoreErrTest() {
    describe('RDBStoreErrTest', () => {
        beforeAll(async () => {
            console.info(TAG + "*************Unit Test Begin*************");
            console.info(TAG + 'beforeAll');
        })

        beforeEach(async () => {
            console.info(TAG + 'beforeEach');
            rdbStore = await dataRdb.getRdbStore(context, STORE_CONFIG, 1);
            console.info(TAG + "create rdb store success")
            await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE, null);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        })

        afterEach(async () => {
            console.info(TAG + 'afterEach');
            await dataRdb.deleteRdbStore(context, "rdbStoreTest.db")
            console.info(TAG + "deleteRdbStore success")
        })

        afterAll(async () => {
            console.info(TAG + 'afterAll');
            console.info(TAG + "*************Unit Test end*************");
        })

        /**
         * @tc.name   RdbQueryErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbQueryErrTest_0100
         * @tc.desc   RdbQueryErrTest001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('RdbQueryErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbQueryErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test")
                let resultSet = await rdbStore.query(null)
                console.info(TAG + " RdbQueryErrTest001 success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbQueryErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbQueryErrTest001 end *************");
        })

        /**
         * @tc.name   RdbQueryErrTest002
         * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbQueryErrTest_0200
         * @tc.desc   RdbQueryErrTest002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('RdbQueryErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbQueryErrTest002 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test")
                let resultSet = await rdbStore.query(undefined)
                console.info(TAG + " RdbQueryErrTest002 success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbQueryErrTest002 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbQueryErrTest002 end *************");
        })

        /**
       * @tc.name   RdbQueryErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbQueryErrTest_0300
       * @tc.desc   RdbQueryErrTest003
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbQueryErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbQueryErrTest003 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let resultSet: dataRdb.ResultSet;
                await rdbStore.query(predicates, null).then((res) => {
                    resultSet = res;
                    console.info(TAG + " RdbQueryErrTest003 success" + resultSet.rowCount);
                    expect(resultSet.rowCount).assertEqual(0);
                    resultSet?.close();
                }).catch((err: BusinessError) => {
                    console.error(TAG + "failed" + err.code + err.message);
                    expect().assertFail();
                });
            } catch (err) {
                console.error(TAG + " RdbQueryErrTest003 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbQueryErrTest003 end *************");
        })

        /**
       * @tc.name   RdbQueryErrTest004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbQueryErrTest_0400
       * @tc.desc   RdbQueryErrTest004
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbQueryErrTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbQueryErrTest004 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let resultSet: dataRdb.ResultSet | undefined;
                resultSet = await rdbStore.query(predicates, undefined)
                console.info(TAG + " RdbQueryErrTest004 success" + resultSet?.rowCount);
                expect(resultSet.rowCount).assertEqual(0);
                resultSet?.close();
            } catch (err) {
                console.error(TAG + " RdbQueryErrTest004 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbQueryErrTest004 end *************");
        })

        /**
       * @tc.name   RdbQueryErrTest005
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbQueryErrTest_0500
       * @tc.desc   RdbQueryErrTest005
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbQueryErrTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbQueryErrTest005 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let resultSet: dataRdb.ResultSet | undefined;
                resultSet = await rdbStore.query(predicates, ["name"])
                console.info(TAG + " RdbQueryErrTest005 success" + resultSet?.rowCount);
                expect(resultSet.rowCount).assertEqual(0);
                resultSet?.close();
            } catch (err) {
                console.error(TAG + " RdbQueryErrTest005 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbQueryErrTest005 end *************");
        })

        /**
       * @tc.name   RdbExecuteSqlErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbExecuteSqlErrTest_0100
       * @tc.desc   RdbExecuteSqlErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbExecuteSqlErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbExecuteSqlErrTest001 start *************");
            try {
                rdbStore.executeSql("", [], (err: BusinessError) => {
                    if (err) {
                        console.info("ExecuteSql failed, err: " + err)
                        expect().assertFail();
                    } else {
                        console.info('Delete table done.')
                        expect().assertFail();
                    }
                })
            } catch (err) {
                console.error(TAG + " RdbExecuteSqlErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done()
            }
            console.info(TAG + "************* RdbExecuteSqlErrTest001 end *************");
        })

        /**
       * @tc.name   RdbExecuteSqlErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbExecuteSqlErrTest_0200
       * @tc.desc   RdbExecuteSqlErrTest002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbExecuteSqlErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbExecuteSqlErrTest002 start *************");
            try {
                rdbStore.executeSql(null, null, (err: BusinessError) => {
                    if (err) {
                        console.info("ExecuteSql failed, err: " + err)
                        expect().assertFail();
                    } else {
                        console.info('Delete table done.')
                        expect().assertFail();
                    }
                })
            } catch (err) {
                console.error(TAG + " RdbExecuteSqlErrTest002 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done()
            }
            console.info(TAG + "************* RdbExecuteSqlErrTest002 end *************");
        })

        /**
       * @tc.name   RdbExecuteSqlErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbExecuteSqlErrTest_0300
       * @tc.desc   RdbExecuteSqlErrTest003
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbExecuteSqlErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbExecuteSqlErrTest003 start *************");
            try {
                rdbStore.executeSql(undefined, undefined, (err: BusinessError) => {
                    if (err) {
                        console.info("ExecuteSql failed, err: " + err)
                        expect().assertFail();
                    } else {
                        console.info('Delete table done.')
                        expect().assertFail();
                    }
                })
            } catch (err) {
                console.error(TAG + " RdbExecuteSqlErrTest003 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done()
            }
            console.info(TAG + "************* RdbExecuteSqlErrTest003 end *************");
        })

        /**
       * @tc.name   RdbExecuteSqlErrTest004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbExecuteSqlErrTest_0400
       * @tc.desc   RdbExecuteSqlErrTest004
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbExecuteSqlErrTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbExecuteSqlErrTest004 start *************");
            try {
                rdbStore.executeSql(undefined, ["zhangsan"], (err: BusinessError) => {
                    if (err) {
                        console.info("ExecuteSql failed, err: " + err)
                        expect().assertFail();
                    } else {
                        console.info('Delete table done.')
                        expect().assertFail();
                    }
                })
            } catch (err) {
                console.error(TAG + " RdbExecuteSqlErrTest004 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done()
            }
            console.info(TAG + "************* RdbExecuteSqlErrTest004 end *************");
        })

        /**
       * @tc.name   RdbExecuteSqlErrTest005
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbExecuteSqlErrTest_0500
       * @tc.desc   RdbExecuteSqlErrTest005
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbExecuteSqlErrTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbExecuteSqlErrTest005 start *************");
            try {
                await rdbStore.executeSql("", [])
                console.info('executeSql table done.')
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbExecuteSqlErrTest005 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done()
            }
            console.info(TAG + "************* RdbExecuteSqlErrTest005 end *************");
        })

        /**
       * @tc.name   RdbExecuteSqlErrTest006
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbExecuteSqlErrTest_0600
       * @tc.desc   RdbExecuteSqlErrTest006
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbExecuteSqlErrTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbExecuteSqlErrTest006 start *************");
            try {
                await rdbStore.executeSql(null, null)
                console.info('executeSql table done.')
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbExecuteSqlErrTest006 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done()
            }
            console.info(TAG + "************* RdbExecuteSqlErrTest006 end *************");
        })

        /**
       * @tc.name   RdbExecuteSqlErrTest007
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbExecuteSqlErrTest_0700
       * @tc.desc   RdbExecuteSqlErrTest007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbExecuteSqlErrTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbExecuteSqlErrTest007 start *************");
            try {
                await rdbStore.executeSql(undefined, undefined)
                console.info('executeSql table done.')
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbExecuteSqlErrTest007 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done()
            }
            console.info(TAG + "************* RdbExecuteSqlErrTest007 end *************");
        })

        /**
       * @tc.name   RdbExecuteSqlErrTest008
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbExecuteSqlErrTest_0800
       * @tc.desc   RdbExecuteSqlErrTest008
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbExecuteSqlErrTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbExecuteSqlErrTest008 start *************");
            try {
                await rdbStore.executeSql(undefined, ["zhangsan"])
                console.info('executeSql table done.')
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbExecuteSqlErrTest008 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done()
            }
            console.info(TAG + "************* RdbExecuteSqlErrTest008 end *************");
        })

        /**
       * @tc.name   RdbOnErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbOnErrTest_0100
       * @tc.desc   RdbOnErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbOnErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbOnErrTest001 start *************");
            try {
                let count = 0
                rdbStore.on(null, dataRdb.SubscribeType.SUBSCRIBE_TYPE_REMOTE, undefined);
                count += 1
                console.info(TAG + "on success");
                expect(count).assertEqual(1);
            } catch (err) {
                console.error(TAG + " RdbOnErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbOnErrTest001 end *************");
        })

        /**
       * @tc.name   RdbOnErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbOnErrTest_0200
       * @tc.desc   RdbOnErrTest002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbOnErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbOnErrTest002 start *************");
            try {
                let count = 0
                rdbStore.on(undefined, dataRdb.SubscribeType.SUBSCRIBE_TYPE_REMOTE, undefined);
                count += 1
                console.info(TAG + "on success");
                expect(count).assertEqual(1);
            } catch (err) {
                console.error(TAG + " RdbOnErrTest002 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbOnErrTest002 end *************");
        })

        /**
       * @tc.name   RdbInDevicesErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbInDevicesErrTest_0100
       * @tc.desc   RdbInDevicesErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbInDevicesErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbInDevicesErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                predicates.inDevices(null);
                console.info(TAG + "inDevices success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbInDevicesErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbInDevicesErrTest001 end *************");
        })

        /**
       * @tc.name   RdbInDevicesErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbInDevicesErrTest_0200
       * @tc.desc   RdbInDevicesErrTest002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbInDevicesErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbInDevicesErrTest002 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                predicates.inDevices(undefined);
                console.info(TAG + "inDevices success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbInDevicesErrTest002 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbInDevicesErrTest002 end *************");
        })

        /**
       * @tc.name   RdbInDevicesErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbOnErrTest_0300
       * @tc.desc   RdbInDevicesErrTest003
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbInDevicesErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbInDevicesErrTest003 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.inDevices([]);
                console.info(TAG + "inDevices success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbInDevicesErrTest003 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbInDevicesErrTest003 end *************");
        })

        /**
       * @tc.name   RdbEqualToErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbEqualToErrTest_0100
       * @tc.desc   RdbEqualToErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbEqualToErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbEqualToErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.equalTo("", null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbEqualToErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbEqualToErrTest001 end *************");
        })

        /**
       * @tc.name   RdbEqualToErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbEqualToErrTest_0200
       * @tc.desc   RdbEqualToErrTest002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbEqualToErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbEqualToErrTest002 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.equalTo(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbEqualToErrTest002 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbEqualToErrTest002 end *************");
        })

        /**
       * @tc.name   RdbEqualToErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbEqualToErrTest_0300
       * @tc.desc   RdbEqualToErrTest003
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbEqualToErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbEqualToErrTest003 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.equalTo(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbEqualToErrTest003 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbEqualToErrTest003 end *************");
        })

        /**
       * @tc.name   RdbEqualToErrTest004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbEqualToErrTest_0400
       * @tc.desc   RdbEqualToErrTest004
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbEqualToErrTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbEqualToErrTest004 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.equalTo("name", "zhangsan");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbEqualToErrTest004 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbEqualToErrTest004 end *************");
        })

        /**
         * @tc.name   RdbNotEqualToErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbNotEqualToErrTest_0100
         * @tc.desc   RdbNotEqualToErrTest001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('RdbNotEqualToErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbNotEqualToErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notEqualTo("", null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbNotEqualToErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbNotEqualToErrTest001 end *************");
        })

        /**
       * @tc.name   RdbNotEqualToErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbNotEqualToErrTest_0200
       * @tc.desc   RdbNotEqualToErrTest002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbNotEqualToErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbNotEqualToErrTest002 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notEqualTo(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbNotEqualToErrTest002 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbNotEqualToErrTest002 end *************");
        })

        /**
       * @tc.name   RdbNotEqualToErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbNotEqualToErrTest_0300
       * @tc.desc   RdbNotEqualToErrTest003
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbNotEqualToErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbNotEqualToErrTest003 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notEqualTo(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbNotEqualToErrTest003 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbNotEqualToErrTest003 end *************");
        })

        /**
       * @tc.name   RdbNotEqualToErrTest004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbNotEqualToErrTest_0400
       * @tc.desc   RdbNotEqualToErrTest004
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbNotEqualToErrTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbNotEqualToErrTest004 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notEqualTo("name", "zhangsan");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbNotEqualToErrTest004 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbNotEqualToErrTest004 end *************");
        })

        /**
         * @tc.name   RdbBeginWrapErrTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbBeginWrapErrTest_0100
         * @tc.desc   RdbBeginWrapErrTest001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('RdbBeginWrapErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbBeginWrapErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.beginWrap();
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbBeginWrapErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbBeginWrapErrTest001 end *************");
        })

        /**
       * @tc.name   RdbEndWrapErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbEndWrapErrTest_0100
       * @tc.desc   RdbEndWrapErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbEndWrapErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbEndWrapErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.endWrap();
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbEndWrapErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbEndWrapErrTest001 end *************");
        })

        /**
       * @tc.name   RdbOrErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbOrErrTest_0100
       * @tc.desc   RdbOrErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbOrErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbOrErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.or();
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbOrErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbOrErrTest001 end *************");
        })

        /**
       * @tc.name   RdbAndErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbAndErrTest_0100
       * @tc.desc   RdbAndErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbAndErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbAndErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.and();
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbAndErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbAndErrTest001 end *************");
        })

        /**
       * @tc.name   RdbContainsErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbContainsErrTest_0100
       * @tc.desc   RdbContainsErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbContainsErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbContainsErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.contains("", "");
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbContainsErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbContainsErrTest001 end *************");
        })

        /**
       * @tc.name   RdbContainsErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbContainsErrTest_0200
       * @tc.desc   RdbContainsErrTest002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbContainsErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbContainsErrTest002 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.contains(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbContainsErrTest002 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbContainsErrTest002 end *************");
        })

        /**
       * @tc.name   RdbContainsErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbContainsErrTest_0300
       * @tc.desc   RdbContainsErrTest003
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbContainsErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbContainsErrTest003 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.contains(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbContainsErrTest003 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbContainsErrTest003 end *************");
        })

        /**
       * @tc.name   RdbContainsErrTest004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbContainsErrTest_0400
       * @tc.desc   RdbContainsErrTest004
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbContainsErrTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbContainsErrTest004 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.contains("name", "zhangsan");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbContainsErrTest004 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbContainsErrTest004 end *************");
        })

        /**
       * @tc.name   RdbBeginsWithErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbBeginsWithErrTest_0100
       * @tc.desc   RdbBeginsWithErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbBeginsWithErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbBeginsWithErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.beginsWith("", "");
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbBeginsWithErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbBeginsWithErrTest001 end *************");
        })

        /**
       * @tc.name   RdbBeginsWithErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbBeginsWithErrTest_0200
       * @tc.desc   RdbBeginsWithErrTest002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbBeginsWithErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbBeginsWithErrTest002 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.beginsWith(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbBeginsWithErrTest002 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbBeginsWithErrTest002 end *************");
        })

        /**
       * @tc.name   RdbBeginsWithErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbBeginsWithErrTest_0300
       * @tc.desc   RdbBeginsWithErrTest003
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbBeginsWithErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbBeginsWithErrTest003 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.beginsWith(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbBeginsWithErrTest003 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbBeginsWithErrTest003 end *************");
        })

        /**
       * @tc.name   RdbBeginsWithErrTest004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbBeginsWithErrTest_0400
       * @tc.desc   RdbBeginsWithErrTest004
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbBeginsWithErrTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbBeginsWithErrTest004 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.beginsWith("name", "zhangsan");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbBeginsWithErrTest004 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbBeginsWithErrTest004 end *************");
        })

        /**
       * @tc.name   RdbEndsWithErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbEndsWithErrTest_0100
       * @tc.desc   RdbEndsWithErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbEndsWithErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbEndsWithErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.endsWith("", "");
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbEndsWithErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbEndsWithErrTest001 end *************");
        })

        /**
       * @tc.name   RdbEndsWithErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbEndsWithErrTest_0200
       * @tc.desc   RdbEndsWithErrTest002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbEndsWithErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbEndsWithErrTest002 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.endsWith(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbEndsWithErrTest002 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbEndsWithErrTest002 end *************");
        })

        /**
       * @tc.name   RdbEndsWithErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbEndsWithErrTest_0300
       * @tc.desc   RdbEndsWithErrTest003
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbEndsWithErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbEndsWithErrTest003 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.endsWith(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbEndsWithErrTest003 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbEndsWithErrTest003 end *************");
        })

        /**
       * @tc.name   RdbEndsWithErrTest004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbEndsWithErrTest_0400
       * @tc.desc   RdbEndsWithErrTest004
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbEndsWithErrTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbEndsWithErrTest004 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.endsWith("name", "zhangsan");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbEndsWithErrTest004 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbEndsWithErrTest004 end *************");
        })

        /**
       * @tc.name   RdbIsNullErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbIsNullErrTest_0100
       * @tc.desc   RdbIsNullErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbIsNullErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbIsNullErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.isNull("");
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbIsNullErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbIsNullErrTest001 end *************");
        })

        /**
       * @tc.name   RdbIsNullErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbIsNullErrTest_0200
       * @tc.desc   RdbIsNullErrTest002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbIsNullErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbIsNullErrTest002 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.isNull(null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbIsNullErrTest002 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbIsNullErrTest002 end *************");
        })

        /**
       * @tc.name   RdbIsNullErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbIsNullErrTest_0300
       * @tc.desc   RdbIsNullErrTest003
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbIsNullErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbIsNullErrTest003 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.isNull(undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbIsNullErrTest003 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.isNull("name");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbIsNullErrTest003 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbIsNullErrTest003 end *************");
        })

        /**
       * @tc.name   RdbIsNotNullErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbIsNotNullErrTest_0100
       * @tc.desc   RdbIsNotNullErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbIsNotNullErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbIsNotNullErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.isNotNull("");
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbIsNotNullErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.isNotNull(null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbIsNotNullErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.isNotNull(undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbIsNotNullErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.isNotNull("name");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbIsNotNullErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbIsNotNullErrTest001 end *************");
        })

        /**
       * @tc.name   RdbLikeErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbLikeErrErrTest_0100
       * @tc.desc   RdbLikeErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbLikeErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbLikeErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.like("", "");
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbLikeErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.like(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbLikeErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.like(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbLikeErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.like("name", "zhangsan");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbLikeErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbLikeErrTest001 end *************");
        })

        /**
       * @tc.name   RdbGlobErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGlobErrTest_0100
       * @tc.desc   RdbGlobErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbGlobErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbGlobErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.glob("", "");
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbGlobErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.glob(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbGlobErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.glob(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbGlobErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.glob("name", "zhangsan");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbGlobErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbGlobErrTest001 end *************");
        })

        /**
       * @tc.name   RdbBetweenErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbBetweenErrTest_0100
       * @tc.desc   RdbBetweenErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbBetweenErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbBetweenErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.between("", 1, 10);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbBetweenErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.between(null, null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbBetweenErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.between(undefined, undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbBetweenErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.between("age", 1, 10);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbBetweenErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbBetweenErrTest001 end *************");
        })

        /**
       * @tc.name   RdbNotBetweenErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbNotBetweenErrTest_0100
       * @tc.desc   RdbNotBetweenErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbNotBetweenErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbNotBetweenErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notBetween("", 1, 10);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbNotBetweenErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notBetween(null, null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbNotBetweenErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notBetween(undefined, undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbNotBetweenErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notBetween("age", 1, 10);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbNotBetweenErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbNotBetweenErrTest001 end *************");
        })

        /**
       * @tc.name   RdbGreaterThanErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGreaterThanErrTest_0100
       * @tc.desc   RdbGreaterThanErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbGreaterThanErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbGreaterThanErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.greaterThan("", 18);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbGreaterThanErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.greaterThan(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbGreaterThanErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.greaterThan(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbGreaterThanErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.greaterThan("age", 18);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbGreaterThanErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbGreaterThanErrTest001 end *************");
        })

        /**
       * @tc.name   RdbLessThanErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbLessThanErrTest_0100
       * @tc.desc   RdbLessThanErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbLessThanErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbLessThanErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.lessThan("", 18);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbLessThanErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.lessThan(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbLessThanErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.lessThan(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbLessThanErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.lessThan("age", 18);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbLessThanErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbLessThanErrTest001 end *************");
        })

        /**
       * @tc.name   RdbGreaterThanOrEqualToErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGreaterThanOrEqualToErrTest_0100
       * @tc.desc   RdbGreaterThanOrEqualToErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbGreaterThanOrEqualToErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbGreaterThanOrEqualToErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.greaterThanOrEqualTo("", 18);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbGreaterThanOrEqualToErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.greaterThanOrEqualTo(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbGreaterThanOrEqualToErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.greaterThanOrEqualTo(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbGreaterThanOrEqualToErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.greaterThanOrEqualTo("age", 18);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbGreaterThanOrEqualToErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbGreaterThanOrEqualToErrTest001 end *************");
        })

        /**
       * @tc.name   RdbLessThanOrEqualToErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbLessThanOrEqualToErrTest_0100
       * @tc.desc   RdbLessThanOrEqualToErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbLessThanOrEqualToErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbLessThanOrEqualToErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.lessThanOrEqualTo("", 18);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbLessThanOrEqualToErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.lessThanOrEqualTo(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbLessThanOrEqualToErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.lessThanOrEqualTo(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbLessThanOrEqualToErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.lessThanOrEqualTo("age", 18);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbLessThanOrEqualToErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbLessThanOrEqualToErrTest001 end *************");
        })

        /**
       * @tc.name   RdbOrderByAscErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbOrderByAscErrTest_0100
       * @tc.desc   RdbOrderByAscErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbOrderByAscErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbOrderByAscErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.orderByAsc("");
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbOrderByAscErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.orderByAsc(null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbOrderByAscErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.orderByAsc(undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbOrderByAscErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.orderByAsc("name");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbOrderByAscErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbOrderByAscErrTest001 end *************");
        })

        /**
       * @tc.name   RdbOrderByDescErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbOrderByDescErrTest_0100
       * @tc.desc   RdbOrderByDescErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbOrderByDescErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbOrderByDescErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.orderByDesc("");
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbOrderByDescErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.orderByDesc(null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbOrderByDescErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.orderByDesc(undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbOrderByDescErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.orderByDesc("name");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbOrderByDescErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbOrderByDescErrTest001 end *************");
        })

        /**
      * @tc.name   RdbDistinctErrTest001
      * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbDistinctErrTest_0100
      * @tc.desc   RdbDistinctErrTest001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
        it('RdbDistinctErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbDistinctErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.distinct();
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbDistinctErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbDistinctErrTest001 end *************");
        })

        /**
       * @tc.name   RdbLimitAsErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbLimitAsErrTest_0100
       * @tc.desc   RdbLimitAsErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbLimitAsErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbLimitAsErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.limitAs(null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbLimitAsErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.limitAs(undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbLimitAsErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.limitAs(3);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbLimitAsErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbLimitAsErrTest001 end *************");
        })

        /**
       * @tc.name   RdbOffsetAsErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbOffsetAsErrTest_0100
       * @tc.desc   RdbOffsetAsErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbOffsetAsErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbOffsetAsErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.offsetAs(null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbOffsetAsErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.offsetAs(undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbOffsetAsErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.offsetAs(3);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbOffsetAsErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbOffsetAsErrTest001 end *************");
        })

        /**
       * @tc.name   RdbGroupByErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGroupByErrTest_0100
       * @tc.desc   RdbGroupByErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbGroupByErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbGroupByErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.groupBy([]);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbGroupByErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.groupBy(null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbGroupByErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.groupBy(undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbGroupByErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.groupBy(["name"]);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbGroupByErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbGroupByErrTest001 end *************");
        })

        /**
       * @tc.name   RdbIndexedByErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbIndexedByErrTest_0100
       * @tc.desc   RdbIndexedByErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbIndexedByErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbIndexedByErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.indexedBy("");
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbIndexedByErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.indexedBy(null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbIndexedByErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.indexedBy(undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbIndexedByErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.indexedBy("name");
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbIndexedByErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbIndexedByErrTest001 end *************");
        })

        /**
       * @tc.name   RdbInErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbInErrTest_0100
       * @tc.desc   RdbInErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbInErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbInErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.in("", []);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbInErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.in(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbInErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.in(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbInErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.in("age", [1, 18]);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbInErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbInErrTest001 end *************");
        })

        /**
       * @tc.name   RdbNotInErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbNotInErrTest_0100
       * @tc.desc   RdbNotInErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbNotInErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbNotInErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notIn("", []);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbNotInErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notIn(null, null);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbNotInErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notIn(undefined, undefined);
                console.info(TAG + " success");
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbNotInErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                let pre = predicates.notIn("age", [1, 18]);
                console.info(TAG + " success");
                expect(pre).assertInstanceOf("Object")
            } catch (err) {
                console.error(TAG + " RdbNotInErrTest001 failed" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* RdbNotInErrTest001 end *************");
        })

        /**
       * @tc.name   RdbObtainDistributedTableNameErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbObtainDistributedTableNameErrTest_0100
       * @tc.desc   RdbObtainDistributedTableNameErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbObtainDistributedTableNameErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest001 start *************");
            try {
                rdbStore.obtainDistributedTableName("", "EMPLOYEE", (err: BusinessError, tableName: String) => {
                    if (err) {
                      console.info(TAG + 'RdbObtainDistributedTableNameErrTest001 failed, err: ' + err.code + err.message);
                      expect().assertFail();
                      done();
                    }
                    console.info(TAG + 'RdbObtainDistributedTableNameErrTest001 successfully, tableName=.' + tableName);
                    expect().assertFail();
                    done();
                  })
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done();
            }
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest001 end *************");
        })

        /**
       * @tc.name   RdbObtainDistributedTableNameErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbObtainDistributedTableNameErrTest_0200
       * @tc.desc   RdbObtainDistributedTableNameErrTest002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbObtainDistributedTableNameErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest002 start *************");
            try {
                rdbStore.obtainDistributedTableName(null, "EMPLOYEE", (err: BusinessError, tableName: String) => {
                    if (err) {
                      console.info(TAG + 'RdbObtainDistributedTableNameErrTest002 failed, err: ' + err.code + err.message);
                      expect().assertFail();
                      done();
                    }
                    console.info(TAG + 'RdbObtainDistributedTableNameErrTest002 successfully, tableName=.' + tableName);
                    expect().assertFail();
                    done();
                  })
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest002 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done();
            }
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest002 end *************");
        })

        /**
       * @tc.name   RdbObtainDistributedTableNameErrTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbObtainDistributedTableNameErrTest_0300
       * @tc.desc   RdbObtainDistributedTableNameErrTest003
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbObtainDistributedTableNameErrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest003 start *************");
            try {
                rdbStore.obtainDistributedTableName(undefined, "EMPLOYEE", (err: BusinessError, tableName: String) => {
                    if (err) {
                      console.info(TAG + 'RdbObtainDistributedTableNameErrTest003 failed, err: ' + err.code + err.message);
                      expect().assertFail();
                      done();
                    }
                    console.info(TAG + 'RdbObtainDistributedTableNameErrTest003 successfully, tableName=.' + tableName);
                    expect().assertFail();
                    done();
                  })
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest003 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done();
            }
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest003 end *************");
        })

        /**
       * @tc.name   RdbObtainDistributedTableNameErrTest004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbObtainDistributedTableNameErrTest_0400
       * @tc.desc   RdbObtainDistributedTableNameErrTest004
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbObtainDistributedTableNameErrTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest004 start *************");
            try {
                rdbStore.obtainDistributedTableName("123", "", (err: BusinessError, tableName: String) => {
                    if (err) {
                      console.info(TAG + 'RdbObtainDistributedTableNameErrTest004 failed, err: ' + err.code + err.message);
                      expect().assertFail();
                      done();
                    }
                    console.info(TAG + 'RdbObtainDistributedTableNameErrTest004 successfully, tableName=.' + tableName);
                    expect().assertFail();
                    done();
                  })
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest004 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done();
            }
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest004 end *************");
        })

        /**
       * @tc.name   RdbObtainDistributedTableNameErrTest005
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbObtainDistributedTableNameErrTest_0500
       * @tc.desc   RdbObtainDistributedTableNameErrTest005
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbObtainDistributedTableNameErrTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest005 start *************");
            try {
                rdbStore.obtainDistributedTableName("123", null, (err: BusinessError, tableName: String) => {
                    if (err) {
                      console.info(TAG + 'RdbObtainDistributedTableNameErrTest005 failed, err: ' + err.code + err.message);
                      expect().assertFail();
                      done();
                    }
                    console.info(TAG + 'RdbObtainDistributedTableNameErrTest005 successfully, tableName=.' + tableName);
                    expect().assertFail();
                    done();
                  })
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest005 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done();
            }
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest005 end *************");
        })

        /**
       * @tc.name   RdbObtainDistributedTableNameErrTest006
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbObtainDistributedTableNameErrTest_0600
       * @tc.desc   RdbObtainDistributedTableNameErrTest006
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbObtainDistributedTableNameErrTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest006 start *************");
            try {
                rdbStore.obtainDistributedTableName("123", undefined, (err: BusinessError, tableName: String) => {
                    if (err) {
                      console.info(TAG + 'RdbObtainDistributedTableNameErrTest006 failed, err: ' + err.code + err.message);
                      expect().assertFail();
                      done();
                    }
                    console.info(TAG + 'RdbObtainDistributedTableNameErrTest006 successfully, tableName=.' + tableName);
                    expect().assertFail();
                    done();
                  })
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest006 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
                done();
            }
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest006 end *************");
        })

        /**
       * @tc.name   RdbObtainDistributedTableNameErrTest007
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbObtainDistributedTableNameErrTest_0700
       * @tc.desc   RdbObtainDistributedTableNameErrTest007
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbObtainDistributedTableNameErrTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest007 start *************");
            try {
                await rdbStore.obtainDistributedTableName("", "EMPLOYEE")
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest007 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                await rdbStore.obtainDistributedTableName(null, "EMPLOYEE")
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest007 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                await rdbStore.obtainDistributedTableName(undefined, "EMPLOYEE")
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest007 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                await rdbStore.obtainDistributedTableName("123", "")
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest007 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                await rdbStore.obtainDistributedTableName("123", null)
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest007 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            try {
                await rdbStore.obtainDistributedTableName("123", undefined)
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbObtainDistributedTableNameErrTest007 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbObtainDistributedTableNameErrTest007 end *************");
        })

        /**
       * @tc.name   RdbSyncErrTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbSyncErrTest_0100
       * @tc.desc   RdbSyncErrTest001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbSyncErrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbSyncErrTest001 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                await rdbStore.sync(dataRdb.SyncMode.SYNC_MODE_PUSH, null)
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbSyncErrTest001 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbSyncErrTest001 end *************");
        })

        /**
       * @tc.name   RdbSyncErrTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbSyncErrTest_0200
       * @tc.desc   RdbSyncErrTest002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
        it('RdbSyncErrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* RdbSyncErrTest002 start *************");
            try {
                let predicates = new dataRdb.RdbPredicates("test");
                await rdbStore.sync(dataRdb.SyncMode.SYNC_MODE_PULL, undefined)
                expect().assertFail();
            } catch (err) {
                console.error(TAG + " RdbSyncErrTest002 failed" + err.code + err.message);
                expect(err.code).assertEqual("401");
            }
            console.info(TAG + "************* RdbSyncErrTest002 end *************");
        })

    })
}