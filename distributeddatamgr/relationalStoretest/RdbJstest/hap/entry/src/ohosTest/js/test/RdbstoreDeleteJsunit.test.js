/*
 * Copyright (C) 2021-2025 Huawei Device Co., Ltd.
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

const TAG = '[RDB_JSKITS_TEST]'
const CREATE_TABLE_TEST = 'CREATE TABLE IF NOT EXISTS test (' + 'id INTEGER PRIMARY KEY AUTOINCREMENT, ' + 'name TEXT NOT NULL, ' + 'age INTEGER, ' + 'salary REAL, ' + 'blobType BLOB)';

const STORE_CONFIG = {
    name: 'Delete.db',
}
let rdbStore = undefined;

export default function rdbStoreDeleteTest() {
describe('rdbStoreDeleteTest', function () {
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
        await rdbStore.executeSql('DELETE FROM test');
        rdbStore = null
        await dataRdb.deleteRdbStore('Delete.db');
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
    })

    console.info(TAG + '*************Unit Test Begin*************');
    
    /**
     * @tc.name rdb delete test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0100
     * @tc.desc rdb delete test
     */
    it('testRdbStoreDelete0001', 0, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0001 start *************');
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 38,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除
        {
            let predicates = new dataRdb.RdbPredicates('test')
            rdbStore.delete(predicates).then(async (ret) => {
                expect(3).assertEqual(ret)
                console.info(TAG + 'Delete done: ' + ret)
                done()
                console.info(TAG + '************* testRdbStoreDelete0001 end *************');
            }).catch((err) => {
                expect(null).assertFail()
            })
        }
    })

    /**
     * @tc.name rdb delete test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0200
     * @tc.desc rdb delete test
     */
    it('testRdbStoreDelete0002', 0, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0002 start *************');
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 38,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'zhangsan')
            rdbStore.delete(predicates).then(async (ret) => {
                expect(1).assertEqual(ret)
                console.info(TAG + 'Delete done: ' + ret)
                done()
                console.info(TAG + '************* testRdbStoreDelete0002 end *************');
            }).catch((err) => {
                expect(null).assertFail()
            })
        }
    })

    /**
     * @tc.name rdb delete test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0300
     * @tc.desc rdb delete test
     */
    it('testRdbStoreDelete0003', 0, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0003 start *************');
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除前查询
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('age', 28)
            let resultSet = await rdbStore.query(predicates)
            expect(1).assertEqual(resultSet.rowCount)
        }
        //删除
        
        let predicates = await new dataRdb.RdbPredicates('test')
        predicates.equalTo('age', 28)
        rdbStore.delete(predicates).then(async (ret) => {
            expect(1).assertEqual(ret)
            console.info(TAG + 'Delete done: ' + ret)
            //删除后查询
    
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('age', 28)
            let resultSet = await rdbStore.query(predicates)
            expect(0).assertEqual(resultSet.rowCount)
        
            done()
            console.info(TAG + '************* testRdbStoreDelete0003 end *************');
        }).catch((err) => {
            expect(null).assertFail()
        })
    })

    /**
     * @tc.name rdb delete test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0400
     * @tc.desc rdb delete test
     */
    it('testRdbStoreDelete0004', 0, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0004 start *************');
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 38,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('aaa id', 1)
            rdbStore.delete(predicates).then(async (ret) => {
                console.info(TAG + 'delete done: ' + ret)
                expect(null).assertFail()
            }).catch((err) => {
                console.info(TAG + 'delete with wrong conditions')
                done();
                console.info(TAG + '************* testRdbStoreDelete0004 end *************');
            })
        }
    })

    /**
     * @tc.name rdb delete test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0500
     * @tc.desc rdb delete test
     */
    it('testRdbStoreDelete0005', 0, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0005 start *************');
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 38,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'lisi')
            rdbStore.delete(predicates).then(async (ret) => {
                expect(2).assertEqual(ret)
                console.info(TAG + 'Delete done: ' + ret)
                
                done()
                console.info(TAG + '************* testRdbStoreDelete0005 end *************');
            }).catch((err) => {
                expect(null).assertFail()
            })
        }
    })

    /**
     * @tc.name rdb delete test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0600
     * @tc.desc rdb delete test
     */
    it('testRdbStoreDelete0006', 0, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0006 start *************');
        let errInfo = undefined;
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 38,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除
        try{
            let predicates = await new dataRdb.RdbPredicates('')
            rdbStore.delete(predicates).then(async (ret) => {
                console.info(TAG + 'delete done: ' + ret)
                expect(null).assertFail()
            }).catch((err) => {
                console.info(TAG + 'delete with null')
            })
        }catch(err){
            errInfo = err
        }
        expect(errInfo.code).assertEqual("401")
        done()
        console.info(TAG + '************* testRdbStoreDelete0006 end *************');
    })
    /**
     * @tc.name setDistributedTables success
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0700
     * @tc.desc setDistributedTables success
     */
        it('dataRdbTest001', 0, async function (done) {
            console.info(TAG + "************* dataRdbTest001 start *************");
            try {
                let u8 = new Uint8Array([1, 2, 3]);
                const record = {
                  "name": "Jim",
                  "age": 30,
                  'salary': 100.5,
                  'blobType': u8,
               }
              rdbStore.setDistributedTables(['test'],async(err)=>{
                console.info(TAG + "set test to be distributed table success");
                await rdbStore.insert("test", record)
                let predicates = new dataRdb.RdbPredicates("test");
                predicates.equalTo("age", 30);
                let resultSet = await rdbStore.query(predicates)
                expect(1).assertEqual(resultSet.rowCount)
                console.info(TAG + "query success,resultSet.rowCount is " + resultSet.rowCount)
              })
            } catch (err) {
              console.info(TAG + "set test to be distributed table failed");
              expect(null).assertFail();
            }
            done()
            console.info(TAG + "************* dataRdbTest001 end *************");
          })
      
          /**
           * @tc.name update success
           * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0800
           * @tc.desc update success
           */
          it('dataRdbTest002', 0, async function (done) {
            console.info(TAG + "************* dataRdbTest002 start *************");
            let u8 = new Uint8Array([1, 2, 3]);
            {
            const record = {
              "name": "Jim",
              "age": 30,
              'salary': 100.5,
              'blobType': u8,
            }
            await rdbStore.insert("test", record)
            }
            let predicates = new dataRdb.RdbPredicates("test");
            predicates.equalTo("age", 30);
            let u9 = new Uint8Array([1, 2, 3])
            const valueBucket = {
              "name": "cathy",
              "age": 18,
              'salary': 100.5,
              'blobType': u9,
            }
            rdbStore.update(valueBucket, predicates, async(err, rows) => {
              if (err == null) {
                console.info(TAG + "update one record success,rows is " + rows)
                expect(1).assertEqual(rows)
                done()
              }
              else{
                console.log(TAG + "Updated failed ")
                expect(null).assertFail();
                done()
              }
            })
            console.info(TAG + "************* dataRdbTest002 end *************");
          })
      
          /**
           * @tc.name query success
           * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0900
           * @tc.desc query success
           */
          it('dataRdbTest003', 0, async function (done) {
            console.info(TAG + "************* dataRdbTest003 start *************");
            let u8 = new Uint8Array([1, 2, 3]);
            {
            const record = {
              "name": "Jim",
              "age": 30,
              'salary': 100.5,
              'blobType': u8,
            }
            await rdbStore.insert("test", record)
            }
            let predicates = new dataRdb.RdbPredicates("test");
            predicates.equalTo("age", 30);
            rdbStore.query(predicates,["ID", "NAME", "AGE"], async(err, resultSet) => {
              if (err == null) {
                console.info(TAG + "query one record success,resultSet.rowCount is " + resultSet.rowCount)
                expect(1).assertEqual(resultSet.rowCount)
                done()
              }
              else{
                console.log(TAG + "query failed ")
                expect(null).assertFail();
                done()
              }
            })
            console.info(TAG + "************* dataRdbTest003 end *************");
          })
          /**
           * @tc.name querysql success
           * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1000
           * @tc.desc querysql success
           */
          it('dataRdbTest004', 0, async function (done) {
            console.info(TAG + "************* dataRdbTest004 start *************");
            let u8 = new Uint8Array([1, 2, 3]);
            {
            const record = {
              "name": "Jim",
              "age": 30,
              'salary': 100.5,
              'blobType': u8,
            }
            await rdbStore.insert("test", record)
            }
            rdbStore.querySql("SELECT * FROM TEST  WHERE name = ?",["Jim"], async(err, resultSet) => {
              if (err == null) {
                console.info(TAG + "querysql success,resultSet.rowCount is " + resultSet.rowCount)
                expect(1).assertEqual(resultSet.rowCount)
                done()
              }
              else{
                console.log(TAG + "querysql failed ")
                expect(null).assertFail();
                done()
              }
            })
            console.info(TAG + "************* dataRdbTest004 end *************");
          })
      
          /**
           * @tc.name executesql success
           * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1100
           * @tc.desc executesql success
           */
          it('dataRdbTest005', 0, async function (done) {
            console.info(TAG + "************* dataRdbTest005 start *************");
            let u8 = new Uint8Array([1, 2, 3]);
            {
            const record = {
              "name": "Jim",
              "age": 30,
              'salary': 100.5,
              'blobType': u8,
            }
            await rdbStore.insert("test", record)
            }
            rdbStore.executeSql("delete FROM TEST  WHERE name = ?",["Jim"], async(err) => {
              if (err == null) {
                console.info(TAG + "executesql success")
              rdbStore.querySql("SELECT * FROM TEST  WHERE name = ?",["Jim"], async(err, resultSet) => {
              if (err == null) {
                console.info(TAG + "querysql success,resultSet.rowCount is " + resultSet.rowCount)
                expect(0).assertEqual(resultSet.rowCount)
                done()
              }
              else{
                console.log(TAG + "querysql failed ")
                expect(null).assertFail();
                done()
              }
            })
            }
            else{
                console.log(TAG + "executesql failed ")
                expect(null).assertFail();
                done()
            }
            })
            console.info(TAG + "************* dataRdbTest005 end *************");
          })
    console.info(TAG + '*************Unit Test End*************');
})}
