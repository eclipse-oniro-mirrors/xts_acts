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
import dataRdb from '@ohos.data.rdb';

const TAG = "[RDB_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT UNIQUE, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const STORE_CONFIG = {
    name: "UpdataTest.db",
}
var rdbStore = undefined;

export default function rdbStoreUpdateTest() {
    describe('rdbStoreUpdateTest', function () {
        beforeAll(function () {
            console.info(TAG + 'beforeAll')
        })

        beforeEach(async function () {
            console.info(TAG + 'beforeEach')
            rdbStore = await dataRdb.getRdbStore(STORE_CONFIG, 1);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        })

        afterEach(async function () {
            console.info(TAG + 'afterEach')
            await rdbStore.executeSql("DELETE FROM test");
            rdbStore = null
            await dataRdb.deleteRdbStore("UpdataTest.db");
        })

        afterAll(async function () {
            console.info(TAG + 'afterAll')
        })

        /**
         * @tc.name testRdbStoreUpdate0001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBUpdateJsAPITest_0100
         * @tc.desc resultSet Update test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testRdbStoreUpdate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreUpdate0001 start *************");
            var u8 = new Uint8Array([1, 2, 3])
            //插入
            {
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(1).assertEqual(ret);
                    console.info(TAG + "update done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            }
            //更新
            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "name": "lisi",
                    "age": 20,
                    "salary": 200.5,
                    "blobType": u8,
                }
                let predicates = await new dataRdb.RdbPredicates("test")
                predicates.equalTo("id", "1")
                let updatePromise = rdbStore.update(valueBucket, predicates)
                await updatePromise.then(async (ret) => {
                    expect(1).assertEqual(ret);
                    console.info(TAG + "update done: " + ret);
                    let resultSet = await rdbStore.query(predicates)

                    expect(true).assertEqual(resultSet.goToFirstRow())
                    const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                    const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                    const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                    const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                    const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                    expect(1).assertEqual(id);
                    expect("lisi").assertEqual(name);
                    expect(20).assertEqual(age);
                    expect(200.5).assertEqual(salary);
                    expect(4).assertEqual(blobType[0]);
                    expect(5).assertEqual(blobType[1]);
                    expect(6).assertEqual(blobType[2]);
                    console.info(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                    expect(false).assertEqual(resultSet.goToNextRow())
                    resultSet = null
                }).catch((err) => {
                    console.info(TAG + "update error");
                    expect(null).assertFail();
                })
                //await updatePromise
            }
            done();
            console.info(TAG + "************* testRdbStoreUpdate0001 end   *************");
        })

        /**
         * @tc.name testRdbStoreUpdate0002
         * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBUpdateJsAPITest_0200
         * @tc.desc resultSet Update test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testRdbStoreUpdate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreUpdate0002 start *************");
            //更新
            {
                let errInfo = undefined;
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                try {
                    let predicates = new dataRdb.RdbPredicates("")
                    let updatePromise = rdbStore.update(valueBucket, predicates)
                    updatePromise.then(async (ret) => {
                        console.info(TAG + "update done: " + ret);
                        expect(null).assertFail();
                    }).catch((err) => {
                        console.info(TAG + "update with null table name");
                    })
                }catch(err){
                    errInfo = err
                }
                {
                    const emptyBucket = {};
                    let predicates = await new dataRdb.RdbPredicates("test")
                    let updatePromise = rdbStore.update(emptyBucket, predicates)
                    updatePromise.then(async (ret) => {
                        console.info(TAG + "update done: " + ret);
                        expect(null).assertFail();
                    }).catch((err) => {
                        console.info(TAG + "update with wrong valueBucket");
                    })
                }
                {
                    let predicates = await new dataRdb.RdbPredicates("test")
                    await predicates.equalTo("aaa", "null")
                    let updatePromise = rdbStore.update(valueBucket, predicates)
                    updatePromise.then(async (ret) => {
                        console.info(TAG + "update done: " + ret);
                        expect(null).assertFail();
                    }).catch((err) => {
                        console.info(TAG + "update with wrong condition");
                    })
                }
                expect(errInfo.code).assertEqual("401")
            }
            done();
            console.info(TAG + "************* testRdbStoreUpdate0002 end   *************");
        })

        /**
         * @tc.name testRdbStoreUpdate0003
         * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBUpdateJsAPITest_0300
         * @tc.desc resultSet Update test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testRdbStoreUpdate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreUpdate0003 start *************");
            //更新
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                    "wrongColumn": 100.5,
                }
                {
                    let predicates = new dataRdb.RdbPredicates("wrongTable")
                    let updatePromise = rdbStore.update(valueBucket, predicates)
                    updatePromise.then(async (ret) => {
                        console.info(TAG + "update done: " + ret);
                        expect(null).assertFail();
                    }).catch((err) => {
                        console.info(TAG + "update with wrong table name");
                    })
                    //await updatePromise
                }
                {
                    let predicates = await new dataRdb.RdbPredicates("test")
                    let updatePromise = rdbStore.update(valueBucket, predicates)
                    updatePromise.then(async (ret) => {
                        console.info(TAG + "update done: " + ret);
                        expect(null).assertFail();
                    }).catch((err) => {
                        console.info(TAG + "update with wrong column name");
                    })
                    //await updatePromise
                }
            }
            done();
            console.info(TAG + "************* testRdbStoreUpdate0003 end   *************");
        })

        /**
         * @tc.name testRdbStoreUpdate0004
         * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBUpdateJsAPITest_0400
         * @tc.desc resultSet Update test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testRdbStoreUpdate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* testRdbStoreUpdate0004 start *************");
            //更新
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                {
                    let predicates = await new dataRdb.RdbPredicates("test")
                    await predicates.equalTo("aaa", "null")
                    await rdbStore.update(valueBucket, predicates).then(async (ret) => {
                        console.info(TAG + "update done: " + ret);
                        expect(null).assertFail();
                    }).catch((err) => {
                        console.info(TAG + "update with wrong condition");
                        expect(err !== null).assertTrue();
                    })
                }
                {
                    let predicates = await new dataRdb.RdbPredicates("test")
                    await predicates.equalTo("name", "zhangsan")
                    await predicates.equalTo("age", 18)
                    await predicates.equalTo("null", 100.5)
                    await rdbStore.update(valueBucket, predicates).then(async (ret) => {
                        console.info(TAG + "update done: " + ret);
                        expect(ret).assertEqual(0);
                    }).catch((err) => {
                        console.info(TAG + "update with wrong condition");
                        expect(null).assertFail();
                    })
                }
            }
            done();
            console.info(TAG + "************* testRdbStoreUpdate0004 end   *************");
        })
        console.info(TAG + "*************Unit Test End*************");
    })

}
