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
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG = {
    name: "rdbstoreTransactionTest.db",
    securityLevel: data_Rdb.SecurityLevel.S1
}

var rdbStore = undefined;

export default function relationalStoreTransactionTest() {
describe('relationalStoreTransactionTest', function () {
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
        await data_Rdb.deleteRdbStore(context, "rdbstoreTransactionTest.db");
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name RelationalStore transaction insert test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_testRdbTransactionInsert0001
     * @tc.desc RelationalStore transaction insert & commit, the result comes out is 3 items;
     */
    it('testRdbTransactionInsert0001', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreInsert0001 start *************");
        var u8 = new Uint8Array([1, 2, 3])
        try {
            rdbStore.beginTransaction()
            const valueBucket = {
                "name": "lisi",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket)

            await rdbStore.commit()

            let predicates = new data_Rdb.RdbPredicates("test");
            let resultSet = await rdbStore.query(predicates)
            console.info(TAG + "testRdbTransactionInsert0001 result count " + resultSet.rowCount)
            expect(1).assertEqual(resultSet.rowCount)
            resultSet.close()
//            resultSet == null;
        } catch (e) {
            console.info(TAG + e);
            expect(null).assertFail()
            console.info(TAG + "testRdbTransactionInsert0001 failed");
        }
        done()
        console.info(TAG + "************* testRdbTransactionInsert0001 end *************");
    })

    /**
     * @tc.name RelationalStore transaction insert test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_testRdbTransactionInsert0002
     * @tc.desc RelationalStore transaction insert & commit, the result comes out is 3 items;
     */
    it('testRdbTransactionInsert0002', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreInsert0002 start *************");
        var u8 = new Uint8Array([1, 2, 3])
        try {
            await rdbStore.beginTransaction()
            const valueBucket = {
                "name": "lisi",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket)

            const valueBucket1 = {
                "name": "zhangsan",
                "age": 20,
                "salary": 9.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket1)


            const valueBucket2 = {
                "name": "wangwu",
                "age": 16,
                "salary": 99,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket2)

            await rdbStore.commit()

            let predicates = new data_Rdb.RdbPredicates("test");
            let resultSet = await rdbStore.query(predicates)
            expect(3).assertEqual(resultSet.rowCount)
          resultSet.close()
//            resultSet == null;
        } catch (e) {
            expect(null).assertFail()
            console.info(TAG + "testRdbTransactionInsert0002 failed");
        }
        done()
        console.info(TAG + "************* testRdbTransactionInsert0002 end *************");
    })


    /**
     * @tc.name RelationalStore transaction insert test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_testRdbTransactionInsert0003
     * @tc.desc while using transaction to insert values, querying the db,
     *     the result comes out is 0;
     */
    it('testRdbTransactionInsert0003', 0, async function (done) {
        console.info(TAG + "************* testRdbTransactionInsert0003 start *************");
        var u8 = new Uint8Array([1, 2, 3])
        try {
            await rdbStore.beginTransaction()
            const valueBucket = {
                "name": "lisi",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket)

            const valueBucket1 = {
                "name": "zhangsan",
                "age": 20,
                "salary": 9.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket1)

            let predicates = new data_Rdb.RdbPredicates("test");
            let resultSet = await rdbStore.query(predicates)
            expect(0).assertEqual(resultSet.rowCount)
                      resultSet.close()
//            resultSet == null;
            const valueBucket2 = {
                "name": "wangwu",
                "age": 16,
                "salary": 99,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket2)

            await rdbStore.commit()
        } catch (e) {
            expect(null).assertFail()
            console.info(TAG + "testRdbTransactionInsert0003 failed");
        }
        done()
        console.info(TAG + "************* testRdbTransactionInsert0003 end *************");
    })

    /**
     * @tc.name RelationalStore insert test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RollBack_0001
     * @tc.desc the classical transaction scenario, when we insert or commit the value,
     *     db returns an exception, we need to catch exception and rollback.
     */
    it('testRdbTransactionRollBack0001', 0, async function (done) {
        console.info(TAG + "************* testRdbTransactionRollBack0001 start *************");
        var u8 = new Uint8Array([1, 2, 3])
        try {
            await rdbStore.beginTransaction()
            const valueBucket = {
                "id": 1,
                "name": "lisi",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket)
            await rdbStore.insert("test", valueBucket)

            await rdbStore.commit()
        } catch (e) {
            await rdbStore.rollBack()
            let predicates = new data_Rdb.RdbPredicates("test");
            let resultSet = await rdbStore.query(predicates)
            console.info(TAG + "testRdbTransactionRollBack0001 result count " + resultSet.rowCount);
            expect(0).assertEqual(resultSet.rowCount)
            resultSet.close()
//            resultSet == null;
        }
        done()
        console.info(TAG + "************* testRdbTransactionRollBack0001 end *************");
    })

    /**
     * @tc.name RelationalStore insert test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Multi_0001
     * @tc.desc the classical transaction scenario, when we insert or commit the value,
     *     db returns an exception, we need to catch exception and rollback.
     */
    it('testRdbTransactionMulti0001', 0, async function (done) {
        console.info(TAG + "************* testRdbTransactionMulti0001 start *************");
        var u8 = new Uint8Array([1, 2, 3])
        try {
            await rdbStore.beginTransaction()
            const valueBucket = {
                "id": 1,
                "name": "lisi",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket)

            await rdbStore.beginTransaction()
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 20,
                "salary": 220.5,
                "blobType": u8,
            }
            let num = rdbStore.insert("test", valueBucket1)
            num.then(async (ret) => {
                console.info(TAG + "testRdbTransactionMulti0001 * insert result " + ret);
                expect(2).assertEqual(ret)
            })

            await rdbStore.commit()
            await rdbStore.commit()

            let predicates = new data_Rdb.RdbPredicates("test");
            num =  rdbStore.query(predicates)
            num.then(async (ret) => {
                expect(2).assertEqual(ret.rowCount)
                ret.close()
            })
        } catch (e) {
            console.info(TAG + "testRdbTransactionMulti0001 fail ***** ");
        }
        done()
        console.info(TAG + "************* testRdbTransactionMulti0001 end *************");
    })

    /**
     * @tc.name RelationalStore insert test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Multi_0002
     * @tc.desc the classical transaction scenario, when we insert or commit the value,
     *     db returns an exception, we need to catch exception and rollback.
     */
    it('testRdbTransactionMulti0002', 0, async function (done) {
        console.info(TAG + "************* testRdbTransactionMulti0002 start *************");
        var u8 = new Uint8Array([1, 2, 3])
        try {
            await rdbStore.beginTransaction()
            const valueBucket = {
                "id": 1,
                "name": "lisi",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket, function (err, ret){

            });

            await rdbStore.beginTransaction()
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 20,
                "salary": 220.5,
                "blobType": u8,
            }
            let num = rdbStore.insert("test", valueBucket1)
            num.then(async (ret) => {
                console.info(TAG + "testRdbTransactionMulti0002 * insert result " + ret);
                expect(2).assertEqual(ret)
                ret.close()
            })

            await rdbStore.rollBack()

            await rdbStore.commit()

            let predicates = new data_Rdb.RdbPredicates("test");
            num =  rdbStore.query(predicates)
            num.then(async (ret) => {
                console.info(TAG + "testRdbTransactionMulti0002 * final query " + ret.rowCount);
                expect(1).assertEqual(ret.rowCount)
                ret.close()
            })
        } catch (e) {
            console.info(TAG + "testRdbTransactionMulti0002 fail ***** ");
        }
        done()
        console.info(TAG + "************* testRdbTransactionMulti0002 end *************");
    })

    /**
     * @tc.name RelationalStore insert test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Multi_0003
     * @tc.desc the classical transaction scenario, when we insert or commit the value,
     *     db returns an exception, we need to catch exception and rollback.
     */
    it('testRdbTransactionMulti0003', 0, async function (done) {
        console.info(TAG + "************* testRdbTransactionMulti0003 start *************");
        var u8 = new Uint8Array([1, 2, 3])
        try {
            await rdbStore.beginTransaction()
            const valueBucket = {
                "id": 1,
                "name": "lisi",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket, function (err, ret){

            });

            await rdbStore.beginTransaction()
            const valueBucket1 = {
                "name": "zhangsan",
                "age": 20,
                "salary": 220.5,
                "blobType": u8,
            }
            let num = await rdbStore.insert("test", valueBucket1)

            await rdbStore.rollBack()

            await rdbStore.insert("test", valueBucket)
            await rdbStore.commit()

            let predicates = new data_Rdb.RdbPredicates("test");
            num =  rdbStore.query(predicates)
            num.then(async (ret) => {
                console.info(TAG + "testRdbTransactionMulti0003 * final query " + ret.rowCount);
                expect(1).assertEqual(ret.rowCount)
                ret.close()
            })
        } catch (e) {
            await rdbStore.rollBack()
            console.info(TAG + "testRdbTransactionMulti0003 rollback ***** ");
        }
        done()
        console.info(TAG + "************* testRdbTransactionMulti0003 end *************");
    })

    /**
     * @tc.name RelationalStore delete test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_Transaction_Delete_0010
     * @tc.desc the classical transaction scenario, when we delete or commit the value,
     *     db returns an exception, we need to catch exception and rollback.
     */
    it('testRdbTransactionDelete0001', 0, async function (done) {
        console.info(TAG + "************* testRdbTransactionDelete0001 start *************");
        var u8 = new Uint8Array([1, 2, 3])
        try {
            await rdbStore.beginTransaction()
            const valueBucket = {
                "name": "lisi",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket)

            const valueBucket1 = {
                "name": "zhangsan",
                "age": 20,
                "salary": 9.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket1)

            let predicates = new data_Rdb.RdbPredicates("test");
            let resultSet = await rdbStore.query(predicates)
            expect(0).assertEqual(resultSet.rowCount)
            resultSet.close()
//            resultSet == null;
            const valueBucket2 = {
                "name": "wangwu",
                "age": 16,
                "salary": 99,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket2)

            await rdbStore.commit()
        } catch (e) {
            expect(null).assertFail()
            console.info(TAG + "testRdbTransactionInsert0003 failed");
        }
        //删除
        {
            let predicates = await new data_Rdb.RdbPredicates("test")
            let deletePromise = rdbStore.delete(predicates)
            deletePromise.then(async (ret) => {
                expect(3).assertEqual(ret)
                console.info(TAG + "Delete done: " + ret)
            }).catch((err) => {
                expect(null).assertFail()
            })
            await deletePromise
        }
        done()
        console.info(TAG + "************* testRdbTransactionDelete0001 end *************");
    })

    console.info(TAG + "*************Unit Test End*************");
})}
