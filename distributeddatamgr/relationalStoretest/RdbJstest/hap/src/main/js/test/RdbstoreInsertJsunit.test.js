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
import dataRdb from '@ohos.data.rdb';

const TAG = "[RDB_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const CREATE_TABLE_NAME = "CREATE TABLE IF NOT EXISTS test" 
const CREATE_TABLE = " (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const STORE_CONFIG = {
    name: "InsertTest.db",
}

var rdbStore = undefined;
var resultSet = undefined;

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
export default function rdbstoreInsertTest() {
describe('rdbstoreInsertTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
        rdbStore = await dataRdb.getRdbStore(STORE_CONFIG, 1);
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.executeSql(CREATE_TABLE_BATCHINSERT_TEST, null);
    })

    beforeEach(async function () {
        console.info(TAG + 'beforeEach')
        await rdbStore.executeSql("DELETE FROM test");
    })

    afterEach(async function () {
        console.info(TAG + 'afterEach')
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
        rdbStore = null
        await dataRdb.deleteRdbStore("InsertTest.db").then(() => {
            sleep(2)
        });
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name rdb insert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_Insert_0010
     * @tc.desc rdb insert test
     */
    it('testRdbStoreInsert0001', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreInsert0001 start *************");
        var u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            await rdbStore.insert("test", valueBucket)
        }
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

        let predicates = new dataRdb.RdbPredicates("test");
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
            console.info("insert1 error " + e);
        }
        resultSet = null
        done()
        console.info(TAG + "************* testRdbStoreInsert0001 end *************");
    })

    /**
     * @tc.name rdb insert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_Insert_0020
     * @tc.desc rdb insert test
     */
    it('testRdbStoreInsert0002', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreInsert0002 start *************");
        var u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            let insertPromise = rdbStore.insert("wrong", valueBucket)
            insertPromise.then(async (ret) => {
                expect(1).assertEqual(ret)
                console.info(TAG + "insert first done: " + ret)
                expect(null).assertFail()
            }).catch((err) => {
                console.info(TAG + "insert with wrong table")
            })
        }
        done()
        console.info(TAG + "************* testRdbStoreInsert0002 end   *************");
    })

    /**
     * @tc.name rdb insert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_Insert_0030
     * @tc.desc rdb insert test
     */
    it('testRdbStoreInsert0003', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreInsert0003 start *************");
        let errInfo = undefined;
        var u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                "name": "zhangsan",
                "age": 18,
                "salary": 100.5,
                "blobType": u8,
            }
            try{
                rdbStore.insert(null, valueBucket)
            }catch(err){
                errInfo = err
            }
            expect(errInfo.code).assertEqual("401")
        }
        done()
        console.info(TAG + "************* testRdbStoreInsert0003 end   *************");
    })

    /**
     * @tc.name rdb insert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_Insert_0040
     * @tc.desc rdb insert test
     */
     it('testRdbStoreInsert0004', 0, async function (done) {
        console.log(TAG + "************* testRdbStoreInsert0004 start *************");
        var u8 = new Uint8Array([1, 2, 3])
        const valueBucket = {
            "name": "zhangsan",
            "age": 18,
            "salary": null,
            "blobType": u8,
        }
        let insertPromise = rdbStore.insert("test", valueBucket)
        insertPromise.then(async (ret) => {
            expect(1).assertEqual(ret)
            console.log(TAG + "insert first done: " + ret)
        }).catch((err) => {
            console.log(TAG + "insert with null table")
            expect(null).assertFail()
        })
        done();
        console.log(TAG + "************* testRdbStoreInsert0004 end   *************");
    })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Promise_0010
     * @tc.desc rdb insert test
     */
     it('testRdbStorebatchInsertPromise0001', 0, async function (done) {
        console.info(TAG + "************* testRdbStorebatchInsertPromise0001 start *************");
        await rdbStore.executeSql(CREATE_TABLE_NAME + "1" + CREATE_TABLE)
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
        await rdbStore.batchInsert("test1", valueBuckets).then((number) => {
            expect(3).assertEqual(number)
        }).catch((err) =>{
            expect(false).assertTrue();
        })

        let predicates = new dataRdb.RdbPredicates("test1");
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
        predicates = new dataRdb.RdbPredicates("test1");
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
        resultSet = null
        done()
        console.info(TAG + "************* testRdbStorebatchInsertPromise0001 end *************");
    })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Promise_0020
     * @tc.desc rdb insert test
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
        }).catch((err) =>{
            expect(false).assertTrue();
        })
        let predicates = new dataRdb.RdbPredicates("test2");
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
            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
            expect(2).assertEqual(id);
            expect("lisi").assertEqual(name)
            expect(23).assertEqual(age)
            expect(200).assertEqual(salary)
            await rdbStore.delete(predicates).then((number) => {
                expect(1).assertEqual(number)
            }).then(async () => {
                resultSet = await rdbStore.query(predicates).catch((err) =>{
                    expect(err != null).assertTrue();
                })
            })
        } catch (e) {
            console.info("BatchInsert2 error " + e);
        }
        resultSet = null
        done()
        console.info(TAG + "************* testRdbStorebatchInsertPromise0002 end *************");
    })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Promise_0030
     * @tc.desc rdb insert test
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
        }).catch((err) =>{
            expect(false).assertTrue();
        })

        let predicates = new dataRdb.RdbPredicates("test3");
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
        } catch (e) {
            console.info("BatchInsert1 error " + e);
        }
        predicates = new dataRdb.RdbPredicates("test3");
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
            const valueBucket4 = {
                "name": "zhangmaowen",
                "age": 25,
                "salary": 500,
                "blobType": u8,
            }
            await rdbStore.insert("test3",valueBucket4)
            predicates = new dataRdb.RdbPredicates("test3");
            predicates.equalTo("name", "zhangmaowen")
            resultSet = await rdbStore.query(predicates)
            try {
                console.info(TAG + "resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
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
        resultSet = null
        done();
        console.info(TAG + "************* testRdbStorebatchInsertPromise0003 end *************");
    })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Promise_0040
     * @tc.desc rdb insert test
     */
     it('testRdbStorebatchInsertPromise0004', 0, async function (done) {
        console.info(TAG + "************* testRdbStorebatchInsertPromise0004 start *************");
        await rdbStore.executeSql(CREATE_TABLE_NAME + "4" + CREATE_TABLE)
        var u8 = new Uint8Array([1, 2, 3])
        var valueBuckets = new Array(100);
        for(var i=0;i<valueBuckets.length;i++){
            valueBuckets[i] = {
                "name": "zhangsan" + i,
                "age": i,
                "salary": 1+i,
                "blobType": u8,
            };
        }
        console.info(TAG + "Batch insert data start")
        await rdbStore.batchInsert("test4", valueBuckets).then((number) => {
            console.info(TAG + "Batch insert data end")
            expect(100).assertEqual(number)
        }).catch((err) =>{
            expect(false).assertTrue();
        })

        let predicates = new dataRdb.RdbPredicates("test4");
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
        resultSet = null;
        done()
        console.info(TAG + "************* testRdbStorebatchInsertPromise0004 end *************");
    })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Promise_0050
     * @tc.desc rdb insert test
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
            }).catch((err) =>{
                expect(false).assertTrue();
            })
    
            let predicates = new dataRdb.RdbPredicates("test5");
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
            resultSet = null;
            done();
            console.info(TAG + "************* testRdbStorebatchInsertPromise0005 end *************");
        })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Promise_0060
     * @tc.desc rdb insert test
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
        try{
            await rdbStore.batchInsert("test6","valueBuckets")
        }catch(err){
            console.info(TAG + "Batch insert data error:  " + err)
            errInfo = err
        }
        expect(errInfo.code).assertEqual("401")
        done()
        console.info(TAG + "************* testRdbStorebatchInsertPromise0006 end *************");
    })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Promise_0070
     * @tc.desc rdb insert test
     */
     it('testRdbStorebatchInsertPromise0007', 0, async function (done) {
        console.info(TAG + "************* testRdbStorebatchInsertPromise0007 start *************");
        let errInfo = undefined;
        await rdbStore.executeSql(CREATE_TABLE_NAME + "7" + CREATE_TABLE)
        try{
            await rdbStore.batchInsert("test7")
        }catch(err){
            console.info(TAG + "Batch insert data error:  " + err)
            errInfo = err
        }
        expect(errInfo.code).assertEqual("401")
        done()
        console.info(TAG + "************* testRdbStorebatchInsertPromise0007 end *************");
    })


    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Callback_0100
     * @tc.desc rdb insert test
     * zheg s
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
                if(err != null){
                    expect(false).assertTrue();
                }else{
                    console.info(TAG + "Batch insert data end")
                    expect(3).assertEqual(data)
                    let predicates = new dataRdb.RdbPredicates("testcallback1");
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
                    predicates = new dataRdb.RdbPredicates("testcallback1");
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
                }
                done();
            })
            resultSet = null
        })
        await sleep(2000)
        done()
        console.info(TAG + "************* testRdbStorebatchInsertCallback0001 end *************");
    })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Callback_0200
     * @tc.desc rdb insert test
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
                if(err != null){
                    expect(false).assertTrue();
                }else{
                    expect(3).assertEqual(data)
                    let predicates = new dataRdb.RdbPredicates("testCallback2");
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
                        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
                        expect(2).assertEqual(id);
                        expect("lisi").assertEqual(name)
                        expect(23).assertEqual(age)
                        expect(200).assertEqual(salary)
                        await rdbStore.delete(predicates).then((number) => {
                            expect(1).assertEqual(number)
                        }).then(async () => {
                            resultSet = await rdbStore.query(predicates).catch((err) =>{
                                expect(err != null).assertTrue();
                            })
                        })
                    } catch (e) {
                        console.info("BatchInsert2 error " + e);
                    }
                }
                done();
            })
        })
        await sleep(2000)
        resultSet = null
        done()
        console.info(TAG + "************* testRdbStorebatchInsertCallback0002 end *************");
    })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Callback_0300
     * @tc.desc rdb insert test
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
        await rdbStore.executeSql(CREATE_TABLE_NAME + "Callback3" + CREATE_TABLE).then(async () =>{
            await rdbStore.batchInsert("testCallback3", valueBuckets, async (err, data) => {
                if(err != null){
                    expect(false).assertTrue()
                }else{
                    expect(3).assertEqual(data)
                    let predicates = new dataRdb.RdbPredicates("testCallback3");
                    predicates.equalTo("name", "zhangsan")
                    let resultSet = await rdbStore.query(predicates)
                    try {
                        console.info(TAG + "resultSet query done");
                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary);
                        expect(1).assertEqual(id);
                        expect("zhangsan").assertEqual(name)
                        expect(18).assertEqual(age)
                        expect(100.5).assertEqual(salary)
                    } catch (e) {
                        console.info("BatchInsert1 error " + e);
                    }
                    predicates = new dataRdb.RdbPredicates("testCallback3");
                    predicates.equalTo("name", "lisi")
                    resultSet = await rdbStore.query(predicates)
                    try {
                        console.info(TAG + "resultSet query done");
                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
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
                        await rdbStore.insert("testCallback3",valueBucket4)
                        predicates = new dataRdb.RdbPredicates("testCallback3");
                        predicates.equalTo("name", "zhangmaowen")
                        resultSet = await rdbStore.query(predicates)
                        try {
                            console.info(TAG + "resultSet query done");
                            expect(true).assertEqual(resultSet.goToFirstRow())
                            const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                            const name = resultSet.getString(resultSet.getColumnIndex("name"))
                            const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
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
        await sleep(2000)
        resultSet = null
        done();
        console.info(TAG + "************* testRdbStorebatchInsertCallback0003 end *************");
    })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Callback_0400
     * @tc.desc rdb insert test
     */
     it('testRdbStorebatchInsertCallback0004', 0, async function (done) {
        console.info(TAG + "************* testRdbStorebatchInsertCallback0004 start *************");  
        var u8 = new Uint8Array([1, 2, 3])
        var valueBuckets = new Array(100);
        for(var i=0;i<valueBuckets.length;i++){
            valueBuckets[i] = {
                "name": "zhangsan" + i,
                "age": i,
                "salary": 1+i,
                "blobType": u8,
            };
        }
        console.info(TAG + "Batch insert data start")
        await rdbStore.executeSql(CREATE_TABLE_NAME + "Callbak4" + CREATE_TABLE).then(async () => {
            await rdbStore.batchInsert("testCallbak4", valueBuckets, async (err, data) => {
                if(err != null){
                    expect(false).assertTrue();
                }else{
                    console.info(TAG + "Batch insert data end")
                    expect(100).assertEqual(data)
                    let predicates = new dataRdb.RdbPredicates("testCallbak4");
                    predicates.equalTo("name", "zhangsan55")
                    let resultSet = await rdbStore.query(predicates)
                    try {
                        console.info(TAG + "resultSet query done");
                        expect(true).assertEqual(resultSet.goToFirstRow())
                        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                        const name = resultSet.getString(resultSet.getColumnIndex("name"))
                        const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
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
        await sleep(2000)
        resultSet = null;
        done()
        console.info(TAG + "************* testRdbStorebatchInsertCallback0004 end *************");
    })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Callback_0500
     * @tc.desc rdb insert test
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
                if(err != null){
                    expect(false).assertTrue();
                }else{
                    expect(3).assertEqual(number)
                    let predicates = new dataRdb.RdbPredicates("testCallback5");
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
                }
                done();
            })
        })
        await sleep(2000)
        resultSet = null;
        done();
        console.info(TAG + "************* testRdbStorebatchInsertCallback0005 end *************");
    })

    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Callback_0600
     * @tc.desc rdb insert test
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
            try{
                rdbStore.batchInsert("testCallback6", "valueBuckets", (err, data) => {
                    console.info(TAG + "Affect row is " + data)
                    if(err != null){
                        expect(null).assertFail();
                    }else{
                        expect(data).assertEqual(-1)
                    }
                })
            }catch(err){
                console.info(TAG + "Batch insert data error:  " + err)
                errInfo = err
            }
        })
        expect(errInfo.code).assertEqual("401")
        done()
        console.info(TAG + "************* testRdbStorebatchInsertCallback0006 end *************");
    })


    /**
     * @tc.name rdb batchInsert test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_BatchInsert_Callback_0700
     * @tc.desc rdb insert test
     */
    it('testRdbStorebatchInsertCallback0007', 0, async function (done) {
        console.info(TAG + "************* testRdbStorebatchInsertCallback0007 start *************");
        let errInfo = undefined;
        await rdbStore.executeSql(CREATE_TABLE_NAME + "Callback7" + CREATE_TABLE).then(async () => {
            try{
                await rdbStore.batchInsert("testCallback7", (err,data) => {
                    console.info(TAG + "Affect row is " + data)
                    if(err != null){
                        expect(null).assertFail();
                    }else{
                        expect(data).assertEqual(-1)
                    }
                })
            }catch(err){
                errInfo = err
            }
        }).catch((err) => {
            expect(null).assertFail();
        })
        expect(errInfo.code).assertEqual("401")
        done()
        console.info(TAG + "************* testRdbStorebatchInsertCallback0007 end *************");
    })

    console.info(TAG + "*************Unit Test End*************");
})
}
