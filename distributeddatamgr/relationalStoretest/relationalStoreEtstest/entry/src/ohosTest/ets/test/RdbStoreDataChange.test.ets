/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';

const TAG = "[RELATIONAL_STORE_JSKITS_TEST] "
const STORE_NAME = "data_change.db"
let rdbStore = undefined;
let context: common.UIAbilityContext;
const config = {
    'name': STORE_NAME,
    securityLevel: relationalStore.SecurityLevel.S1,
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

export default function RdbStoreDataChangeTest() {
    describe('RdbStoreDataChangeTest', function () {
        beforeAll(async function () {
            console.info(TAG + 'beforeAll')
        })

        beforeEach(async function (done) {
            console.info(TAG + 'beforeEach')
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            try {
                rdbStore = await relationalStore.getRdbStore(context, config);
                const CREATE_TABLE_SQL = "CREATE TABLE IF NOT EXISTS test (" +
                "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
                await rdbStore.executeSql(CREATE_TABLE_SQL);

                const valueBucket1 = {
                    'name': 'zhangsan',
                    'age': 18,
                    'salary': 25000,
                    'blobType': new Uint8Array([1, 2, 3]),
                };
                const valueBucket2 = {
                    'name': 'zhangsan2',
                    'age': 20,
                    'salary': 25000,
                    'blobType': new Uint8Array([1, 2, 3]),
                };
                let rowId = await rdbStore.insert('test', valueBucket1);
                console.info(TAG + 'beforeEach insert rowId=' + rowId);
                let rowId2 = await rdbStore.insert('test', valueBucket2);
                console.info(TAG + 'beforeEach insert rowId=' + rowId2);
                done();
            } catch (err) {
                console.error(TAG + `failed, code:${err.code}, message: ${err.message}`)
                done();
            }
        })

        afterEach(async function (done) {
            console.info(TAG + 'afterEach')
            await relationalStore.deleteRdbStore(context, STORE_NAME);
            rdbStore = null
            done();
        })

        afterAll(async function () {
            console.info(TAG + 'afterAll')
        })

        console.info(TAG + "*************Unit Test Begin*************");

        /**
         * @tc.name Normal case for inserting a data into local database
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_0100
         * @tc.desc 1. Register callback for local database
         *          2. Insert data 
         *          3. UnRegister callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange0100 start *************");
            function observer1(ChangeInfos) {
                for (let i = 0; i < ChangeInfos.length; i++) {
                    console.info(TAG + "testRdbStoreDataChange0100 ChangeInfos.length=" + ChangeInfos.length);
                    console.info(TAG + "testRdbStoreDataChange0100 ChangeInfos[i].inserted[0]=" + ChangeInfos[i].inserted[0]);
                    expect('test').assertEqual(ChangeInfos[i].table);
                    expect(0).assertEqual(ChangeInfos[i].type);
                    expect(3).assertEqual(ChangeInfos[i].inserted[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].updated[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].deleted[0]);
                    done();
                }
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1)
            } catch (err) {
                console.error(TAG + `on dataChange fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }

            try {
                const valueBucket1 = {
                    'name': 'zhangsan',
                    'age': 18,
                    'salary': 25000,
                    'blobType': new Uint8Array([1, 2, 3]),
                };

                let rowId = await rdbStore.insert('test', valueBucket1);
                console.info(TAG + "testRdbStoreDataChange0100 insert rowId=" + rowId);
                expect(3).assertEqual(rowId);
                done();
            } catch (error) {
                console.error(TAG + `insert2 fail, code:${error.code}, message: ${error.message}`);
                expect().assertFail();
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }

            console.info(TAG + "************* testRdbStoreDataChange0100 end *************");
        })

        /**
         * @tc.name Normal case for updating a data
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_0200
         * @tc.desc 1. Register callback for local database
         *          2. Update data
         *          3. UnRegister callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange0200 start *************");
            function observer1(ChangeInfos) {
                for (let i = 0; i < ChangeInfos.length; i++) {
                    console.info(TAG + "testRdbStoreDataChange0100 ChangeInfos.length=" + ChangeInfos.length);
                    console.info(TAG + "testRdbStoreDataChange0100 ChangeInfos[i].updated[0]=" + ChangeInfos[i].updated[0]);
                    expect('test').assertEqual(ChangeInfos[i].table);
                    expect(0).assertEqual(ChangeInfos[i].type);
                    expect(undefined).assertEqual(ChangeInfos[i].inserted[0]);
                    expect(1).assertEqual(ChangeInfos[i].updated[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].deleted[0]);
                }
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }

            try {
                const valueBucket = {
                    'name': 'lisi',
                    'age': 18,
                    'salary': 30000,
                    'blobType': new Uint8Array([1, 2, 3]),
                };
                let predicates = new relationalStore.RdbPredicates('test');
                predicates.equalTo('id', 1);
                let rowId = await rdbStore.update(valueBucket, predicates);
                console.info(TAG + "testRdbStoreDataChange0200 update rowId=" + rowId);
                expect(1).assertEqual(rowId);
                done();
            } catch (error) {
                console.error(TAG + `update fail, code:${error.code}, message: ${error.message}`);
                expect().assertFail();
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }

            console.info(TAG + "************* testRdbStoreDataChange0200 end *************");
        })

        /**
         * @tc.name Normal case for deleting datas
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_0300
         * @tc.desc 1. Register callback for local database
         *          2. Delete data
         *          3. UnRegister callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange0300 start *************");
            function observer1(ChangeInfos) {
                for (let i = 0; i < ChangeInfos.length; i++) {
                    console.info(TAG + "testRdbStoreDataChange0300 ChangeInfos.length=" + ChangeInfos.length);
                    console.info(TAG + "testRdbStoreDataChange0300 ChangeInfos[i].deleted[0]=" + ChangeInfos[i].deleted[0]);
                    console.info(TAG + "testRdbStoreDataChange0300 ChangeInfos[i].deleted[1]=" + ChangeInfos[i].deleted[1]);
                    expect('test').assertEqual(ChangeInfos[i].table);
                    expect(0).assertEqual(ChangeInfos[i].type);
                    expect(undefined).assertEqual(ChangeInfos[i].inserted[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].updated[0]);
                    expect(1).assertEqual(ChangeInfos[i].deleted[0]);
                    expect(2).assertEqual(ChangeInfos[i].deleted[1]);
                }
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }

            try {
                let predicates = new relationalStore.RdbPredicates('test');
                let rowId = await rdbStore.delete(predicates);
                console.info(TAG + 'testRdbStoreDataChange0300 delete rowId=' + rowId)
                expect(2).assertEqual(rowId);
                done();
            } catch (error) {
                console.error(TAG + `delete fail, code:${error.code}, message: ${error.message}`);
                expect().assertFail();
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }

            console.info(TAG + "************* testRdbStoreDataChange0300 end *************");
        })

        /**
         * @tc.name Normal case for batch insert data into local database
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_0400
         * @tc.desc 1. Register callback for local database
         *          2. Batch insert data
         *          3. UnRegister callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange0400 start *************");
            function observer1(ChangeInfos) {
                for (let i = 0; i < ChangeInfos.length; i++) {
                    console.info(TAG + "testRdbStoreDataChange0400 ChangeInfos.length=" + ChangeInfos.length);
                    console.info(TAG + "testRdbStoreDataChange0400 ChangeInfos[i].inserted[0]=" + ChangeInfos[i].inserted[0]);
                    console.info(TAG + "testRdbStoreDataChange0400 ChangeInfos[i].inserted[1]=" + ChangeInfos[i].inserted[1]);
                    expect('test').assertEqual(ChangeInfos[i].table);
                    expect(0).assertEqual(ChangeInfos[i].type);
                    expect(3).assertEqual(ChangeInfos[i].inserted[0]);
                    expect(4).assertEqual(ChangeInfos[i].inserted[1]);
                    expect(undefined).assertEqual(ChangeInfos[i].updated[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].deleted[0]);
                    done();
                }
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }

            try {
                let u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let valueBucketArray = new Array();
                for (let i = 0; i < 2; i++) {
                    valueBucketArray.push(valueBucket);
                }
                let rowId = await rdbStore.batchInsert("test", valueBucketArray);
                console.info(TAG + "testRdbStoreDataChange0400 batchInsert rowId=" + rowId);
                expect(2).assertEqual(rowId);
                done();
            } catch (error) {
                console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
                expect().assertFail();
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }

            console.info(TAG + "************* testRdbStoreDataChange0400 end *************");
        })

        /**
         * @tc.name Normal case for multi tables
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_0500
         * @tc.desc 1. Register callback for local database
         *          2. Create table test1
         *          3. Insert data into table test1
         *          4. UnRegister callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange0500 start *************");
            function observer1(ChangeInfos) {
                for (let i = 0; i < ChangeInfos.length; i++) {
                    console.info(TAG + "testRdbStoreDataChange0500 ChangeInfos.length=" + ChangeInfos.length);
                    console.info(TAG + "testRdbStoreDataChange0500 ChangeInfos[i].inserted[0]=" + ChangeInfos[i].inserted[0]);
                    expect('test1').assertEqual(ChangeInfos[i].table);
                    expect(0).assertEqual(ChangeInfos[i].type);
                    expect(1).assertEqual(ChangeInfos[i].inserted[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].updated[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].deleted[0]);
                    done();
                }
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }

            try {
                const CREATE_TABLE_SQL = "CREATE TABLE IF NOT EXISTS test1 (" +
                "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
                await rdbStore.executeSql(CREATE_TABLE_SQL); 

                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": new Uint8Array([1, 2, 3]),
                }
                let rowId = await rdbStore.insert("test1", valueBucket);
                console.info(TAG + "testRdbStoreDataChange0100 insert test1 rowId=" + rowId);
                expect(1).assertEqual(rowId);
                done();
            } catch (error) {
                console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
                expect().assertFail();
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }
            console.info(TAG + "************* testRdbStoreDataChange0500 end *************");
        })

        /**
         * @tc.name AbNormal case for failed to insert
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_0600
         * @tc.desc 1. Register callback for local database
         *          2. Failed to insert data into table test
         *          3. UnRegister callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange0600 start *************");
            function observer1(ChangeInfos) {
                console.info(TAG + "testRdbStoreDataChange0600 ChangeInfos.length=" + ChangeInfos.length);
                expect().assertFail();
                done();
            };
            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1)
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }

            try {
                const valueBucket = {
                    "age": 18,
                    "salary": 100.5,
                    "blobType": new Uint8Array([1, 2, 3]),
                }
                await rdbStore.insert("test", valueBucket);
                expect(null).assertFail();
                done();
            } catch (error) {
                console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
                expect(14800032).assertEqual(error.code);
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }
            console.info(TAG + "************* testRdbStoreDataChange0600 end *************");
        })

        /**
         * @tc.name AbNormal case for function on, if args is invalid
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_0700
         * @tc.desc 1.Register callback for local database, event is invalid
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange0700 start *************");
            try {
                rdbStore.on('', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, (ChangeInfos) => {})
                expect().assertFail();
                done();
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect('401').assertEqual(err.code);
                done();
            }
            console.info(TAG + "************* testRdbStoreDataChange0700 end *************");
        })

        /**
         * @tc.name AbNormal case for function on, if args is invalid
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_0800
         * @tc.desc 1.Register callback for local database, SubscribeType is invalid
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange0800 start *************");
            try {
                // SubscribeType -2 is a invalid argument
                rdbStore.on('dataChange', -2, (ChangeInfos) => {})
                expect().assertFail();
                done();
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect('401').assertEqual(err.code);
                done();
            }
            console.info(TAG + "************* testRdbStoreDataChange0800 end *************");
        })

        /**
         * @tc.name AbNormal case for function on, if args is invalid
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_0900
         * @tc.desc 1.Register callback for local database, SubscribeType is null
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange0900 start *************");
            try {
                rdbStore.on('dataChange', null, (ChangeInfos) => {})
                expect().assertFail();
                done();
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect('401').assertEqual(err.code);
                done();
            }
            console.info(TAG + "************* testRdbStoreDataChange0900 end *************");
        })

        /**
         * @tc.name AbNormal case for function on, if args is invalid
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_1000
         * @tc.desc 1.Register callback for local database, SubscribeType is undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange1000 start *************");
            try {
                rdbStore.on('dataChange', undefined, (ChangeInfos) => {})
                expect().assertFail();
                done();
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect("401").assertEqual(err.code);
                done();
            }
            console.info(TAG + "************* testRdbStoreDataChange1000 end *************");
        })

        /**
         * @tc.name AbNormal case for function off, if args is invalid
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_1100
         * @tc.desc 1.unRegister callback for local database, event is invalid
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange1100 start *************");
            try {
                rdbStore.off('', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, (ChangeInfos) => {})
                expect().assertFail();
                done();
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect('401').assertEqual(err.code);
                done();
            }
            console.info(TAG + "************* testRdbStoreDataChange1100 end *************");
        })

        /**
         * @tc.name AbNormal case for function off, if args is invalid
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_1200
         * @tc.desc 1.unRegister callback for local database, SubscribeType is invalid
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange1200 start *************");
            try {
                // SubscribeType -2 is a invalid argument
                rdbStore.off('dataChange', -2, (ChangeInfos) => {})
                expect().assertFail();
                done();
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect('401').assertEqual(err.code);
                done();
            }
            console.info(TAG + "************* testRdbStoreDataChange1200 end *************");
        })

        /**
         * @tc.name AbNormal case for function off, if args is invalid
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_1300
         * @tc.desc 1.unRegister callback for local database, SubscribeType is null
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange1300 start *************");
            try {
                rdbStore.off('dataChange', null, (ChangeInfos) => {})
                expect().assertFail();
                done();
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect('401').assertEqual(err.code);
                done();
            }
            console.info(TAG + "************* testRdbStoreDataChange1300 end *************");
        })

        /**
         * @tc.name AbNormal case for function off, if args is invalid
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_1400
         * @tc.desc 1.unRegister callback for local database, SubscribeType is undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange1400 start *************");
            try {
                rdbStore.off('dataChange', undefined, (ChangeInfos) => {})
                expect().assertFail();
                done();
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect('401').assertEqual(err.code);
                done();
            }
            console.info(TAG + "************* testRdbStoreDataChange1400 end *************");
        })

        /**
         * @tc.name Normal case for multi observer
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_1500
         * @tc.desc 1. Register observer1 and observer2 for local database
         *          2. UnRegister observer1
         *          3. Insert data into table test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange1500 start *************");
            function observer1(ChangeInfos) {
                console.info(TAG + "observer1");
                expect().assertFail();
                done();
            };

            function observer2(ChangeInfos) {
                console.info(TAG + "observer2");
                for (let i = 0; i < ChangeInfos.length; i++) {
                    console.info(TAG + "testRdbStoreDataChange1500 ChangeInfos.length=" + ChangeInfos.length);
                    console.info(TAG + "testRdbStoreDataChange1500 ChangeInfos[i].inserted[0]=" + ChangeInfos[i].inserted[0]);
                    expect('test').assertEqual(ChangeInfos[0].table);
                    expect(3).assertEqual(ChangeInfos[i].inserted[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].updated[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].deleted[0]);
                }
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1);
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer2);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1);
            } catch (err) {
                expect().assertFail();
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
            }

            try {
                const valueBucket = {
                    'name': 'liSi',
                    "age": 18,
                    "salary": 100.5,
                    "blobType": new Uint8Array([1, 2, 3]),
                }
                let rowId = await rdbStore.insert("test", valueBucket);
                expect(3).assertEqual(rowId);
                done();
            } catch (error) {
                expect().assertFail();
                console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer2);
            } catch (err) {
                expect().assertFail();
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
            }

            console.info(TAG + "************* testRdbStoreDataChange1500 end *************");
        })

        /**
         * @tc.name Normal case for multi observer
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_1600
         * @tc.desc 1. Register observer1 and observer2 for local database
         *          2. Insert data into table test
         *          3. UnRegister observer1 and observer2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange1600 start *************");
            function observer1(ChangeInfos) {
                for (let i = 0; i < ChangeInfos.length; i++) {
                    console.info(TAG + "testRdbStoreDataChange1600 observer1");
                    console.info(TAG + "testRdbStoreDataChange1600 ChangeInfos[i].inserted[0]=" + ChangeInfos[i].inserted[0]);
                    expect('test').assertEqual(ChangeInfos[i].table);
                    expect(3).assertEqual(ChangeInfos[i].inserted[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].updated[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].deleted[0]);
                }
            };

            function observer2(ChangeInfos) {
                for (let i = 0; i < ChangeInfos.length; i++) {
                    console.info(TAG + "testRdbStoreDataChange1600 observer1");
                    console.info(TAG + "testRdbStoreDataChange1600 ChangeInfos[i].inserted[0]=" + ChangeInfos[i].inserted[0]);
                    expect('test').assertEqual(ChangeInfos[i].table);
                    expect(3).assertEqual(ChangeInfos[i].inserted[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].updated[0]);
                    expect(undefined).assertEqual(ChangeInfos[i].deleted[0]);
                }
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1);
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer2);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }

            try {
                const valueBucket = {
                    'name': 'liSi',
                    "age": 18,
                    "salary": 100.5,
                    "blobType": new Uint8Array([1, 2, 3]),
                }
                let rowId = await rdbStore.insert("test", valueBucket);
                expect(3).assertEqual(rowId);
                done();
            } catch (error) {
                expect().assertFail();
                console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1);
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer2);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }

            console.info(TAG + "************* testRdbStoreDataChange1600 end *************");
        })

        /**
         * @tc.name Normal case for multi observer
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_1700
         * @tc.desc 1. Register observer1 and observer2 for local database
         *          2. UnRegister observer1 and observer2
         *          3. Insert data into table test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange1700 start *************");
            function observer1(ChangeInfos) {
                console.info(TAG + "observer1");
                expect().assertFail();
                done();
            };

            function observer2(ChangeInfos) {
                console.info(TAG + "observer2");
                expect().assertFail();
                done();
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1);
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer2);
                done();
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1);
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer2);
            } catch (err) {
                expect().assertFail();
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                done();
            }

            try {
                const valueBucket = {
                    'name': 'liSi',
                    "age": 18,
                    "salary": 100.5,
                    "blobType": new Uint8Array([1, 2, 3]),
                }
                let rowId = await rdbStore.insert("test", valueBucket);
                expect(3).assertEqual(rowId);
                done();
            } catch (error) {
                expect().assertFail();
                console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
                done();
            }

            console.info(TAG + "************* testRdbStoreDataChange1700 end *************");
        })


        /**
         * @tc.name Normal case for multi observer
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_1800
         * @tc.desc 1. Register observer1 and observer2 for local database
         *          2. UnRegister all
         *          3. Insert data into table test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange1800 start *************");
            function observer1(ChangeInfos) {
                console.info(TAG + "observer1");
                expect().assertFail();
                done();
            };

            function observer2(ChangeInfos) {
                console.info(TAG + "observer2");
                expect().assertFail();
                done();
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer1);
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, observer2);
                done();
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS);
            } catch (err) {
                expect().assertFail();
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                done();
            }

            try {
                const valueBucket = {
                    'name': 'liSi',
                    "age": 18,
                    "salary": 100.5,
                    "blobType": new Uint8Array([1, 2, 3]),
                }
                let rowId = await rdbStore.insert("test", valueBucket);
                expect(3).assertEqual(rowId);
                done();
            } catch (error) {
                expect().assertFail();
                console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
                done();
            }

            console.info(TAG + "************* testRdbStoreDataChange1800 end *************");
        })

        /**
         * @tc.name Normal case for multi observer
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_1900
         * @tc.desc 1. Register observer1 ,SubscribeType=SUBSCRIBE_TYPE_REMOTE
         *          2. Insert data into table test
         *          3. UnRegister observer1 and observer2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange1800 start *************");
            function observer1(ChangeInfos) {
                console.info(TAG + "observer1");
                expect().assertFail();
                done();
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE, observer1);
                done();
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }

            try {
                const CREATE_TABLE_SQL = "CREATE TABLE IF NOT EXISTS test18 (" +
                "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
                await rdbStore.executeSql(CREATE_TABLE_SQL);

                const valueBucket = {
                    'name': 'liSi',
                    "age": 18,
                    "salary": 100.5,
                    "blobType": new Uint8Array([1, 2, 3]),
                }
                let rowId = await rdbStore.insert("test18", valueBucket);
                expect(1).assertEqual(rowId);
                done();
            } catch (error) {
                expect().assertFail();
                console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE);
            } catch (err) {
                expect().assertFail();
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
            }

            console.info(TAG + "************* testRdbStoreDataChange1900 end *************");
        })


        /**
         * @tc.name Normal case for multi observer
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_2000
         * @tc.desc 1. Register observer1 ,SubscribeType=SUBSCRIBE_TYPE_CLOUD
         *          2. Insert data into table test
         *          3. UnRegister observer1 and observer2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange2000 start *************");
            function observer1(ChangeInfos) {
                console.info(TAG + "observer1");
                expect().assertFail();
                done();
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_CLOUD, observer1);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }

            try {
                const CREATE_TABLE_SQL = "CREATE TABLE IF NOT EXISTS test19 (" +
                "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
                await rdbStore.executeSql(CREATE_TABLE_SQL);

                const valueBucket = {
                    'name': 'liSi',
                    "age": 18,
                    "salary": 100.5,
                    "blobType": new Uint8Array([1, 2, 3]),
                }
                let rowId = await rdbStore.insert("test19", valueBucket);
                expect(1).assertEqual(rowId);
                done();
            } catch (error) {
                expect().assertFail();
                console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_CLOUD);
            } catch (err) {
                expect().assertFail();
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
            }

            console.info(TAG + "************* testRdbStoreDataChange2000 end *************");
        })

        /**
         * @tc.name Normal case for multi observer
         * @tc.number SUB_DistributedData_RelationalStore_SDK_DataChange_2100
         * @tc.desc 1. Register observer1 ,SubscribeType=SUBSCRIBE_TYPE_CLOUD_DETAILS
         *          2. Insert data into table test
         *          3. UnRegister observer1 and observer2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreDataChange2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreDataChange2100 start *************");
            function observer1(ChangeInfos) {
                console.info(TAG + "observer1");
                expect().assertFail();
                done();
            };

            try {
                rdbStore.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS, observer1);
            } catch (err) {
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
                expect().assertFail();
            }

            try {
                const CREATE_TABLE_SQL = "CREATE TABLE IF NOT EXISTS test20 (" +
                "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
                await rdbStore.executeSql(CREATE_TABLE_SQL);

                const valueBucket = {
                    'name': 'liSi',
                    "age": 18,
                    "salary": 100.5,
                    "blobType": new Uint8Array([1, 2, 3]),
                }
                let rowId = await rdbStore.insert("test20", valueBucket);
                expect(1).assertEqual(rowId);
                done();
            } catch (error) {
                expect().assertFail();
                console.error(TAG + `insert fail, code:${error.code}, message: ${error.message}`);
                done();
            }

            try {
                rdbStore.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS);
            } catch (err) {
                expect().assertFail();
                console.error(TAG + `register fail, code:${err.code}, message: ${err.message}`);
            }
            console.info(TAG + "************* testRdbStoreDataChange2100 end *************");
        })

        console.info(TAG + "*************Unit Test End*************");
    })
}
