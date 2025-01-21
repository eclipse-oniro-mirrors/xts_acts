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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import data_Rdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';

let context: common.UIAbilityContext;

const TAG = "[RelationalStore_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const CREATE_TABLE_NAME = "CREATE TABLE IF NOT EXISTS test"
const CREATE_TABLE = " (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const STORE_CONFIG = {
    name: "InsertTest.db",
    securityLevel: data_Rdb.SecurityLevel.S1
}

let rdbStore = undefined;

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

export default function relationalStoreInsertTest() {
    describe('relationalStoreInsertTest', function () {
        beforeAll(async function () {
            console.info(TAG + 'beforeAll')
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
        })

        beforeEach(async function () {
            console.info(TAG + 'beforeEach')
            rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        })

        afterEach(async function () {
            console.info(TAG + 'afterEach')
            rdbStore = null
            await data_Rdb.deleteRdbStore(context, "InsertTest.db")
        })

        afterAll(async function () {
            console.info(TAG + 'afterAll')
        })

        console.info(TAG + "*************Unit Test Begin*************");

        /**
         * @tc.name testRdbStoreInsert0001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_0100
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreInsert0001', 0, async function (done) {
            console.info(TAG + "************* testRdbStoreInsert0001 start *************");
            var u8 = new Uint8Array([1, 2, 3])

                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)

            {
                const valueBucket = {
                    "name": "lisi",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                const valueBucket = {
                    "name": "lisi",
                    "age": 20,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }

            let predicates = new data_Rdb.RdbPredicates("test");
            predicates.equalTo("name", "zhangsan")
            await rdbStore.query(predicates).then(async (resultSet) => {
                console.info(TAG + "resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                expect(1).assertEqual(id);
                expect("zhangsan").assertEqual(name)
                expect(18).assertEqual(age)
                expect(100.5).assertEqual(salary)
                expect(1).assertEqual(blobType[0])
                expect(2).assertEqual(blobType[1])
                expect(3).assertEqual(blobType[2])
                expect(false).assertEqual(resultSet.goToNextRow())
                done();
                console.info(TAG + "************* testRdbStoreInsert0001 end *************");
                resultSet.close();
                resultSet = null;
            }).catch((err) => {
                console.info("insert1 error " + err);
                expect().assertFail();
                done();
            })
        })

        /**
         * @tc.name testRdbStoreInsert0002
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_0200
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreInsert0002', 0, async function (done) {
            console.info(TAG + "************* testRdbStoreInsert0002 start *************");
            let u8 = new Uint8Array([1, 2, 3])

                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("wrong", valueBucket).then(async (ret) => {
                    console.info(TAG + "insert first done: " + ret)
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.info(TAG + "insert with wrong table")
                    expect(err !== null).assertTrue();
                    done();
                    console.info(TAG + "************* testRdbStoreInsert0002 end   *************");
                })

        })

        /**
         * @tc.name testRdbStoreInsert0003
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_0300
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreInsert0003', 0, async function (done) {
            console.info(TAG + "************* testRdbStoreInsert0003 start *************");
            let u8 = new Uint8Array([1, 2, 3])

                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                try {
                    await rdbStore.insert(null, valueBucket).then(()=>{
                        console.log("insert done");
                        expect().assertFail();
                        done();
                    }).catch((error) => {
                        console.log("insert error" + error);
                        expect().assertFail();
                        done();
                    })
                } catch (err) {
                    console.log(`insert failed, code is ${err.code},message is ${err.message}`);
                    expect(err.code).assertEqual('401');
                    done();
                    console.info(TAG + "************* testRdbStoreInsert0003 end   *************");
                }

        })

        /**
         * @tc.name testRdbStoreInsert0004
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_0400
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreInsert0004', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreInsert0004 start *************");
            let u8 = new Uint8Array([1, 2, 3])
            const valueBucket = {
                "name": "zhangsan",
                "age": 18,
                "salary": null,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket).then(async (ret) => {
                expect(1).assertEqual(ret);
                console.log(TAG + "insert first done: " + ret);
                done();
                console.log(TAG + "************* testRdbStoreInsert0004 end   *************");
            }).catch((err) => {
                console.log(TAG + "insert with null table" + err);
                expect().assertFail();
                done();
            })
        })

        /**
         * @tc.name testRdbStorebatchInsertPromise0001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_0500
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertPromise0001', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertPromise0001 start *************");
            await rdbStore.executeSql(CREATE_TABLE_NAME + "1" + CREATE_TABLE)
            let u8 = new Uint8Array([1, 2, 3])
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket2 = {
                "name": "lisi",
                "age": 23,
                "salary": 200,
                "blobType": u8,
            }
            const valueBucket3 = {
                "name": "wangwu",
                "age": 20,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBuckets = [valueBucket1, valueBucket2, valueBucket3]
            await rdbStore.batchInsert("test1", valueBuckets).then((number) => {
                console.info(TAG + "batchInsert number = " + number);
                expect(3).assertEqual(number);
            }).catch((err) => {
                console.info(TAG + "batchInsert fail = " + err);
                expect().assertFail();
            })

            let predicates = new data_Rdb.RdbPredicates("test1");
            predicates.equalTo("name", "zhangsan")
            await rdbStore.query(predicates).then((resultSet) => {
                console.info(TAG + "resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                expect(1).assertEqual(id);
                expect("zhangsan").assertEqual(name)
                expect(18).assertEqual(age)
                expect(100.5).assertEqual(salary)
                expect(1).assertEqual(blobType[0])
                expect(2).assertEqual(blobType[1])
                expect(3).assertEqual(blobType[2])
                expect(false).assertEqual(resultSet.goToNextRow())
                done();
                console.info(TAG + "************* testRdbStorebatchInsertPromise0001 end *************");
                resultSet.close();
                resultSet = null;
            }).catch((err) => {
                console.error(`Updated failed, err is ${err}`);
                expect().assertFail();
                done();
            })
        })

        /**
         * @tc.name testRdbStorebatchInsertPromise0002
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_0600
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertPromise0002', 0, async function (done) {
            await rdbStore.executeSql(CREATE_TABLE_NAME + "2" + CREATE_TABLE)
            console.info(TAG + "************* testRdbStorebatchInsertPromise0002 start *************");
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket2 = {
                "name": "lisi",
                "age": 23,
                "salary": 200,
                "blobType": u8,
            }
            const valueBucket3 = {
                "name": "wangwu",
                "age": 20,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBuckets = [valueBucket1, valueBucket2, valueBucket3]
            await rdbStore.batchInsert("test2", valueBuckets).then((number) => {
                expect(3).assertEqual(number)
            }).catch((err) => {
                expect(false).assertTrue();
            })
            let predicates = new data_Rdb.RdbPredicates("test2");
            predicates.equalTo("name", "lisi")
            let resultSet = await rdbStore.query(predicates)
            try {
                console.info(TAG + "resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                resultSet.close();
                console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                expect(2).assertEqual(id);
                expect("lisi").assertEqual(name)
                expect(23).assertEqual(age)
                expect(200).assertEqual(salary)
                await rdbStore.delete(predicates).then((number) => {
                    expect(1).assertEqual(number)
                }).then(async () => {
                    resultSet = await rdbStore.query(predicates).catch((err) => {
                        expect(err != null).assertTrue();
                    })
                    resultSet.close();
                })
            } catch (e) {
                console.info("BatchInsert2 error " + e);
            }
            done()
            console.info(TAG + "************* testRdbStorebatchInsertPromise0002 end *************");
        })

        /**
         * @tc.name testRdbStorebatchInsertPromise0003
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_0700
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertPromise0003', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertPromise0003 start *************");
            await rdbStore.executeSql(CREATE_TABLE_NAME + "3" + CREATE_TABLE)
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket2 = {
                "name": "lisi",
                "age": 23,
                "salary": 200,
                "blobType": u8,
            }
            const valueBucket3 = {
                "name": "wangwu",
                "age": 20,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBuckets = [valueBucket1, valueBucket2, valueBucket3]
            await rdbStore.batchInsert("test3", valueBuckets).then((number) => {
                expect(3).assertEqual(number)
            }).catch((err) => {
                expect(false).assertTrue();
            })

            let predicates = new data_Rdb.RdbPredicates("test3");
            predicates.equalTo("name", "zhangsan")
            let resultSet = await rdbStore.query(predicates)
            try {
                console.info(TAG + "resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                resultSet.close();
                console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                expect(1).assertEqual(id);
                expect("zhangsan").assertEqual(name)
                expect(18).assertEqual(age)
                expect(100.5).assertEqual(salary)
                expect(1).assertEqual(blobType[0])
                expect(2).assertEqual(blobType[1])
                expect(3).assertEqual(blobType[2])
            } catch (e) {
                console.info("BatchInsert1 error " + e);
            }
            predicates = new data_Rdb.RdbPredicates("test3");
            predicates.equalTo("name", "lisi")
            resultSet = await rdbStore.query(predicates)
            try {
                console.info(TAG + "resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                resultSet.close();
                console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                expect(2).assertEqual(id);
                expect("lisi").assertEqual(name)
                expect(23).assertEqual(age)
                expect(200).assertEqual(salary)
                const valueBucket4 = {
                    "name": "zhangmaowen",
                    "age": 25,
                    "salary": 500,
                    "blobType": u8,
                }
                await rdbStore.insert("test3", valueBucket4)
                predicates = new data_Rdb.RdbPredicates("test3");
                predicates.equalTo("name", "zhangmaowen")
                resultSet = await rdbStore.query(predicates)
                try {
                    console.info(TAG + "resultSet query done");
                    expect(true).assertEqual(resultSet.goToFirstRow())
                    const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                    const name = resultSet.getString(resultSet.getColumnIndex("name"))
                    const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                    const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                    resultSet.close();
                    console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                    expect(4).assertEqual(id);
                    expect("zhangmaowen").assertEqual(name)
                    expect(25).assertEqual(age)
                    expect(500).assertEqual(salary)
                } catch (e) {
                    console.info("BatchInsert1 error " + e);
                }
            } catch (e) {
                console.info("BatchInsert1 error " + e);
            }
            done();
            console.info(TAG + "************* testRdbStorebatchInsertPromise0003 end *************");
        })

        /**
         * @tc.name testRdbStorebatchInsertPromise0004
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_0800
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertPromise0004', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertPromise0004 start *************");
            await rdbStore.executeSql(CREATE_TABLE_NAME + "4" + CREATE_TABLE)
            var u8 = new Uint8Array([1, 2, 3])
            var valueBuckets = new Array(100);
            for (var i = 0;i < valueBuckets.length; i++) {
                valueBuckets[i] = {
                    "name": "zhangsan" + i,
                    "age": i,
                    "salary": 1 + i,
                    "blobType": u8,
                };
            }
            console.info(TAG + "Batch insert data start")
            await rdbStore.batchInsert("test4", valueBuckets).then((number) => {
                console.info(TAG + "Batch insert data end")
                expect(100).assertEqual(number)
            }).catch((err) => {
                expect(false).assertTrue();
            })

            let predicates = new data_Rdb.RdbPredicates("test4");
            predicates.equalTo("name", "zhangsan55")
            let resultSet = await rdbStore.query(predicates)
            try {
                console.info(TAG + "resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                resultSet.close();
                console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                expect(56).assertEqual(id);
                expect("zhangsan55").assertEqual(name)
                expect(55).assertEqual(age)
                expect(56).assertEqual(salary)
                expect(1).assertEqual(blobType[0])
                expect(2).assertEqual(blobType[1])
                expect(3).assertEqual(blobType[2])
            } catch (e) {
                console.info("BatchInsert1 error " + e);
            }
            done()
            console.info(TAG + "************* testRdbStorebatchInsertPromise0004 end *************");
        })

        /**
         * @tc.name testRdbStorebatchInsertPromise0005
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_0900
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertPromise0005', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertPromise0005 start *************");
            await rdbStore.executeSql(CREATE_TABLE_NAME + "5" + CREATE_TABLE)
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket2 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket3 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBuckets = [valueBucket1, valueBucket2, valueBucket3]
            await rdbStore.batchInsert("test5", valueBuckets).then((number) => {
                expect(3).assertEqual(number)
            }).catch((err) => {
                expect(false).assertTrue();
            })

            let predicates = new data_Rdb.RdbPredicates("test5");
            predicates.equalTo("name", "zhangsan")
            let resultSet = await rdbStore.query(predicates)
            try {
                console.info(TAG + "resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                console.info(TAG + " name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                expect("zhangsan").assertEqual(name)
                expect(18).assertEqual(age)
                expect(100.5).assertEqual(salary)
                expect(1).assertEqual(blobType[0])
                expect(2).assertEqual(blobType[1])
                expect(3).assertEqual(blobType[2])
                expect(true).assertEqual(resultSet.goToNextRow())
            } catch (e) {
                console.info("BatchInsert1 error " + e);
            }
            resultSet.close();
            done();
            console.info(TAG + "************* testRdbStorebatchInsertPromise0005 end *************");
        })

        /**
         * @tc.name testRdbStorebatchInsertPromise0006
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_1000
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertPromise0006', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertPromise0006 start *************");
            await rdbStore.executeSql(CREATE_TABLE_NAME + "6" + CREATE_TABLE)
            let errInfo = undefined;
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket2 = {
                "name": "lisi",
                "age": 23,
                "salary": 200,
                "blobType": u8,
            }
            const valueBucket3 = {
                "name": "wangwu",
                "age": 20,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBuckets = [valueBucket1, valueBucket2, valueBucket3]
            try {
                await rdbStore.batchInsert("test6", "valueBuckets")
            } catch (err) {
                console.info(TAG + "Batch insert data error:  " + err)
                errInfo = err
            }
            expect(errInfo.code).assertEqual("401")
            done()
            console.info(TAG + "************* testRdbStorebatchInsertPromise0006 end *************");
        })

        /**
         * @tc.name testRdbStorebatchInsertPromise0007
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_1100
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertPromise0007', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertPromise0007 start *************");
            let errInfo = undefined;
            await rdbStore.executeSql(CREATE_TABLE_NAME + "7" + CREATE_TABLE)
            try {
                await rdbStore.batchInsert("test7")
            } catch (err) {
                console.info(TAG + "Batch insert data error:  " + err)
                errInfo = err
            }
            expect(errInfo.code).assertEqual("401")
            done()
            console.info(TAG + "************* testRdbStorebatchInsertPromise0007 end *************");
        })


        /**
         * @tc.name testRdbStorebatchInsertCallback0001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_1200
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertCallback0001', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertCallback0001 start *************");
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket2 = {
                "name": "lisi",
                "age": 23,
                "salary": 200,
                "blobType": u8,
            }
            const valueBucket3 = {
                "name": "wangwu",
                "age": 20,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBuckets = [valueBucket1, valueBucket2, valueBucket3]
            await rdbStore.executeSql(CREATE_TABLE_NAME + "callback1" + CREATE_TABLE).then(async () => {
                console.info(TAG + "Batch insert data start")
                await rdbStore.batchInsert("testcallback1", valueBuckets, async (err, data) => {
                    if (err != null) {
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + "Batch insert data end")
                        expect(3).assertEqual(data)
                        let predicates = new data_Rdb.RdbPredicates("testcallback1");
                        predicates.equalTo("name", "zhangsan")
                        let resultSet = await rdbStore.query(predicates)
                        try {
                            console.info(TAG + "resultSet query done");
                            expect(true).assertEqual(resultSet.goToFirstRow())
                            const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                            const name = resultSet.getString(resultSet.getColumnIndex("name"))
                            const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                            expect(1).assertEqual(id);
                            expect("zhangsan").assertEqual(name)
                            expect(18).assertEqual(age)
                            expect(100.5).assertEqual(salary)
                            expect(1).assertEqual(blobType[0])
                            expect(2).assertEqual(blobType[1])
                            expect(3).assertEqual(blobType[2])
                            expect(false).assertEqual(resultSet.goToNextRow())
                        } catch (e) {
                            console.info("BatchInsert1 error " + e);
                        }
                        resultSet.close();
                        predicates = new data_Rdb.RdbPredicates("testcallback1");
                        predicates.equalTo("name", "lisi")
                        resultSet = await rdbStore.query(predicates)
                        try {
                            console.info(TAG + "resultSet query done");
                            expect(true).assertEqual(resultSet.goToFirstRow())
                            const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                            const name = resultSet.getString(resultSet.getColumnIndex("name"))
                            const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                            expect(2).assertEqual(id);
                            expect("lisi").assertEqual(name)
                            expect(23).assertEqual(age)
                            expect(200).assertEqual(salary)
                            expect(false).assertEqual(resultSet.goToNextRow())
                        } catch (e) {
                            console.info("BatchInsert1 error " + e);
                        }
                        resultSet.close();
                    }
                    done();
                })
            })
            await sleep(500)
            done()
            console.info(TAG + "************* testRdbStorebatchInsertCallback0001 end *************");
        })

        /**
         * @tc.name testRdbStorebatchInsertCallback0002
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_1300
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertCallback0002', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertCallback0002 start *************");
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket2 = {
                "name": "lisi",
                "age": 23,
                "salary": 200,
                "blobType": u8,
            }
            const valueBucket3 = {
                "name": "wangwu",
                "age": 20,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBuckets = [valueBucket1, valueBucket2, valueBucket3]
            await rdbStore.executeSql(CREATE_TABLE_NAME + "Callback2" + CREATE_TABLE).then(async () => {
                await rdbStore.batchInsert("testCallback2", valueBuckets, async (err, data) => {
                    if (err != null) {
                        expect(false).assertTrue();
                    } else {
                        expect(3).assertEqual(data)
                        let predicates = new data_Rdb.RdbPredicates("testCallback2");
                        predicates.equalTo("name", "lisi")
                        let resultSet = await rdbStore.query(predicates)
                        try {
                            console.info(TAG + "resultSet query done");
                            expect(true).assertEqual(resultSet.goToFirstRow())
                            const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                            const name = resultSet.getString(resultSet.getColumnIndex("name"))
                            const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                            resultSet.close();
                            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                            expect(2).assertEqual(id);
                            expect("lisi").assertEqual(name)
                            expect(23).assertEqual(age)
                            expect(200).assertEqual(salary)
                            await rdbStore.delete(predicates).then((number) => {
                                expect(1).assertEqual(number)
                            }).then(async () => {
                                resultSet = await rdbStore.query(predicates).catch((err) => {
                                    expect(err != null).assertTrue();
                                })
                                resultSet.close();
                            })
                        } catch (e) {
                            console.info("BatchInsert2 error " + e);
                        }
                    }
                    done();
                })
            })
            await sleep(500)
            done()
            console.info(TAG + "************* testRdbStorebatchInsertCallback0002 end *************");
        })

        /**
         * @tc.name testRdbStorebatchInsertCallback0003
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_1400
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertCallback0003', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertCallback0003 start *************");
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket2 = {
                "name": "lisi",
                "age": 23,
                "salary": 200,
                "blobType": u8,
            }
            const valueBucket3 = {
                "name": "wangwu",
                "age": 20,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBuckets = [valueBucket1, valueBucket2, valueBucket3]
            await rdbStore.executeSql(CREATE_TABLE_NAME + "Callback3" + CREATE_TABLE).then(async () => {
                await rdbStore.batchInsert("testCallback3", valueBuckets, async (err, data) => {
                    if (err != null) {
                        expect(false).assertTrue()
                    } else {
                        expect(3).assertEqual(data)
                        let predicates = new data_Rdb.RdbPredicates("testCallback3");
                        predicates.equalTo("name", "zhangsan")
                        let resultSet = await rdbStore.query(predicates)
                        try {
                            console.info(TAG + "resultSet query done");
                            expect(true).assertEqual(resultSet.goToFirstRow())
                            const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                            const name = resultSet.getString(resultSet.getColumnIndex("name"))
                            const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                            resultSet.close();
                            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary);
                            expect(1).assertEqual(id);
                            expect("zhangsan").assertEqual(name)
                            expect(18).assertEqual(age)
                            expect(100.5).assertEqual(salary)
                        } catch (e) {
                            console.info("BatchInsert1 error " + e);
                        }
                        predicates = new data_Rdb.RdbPredicates("testCallback3");
                        predicates.equalTo("name", "lisi")
                        resultSet = await rdbStore.query(predicates)
                        try {
                            console.info(TAG + "resultSet query done");
                            expect(true).assertEqual(resultSet.goToFirstRow())
                            const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                            const name = resultSet.getString(resultSet.getColumnIndex("name"))
                            const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                            resultSet.close();
                            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary);
                            expect(2).assertEqual(id);
                            expect("lisi").assertEqual(name)
                            expect(23).assertEqual(age)
                            expect(200).assertEqual(salary)
                            const valueBucket4 = {
                                "name": "zhangmaowen",
                                "age": 25,
                                "salary": 500,
                                "blobType": u8,
                            }
                            await rdbStore.insert("testCallback3", valueBucket4)
                            predicates = new data_Rdb.RdbPredicates("testCallback3");
                            predicates.equalTo("name", "zhangmaowen")
                            resultSet = await rdbStore.query(predicates)
                            try {
                                console.info(TAG + "resultSet query done");
                                expect(true).assertEqual(resultSet.goToFirstRow())
                                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                                const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                                const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                                resultSet.close();
                                console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary);
                                expect(4).assertEqual(id);
                                expect("zhangmaowen").assertEqual(name)
                                expect(25).assertEqual(age)
                                expect(500).assertEqual(salary)
                            } catch (e) {
                                console.info("BatchInsert1 error " + e);
                            }
                        } catch (e) {
                            console.info("BatchInsert1 error " + e);
                        }
                    }
                    done();
                })
            })
            await sleep(500)
            done();
            console.info(TAG + "************* testRdbStorebatchInsertCallback0003 end *************");
        })

        /**
         * @tc.name testRdbStorebatchInsertCallback0004
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_1500
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertCallback0004', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertCallback0004 start *************");
            var u8 = new Uint8Array([1, 2, 3])
            var valueBuckets = new Array(100);
            for (var i = 0;i < valueBuckets.length; i++) {
                valueBuckets[i] = {
                    "name": "zhangsan" + i,
                    "age": i,
                    "salary": 1 + i,
                    "blobType": u8,
                };
            }
            console.info(TAG + "Batch insert data start")
            await rdbStore.executeSql(CREATE_TABLE_NAME + "Callbak4" + CREATE_TABLE).then(async () => {
                await rdbStore.batchInsert("testCallbak4", valueBuckets, async (err, data) => {
                    if (err != null) {
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + "Batch insert data end")
                        expect(100).assertEqual(data)
                        let predicates = new data_Rdb.RdbPredicates("testCallbak4");
                        predicates.equalTo("name", "zhangsan55")
                        let resultSet = await rdbStore.query(predicates)
                        try {
                            console.info(TAG + "resultSet query done");
                            expect(true).assertEqual(resultSet.goToFirstRow())
                            const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                            const name = resultSet.getString(resultSet.getColumnIndex("name"))
                            const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                            resultSet.close();
                            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary);
                            expect(56).assertEqual(id);
                            expect("zhangsan55").assertEqual(name)
                            expect(55).assertEqual(age)
                            expect(56).assertEqual(salary)
                        } catch (e) {
                            console.info("BatchInsert1 error " + e);
                        }
                    }
                    done();
                })
            })
            await sleep(500)
            done()
            console.info(TAG + "************* testRdbStorebatchInsertCallback0004 end *************");
        })

        /**
         * @tc.name testRdbStorebatchInsertCallback0005
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_1600
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertCallback0005', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertCallback0005 start *************");
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket2 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket3 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBuckets = [valueBucket1, valueBucket2, valueBucket3]
            await rdbStore.executeSql(CREATE_TABLE_NAME + "Callback5" + CREATE_TABLE).then(async () => {
                await rdbStore.batchInsert("testCallback5", valueBuckets, async (err, number) => {
                    if (err != null) {
                        expect(false).assertTrue();
                    } else {
                        expect(3).assertEqual(number)
                        let predicates = new data_Rdb.RdbPredicates("testCallback5");
                        predicates.equalTo("name", "zhangsan")
                        let resultSet = await rdbStore.query(predicates)
                        try {
                            console.info(TAG + "resultSet query done");
                            expect(true).assertEqual(resultSet.goToFirstRow())
                            const name = resultSet.getString(resultSet.getColumnIndex("name"))
                            const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                            console.info(TAG + " name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                            expect("zhangsan").assertEqual(name)
                            expect(18).assertEqual(age)
                            expect(100.5).assertEqual(salary)
                            expect(1).assertEqual(blobType[0])
                            expect(2).assertEqual(blobType[1])
                            expect(3).assertEqual(blobType[2])
                            expect(true).assertEqual(resultSet.goToNextRow())
                        } catch (e) {
                            console.info("BatchInsert1 error " + e);
                        }
                        resultSet.close();
                    }
                    done();
                })
            })
            await sleep(500)
            done();
            console.info(TAG + "************* testRdbStorebatchInsertCallback0005 end *************");
        })

        /**
         * @tc.name testRdbStorebatchInsertCallback0006
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_1700
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertCallback0006', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertCallback0006 start *************");
            let errInfo = undefined;
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBucket2 = {
                "name": "lisi",
                "age": 23,
                "salary": 200,
                "blobType": u8,
            }
            const valueBucket3 = {
                "name": "wangwu",
                "age": 20,
                "salary": 100.5,
                "blobType": u8,
            }
            const valueBuckets = [valueBucket1, valueBucket2, valueBucket3]
            await rdbStore.executeSql(CREATE_TABLE_NAME + "Callback6" + CREATE_TABLE).then(async () => {
                try {
                    rdbStore.batchInsert("testCallback6", "valueBuckets", (err, data) => {
                        console.info(TAG + "Affect row is " + data)
                        if (err != null) {
                            expect(null).assertFail();
                        } else {
                            expect(data).assertEqual(-1)
                        }
                    })
                } catch (err) {
                    console.info(TAG + "Batch insert data error:  " + err)
                    errInfo = err
                }
            })
            expect(errInfo.code).assertEqual("401")
            done()
            console.info(TAG + "************* testRdbStorebatchInsertCallback0006 end *************");
        })


        /**
         * @tc.name testRdbStorebatchInsertCallback0007
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_1800
         * @tc.desc RelationalStore insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStorebatchInsertCallback0007', 0, async function (done) {
            console.info(TAG + "************* testRdbStorebatchInsertCallback0007 start *************");
            let errInfo = undefined;
            await rdbStore.executeSql(CREATE_TABLE_NAME + "Callback7" + CREATE_TABLE).then(async () => {
                try {
                    await rdbStore.batchInsert("testCallback7", (err, data) => {
                        console.info(TAG + "Affect row is " + data)
                        if (err != null) {
                            expect(null).assertFail();
                        } else {
                            expect(data).assertEqual(-1)
                        }
                    })
                } catch (err) {
                    errInfo = err
                }
            }).catch((err) => {
                expect(null).assertFail();
            })
            expect(errInfo.code).assertEqual("401")
            done()
            console.info(TAG + "************* testRdbStorebatchInsertCallback0007 end *************");
        })

        /**
         * @tc.name InsertWithConflictResolution0001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_1900
         * @tc.desc rdb insertWithConflictResolution test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('InsertWithConflictResolution0001', 0, async function (done) {
            console.log(TAG + " ************* InsertWithConflictResolution0001 start *************");
            var u8 = new Uint8Array([1, 2, 3])

                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket, data_Rdb.ConflictResolution.ON_CONFLICT_NONE);


            {
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 200.5,
                    "blobType": u8,
                }
                try {
                    let insertPromise = rdbStore.insert("test", valueBucket, data_Rdb.ConflictResolution.ON_CONFLICT_NONE);
                    insertPromise.then(async (ret) => {
                        expect(1).assertEqual(ret);
                        console.log(TAG + " InsertWithConflictResolution0001 insert first done: " + ret);
                        expect(null).assertFail();
                    }).catch((err) => {
                        console.log(TAG + " InsertWithConflictResolution0001 insert with wrong valuebucket and ConflictResolution is default")
                        done();
                    })
                } catch (err) {
                    console.log(TAG + " InsertWithConflictResolution0001 catch err: failed, err: code=" + err.code + " message=" + err.message)
                    expect("401").assertEqual(err.code);
                    expect(null).assertFail();
                }
            }

            console.log(TAG + " ************* InsertWithConflictResolution_0001 end   *************");
        })

        /**
         * @tc.name InsertWithConflictResolution0002
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_2000
         * @tc.desc rdb insertWithConflictResolution test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('InsertWithConflictResolution0002', 0, async function (done) {
            console.log(TAG + " ************* InsertWithConflictResolution0002 start *************");
            var u8 = new Uint8Array([1, 2, 3])

                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket, data_Rdb.ConflictResolution.ON_CONFLICT_ROLLBACK);


            {
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 200.5,
                    "blobType": u8,
                }
                try {
                    let insertPromise = rdbStore.insert("test", valueBucket, data_Rdb.ConflictResolution.ON_CONFLICT_ROLLBACK);
                    insertPromise.then(async (ret) => {
                        expect(1).assertEqual(ret)
                        console.log(TAG + " InsertWithConflictResolution0002 insert first done: " + ret)
                        expect(null).assertFail()
                    }).catch((err) => {
                        console.log(TAG + " InsertWithConflictResolution0002 insert with wrong valuebucket and ConflictResolution is ON_CONFLICT_ROLLBACK")
                        done()
                    })
                } catch (err) {
                    console.log(TAG + " InsertWithConflictResolution0002 catch err: failed, err: code=" + err.code + " message=" + err.message)
                    expect("401").assertEqual(err.code)
                    expect(null).assertFail()
                }
            }

            console.log(TAG + " ************* InsertWithConflictResolution_0002 end   *************");
        })

        /**
         * @tc.name InsertWithConflictResolution0003
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_2100
         * @tc.desc rdb insertWithConflictResolution test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('InsertWithConflictResolution0003', 0, async function (done) {
            console.log(TAG + " ************* InsertWithConflictResolution0003 start *************");
            var u8 = new Uint8Array([1, 2, 3])

                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket, data_Rdb.ConflictResolution.ON_CONFLICT_IGNORE);


            {
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket, data_Rdb.ConflictResolution.ON_CONFLICT_IGNORE);
            }
            let predicates = new data_Rdb.RdbPredicates("test");
            predicates.equalTo("name", "zhangsan")
            let resultSet = await rdbStore.query(predicates)
            try {
                console.log(TAG + " InsertWithConflictResolution0003 resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                console.log(TAG + " InsertWithConflictResolution0004 id=" + id + ", salary=" + salary);
                expect(1).assertEqual(id);
                expect(100.5).assertEqual(salary)
                expect(false).assertEqual(resultSet.goToNextRow())
            } catch (err) {
                console.log(TAG + " InsertWithConflictResolution0003 insert error" + err);
            }
            resultSet.close();
            done()
            console.log(TAG + " ************* InsertWithConflictResolution_0003 end  *************");
        })

        /**
         * @tc.name InsertWithConflictResolution0004
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_2200
         * @tc.desc rdb insertWithConflictResolution test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('InsertWithConflictResolution0004', 0, async function (done) {
            console.log(TAG + " ************* InsertWithConflictResolution0004 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket, data_Rdb.ConflictResolution.ON_CONFLICT_REPLACE);
            }
            let predicates = new data_Rdb.RdbPredicates("test");
            predicates.equalTo("name", "zhangsan")
            let resultSet = await rdbStore.query(predicates)
            try {
                console.log(TAG + " InsertWithConflictResolution0004 resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                expect(1).assertEqual(id);
                expect(false).assertEqual(resultSet.goToNextRow())
            } catch (err) {
                console.log(TAG + " InsertWithConflictResolution0004 insert error" + err);
            }
            resultSet.close();

            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket, data_Rdb.ConflictResolution.ON_CONFLICT_REPLACE);
            }
            resultSet = await rdbStore.query(predicates)
            try {
                console.log(TAG + " InsertWithConflictResolution0004 resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                console.log(TAG + " InsertWithConflictResolution0004 id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                expect(1).assertEqual(id);
                expect("zhangsan").assertEqual(name)
                expect(18).assertEqual(age)
                expect(200.5).assertEqual(salary)
                expect(4).assertEqual(blobType[0])
                expect(5).assertEqual(blobType[1])
                expect(6).assertEqual(blobType[2])
                expect(false).assertEqual(resultSet.goToNextRow())
            } catch (err) {
                console.log(TAG + " InsertWithConflictResolution0004 resultSet query error " + err);
            }
            resultSet.close();
            done()
            console.log(TAG + " ************* InsertWithConflictResolution_0004 end   *************");
        })

        /**
         * @tc.name InsertWithConflictResolution0005
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_2300
         * @tc.desc rdb insertWithConflictResolution test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('InsertWithConflictResolution0005', 0, async function (done) {
            console.log(TAG + " ************* InsertWithConflictResolution0005 start *************");
            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 200.5,
                    "blobType": u8,
                }
                try {
                    rdbStore.insert("test", valueBucket, 6);
                    expect(null).assertFail()
                } catch (err) {
                    console.log(TAG + " InsertWithConflictResolution0005 catch err: failed, err: code=" + err.code + " message=" + err.message)
                    expect("401").assertEqual(err.code)
                    done()
                }
            }

            console.log(TAG + " ************* InsertWithConflictResolution_0005 end   *************");
        })

        /**
         * @tc.name InsertWithConflictResolution0006
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_2400
         * @tc.desc rdb insertWithConflictResolution test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('InsertWithConflictResolution0006', 0, async function (done) {
            console.log(TAG + " ************* InsertWithConflictResolution0006 start *************");
            var u8 = new Uint8Array([1, 2, 3])

                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket, data_Rdb.ConflictResolution.ON_CONFLICT_ABORT);


            {
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 200.5,
                    "blobType": u8,
                }
                try {
                    let insertPromise = rdbStore.insert("test", valueBucket, data_Rdb.ConflictResolution.ON_CONFLICT_ABORT);
                    insertPromise.then(async (ret) => {
                        expect(1).assertEqual(ret)
                        console.log(TAG + " InsertWithConflictResolution0006 insert first done: " + ret)
                        expect(null).assertFail()
                    }).catch((err) => {
                        console.log(TAG + " InsertWithConflictResolution0006 insert with wrong valuebucket and ConflictResolution is ON_CONFLICT_ABORT")
                        done()
                    })
                } catch (err) {
                    console.log(TAG + " InsertWithConflictResolution0006 catch err: failed, err: code=" + err.code + " message=" + err.message)
                    expect("401").assertEqual(err.code)
                    expect(null).assertFail()
                }
            }

            console.log(TAG + " ************* InsertWithConflictResolution0006 end   *************");
        })


        /**
         * @tc.name InsertWithConflictResolution0007
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_2500
         * @tc.desc rdb insertWithConflictResolution test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('InsertWithConflictResolution0007', 0, async function (done) {
            console.log(TAG + " ************* InsertWithConflictResolution0007 start *************");
            let u8 = new Uint8Array([1, 2, 3])
                const valueBucket1 = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket1, data_Rdb.ConflictResolution.ON_CONFLICT_FAIL);

                const valueBucket2 = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 200.5,
                    "blobType": u8,
                }
                try {
                    let insertPromise = rdbStore.insert("test", valueBucket2, data_Rdb.ConflictResolution.ON_CONFLICT_FAIL);
                    insertPromise.then(async (ret) => {
//                        expect(1).assertEqual(ret)
                        console.log(TAG + " InsertWithConflictResolution0007 insert first done: " + ret)
                        expect().assertFail();
                        done()
                    }).catch((err) => {
                        console.error(`insert failed, code is ${err.code},message is ${err.message}`);
                        expect(err !== null).assertTrue();
                        done();
                    })
                } catch (err) {
                    console.log(TAG + " catch err: failed, err: code=" + err.code + " message=" + err.message)
                    expect().assertFail();
                    done();
                }
            console.log(TAG + " ************* InsertWithConflictResolution0007 end   *************");
        })

        /**
         * @tc.name testRdbStoreInsert0005
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_2600
         * @tc.desc rdb insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreInsert0005', 0, async function () {
            console.log(TAG + "************* testRdbStoreInsert0005 start *************");
            var u8 = new Uint8Array([1, 2, 3])

            const valueBucket1 = {
                "id": 1,
                "name": "zhangsan",
                "age": null,
                "salary": undefined,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket1);

            const valueBucket2 = {
                "id": 2,
                "name": "lisi",
                "age": 19,
                "salary": 200.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket2);

            let predicates = new data_Rdb.RdbPredicates("test");
            await rdbStore.query(predicates).then((resultSet) => {
                expect(true).assertEqual(resultSet.goToFirstRow());
                expect(true).assertEqual(resultSet.isColumnNull(resultSet.getColumnIndex("age")));
                expect(true).assertEqual(resultSet.isColumnNull(resultSet.getColumnIndex("salary")));
                resultSet.close();
                resultSet = null;
            }).catch((err) => {
                console.log(TAG + "query1 error" + err);
                expect().assertFail()
            })

            const valueBucket3 = {
                "age": null,
                "salary": undefined,
            }
            predicates.equalTo("name", "lisi");
            await rdbStore.update(valueBucket3, predicates);

            predicates = new data_Rdb.RdbPredicates("test");
            await rdbStore.query(predicates).then((resultSet) => {
                expect(true).assertEqual(resultSet.goToFirstRow());
                expect(true).assertEqual(resultSet.goToNextRow());
                expect(true).assertEqual(resultSet.isColumnNull(resultSet.getColumnIndex("age")));
                expect(200.5).assertEqual(resultSet.getDouble(resultSet.getColumnIndex("salary")));
                console.log(TAG + "************* testRdbStoreInsert0005 end  *************");
                resultSet.close();
                resultSet = null;
            }).catch((err) => {
                console.log(TAG + "query2 error" + err);
                expect().assertFail();
            })
        })

        /**
         * @tc.name testRdbStoreInsert0006
         * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertEtsAPITest_2700
         * @tc.desc rdb insert test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreInsert0006', 0, async function () {
            console.log(TAG + "************* testRdbStoreInsert0006 start *************");
            var u8 = new Uint8Array([1, 2, 3])

                const valueBucket = {
                    "name": "zhangsan",
                    "age": new Date(),
                    "salary": 100.5,
                    "blobType": u8,
                }
                try {
                    await rdbStore.insert("test", valueBucket).then(async (ret) => {
                        expect().assertFail()
                    }).catch((err) => {
                        expect().assertFail()
                    })
                } catch (err) {
                    console.log("catch err: failed, err: code=" + err.code + " message=" + err.message + typeof (err.code))
                    expect(err.code).assertEqual('401');
                }

            console.log(TAG + "************* testRdbStoreInsert0006 end  *************");
        })

        console.info(TAG + " *************Unit Test End*************");
    })
}
