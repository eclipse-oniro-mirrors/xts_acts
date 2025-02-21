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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import data_Rdb from '@ohos.data.relationalStore';
import ability_featureAbility from '@ohos.ability.featureAbility';
var context = ability_featureAbility.getContext();

const TAG = "[RelationalStore_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT UNIQUE, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const STORE_CONFIG = {
    name: "UpdataTest.db",
    securityLevel: data_Rdb.SecurityLevel.S1
}
var rdbStore = undefined;

export default function relationalStoreUpdateTest() {
    describe('relationalStoreUpdateTest', function () {
        beforeAll(function () {
            console.info(TAG + 'beforeAll')
        })

        beforeEach(async function () {
            console.info(TAG + 'beforeEach')
            rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        })

        afterEach(async function () {
            console.info(TAG + 'afterEach')
            await rdbStore.executeSql("DELETE FROM test");
            rdbStore = null
            await data_Rdb.deleteRdbStore(context, "UpdataTest.db");
        })

        afterAll(async function () {
            console.info(TAG + 'afterAll')
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_0100
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdate0001', 0, async function (done) {
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
                let predicates = await new data_Rdb.RdbPredicates("test")
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
                    resultSet.close()
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
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_0200
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdate0002', 0, async function (done) {
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
                    let predicates = new data_Rdb.RdbPredicates("")
                    let updatePromise = rdbStore.update(valueBucket, predicates)
                    updatePromise.then(async (ret) => {
                        console.info(TAG + "update done: " + ret);
                        expect(null).assertFail();
                    }).catch((err) => {
                        console.info(TAG + "update with null table name");
                    })
                } catch (err) {
                    errInfo = err
                }
                {
                    const emptyBucket = {};
                    let predicates = await new data_Rdb.RdbPredicates("test")
                    let updatePromise = rdbStore.update(emptyBucket, predicates)
                    updatePromise.then(async (ret) => {
                        console.info(TAG + "update done: " + ret);
                        expect(null).assertFail();
                    }).catch((err) => {
                        console.info(TAG + "update with wrong valueBucket");
                    })
                }
                {
                    let predicates = await new data_Rdb.RdbPredicates("test")
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
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_0300
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdate0003', 0, async function (done) {
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
                    let predicates = new data_Rdb.RdbPredicates("wrongTable")
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
                    let predicates = await new data_Rdb.RdbPredicates("test")
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
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_0400
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdate0004', 0, async function (done) {
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
                    let predicates = await new data_Rdb.RdbPredicates("test")
                    await predicates.equalTo("aaa", "null")
                    await rdbStore.update(valueBucket, predicates).then(async (ret) => {
                        console.info(TAG + "update done: " + ret);
                        expect(null).assertFail();
                    }).catch((err) => {
                        expect(err !== null).assertTrue();
                        console.info(TAG + "update with wrong condition");
                    })
                }
                {
                    let predicates = await new data_Rdb.RdbPredicates("test")
                    await predicates.equalTo("name", "zhangsan")
                    await predicates.equalTo("age", 18)
                    await predicates.equalTo("null", 100.5)
                    await rdbStore.update(valueBucket, predicates).then(async (ret) => {
                        console.info(TAG + "update done: " + ret);
                        expect(ret).assertEqual(0);
                        done();
                        console.info(TAG + "************* testRdbStoreUpdate0004 end   *************");
                    }).catch((err) => {
                        console.info(TAG + "update with wrong condition");
                    })
                }
            }
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_0500
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0001', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0001 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }

            {
                var u8 = new Uint8Array([7, 8, 9])
                const valueBucket = {
                    "id": 3,
                    "name": "wangjing",
                    "age": 20,
                    "salary": 300.5,
                    "blobType": u8,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                let updatePromise = rdbStore.update(valueBucket, predicates)
                updatePromise.then(async (ret) => {
                    await expect(1).assertEqual(ret);
                    await console.log(TAG + "testRdbStoreUpdateWithConflictResolution0001 done: " + ret);
                    {
                        let predicates = await new data_Rdb.RdbPredicates("test")
                        let resultSet = await rdbStore.query(predicates)

                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(1).assertEqual(id);
                        await expect("zhangsan").assertEqual(name);
                        await expect(18).assertEqual(age);
                        await expect(100.5).assertEqual(salary);
                        await expect(1).assertEqual(blobType[0]);
                        await expect(2).assertEqual(blobType[1]);
                        await expect(3).assertEqual(blobType[2]);
                        console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                        + salary + ", blobType=" + blobType);

                        await expect(true).assertEqual(resultSet.goToNextRow())
                        const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(3).assertEqual(id_1);
                        await expect("wangjing").assertEqual(name_1);
                        await expect(20).assertEqual(age_1);
                        await expect(300.5).assertEqual(salary_1);
                        await expect(7).assertEqual(blobType_1[0]);
                        await expect(8).assertEqual(blobType_1[1]);
                        await expect(9).assertEqual(blobType_1[2]);
                        console.log(TAG + "{id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
                        + salary_1 + ", blobType=" + blobType_1);
                        await expect(false).assertEqual(resultSet.goToNextRow())

                        resultSet.close()
                        done();
                        console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0001 end   *************");
                    }
                }).catch((err) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0001 error");
                    expect(null).assertFail();
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0001 end   *************");
                })
            }
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_0600
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0002', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0002 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([7, 8, 9])
                const valueBucket = {
                    "id": 3,
                    "name": "zhangsan",
                    "age": 20,
                    "salary": 300.5,
                    "blobType": u8,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                await rdbStore.update(valueBucket, predicates, data_Rdb.ConflictResolution.ON_CONFLICT_NONE).then(async (ret) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0002 done: " + ret);
                    expect().assertFail();
                }).catch((err) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0002 error" + err);
                    expect(err !== null).assertTrue();
                })
            }

            {
                let predicates = await new data_Rdb.RdbPredicates("test")
                await rdbStore.query(predicates).then(async (resultSet)=>{
                    expect(true).assertEqual(resultSet.goToFirstRow())
                    const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                    const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                    const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                    const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                    const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                    expect(1).assertEqual(id);
                    expect("zhangsan").assertEqual(name);
                    expect(18).assertEqual(age);
                    expect(100.5).assertEqual(salary);
                    expect(1).assertEqual(blobType[0]);
                    expect(2).assertEqual(blobType[1]);
                    expect(3).assertEqual(blobType[2]);
                    console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                    + salary + ", blobType=" + blobType);

                    expect(true).assertEqual(resultSet.goToNextRow())
                    const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"))
                    const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"))
                    const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"))
                    const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                    const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                    expect(2).assertEqual(id_1);
                    expect("lisi").assertEqual(name_1);
                    expect(19).assertEqual(age_1);
                    expect(200.5).assertEqual(salary_1);
                    expect(4).assertEqual(blobType_1[0]);
                    expect(5).assertEqual(blobType_1[1]);
                    expect(6).assertEqual(blobType_1[2]);
                    console.log(TAG + "{id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
                    + salary_1 + ", blobType=" + blobType_1);
                    expect(false).assertEqual(resultSet.goToNextRow())

                    resultSet.close();
                    resultSet = null;
                    done()
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0002 end   *************");
                })
            }
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_0700
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0003', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0003 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([7, 8, 9])
                const valueBucket = {
                    "id": 3,
                    "name": "wangjing",
                    "age": 20,
                    "salary": 300.5,
                    "blobType": u8,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                await rdbStore.update(valueBucket, predicates, data_Rdb.ConflictResolution.ON_CONFLICT_ROLLBACK).then(async (ret) => {
                    expect(1).assertEqual(ret);
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0003 done: " + ret);
                    {
                        let predicates = await new data_Rdb.RdbPredicates("test")
                        let resultSet = await rdbStore.query(predicates)

                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        expect(1).assertEqual(id);
                        expect("zhangsan").assertEqual(name);
                        expect(18).assertEqual(age);
                        expect(100.5).assertEqual(salary);
                        expect(1).assertEqual(blobType[0]);
                        expect(2).assertEqual(blobType[1]);
                        expect(3).assertEqual(blobType[2]);
                        console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                        + salary + ", blobType=" + blobType);

                        expect(true).assertEqual(resultSet.goToNextRow())
                        const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        expect(3).assertEqual(id_1);
                        expect("wangjing").assertEqual(name_1);
                        expect(20).assertEqual(age_1);
                        expect(300.5).assertEqual(salary_1);
                        expect(7).assertEqual(blobType_1[0]);
                        expect(8).assertEqual(blobType_1[1]);
                        expect(9).assertEqual(blobType_1[2]);
                        console.log(TAG + "{id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
                        + salary_1 + ", blobType=" + blobType_1);
                        expect(false).assertEqual(resultSet.goToNextRow())

                        resultSet.close()
                        done();
                        console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0003 end   *************");
                    }

                }).catch((err) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0003 error");
                    expect(null).assertFail();
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0003 end   *************");
                })
            }
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_0800
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0004', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0004 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([7, 8, 9])
                const valueBucket = {
                    "id": 3,
                    "name": "zhangsan",
                    "age": 20,
                    "salary": 300.5,
                    "blobType": u8,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                await rdbStore.update(valueBucket, predicates, data_Rdb.ConflictResolution.ON_CONFLICT_ROLLBACK).then(async (ret) => {
                    expect(null).assertFail();
                    await console.log(TAG + "testRdbStoreUpdateWithConflictResolution0004 done: " + ret);
                }).catch((err) => {
                    expect(err !== null).assertTrue();
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0004 error");
                })
//                done()
            }

            {
                let predicates = await new data_Rdb.RdbPredicates("test")
                await rdbStore.query(predicates).then(async (resultSet)=>{
                    expect(true).assertEqual(resultSet.goToFirstRow())
                    const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                    const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                    const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                    const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                    const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                    expect(1).assertEqual(id);
                    expect("zhangsan").assertEqual(name);
                    expect(18).assertEqual(age);
                    expect(100.5).assertEqual(salary);
                    expect(1).assertEqual(blobType[0]);
                    expect(2).assertEqual(blobType[1]);
                    expect(3).assertEqual(blobType[2]);
                    console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                    + salary + ", blobType=" + blobType);

                    expect(true).assertEqual(resultSet.goToNextRow())
                    const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"))
                    const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"))
                    const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"))
                    const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                    const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                    expect(2).assertEqual(id_1);
                    expect("lisi").assertEqual(name_1);
                    expect(19).assertEqual(age_1);
                    expect(200.5).assertEqual(salary_1);
                    expect(4).assertEqual(blobType_1[0]);
                    expect(5).assertEqual(blobType_1[1]);
                    expect(6).assertEqual(blobType_1[2]);
                    console.log(TAG + "{id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
                    + salary_1 + ", blobType=" + blobType_1);
                    expect(false).assertEqual(resultSet.goToNextRow())

                    resultSet.close()
                    done()
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0004 end   *************");
                })
            }
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_0900
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0005', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0005 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([7, 8, 9])
                const valueBucket = {
                    "id": 3,
                    "name": "wangjing",
                    "age": 20,
                    "salary": 300.5,
                    "blobType": u8,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                await rdbStore.update(valueBucket, predicates, data_Rdb.ConflictResolution.ON_CONFLICT_REPLACE).then(async (ret) => {
                    expect(1).assertEqual(ret);
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0005 done: " + ret);
                    {
                        let predicates = await new data_Rdb.RdbPredicates("test")
                        let resultSet = await rdbStore.query(predicates)

                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        expect(1).assertEqual(id);
                        expect("zhangsan").assertEqual(name);
                        expect(18).assertEqual(age);
                        expect(100.5).assertEqual(salary);
                        expect(1).assertEqual(blobType[0]);
                        expect(2).assertEqual(blobType[1]);
                        expect(3).assertEqual(blobType[2]);
                        console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                        + salary + ", blobType=" + blobType);

                        expect(true).assertEqual(resultSet.goToNextRow())
                        const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        expect(3).assertEqual(id_1);
                        expect("wangjing").assertEqual(name_1);
                        expect(20).assertEqual(age_1);
                        expect(300.5).assertEqual(salary_1);
                        expect(7).assertEqual(blobType_1[0]);
                        expect(8).assertEqual(blobType_1[1]);
                        expect(9).assertEqual(blobType_1[2]);
                        console.log(TAG + "{id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
                        + salary_1 + ", blobType=" + blobType_1);
                        expect(false).assertEqual(resultSet.goToNextRow())

                        resultSet.close()
                        done()
                        console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0005 end   *************");
                    }

                }).catch((err) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0005 error");
                    expect(null).assertFail();
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0005 end   *************");
                })
            }
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_1000
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0006', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0006 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }

            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 20,
                    "salary": 300.5,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                let updatePromise = rdbStore.update(valueBucket, predicates, data_Rdb.ConflictResolution.ON_CONFLICT_REPLACE);
                updatePromise.then(async (ret) => {
                    await expect(1).assertEqual(ret);
                    await console.log(TAG + "testRdbStoreUpdateWithConflictResolution0006 done: " + ret);
                    {
                        let predicates = await new data_Rdb.RdbPredicates("test")
                        let resultSet = await rdbStore.query(predicates)

                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(2).assertEqual(id);
                        await expect("zhangsan").assertEqual(name);
                        await expect(20).assertEqual(age);
                        await expect(300.5).assertEqual(salary);
                        await expect(4).assertEqual(blobType[0]);
                        await expect(5).assertEqual(blobType[1]);
                        await expect(6).assertEqual(blobType[2]);
                        console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                        + salary + ", blobType=" + blobType);

                        await expect(false).assertEqual(resultSet.goToNextRow())
                        resultSet.close()
                        done()
                        console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0006 end   *************");
                    }

                }).catch((err) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0006 error");
                    expect(null).assertFail();
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0006 end   *************");
                })
            }
        })


        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_1100
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0007', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0007 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([7, 8, 9])
                const valueBucket = {
                    "id": 3,
                    "name": "wangjing",
                    "age": 20,
                    "salary": 300.5,
                    "blobType": u8,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                let updatePromise = rdbStore.update(valueBucket, predicates, data_Rdb.ConflictResolution.ON_CONFLICT_ABORT);
                updatePromise.then(async (ret) => {
                    await expect(1).assertEqual(ret);
                    await console.log(TAG + "testRdbStoreUpdateWithConflictResolution0007 done: " + ret);
                    {
                        let predicates = await new data_Rdb.RdbPredicates("test")
                        let resultSet = await rdbStore.query(predicates)

                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(1).assertEqual(id);
                        await expect("zhangsan").assertEqual(name);
                        await expect(18).assertEqual(age);
                        await expect(100.5).assertEqual(salary);
                        await expect(1).assertEqual(blobType[0]);
                        await expect(2).assertEqual(blobType[1]);
                        await expect(3).assertEqual(blobType[2]);
                        console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                        + salary + ", blobType=" + blobType);

                        await expect(true).assertEqual(resultSet.goToNextRow())
                        const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(3).assertEqual(id_1);
                        await expect("wangjing").assertEqual(name_1);
                        await expect(20).assertEqual(age_1);
                        await expect(300.5).assertEqual(salary_1);
                        await expect(7).assertEqual(blobType_1[0]);
                        await expect(8).assertEqual(blobType_1[1]);
                        await expect(9).assertEqual(blobType_1[2]);
                        console.log(TAG + "{id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
                        + salary_1 + ", blobType=" + blobType_1);
                        await expect(false).assertEqual(resultSet.goToNextRow())

                        resultSet.close()
                        done()
                        console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0007 end   *************");
                    }

                }).catch((err) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0007 error");
                    expect(null).assertFail();
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0007 end   *************");
                })
            }
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_1200
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0008', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0008 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }

            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 20,
                    "salary": 300.5,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                let updatePromise = rdbStore.update(valueBucket, predicates, data_Rdb.ConflictResolution.ON_CONFLICT_ABORT);
                updatePromise.then(async (ret) => {
                    await expect(1).assertEqual(ret);
                    await console.log(TAG + "testRdbStoreUpdateWithConflictResolution0008 done: " + ret);
                    {
                        let predicates = await new data_Rdb.RdbPredicates("test")
                        let resultSet = await rdbStore.query(predicates)

                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(2).assertEqual(id);
                        await expect("zhangsan").assertEqual(name);
                        await expect(20).assertEqual(age);
                        await expect(300.5).assertEqual(salary);
                        await expect(4).assertEqual(blobType[0]);
                        await expect(5).assertEqual(blobType[1]);
                        await expect(6).assertEqual(blobType[2]);
                        console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                        + salary + ", blobType=" + blobType);

                        await expect(false).assertEqual(resultSet.goToNextRow())
                        resultSet.close()
                        done()
                        console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0008 end   *************");
                    }

                }).catch((err) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0008 error");
                    done()
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0008 end   *************");
                })
            }
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_1300
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0009', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0009 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([7, 8, 9])
                const valueBucket = {
                    "id": 3,
                    "name": "wangjing",
                    "age": 20,
                    "salary": 300.5,
                    "blobType": u8,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                let updatePromise = rdbStore.update(valueBucket, predicates, data_Rdb.ConflictResolution.ON_CONFLICT_IGNORE);
                updatePromise.then(async (ret) => {
                    await expect(1).assertEqual(ret);
                    await console.log(TAG + "testRdbStoreUpdateWithConflictResolution0009 done: " + ret);
                    {
                        let predicates = await new data_Rdb.RdbPredicates("test")
                        let resultSet = await rdbStore.query(predicates)

                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(1).assertEqual(id);
                        await expect("zhangsan").assertEqual(name);
                        await expect(18).assertEqual(age);
                        await expect(100.5).assertEqual(salary);
                        await expect(1).assertEqual(blobType[0]);
                        await expect(2).assertEqual(blobType[1]);
                        await expect(3).assertEqual(blobType[2]);
                        console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                        + salary + ", blobType=" + blobType);

                        await expect(true).assertEqual(resultSet.goToNextRow())
                        const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(3).assertEqual(id_1);
                        await expect("wangjing").assertEqual(name_1);
                        await expect(20).assertEqual(age_1);
                        await expect(300.5).assertEqual(salary_1);
                        await expect(7).assertEqual(blobType_1[0]);
                        await expect(8).assertEqual(blobType_1[1]);
                        await expect(9).assertEqual(blobType_1[2]);
                        console.log(TAG + "{id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
                        + salary_1 + ", blobType=" + blobType_1);
                        await expect(false).assertEqual(resultSet.goToNextRow())

                        resultSet.close()
                        done()
                        console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0009 end   *************");
                    }

                }).catch((err) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0009 error");
                    expect(null).assertFail();
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0009 end   *************");
                })
            }
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_1400
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0010', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0010 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }

            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 20,
                    "salary": 300.5,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                let updatePromise = rdbStore.update(valueBucket, predicates, data_Rdb.ConflictResolution.ON_CONFLICT_IGNORE);
                updatePromise.then(async (ret) => {
                    await expect(0).assertEqual(ret);
                    await console.log(TAG + "testRdbStoreUpdateWithConflictResolution0010 done: " + ret);
                    {
                        let predicates = await new data_Rdb.RdbPredicates("test")
                        let resultSet = await rdbStore.query(predicates)

                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(1).assertEqual(id);
                        await expect("zhangsan").assertEqual(name);
                        await expect(18).assertEqual(age);
                        await expect(100.5).assertEqual(salary);
                        await expect(1).assertEqual(blobType[0]);
                        await expect(2).assertEqual(blobType[1]);
                        await expect(3).assertEqual(blobType[2]);
                        console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                        + salary + ", blobType=" + blobType);

                        await expect(true).assertEqual(resultSet.goToNextRow())
                        resultSet.close()
                        done()
                        console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0010 end   *************");
                    }

                }).catch((err) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0010 error");
                    done()
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0010 end   *************");
                })
            }
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_1500
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0011', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0011 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                var u8 = new Uint8Array([7, 8, 9])
                const valueBucket = {
                    "id": 3,
                    "name": "wangjing",
                    "age": 20,
                    "salary": 300.5,
                    "blobType": u8,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                let updatePromise = rdbStore.update(valueBucket, predicates, data_Rdb.ConflictResolution.ON_CONFLICT_FAIL);
                updatePromise.then(async (ret) => {
                    await expect(1).assertEqual(ret);
                    await console.log(TAG + "testRdbStoreUpdateWithConflictResolution0011 done: " + ret);
                    {
                        let predicates = await new data_Rdb.RdbPredicates("test")
                        let resultSet = await rdbStore.query(predicates)

                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(1).assertEqual(id);
                        await expect("zhangsan").assertEqual(name);
                        await expect(18).assertEqual(age);
                        await expect(100.5).assertEqual(salary);
                        await expect(1).assertEqual(blobType[0]);
                        await expect(2).assertEqual(blobType[1]);
                        await expect(3).assertEqual(blobType[2]);
                        console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                        + salary + ", blobType=" + blobType);

                        await expect(true).assertEqual(resultSet.goToNextRow())
                        const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(3).assertEqual(id_1);
                        await expect("wangjing").assertEqual(name_1);
                        await expect(20).assertEqual(age_1);
                        await expect(300.5).assertEqual(salary_1);
                        await expect(7).assertEqual(blobType_1[0]);
                        await expect(8).assertEqual(blobType_1[1]);
                        await expect(9).assertEqual(blobType_1[2]);
                        console.log(TAG + "{id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
                        + salary_1 + ", blobType=" + blobType_1);
                        await expect(false).assertEqual(resultSet.goToNextRow())

                        resultSet.close()
                        done()
                        console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0011 end   *************");
                    }

                }).catch((err) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0011 error");
                    done()
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0011 end   *************");
                })
            }
        })

        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_1600
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0012', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0012 start *************");
            {
                var u8 = new Uint8Array([1, 2, 3])
                const valueBucket = {
                    "id": 1,
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }

            {
                var u8 = new Uint8Array([4, 5, 6])
                const valueBucket = {
                    "id": 2,
                    "name": "lisi",
                    "age": 19,
                    "salary": 200.5,
                    "blobType": u8,
                }
                await rdbStore.insert("test", valueBucket)
            }
            {
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 20,
                    "salary": 300.5,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                let updatePromise = rdbStore.update(valueBucket, predicates, data_Rdb.ConflictResolution.ON_CONFLICT_FAIL);
                updatePromise.then(async (ret) => {
                    await expect(1).assertEqual(ret);
                    await console.log(TAG + "testRdbStoreUpdateWithConflictResolution0012 done: " + ret);
                    {
                        let predicates = await new data_Rdb.RdbPredicates("test")
                        let resultSet = await rdbStore.query(predicates)

                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = await resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = await resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = await resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"))

                        await expect(2).assertEqual(id);
                        await expect("zhangsan").assertEqual(name);
                        await expect(20).assertEqual(age);
                        await expect(300.5).assertEqual(salary);
                        await expect(4).assertEqual(blobType[0]);
                        await expect(5).assertEqual(blobType[1]);
                        await expect(6).assertEqual(blobType[2]);
                        console.log(TAG + "{id=" + id + ", name=" + name + ", age=" + age + ", salary="
                        + salary + ", blobType=" + blobType);

                        await expect(false).assertEqual(resultSet.goToNextRow())
                        resultSet.close()
                        done()
                        console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0012 end   *************");
                    }

                }).catch((err) => {
                    console.log(TAG + "testRdbStoreUpdateWithConflictResolution0012 error");
                    done()
                    console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0012 end   *************");
                })
            }
        })



        /**
         * @tc.name resultSet Update test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateJsAPITest_1700
         * @tc.desc resultSet Update test
         */
        it('testRdbStoreUpdateWithConflictResolution0013', 0, async function (done) {
            console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0013 start *************");
            try {
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 20,
                    "salary": 300.5,
                }
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("age", "19")
                rdbStore.update(valueBucket, predicates, 6);
                expect(null).assertFail();
            } catch (err) {
                console.log("catch err: failed, err: code=" + err.code + " message=" + err.message)
                expect("401").assertEqual(err.code)
                console.log(TAG + "************* testRdbStoreUpdateWithConflictResolution0013 end   *************");
                done()
            }
        })

        console.info(TAG + "*************Unit Test End*************");
    })

}
