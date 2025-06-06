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
import data_Rdb from '@ohos.data.relationalStore';
import ability_featureAbility from '@ohos.ability.featureAbility';
var context = ability_featureAbility.getContext();

const TAG = "[RelationalStore_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG = {
    name: "ExcuteSqlTest.db",
    securityLevel: data_Rdb.SecurityLevel.S1
}
var rdbStore = undefined;

export default function relationalStoreExcuteSqlTest() {
    describe('relationalStoreExcuteSqlTest', function () {
        beforeAll(async function () {
            console.info(TAG + 'beforeAll')
            rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        })
    
        beforeEach(async function () {
            await rdbStore.executeSql("DELETE FROM test");
            console.info(TAG + 'beforeEach')
        })
    
        afterEach(function () {
            console.info(TAG + 'afterEach')
        })
    
        afterAll(async function () {
            console.info(TAG + 'afterAll')
            rdbStore = null
            await data_Rdb.deleteRdbStore(context, "ExcuteSqlTest.db");
        })
    
        /**
         * @tc.name resultSet ExcuteSql normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesJsAPITest_1210
         * @tc.desc resultSet ExcuteSql normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('ExcuteSqlTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* ExcuteSqlTest0001 start *************");
            var u8 = new Uint8Array([1, 2, 3])
            //插入
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(1).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            {
                const valueBucket = {
                    "name": "lisi",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(2).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            }
            {
                const valueBucket = {
                    "name": "lisi",
                    "age": 20,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(3).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            }
            //sql删除
                let executeSqlPromise = rdbStore.executeSql("DELETE FROM test WHERE age = ? OR age = ?", ["18", "20"])
                executeSqlPromise.then(async (resultSet) => {
                    await console.info(TAG + "executeSql done: " + resultSet);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await executeSqlPromise
    
    
                let querySqlPromise = rdbStore.querySql("SELECT * FROM test")
                querySqlPromise.then(async (resultSet) => {
                    await expect(0).assertEqual(resultSet.rowCount)
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await querySqlPromise
    
            done();
            console.info(TAG + "************* ExcuteSqlTest0001 end   *************");
        })
    
        /**
         * @tc.name resultSet ExcuteSql normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesJsAPITest_1220
         * @tc.desc resultSet ExcuteSql normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('ExcuteSqlTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* ExcuteSqlTest0002 start *************");
            var u8 = new Uint8Array([2, 3, 4])
            //插入
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(4).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            {
                const valueBucket = {
                    "name": "lisi",
                    "age": 19,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(5).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            }
            {
                const valueBucket = {
                    "name": "lisi",
                    "age": 20,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(6).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            }
                let executeSqlPromise = rdbStore.executeSql("DELETE FROM test WHERE name = 'lisi'")
                executeSqlPromise.then(async () => {
                    await console.info(TAG + "executeSql done");
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await executeSqlPromise
    
                let querySqlPromise = rdbStore.querySql("SELECT * FROM test")
                querySqlPromise.then(async (resultSet) => {
                    await expect(1).assertEqual(resultSet.rowCount)
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await querySqlPromise
    
            done();
            console.info(TAG + "************* ExcuteSqlTest0002 end   *************");
        })
    
        /**
         * @tc.name resultSet ExcuteSql normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesJsAPITest_1230
         * @tc.desc resultSet ExcuteSql normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('ExcuteSqlTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* ExcuteSqlTest0003 start *************");
            var u8 = new Uint8Array([3, 4, 5])
            var nameStr = "lisi" + "e".repeat(2000) + "zhangsan"
            //插入
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(7).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            {
                const valueBucket = {
                    "name": nameStr,
                    "age": 19,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(8).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            }
            {
                const valueBucket = {
                    "name": nameStr,
                    "age": 28,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(9).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            }
                let predicates = await new data_Rdb.RdbPredicates("test")
                predicates.equalTo("name", nameStr)
                let querySqlPromise = rdbStore.query(predicates)
                querySqlPromise.then(async (resultSet) => {
                    await expect(2).assertEqual(resultSet.rowCount)
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await querySqlPromise
    
                let executeSqlPromise = rdbStore.executeSql("DELETE FROM test WHERE age = 19 AND name ='" + nameStr + "'")
                executeSqlPromise.then(async () => {
                    await console.info(TAG + "executeSql done." );
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await executeSqlPromise
            {
                let querySqlPromise = rdbStore.querySql("SELECT * FROM test WHERE name ='" + nameStr + "'")
                querySqlPromise.then(async (resultSet) => {
                    await expect(1).assertEqual(resultSet.rowCount)
                    expect(true).assertEqual(resultSet.goToFirstRow())
                    const name = resultSet.getString(resultSet.getColumnIndex("name"))
                    const age = resultSet.getLong(resultSet.getColumnIndex("age"))
                    const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
                    const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                    expect(nameStr).assertEqual(name)
                    expect(2012).assertEqual(name.length)
                    expect(28).assertEqual(age)
                    expect(100.5).assertEqual(salary)
                    expect(3).assertEqual(blobType[0])
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await querySqlPromise
            }
            done();
            console.info(TAG + "************* ExcuteSqlTest0003 end   *************");
        })
    
        /**
         * @tc.name resultSet ExcuteSql normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesJsAPITest_1240
         * @tc.desc resultSet ExcuteSql normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('ExcuteSqlTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + "************* ExcuteSqlTest0004 start *************");
            var u8 = new Uint8Array([3, 4, 5])
            //插入
                const valueBucket = {
                    "name": "zhangsan",
                    "age": 18,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(10).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            {
                const valueBucket = {
                    "name": "lisi",
                    "age": 19,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(11).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            }
            {
                const valueBucket = {
                    "name": "lisi",
                    "age": 28,
                    "salary": 100.5,
                    "blobType": u8,
                }
                let insertPromise = rdbStore.insert("test", valueBucket)
                insertPromise.then(async (ret) => {
                    expect(12).assertEqual(ret);
                    await console.info(TAG + "insert done: " + ret);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await insertPromise
            }
                let QuerySqlPromise = rdbStore.executeSql("DROP TABLE IF EXISTS test")
                QuerySqlPromise.then(async (resultSet) => {
                    await console.info(TAG + "executeSql done: " + resultSet);
                }).catch((err) => {
                    expect(null).assertFail();
                })
                await QuerySqlPromise
    
            done();
            console.info(TAG + "************* ExcuteSqlTest0004 end   *************");
        })
    
    
        console.info(TAG + "*************Unit Test End*************");
    })
}
