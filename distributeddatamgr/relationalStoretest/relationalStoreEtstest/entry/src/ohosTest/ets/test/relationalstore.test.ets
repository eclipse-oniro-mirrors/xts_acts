/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size,TestType } from '@ohos/hypium'
import relationalStore from '@ohos.data.relationalStore';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';


let context: common.UIAbilityContext;
const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER)";

const STORE_CONFIG : relationalStore.StoreConfig= {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
let rdbStore:relationalStore.RdbStore;

export default function relationalStoreInterfaceTest() {
  describe('relationalStoreInterfaceTest', ()=> {
    beforeAll(async ()=> {
      console.info(TAG + "*************Unit Test Begin*************");
      console.info(TAG + 'beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    })

    beforeEach(async ()=> {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE, null);
    })

    afterEach(async ()=> {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context,"rdbStore.db");

    })

    afterAll(async ()=> {

      console.info(TAG + 'afterAll');

      console.info(TAG + "*************Unit Test end*************");
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
          const record :relationalStore.ValuesBucket = {
            "name": "Jim",
            "age": 30,
          }
          await (rdbStore as relationalStore.RdbStore).insert("employee", record)
          let predicates = await new relationalStore.RdbPredicates("employee");
          predicates.equalTo("age", 30);
          (rdbStore as relationalStore.RdbStore).delete(predicates,async(err, rows) => {
            if (err) {
              console.log(TAG + "delete failed" + err.code + err.message)
              expect(null).assertFail()
              done()
            } else {
              console.log(TAG + "delete successs")
              expect(1).assertEqual(rows)
              done()
            }
          })
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })
    /**
     * @tc.name query success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0200
     * @tc.desc query success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest002 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      }

      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = await new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      (rdbStore as relationalStore.RdbStore).query(predicates, async(err, resultSet) => {
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
      console.info(TAG + "************* relationalStoreTest002 end *************");
    })
      /**
       * @tc.name querysql executeSql success callback
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0300
       * @tc.desc querysql executeSql success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.info(TAG + "************* relationalStoreTest003 start *************");
        const record :relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": 30,
        }
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        (rdbStore as relationalStore.RdbStore).executeSql("DELETE FROM EMPLOYEE where name = 'Jim'", async(err:BusinessError) => {
          if (err == null) {
           // console.info(TAG + "executesql success")
            (rdbStore as relationalStore.RdbStore).querySql("SELECT * FROM EMPLOYEE", async(err:BusinessError, resultSet:relationalStore.ResultSet) => {
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
        console.info(TAG + "************* relationalStoreTest003 end *************");
      })

      /**
       * @tc.name executesql querysql success callback
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0400
       * @tc.desc executesql querysql success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.info(TAG + "************* relationalStoreTest004 start *************");
        const record :relationalStore.ValuesBucket= {
          "name": "Jim",
          "age": 30,
        }
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        (rdbStore as relationalStore.RdbStore).executeSql("DELETE FROM EMPLOYEE  WHERE name = ?",["Jim"], async(err:BusinessError) => {
          if (err == null) {
            //console.info(TAG + "executesql success ")
            (rdbStore as relationalStore.RdbStore).querySql("SELECT * FROM EMPLOYEE  WHERE name = ?",["Jim"], async(err:BusinessError, resultSet:relationalStore.ResultSet) => {
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
        console.info(TAG + "************* relationalStoreTest004 end *************");
      })
      /**
       * @tc.name querySqlSync success callback
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0500
       * @tc.desc querySqlSync success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.info(TAG + "************* relationalStoreTest005 start *************");
        const record:relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": 30,
        }
        try {
          await (rdbStore as relationalStore.RdbStore).insert("employee", record)
          let resultSet = (rdbStore as relationalStore.RdbStore).querySqlSync("SELECT * FROM EMPLOYEE  WHERE name = ?",["Jim"])
          console.info(TAG + "querysql success,resultSet.rowCount is " + resultSet.rowCount)
          expect(1).assertEqual(resultSet.rowCount)
          done()
        }catch(err){
          console.log(TAG + "querysql failed ")
          expect(null).assertFail();
          done()
        }
        console.info(TAG + "************* relationalStoreTest005 end *************");
      })
      /**
       * @tc.name backup success callback
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0600
       * @tc.desc backup success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.info(TAG + "************* relationalStoreTest006 start *************");
        const record : relationalStore.ValuesBucket= {
          "name": "Jim",
          "age": 30,
        }
        await (rdbStore as relationalStore.RdbStore).insert("employee", record)
        rdbStore.backup("backdb.db",async(err)=>{
          if (err) {
            console.log(TAG+`Backup failed, code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done()
          }
          else {
            console.log(TAG+ "backup success");
            const STORE_CONFIG1 : relationalStore.StoreConfig= {
              name: "backdb.db",
              securityLevel: relationalStore.SecurityLevel.S1,
            }
            rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
            console.info(TAG + "create rdb store success")
            let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("SELECT * FROM EMPLOYEE  WHERE name = ?",["Jim"])
            console.info(TAG + "querysql success,resultSet.rowCount is " + resultSet.rowCount)
            expect(1).assertEqual(resultSet.rowCount)
            done()
          }
       })
        console.info(TAG + "************* relationalStoreTest006 end *************");
      })
      /**
       * @tc.name getrows success
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0700
       * @tc.desc getrows success
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */

      it('relationalStoreTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.log(TAG + "************* relationalStoreTest007 start *************");
          const valueBucket1:relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 30,
          }
          const valueBucket2:relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 30,
          }
          const valueBucket3:relationalStore.ValuesBucket = {
            "name": "zhoubiao",
            "age": 30,
          }
          let valueBuckets = new Array(valueBucket1, valueBucket2, valueBucket3);
          await (rdbStore as relationalStore.RdbStore).batchInsertSync("employee",valueBuckets)
          console.info(TAG + 'batchInsertSync successfully.');
          let predicates = await new relationalStore.RdbPredicates('employee');
          predicates.equalTo("age", 30);
          let resultSet = (rdbStore as relationalStore.RdbStore).querySync(predicates);
          console.info(TAG + 'querySync successfully.');
          try {
            let rows:Array<relationalStore.ValuesBucket>
            let maxCount:number = 2
            let position:number = 0
            console.log(TAG + "111111" )
            rows = await (resultSet as relationalStore.ResultSet).getRows(maxCount,position)
            console.log(TAG + "rows" + rows.length + JSON.stringify(rows[0]))
            expect(rows.length).assertEqual(2)
            done()
           }catch (err) {
            console.log(TAG + err +"relationalStoreTest008 failed" + err.code);
            expect().assertFail()
            done();
         }
        console.log(TAG + "************* relationalStoreTest007 end *************");
      })
    /**
     * @tc.name querySync success
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0800
     * @tc.desc querySync success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest008 start *************");
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": 30,
      };
        try {
            (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
            let predicates = await new relationalStore.RdbPredicates("employee");
            predicates.equalTo("age", 30);
            let resultSet: relationalStore.ResultSet = (rdbStore as relationalStore.RdbStore).querySync(predicates, ["ID", "NAME", "AGE"]);
            console.log(TAG +"resultSet.rowCount"+resultSet.rowCount);
            expect(resultSet.rowCount).assertEqual(1)
            resultSet.close();
            done()
          } catch (err) {
            console.log(TAG + "Query failed,"+err.code+err.message)
            expect().assertFail()
            done()
          }

      console.info(TAG + "************* relationalStoreTest008 end *************");
    })

    /**
     * @tc.name executesql success
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0900
     * @tc.desc executesql success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest009 start *************");
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": 30,
      };
      try {
        (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
        let data = (rdbStore as relationalStore.RdbStore).executeSync("DELETE FROM EMPLOYEE WHERE name = ?",["Jim"]);
        console.log(TAG + "query success"+ data );
        expect(data).assertEqual(1)
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest009 end *************");
    })

  })
}