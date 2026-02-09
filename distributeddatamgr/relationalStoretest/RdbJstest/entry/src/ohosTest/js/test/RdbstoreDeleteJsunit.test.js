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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
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
     * @tc.name   testRdbStoreDelete0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0100
     * @tc.desc   rdb delete test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
     * @tc.name   testRdbStoreDelete0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0200
     * @tc.desc   rdb delete test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
     * @tc.name   testRdbStoreDelete0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0300
     * @tc.desc   rdb delete test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDelete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
     * @tc.name   testRdbStoreDelete0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0400
     * @tc.desc   rdb delete test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
     * @tc.name   testRdbStoreDelete0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0500
     * @tc.desc   rdb delete test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
     * @tc.name   testRdbStoreDelete0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0600
     * @tc.desc   rdb delete test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDelete0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
         * @tc.name   dataRdbTest001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0700
         * @tc.desc   setDistributedTables success
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('dataRdbTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                done()
              })
            } catch (err) {
              console.info(TAG + "set test to be distributed table failed");
              expect(null).assertFail();
              done()
            }
            console.info(TAG + "************* dataRdbTest001 end *************");
          })
      
          /**
           * @tc.name   dataRdbTest002
           * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0800
           * @tc.desc   update success
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
          it('dataRdbTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
           * @tc.name   dataRdbTest003
           * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_0900
           * @tc.desc   query success
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
          it('dataRdbTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
           * @tc.name   dataRdbTest004
           * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1000
           * @tc.desc   querysql success
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
          it('dataRdbTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
           * @tc.name   dataRdbTest005
           * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1100
           * @tc.desc   executesql success
           * @tc.type   FUNCTION
           * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL2
           */
          it('dataRdbTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
    /**
     * @tc.name   dataRdbTest006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1001
     * @tc.desc   isNotNull errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dataRdbTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* dataRdbTest006 start *************");
      let u8 = new Uint8Array([1, 2, 3]);
      {
        const record = {
          "name": "Jim",
          "age": 30,
          'salary': 100.5,
          'blobType': u8,
        }
        await rdbStore.insert("test", record);
      }
      let predicates = new dataRdb.RdbPredicates("test");
      try{
        predicates.isNotNull(1);
        expect().assertFail();
        done();
      }catch(err) {
        expect(err.code).assertEqual('401');
        console.log(TAG+"err.code"+err.code);
        done();
      }
      console.info(TAG + "************* dataRdbTest006 end *************");
    })
    /**
     * @tc.name   dataRdbTest007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1002
     * @tc.desc   batchInsert test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dataRdbTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* dataRdbTest007 start *************");
        const record = {
            "name": "Jim",
            "age": 30,
            'salary': 100.5,
            'blobType': new Uint8Array([1, 2, 3]),
          }
        const record1 = {
            "name": "Jim",
            "age": 30,
            'salary': 100.5,
            'blobType': new Uint8Array([1, 2, 3]),
          }
        const valueBuckets = [record, record1];
        try{
          let num = await rdbStore.batchInsert("test", valueBuckets);
          expect(num).assertEqual(2);
          done();
        }catch(err) {
          console.log(TAG+"err.code"+err.code);
          expect().assertFail();
          done();
        }
        console.info(TAG + "************* dataRdbTest007 end *************");
      })
     /**
      * @tc.name   dataRdbTest008
      * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1003
      * @tc.desc   batchInsert test
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('dataRdbTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* dataRdbTest008 start *************");
        const record = {
            "name": "Jim",
            "age": 30,
            'salary': 100.5,
            'blobType': new Uint8Array([1, 2, 3]),
          }
        const record1 = {
            "name": "Jim",
            "age": 30,
            'salary': 100.5,
            'blobType': new Uint8Array([1, 2, 3]),
          }
        const valueBuckets = [record, record1];
        rdbStore.batchInsert("test", valueBuckets,async(err,num)=>{
            let num1 = num;
              if(err){
                console.log(TAG+"err.code"+err.code);
                expect().assertFail();
                done();
              }else{
                console.log(TAG+"num1:"+ num1);
                expect(num1).assertEqual(2);
                done();
              }

        });
        console.info(TAG + "************* dataRdbTest008 end *************");
      })
    /**
     * @tc.name   dataRdbTest009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1004
     * @tc.desc   update test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dataRdbTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* dataRdbTest009 start *************");
            let u8 = new Uint8Array([1, 2, 3]);
            {
            const record = {
              "name": "Jim",
              "age": 30,
              'salary': 100.5,
              'blobType': u8,
            }
            await rdbStore.insert("test", record);
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
            try{
                let num = await rdbStore.update(valueBucket, predicates);
                expect(num).assertEqual(1);
                done();
            }catch(err){
                console.log(TAG + "err.code:" + err.code + err.message);
                expect(null).assertFail();
                done();         
            }
        console.info(TAG + "************* dataRdbTest009 end *************");
    })
     /**
      * @tc.name   dataRdbTest010
      * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1005
      * @tc.desc   delete success
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('dataRdbTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* dataRdbTest010 start *************");
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
            try{
                let num = await rdbStore.delete(predicates);
                expect(num).assertEqual(1);
                done();
            }catch(err){
                console.log(TAG + "err.code:" + err.code + err.message)
                expect(null).assertFail();
                done();        
            }
        console.info(TAG + "************* dataRdbTest010 end *************");
    })
    /**
     * @tc.name   dataRdbTest011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1006
     * @tc.desc   querysql callback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dataRdbTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* dataRdbTest011 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        {
            const record = {
              "name": "Jim",
              "age": 30,
              'salary': 100.5,
              'blobType': u8,
        }
        await rdbStore.insert("test", record);
        }
        rdbStore.querySql("SELECT * FROM TEST  WHERE name = ?",["Jim"], async(err, resultSet) => {
            let resultSet1 = resultSet;
              if (err == null) {
                console.info(TAG + "querysql success,resultSet1.rowCount is " + resultSet1.rowCount);
                expect(1).assertEqual(resultSet1.rowCount);
                done();
              }
              else{
                console.log(TAG + "querysql failed ");
                expect(null).assertFail();
                done();
              }
        })
        console.info(TAG + "************* dataRdbTest011 end *************");
    })
      /**
       * @tc.name   dataRdbTest012
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1007
       * @tc.desc   querysql promise success
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('dataRdbTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* dataRdbTest012 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        {
            const record = {
              "name": "Jim",
              "age": 30,
              'salary': 100.5,
              'blobType': u8,
        }
        await rdbStore.insert("test", record);
        }
        try{
            let resultSet = await rdbStore.querySql("SELECT * FROM TEST  WHERE name = ?",["Jim"]);
            console.log(TAG + "resultSet.rowCount:" + resultSet.rowCount);
            expect(resultSet.rowCount).assertEqual(1);
            done();
        }catch(err){
            console.log(TAG + "err.code:" + err.code + err.message);
            expect().assertFail();
            done();
        }
        console.info(TAG + "************* dataRdbTest012 end *************");
    })
     /**
      * @tc.name   dataRdbTest013
      * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1008
      * @tc.desc   goToFirstRow test
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('dataRdbTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* dataRdbTest013 start *************");
      let predicates = new dataRdb.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try{
        let bool1 = resultSet.goToFirstRow();
        console.log(TAG + "resultSet.goToFirstRow():" + bool1);
        expect(bool1).assertEqual(false);
        resultSet.close();
        done();
      }catch(err){
        console.log(TAG + "err.code:" + err.code + err.message);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* dataRdbTest013 end *************");
    })
     /**
      * @tc.name   dataRdbTest014
      * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBDeleteJsAPITest_1009
      * @tc.desc   goToNextRow test
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('dataRdbTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* dataRdbTest014 start *************");
      let predicates = new dataRdb.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try{
        let bool1 = resultSet.goToNextRow();
        console.log(TAG + "resultSet.goToNextRow():" + bool1);
        expect(bool1).assertEqual(false);
        resultSet.close();
        done();
      }catch(err){
        console.log(TAG + "err.code:" + err.code + err.message);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* dataRdbTest014 end *************");
    })
    console.info(TAG + '*************Unit Test End*************');
})}
