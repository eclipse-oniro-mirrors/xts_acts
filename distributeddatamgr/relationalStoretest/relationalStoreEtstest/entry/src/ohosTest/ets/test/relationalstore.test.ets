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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
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

    })

    beforeEach(async ()=> {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE, null);
    })

    afterEach(async ()=> {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context,"rdbStore.db")
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
     * @tc.level Level 0
     */
    it('relationalStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) =>{
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
     * @tc.level Level 0
     */
    it('relationalStoreTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
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
    /**
     * @tc.name relationalStoreTest010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1000
     * @tc.desc querySync success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest010 start *************");
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": 30,
      };
      try {
        (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
        let predicates = await new relationalStore.RdbPredicates("employee where age = 30");
        let resultSet = (rdbStore as relationalStore.RdbStore).querySync(predicates);
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(resultSet.rowCount).assertEqual(1)
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest010 end *************");
    })
    /**
     * @tc.name relationalStoreTest011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1100
     * @tc.desc query success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest011 start *************");
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": 30,
      };
      try {
        (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
        let predicates = await new relationalStore.RdbPredicates("employee where age = 30");
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(resultSet.rowCount).assertEqual(1)
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest011 end *************");
    })
    /**
     * @tc.name relationalStoreTest012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2300
     * @tc.desc Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest012 start *************");
      let valueNum = Number.MIN_SAFE_INTEGER;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType("age")
        console.log(TAG + "res:" + res + typeof(res))
        expect(typeof(valueNum)).assertEqual(typeof(res))
        let str = resultSet.getString(resultSet.getColumnIndex("age"))
        expect(String(valueNum)).assertEqual(str);
        console.log(TAG + "str:" + str);
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest012 end *************");
    })
    /**
     * @tc.name relationalStoreTest013
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2400
     * @tc.desc Number.MIN_SAFE_INTEGER*10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest013 start *************");
      let valueNum = Number.MIN_SAFE_INTEGER*10;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
        console.log(TAG + "res:" + res + typeof(res))
        expect(typeof(valueNum)).assertEqual(typeof(res))
        let str = resultSet.getString(resultSet.getColumnIndex("age"))
        console.log(TAG + "str:" + str);
        console.log(TAG + "valueNum:" + valueNum);
        expect(valueNum < Number.MIN_SAFE_INTEGER).assertTrue()
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest013 end *************");
    })
    /**
     * @tc.name relationalStoreTest014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2500
     * @tc.desc Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest014 start *************");
      let valueNum = Number.MAX_SAFE_INTEGER;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
        console.log(TAG + "res:" + res + typeof(res))
        expect(typeof(valueNum)).assertEqual(typeof(res))
        let str = resultSet.getString(resultSet.getColumnIndex("age"))
        expect(String(valueNum)).assertEqual(str);
        console.log(TAG + "str:" + str);
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest014 end *************");
    })
    /**
     * @tc.name relationalStoreTest015
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2600
     * @tc.desc Number.MAX_SAFE_INTEGER*10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest015 start *************");
      let valueNum = Number.MAX_SAFE_INTEGER*10;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
        console.log(TAG + "res:" + res + typeof(res))
        let str = resultSet.getString(resultSet.getColumnIndex("age"))
        console.log(TAG + "str:" + str);
        console.log(TAG + "valueNum:" + valueNum);
        expect(valueNum > Number.MIN_SAFE_INTEGER).assertTrue()
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest015 end *************");
    })
    /**
     * @tc.name relationalStoreTest016
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2700
     * @tc.desc getColumnType test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest016 start *************");
      let valueNum = -500;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
        console.log(TAG + "res:" + res + typeof(res))
        expect(typeof(valueNum)).assertEqual(typeof(res))
        let str = resultSet.getLong(resultSet.getColumnIndex("age"))
        expect(valueNum).assertEqual(str);
        console.log(TAG + "str:" + str);
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest016 end *************");
    })
    /**
     * @tc.name relationalStoreTest017
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2800
     * @tc.desc getColumnType test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest017 start *************");
      let valueNum = 500;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
        console.log(TAG + "res:" + res + typeof(res))
        expect(typeof(valueNum)).assertEqual(typeof(res))
        let str = resultSet.getLong(resultSet.getColumnIndex("age"))
        expect(valueNum).assertEqual(str);
        console.log(TAG + "str:" + str);
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest017 end *************");
    })
    /**
     * @tc.name relationalStoreTest018
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0100
     * @tc.desc errcode is 14800001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest018 start *************");
      try {
        rdbStore.setLocale("")
        console.log(TAG + "relationalStoreTest018");
        done()
      } catch (err) {
        console.log(TAG + "err"+ err.code + err.message);
        expect("14800001").assertEqual(String(err.code))
        done()
      }
      console.info(TAG + "************* relationalStoreTest018 end *************");
    })
    /**
     * @tc.name relationalStoreTest019
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0200
     * @tc.desc errcode is 14800014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest019 start *************");
      rdbStore.close();
      try {
        rdbStore.setLocale("zh")
        console.log(TAG + "relationalStoreTest019");
        done()
      } catch (err) {
        console.log(TAG + "err"+ err.code + err.message);
        expect("14800014").assertEqual(String(err.code))
        done()
      }
      console.info(TAG + "************* relationalStoreTest019 end *************");
    })
    /**
     * @tc.name relationalStoreTest020
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0300
     * @tc.desc errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest020 start *************");
      try {
        rdbStore.setLocale(undefined)
        console.log(TAG + "relationalStoreTest020");
        done()
      } catch (err) {
        console.log(TAG + "err"+ err.code + err.message);
        expect("401").assertEqual(String(err.code))
        done()
      }
      console.info(TAG + "************* relationalStoreTest020 end *************");
    })
    /**
     * @tc.name relationalStoreTest021
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0400
     * @tc.desc setLocale para is "zh-CN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest021 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
      'name': '张三',
      'age': 18,
     };
    const valueBucket2: relationalStore.ValuesBucket = {
      'name': '李四',
      'age': 18,
    };
    const valueBucket3: relationalStore.ValuesBucket = {
      'name': '王五',
      'age': 18,
    };
    await rdbStore?.insert('employee', valueBucket1);
    await rdbStore?.insert('employee', valueBucket2);
    await rdbStore?.insert('employee', valueBucket3);
      try {
        await rdbStore?.setLocale("zh-CN");
        let resultSet = await rdbStore?.querySql("select * from employee order by name collate LOCALES")
        resultSet?.goToNextRow()
        expect('李四').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('王五').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('张三').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.close()
        done()
      } catch (e) {
        console.error(`message is ${e.message}  code  ${e.code}`);
        expect().assertFail();
        done()
      }
      console.info(TAG + "************* relationalStoreTest021 end *************");
    })
    /**
     * @tc.name relationalStoreTest022
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0500
     * @tc.desc errcode is 14800001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest021 start *************");
      try {
        await rdbStore?.setLocale("%zh%");
        console.log(TAG + "relationalStoreTest022")
        expect().assertFail()
        done()
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message)
        expect("14800001").assertEqual(String(err.code));
        done()
      }
      console.info(TAG + "************* relationalStoreTest022 end *************");
    })
    /**
     * @tc.name relationalStoreTest023
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0600
     * @tc.desc setLocale para is "zh-Hans"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest023 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': '张三',
        'age': 18,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'name': '李四',
        'age': 18,
      };
      const valueBucket3: relationalStore.ValuesBucket = {
        'name': '王五',
        'age': 18,
      };
      await rdbStore?.insert('employee', valueBucket1);
      await rdbStore?.insert('employee', valueBucket2);
      await rdbStore?.insert('employee', valueBucket3);
      try {
        await rdbStore?.setLocale("zh-Hans");
        let resultSet = await rdbStore?.querySql("select * from employee order by name collate LOCALES")
        resultSet?.goToNextRow()
        expect('李四').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('王五').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('张三').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.close()
        done()
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect().assertFail();
        done()
      }
      console.info(TAG + "************* relationalStoreTest023 end *************");
    })
    /**
     * @tc.name relationalStoreTest024
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0700
     * @tc.desc setLocale para is "zh-Hant"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest024 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': '张三',
        'age': 18,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'name': '李四',
        'age': 18,
      };
      const valueBucket3: relationalStore.ValuesBucket = {
        'name': '王五',
        'age': 18,
      };
      await rdbStore?.insert('employee', valueBucket1);
      await rdbStore?.insert('employee', valueBucket2);
      await rdbStore?.insert('employee', valueBucket3);
      try {
        await rdbStore?.setLocale("zh-Hant");
        let resultSet = await rdbStore?.querySql("select * from employee order by name collate LOCALES")
        resultSet?.goToNextRow()
        expect('王五').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('张三').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('李四').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.close()
        done()
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect().assertFail();
        done()
      }
      console.info(TAG + "************* relationalStoreTest024 end *************");
    })
    /**
     * @tc.name relationalStoreTest025
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0800
     * @tc.desc setLocale para is "zh"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest025 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': '张三',
        'age': 18,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'name': '李四',
        'age': 18,
      };
      const valueBucket3: relationalStore.ValuesBucket = {
        'name': '王五',
        'age': 18,
      };
      await rdbStore?.insert('employee', valueBucket1);
      await rdbStore?.insert('employee', valueBucket2);
      await rdbStore?.insert('employee', valueBucket3);
      try {
        await rdbStore?.setLocale("zh");
        let resultSet = await rdbStore?.querySql("select * from employee order by name collate LOCALES")
        resultSet?.goToNextRow()
        expect('李四').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('王五').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('张三').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.close()
        done()
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect().assertFail();
        done()
      }
      console.info(TAG + "************* relationalStoreTest025 end *************");
    })
    /**
     * @tc.name relationalStoreTest026
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0900
     * @tc.desc setLocale para is "es"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest026 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'Fulano',
        'age': 18,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'name': 'Mengano',
        'age': 18,
      };
      const valueBucket3: relationalStore.ValuesBucket = {
        'name': 'Zutano',
        'age': 18,
      };
      await rdbStore?.insert('employee', valueBucket1);
      await rdbStore?.insert('employee', valueBucket2);
      await rdbStore?.insert('employee', valueBucket3);
      try {
        await rdbStore?.setLocale("es");
        let resultSet = await rdbStore?.querySql("select * from employee order by name collate LOCALES")
        resultSet?.goToNextRow()
        expect('Fulano').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('Mengano').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('Zutano').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.close()
        done()
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest026 end *************");
    })
  })
}