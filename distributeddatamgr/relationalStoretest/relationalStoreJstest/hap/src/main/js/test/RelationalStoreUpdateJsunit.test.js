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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
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
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Update_0010
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
     * @tc.name resultSet Update test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Update_0020
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
            try{
                let predicates = new data_Rdb.RdbPredicates("")
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
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Update_0030
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
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Update_0040
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
                let updatePromise = rdbStore.update(valueBucket, predicates)
                updatePromise.then(async (ret) => {
                    console.info(TAG + "update done: " + ret);
                    expect(null).assertFail();
                }).catch((err) => {
                    console.info(TAG + "update with wrong condition");
                })
                //await updatePromise
            }
            {
                const emptyBucket = {};
                let predicates = await new data_Rdb.RdbPredicates("test")
                await predicates.equalTo("name", "zhangsan")
                await predicates.equalTo("age", 18)
                await predicates.equalTo("null", 100.5)
                let updatePromise = rdbStore.update(valueBucket, predicates)
                updatePromise.then(async (ret) => {
                    console.info(TAG + "update done: " + ret);
                    expect(null).assertFail();
                }).catch((err) => {
                    console.info(TAG + "update with wrong condition");
                })
            }
        }
        done();
        console.info(TAG + "************* testRdbStoreUpdate0004 end   *************");
    })
    console.info(TAG + "*************Unit Test End*************");
})
  
}
