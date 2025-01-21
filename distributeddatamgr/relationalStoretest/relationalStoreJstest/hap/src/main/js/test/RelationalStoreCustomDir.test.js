/*
* Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import data_Rdb from '@ohos.data.relationalStore';
import ability_featureAbility from '@ohos.ability.featureAbility';

var context = ability_featureAbility.getContext();

const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
export default function relationalStoreCustomDirTest() {
  describe('relationalStoreCustomDirTest', function () {
    beforeAll(async function () {
      console.info(TAG + "*************Unit Test Begin*************");
      console.info(TAG + 'beforeAll');
    })

    beforeEach(function () {
      console.info(TAG + 'beforeEach');
    })

    afterEach(async function () {
      console.info(TAG + 'afterEach');

    })

    afterAll(async function () {
      console.info(TAG + 'afterAll');
      console.info(TAG + "*************Unit Test end*************");
    })

    /**
     * @tc.name RelationalStore store Single level directory getRdbStore callback test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_1700
     * @tc.desc RelationalStore store Single level directory getRdbStore callback test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest0100', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest0100 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "test"
      }
      data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, rdbStore) => {
        if (err == null) {
          console.info(TAG + "getRdbStore done: " + rdbStore);
          expect(rdbStore != null).assertTrue();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          expect(null).assertFail();
        }
      })
      await sleep(1000);
      data_Rdb.deleteRdbStore(context, STORE_CONFIG,async(err)=>{
        if(err){
          console.error(TAG+`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
        }
        console.info(TAG+`Delete RdbStore successfully.`);
      })
      await sleep(1000);
      done();
      console.info(TAG + "************* CustomDirTest0100 end*************");
    })
    /**
     * @tc.name RelationalStore store Single level directory getRdbStore promise test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_1800
     * @tc.desc RelationalStore store Single level directory getRdbStore promise test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest0200', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest0200 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "test"
      }
      await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
        console.info(TAG + "getRdbStore done: " + rdbStore);
        expect(rdbStore != null).assertTrue();
      }).catch((err) => {
        console.info(`Get RdbStore failed,code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG).then(()=>{
        console.info(TAG+"Delete RdbStore successfully");
      }).catch((err)=>{
        console.info(TAG+"Delete RdbStore failed"+err.code+ err.message);
      })
      done();
      console.info(TAG + "************* CustomDirTest0200 end   *************");
    })
    /**
     * @tc.name RelationalStore store Single level directory insert update delete query test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_1900
     * @tc.desc RelationalStore store Single level directory insert update delete query test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest0300', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest0300start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "test"
      }
      let store = null;
      try {
        store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        await store.executeSql(CREATE_TABLE_TEST,null);
      } catch (e) {
        expect(null).assertFail();
      }
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await store.insert("test", valueBucket).then(async (ret) => {
        console.log(TAG + "************* insert start  *************");
        console.info(TAG + "insert  done: " + ret)
        expect(1).assertEqual(ret);
        console.log(TAG + "************* insert end  *************");
      }).catch((err) => {
        console.log(TAG + "insert with null table" + err);
        expect().assertFail();
      })
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      await store.query(predicates).then(async (resultSet) => {
        console.info(TAG + "************* query start*************");
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
        console.info(TAG + "************* query end*************");
        resultSet.close();
        resultSet = null;
      }).catch((err) => {
        console.info("query error " + err);
        expect().assertFail();
      })
      const valueBucket1 = {
        "name": "lisi",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      predicates.equalTo("name", "zhangsan");
      await store.update(valueBucket1, predicates).then(async (rows) => {
        console.info(TAG + "*************update start*************");
        console.info(TAG + "Updated row count:" + rows);
        expect(1).assertEqual(rows);
        console.info(TAG + "*************update end*************");
      }).catch((err) => {
        console.info("update error " + err);
        expect().assertFail();
      })
      let predicates1 = new data_Rdb.RdbPredicates("test");
      predicates1.equalTo("name", "lisi");
      await store.query(predicates1).then(async (resultSet) => {
        console.info(TAG + "************* query start*************");
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow())
        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
        const name = resultSet.getString(resultSet.getColumnIndex("name"))
        const age = resultSet.getLong(resultSet.getColumnIndex("age"))
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(1).assertEqual(id);
        expect("lisi").assertEqual(name)
        expect(18).assertEqual(age)
        expect(100.5).assertEqual(salary)
        expect(1).assertEqual(blobType[0])
        expect(2).assertEqual(blobType[1])
        expect(3).assertEqual(blobType[2])
        expect(false).assertEqual(resultSet.goToNextRow())
        console.info(TAG + "************* query end*************");
        resultSet.close();
        resultSet = null;
      }).catch((err) => {
        console.info("query error " + err);
        expect().assertFail();
      })
      await store.delete(predicates1).then(async (rows) => {
        console.info(TAG + "************* delete start*************")
        console.info(TAG + "delete done:"+ rows);
        expect(1).assertEqual(rows);
        console.info(TAG + "************* delete end*************")
      }).catch((err) => {
        console.info("delete error " + err)
      })
      await store.query(predicates1).then(async (resultSet) => {
        console.info(TAG + "resultSet query done");
        console.info(TAG + "************* query start*************")
        console.info(TAG+"query result:"+resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        console.info(TAG + "************* query end*************")
        resultSet.close();
        resultSet = null;
      }).catch((err) => {
        console.info("query error " + err);
        expect().assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      store = null;
      done();
      console.info(TAG + "************* CustomDirTest0300 end   *************");
    })
    /**
     * @tc.name RelationalStore store Multi-level directory getRdbStore callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2000
     * @tc.desc RelationalStore store Multi-level directory getRdbStore callback
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest0400', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest0400 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/testrdb/test/rdb"
      }
      data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, rdbStore) => {
        if (err == null) {
          console.info(TAG + "getRdbStore Success: " + rdbStore);
          expect(rdbStore != null).assertTrue();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          expect(null).assertFail();
        }
      })
      await sleep(1000);
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest0400 end *************");
    })
    /**
     * @tc.name RelationalStore store Multi-level directory getRdbStore promise
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2100
     * @tc.desc cRelationalStore store Multi-level directory getRdbStore promise
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest0500', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest0500 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/testrdb/test/rdb"
      }
      await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
        console.info(TAG + "getRdbStore done: " + rdbStore);
        expect(rdbStore != null).assertTrue();
      }).catch((err) => {
        console.info(`Get RdbStore failed,code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest0500 end   *************");
    })
    /**
     * @tc.name RelationalStore store Multi-level directory insert update delete query test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2200
     * @tc.desc RelationalStore store Multi-level directory insert update delete query test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest0600', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest0600start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/testrdb/test/rdb"
      }
      let store = null;
      try {
        store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        await store.executeSql(CREATE_TABLE_TEST, null);
      } catch (e) {
        expect(null).assertFail();
      }
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await store.insert("test", valueBucket).then(async (ret) => {
        console.log(TAG + "************* insert start  *************");
        console.info(TAG + "insert  done: " + ret)
        expect(1).assertEqual(ret);
        console.log(TAG + "************* insert end  *************");
      }).catch((err) => {
        console.log(TAG + "insert with null table" + err);
        expect().assertFail();
      })
      let predicates = new data_Rdb.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      await store.query(predicates).then(async (resultSet) => {
        console.info(TAG + "************* query start*************");
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
        console.info(TAG + "************* query end*************");
        resultSet.close();
        resultSet = null;
      }).catch((err) => {
        console.info("query error " + err);
        expect().assertFail();
      })
      const valueBucket1 = {
        "name": "lisi",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      predicates.equalTo("name", "zhangsan");
      await store.update(valueBucket1, predicates).then(async (rows) => {
        console.info(TAG + "*************update start*************");
        console.info(TAG + "Updated row count:" + rows);
        expect(1).assertEqual(rows);
        console.info(TAG + "*************update end*************");
      }).catch((err) => {
        console.info("update error " + err);
        expect().assertFail();
      })
      let predicates1 = new data_Rdb.RdbPredicates("test");
      predicates1.equalTo("name", "lisi");
      await store.query(predicates1).then(async (resultSet) => {
        console.info(TAG + "************* query start*************");
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow())
        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
        const name = resultSet.getString(resultSet.getColumnIndex("name"))
        const age = resultSet.getLong(resultSet.getColumnIndex("age"))
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(1).assertEqual(id);
        expect("lisi").assertEqual(name)
        expect(18).assertEqual(age)
        expect(100.5).assertEqual(salary)
        expect(1).assertEqual(blobType[0])
        expect(2).assertEqual(blobType[1])
        expect(3).assertEqual(blobType[2])
        expect(false).assertEqual(resultSet.goToNextRow())
        console.info(TAG + "************* query end*************");
        resultSet.close();
        resultSet = null;
      }).catch((err) => {
        console.info("query error " + err);
        expect().assertFail();
      })
      await store.delete(predicates1).then(async (rows) => {
        console.info(TAG + "************* delete start*************")
        console.info(TAG + "delete done:"+rows);
        expect(1).assertEqual(rows);
        console.info(TAG + "************* delete end*************")
      }).catch((err) => {
        console.info("delete error " + err)
      })
      await store.query(predicates1).then(async (resultSet) => {
        console.info(TAG + "resultSet query done");
        console.info(TAG + "************* query start*************")
        console.info(TAG+"query result:"+resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        console.info(TAG + "************* query end*************")
        resultSet.close();
        resultSet = null;
      }).catch((err) => {
        console.info("query error " + err);
        expect().assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      store = null;
      done();
      console.info(TAG + "************* CustomDirTest0600 end   *************");
    })


    /**
     * @tc.name RelationalStore store customDir: "" getRdbStore test callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2300
     * @tc.desc RelationalStore store customDir: "" getRdbStore test callback
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest0700', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest0700 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: ""
      }
      data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, rdbStore) => {
        if (err == null) {
          console.info(TAG + "getRdbStore done: " + rdbStore);
          expect(rdbStore != null).assertTrue();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          expect(null).assertFail();
        }
      })
      await sleep(1000);
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest0700 end *************");

    })
    /**
     * @tc.name RelationalStore store customDir: "" getRdbStore test promise
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2400
     * @tc.desc RelationalStore store customDir: "" getRdbStore test promise
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest0800', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest0800 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: ""
      };
      await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
        console.info(TAG + "getRdbStore done: " + rdbStore);
        expect(rdbStore != null).assertTrue();

      }).catch((err) => {
        console.info(`Get RdbStore failed,code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest0800 end   *************");
    })
    /**
     * @tc.name RelationalStore store customDir:null getRdbStore test callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2500
     * @tc.desc RelationalStore store customDir:null getRdbStore test callback
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest0900', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest0900 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: null
      }
      data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, rdbStore) => {
        if (err == null) {
          console.info(TAG + "getRdbStore done: " + rdbStore);
          expect(rdbStore != null).assertTrue();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          expect(null).assertFail();
        }
      })
      await sleep(1000);
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest0900 end *************");

    })

    /**
     * @tc.name RelationalStore store customDir:null getRdbStore test promise
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2600
     * @tc.desc RelationalStore store customDir:null getRdbStore test promise
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest1000', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest1000 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: null
      }
      await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
        console.info(TAG + "getRdbStore done: " + rdbStore);
        expect(rdbStore != null).assertTrue();
      }).catch((err) => {
        console.info(`Get RdbStore failed,code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest1000 end   *************");
    })
    /**
     * @tc.name RelationalStore store customDir: undefined getRdbStore test callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2700
     * @tc.desc RelationalStore store customDir: undefined getRdbStore test callback
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest1100', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest1100 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: undefined
      }
      data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, rdbStore) => {
        if (err == null) {
          console.info(TAG + "getRdbStore done: " + rdbStore);
          expect(rdbStore != null).assertTrue();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          expect(null).assertFail();
        }
      })
      await sleep(1000);
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest1100 end *************");

    })
    /**
     * @tc.name RelationalStore store customDir: undefined getRdbStore test promise
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2800
     * @tc.desc RelationalStore store customDir: undefined getRdbStore test promise
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest1200', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest1200 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: undefined
      }
      await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
        console.info(TAG + "getRdbStore done: " + rdbStore);
        expect(rdbStore != null).assertTrue();
      }).catch((err) => {
        console.info(`Get RdbStore failed,code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest1200 end   *************");
    })
    /**
     * @tc.name RelationalStore store customDir:"*"  getRdbStore test callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2900
     * @tc.desc RelationalStore store customDir:"*"  getRdbStore test callback
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest1300', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest1300 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "*"
      }
      data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, rdbStore) => {
        if (err == null) {
          console.info(TAG + "getRdbStore done: " + rdbStore);
          expect(rdbStore != null).assertTrue();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          expect(null).assertFail();
        }
      })
      await sleep(1000);
      data_Rdb.deleteRdbStore(context, STORE_CONFIG,async(err)=>{

        if(err){
          console.error(TAG+`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
        }
        console.info(TAG+`Delete RdbStore successfully.`);
      })
      await sleep(1000)
      done()
      console.info(TAG + "************* CustomDirTest1300 end *************");
    })
    /**
     * @tc.name RelationalStore store customDir:"*"  getRdbStore test promise
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3000
     * @tc.desc RelationalStore store customDir:"*"  getRdbStore test promise
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest1400', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest1400 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "*"
      }
      await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
        console.info(TAG + "getRdbStore done: " + rdbStore);
        expect(rdbStore != null).assertTrue();
      }).catch((err) => {
        console.info(`Get RdbStore failed,code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG).then(()=>{
        console.info(TAG+"Delete RdbStore successfully");
      }).catch((err)=>{
        console.info(TAG+"Delete RdbStore failed"+err.code+ err.message);
      })
      done();
      console.info(TAG + "************* CustomDirTest1400 end   *************");
    })

    /**
     * @tc.name RelationalStore store Sandbox Path 128 bytes customDir:Multi-level directory  getRdbStore test callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3100
     * @tc.desc RelationalStore store Sandbox Path 128 bytes customDir:Multi-level directory getRdbStore test callback
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest1500', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest1500 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/ttst/tee00/11/tee2288000000/#% 0t00/123323vjkdfn/48378498/nvnvnvn/88999/vvbbb/nvjdnvj/8"
      }
      data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, rdbStore) => {
        if (err == null) {
          console.info(TAG + "getRdbStore done: " + rdbStore);
          expect(rdbStore != null).assertTrue();

        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          expect(null).assertFail();
        }
      })
      await sleep(1000);
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest1500 end*************");
    })
    /**
     * @tc.name RelationalStore store Sandbox Path 128 bytes customDir:Multi-level directory getRdbStore test promise
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3200
     * @tc.desc RelationalStore store Sandbox Path 128 bytes customDir:Multi-level directory getRdbStore test promise
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest1600', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest1600 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir:"data/app/el2/100/database/bundleName/rdb/ttst/tee00/11/tee2288000000/#% 0t00/123323vjkdfn/48378498/nvnvnvn/88999/vvbbb/nvjdnvj/8"
      }
      await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
        console.info(TAG + "getRdbStore done: " + rdbStore);
        expect(rdbStore != null).assertTrue();
      }).catch((err) => {
        console.info(`Get RdbStore failed,code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest1600 end   *************");
    })
    /**
     * @tc.name RelationalStore store Sandbox Path 129 bytes customDir:Multi-level directory getRdbStore test callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3300
     * @tc.desc RelationalStore store Sandbox Path 129 bytes customDir:Multi-level directory  getRdbStore test callback
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest1700', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest1700 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir:"data/app/el2/100/database/bundleName/rdb/ttst/tee00/11/tee2288000000/#% 0t00/123323vjkdfn/48378498/nvnvnvn/88999/vvbbb/nvjdnvj/78"
      }
      try {
        data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, store) => {
          if (err) {
            console.error(TAG+"catch err: Get RdbStore failed, err: code=" + err.code + " message=" + err.message);
            done()
            expect(null).assertFail()
          } else {
            done()
            expect(null).assertFail()
          }
        })
      } catch (err) {
        console.error(TAG+"catch err:  code=" + err.code + " message=" + err.message);
        done()
        expect("401").assertEqual(err.code);
        console.info(TAG + "************* CustomDirTest1700 end *************");
      }

    })
    /**
     * @tc.name RelationalStore store Sandbox Path 129 bytes customDir:Multi-level directory  getRdbStore test promise
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3400
     * @tc.desc RelationalStore store Sandbox Path 129 bytes customDir:Multi-level directory  getRdbStore test promise
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest1800', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest1800 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir:"data/app/el2/100/database/bundleName/rdb/ttst/tee00/11/tee2288000000/#% 0t00/123323vjkdfn/48378498/nvnvnvn/88999/vvbbb/nvjdnvj/78"
      }
      try{
        await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
          done()
          expect(null).assertFail();
        }).catch((err) => {
          done()
          console.info(TAG + `Get RdbStore failed, err: code= ${err.code}, message = ${err.message}`);
          expect(null).assertFail();
        })
      }catch(err){
        console.info(TAG,"catch err: Get RdbStore failed, err: code=" + err.code + " message=" + err.message);
        done();
        expect("401").assertEqual(err.code);
        console.info(TAG + "************* CustomDirTest1800 end   *************");
      }

    })

    /**
     * @tc.name RelationalStore getrdbStore-deleteRdbStore-getrdbStore test callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3500
     * @tc.desc RelationalStore getrdbStore-deleteRdbStore-getrdbStore test callback
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest1900', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest1900 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/test"
      }
      try {
        data_Rdb.getRdbStore(context, STORE_CONFIG,async (err, rdbStore) =>{
          console.info(TAG + "getRdbStore done: " + rdbStore);
          await rdbStore.executeSql(CREATE_TABLE_TEST,null);
        })
      } catch (e) {
        expect(null).assertFail();
      }
      await sleep(1000);
      data_Rdb.deleteRdbStore(context, STORE_CONFIG,async(err)=>{
        if(err){
          console.error(TAG+`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
        }
        console.info(TAG+`Delete RdbStore successfully.`);
      })
      await sleep(1000);
      const STORE_CONFIG1 = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/test"
      }
      data_Rdb.getRdbStore(context, STORE_CONFIG1, async (err, rdbStore) => {
        if (err) {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          expect(null).assertFail();
        }
        console.info(TAG + "getRdbStore done: " + rdbStore);
        expect(rdbStore != null).assertTrue();
      })
      await sleep(1000);
      await  data_Rdb.deleteRdbStore(context, STORE_CONFIG1).then(()=>{
        console.info(TAG+"Delete RdbStore successfully.");
      }).catch((err)=>{
        console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      done();
      console.info(TAG + "************* CustomDirTest1900 end*************");
    })
    /**
     * @tc.name RelationalStore getrdbStore-deleteRdbStore-getrdbStore test promise
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3600
     * @tc.desc RelationalStore getrdbStore-deleteRdbStore-getrdbStore test promise
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest2000', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest2000 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/test"
      }
      try {
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        await store.executeSql(CREATE_TABLE_TEST,null);
        console.info(TAG + "getRdbStore done: " + store);
      } catch (e) {
        expect(null).assertFail();
      }
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG).then(()=>{
        console.info(TAG+"Delete RdbStore successfully.");
      }).catch((err)=>{
        console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      const STORE_CONFIG1 = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/test"
      }
      await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
        console.info(TAG + "getRdbStore done: " + rdbStore);
        expect(rdbStore != null).assertTrue();
      }).catch((err) => {
        console.info(`Get RdbStore failed,code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG1);
      done();
      console.info(TAG + "************* CustomDirTest2000 end   *************");
    })
    /**
     * @tc.name RelationalStore store Sandbox Path 128 bytes customDir:Single level directory   getRdbStore test callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3700
     * @tc.desc RelationalStore store Sandbox Path 128 bytes customDir:Single level directory  getRdbStore test callback
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest2100', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest2100 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "dataappel66teeeeeeeee67eeeehfghfgheeeeeeeee!@#@$$#%%(*  (eeee9988711ssssssssss+_)25555555555555hfhfg55gggggghgfhhhfghfghgfhfhfgh"
      }
      data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, rdbStore) => {
        if (err == null) {
          console.info(TAG + "getRdbStore done: " + rdbStore);
          expect(rdbStore != null).assertTrue();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          expect(null).assertFail();
        }
      })
      await sleep(1000);
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest2100 end*************");
    })
    /**
     * @tc.name RelationalStore store Sandbox Path 128 bytes customDir:Single level directory    getRdbStore test promise
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3800
     * @tc.desc RelationalStore store Sandbox Path 128 bytes customDir:Single level directory  getRdbStore test promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest2200', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest2200 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "dataappel66teeeeeeeee67eeeehfghfgheeeeeeeee!@#@$$#%%(*  (eeee9988711ssssssssss+_)25555555555555hfhfg55gggggghgfhhhfghfghgfhfhfgh"
      }
      await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
        console.info(TAG + "getRdbStore done: " + rdbStore);
        expect(rdbStore != null).assertTrue();
      }).catch((err) => {
        console.info(`Get RdbStore failed,code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
      console.info(TAG + "************* CustomDirTest2200 end   *************");
    })
    /**
     * @tc.name RelationalStore store Sandbox Path 129 bytes customDir:Single level directory   getRdbStore test callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3900
     * @tc.desc RelationalStore store Sandbox Path 129 bytes customDir:Single level directory getRdbStore test callback
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest2300', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest2300 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir:"dataappel66teeeeeeeee67eeeehfghfgheeeeeeeee!@#@$$#%%(*  (eeee9988711ssssssssss+_)25555555555555hfhfg55gggggghgfhhhfghfghgfhfhfgh5"
      }
      try {
        data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, store) => {
          if (err) {
            console.error(TAG, "catch err: Get RdbStore failed111111, err: code=" + err.code + " message=" + err.message);
            done()
            expect().assertFail();
          } else {
            done()
            expect().assertFail();
          }
        })
      } catch (err) {
        console.error(TAG, "catch err: Get RdbStore failed, err: code=" + err.code + " message=" + err.message);
        done()
        expect("401").assertEqual(err.code);
        console.info(TAG + "************* CustomDirTest2300 end *************");
      }

    })

    /**
     * @tc.name RelationalStore store Sandbox Path 129 bytes customDir:Single level directory   getRdbStore test promise
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_4000
     * @tc.desc RelationalStore store Sandbox Path 129 bytes customDir:Single level directory getRdbStore test promise
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest2400', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest2400 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir:"dataappel66teeeeeeeee67eeeehfghfgheeeeeeeee!@#@$$#%%(*  (eeee9988711ssssssssss+_)25555555555555hfhfg55gggggghgfhhhfghfghgfhfhfgh5"
      }
      try{
        await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
          done()
          expect(null).assertFail();
        }).catch((err) => {
          console.info(TAG + `catch err: failed: err: code= ${err.code}, message = ${err.message}`);
          done()
          expect(null).assertFail();
        })
      }catch(err){
        console.error(TAG, "catch err: Get RdbStore failed, err: code=" + err.code + " message=" + err.message);
        done()
        expect("401").assertEqual(err.code);
        console.info(TAG + "************* CustomDirTest2400 end   *************");
      }
    })

    /**
     * @tc.name RelationalStore store backup and restore promise test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_4100
     * @tc.desc RelationalStore store backup and restore promise test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest2500', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest2500 *************");
      let backupName = "BackupTest003.db"
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/test/rdbStore.db"
      }
      let store = null;
      try {
        store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        await store.executeSql(CREATE_TABLE_TEST,null);
      } catch (e) {
        expect(null).assertFail();
      }
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await store.insert("test", valueBucket).then(async (ret) => {
        console.log(TAG + "************* insert start  *************");
        console.info(TAG + "insert  done: " + ret)
        expect(1).assertEqual(ret);
        console.log(TAG + "************* insert end  *************");
      }).catch((err) => {
        console.log(TAG + "insert with null table" + err);
        expect().assertFail();
        done();
      })
      try {
        store.backup(backupName, (err, data) => {
          if(err != null){
            console.info(TAG + "Backup error: " + err)
            expect().assertFail();
            done();
          }
          data_Rdb.deleteRdbStore(context, STORE_CONFIG, (err) => {
            if(err != null){
              console.info(TAG + " deleteRdbStore done")
              expect().assertFail();
              done();
            }
            store.restore(backupName, (err, data) => {
              expect(err == null).assertTrue()
              console.info(TAG + " restore successful " )
            })
          })
        })
      } catch(errInfo){
        console.info(TAG + "BackupCallbackTest error: " + errInfo)
        expect().assertFail();
        done();
      }

      let predicates = new data_Rdb.RdbPredicates("test");
      await store.query(predicates).then(async (resultSet) => {
        console.info(TAG + "************* query start*************");
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
        console.info(TAG + "************* query end*************");
        resultSet.close();
        resultSet = null;
        data_Rdb.deleteRdbStore(context, STORE_CONFIG);
        done();
      }).catch((err) => {
        console.info("query error " + err);
        expect().assertFail();
        done();
      })
      console.info(TAG + "************* CustomDirTest2500 end   *************");
    })

    /**
     * @tc.name RelationalStore store backup and restore callback test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_4200
     * @tc.desc RelationalStore store backup and restore callback test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest2600', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest2600 start *************");
      let backupName = "BackupTest003.db"
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir:"data/app/el2/100/database/bundleName/rdb/test/rdbStore1.db"}
      data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, store) => {
        if (err == null) {
          console.info(TAG + "getRdbStore done: " + store);
          expect(store != null).assertTrue();
          await store.executeSql(CREATE_TABLE_TEST,null);
          let u8 = new Uint8Array([1, 2, 3]);
          const valueBucket = {
            "name": "zhangsan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          }
          await store.insert("test", valueBucket).then(async (ret) => {
            console.log(TAG + "************* insert start  *************");
            console.info(TAG + "insert  done: " + ret)
            expect(1).assertEqual(ret);
            console.log(TAG + "************* insert end  *************");
          }).catch((err) => {
            console.log(TAG + "insert with null table" + err);
            expect().assertFail();
            done();
          })
          try {
            store.backup(backupName, (err, data) => {
              if(err != null){
                console.info(TAG + "Backup error: " + err)
                expect().assertFail();
                done();
              }
              data_Rdb.deleteRdbStore(context, STORE_CONFIG, (err) => {
                if(err != null){
                  console.info(TAG + " deleteRdbStore done")
                  expect().assertFail();
                  done();
                }
                store.restore(backupName, (err, data) => {
                  expect(err == null).assertTrue()
                  console.info(TAG + " restore successful ")
                })
              })
            })
          } catch(errInfo){
            console.info(TAG + "BackupCallbackTest error: " + errInfo)
            expect().assertFail();
            done();
          }

          let predicates = new data_Rdb.RdbPredicates("test");
          await store.query(predicates).then(async (resultSet) => {
            console.info(TAG + "************* query start*************");
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
            console.info(TAG + "************* query end*************");
            resultSet.close();
            resultSet = null;
            data_Rdb.deleteRdbStore(context, STORE_CONFIG);
            done();
            console.info(TAG + "************* CustomDirTest2600 end*************");
          }).catch((err) => {
            console.info("query error " + err);
            expect().assertFail();
            done();
          })
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          expect(null).assertFail();
        }
      })
    })

    /**
     * @tc.name RelationalStore store encrypt promise test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_4300
     * @tc.desc RelationalStore store encrypt promise test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest2700', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest2700start *************");
      const STORE_CONFIG = {
        name: "rdbStore1.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        encrypt:true,
        customDir: "data/app/el2/100/database/bundleName/rdb/test/rdbStore1.db"
      }
      let store = null;
      try {
        store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        await store.executeSql(CREATE_TABLE_TEST,null);
      } catch (e) {
        expect(null).assertFail();
      }
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await store.insert("test", valueBucket).then(async (ret) => {
        console.log(TAG + "************* insert start  *************");
        console.info(TAG + "insert  done: " + ret)
        expect(1).assertEqual(ret);
        console.log(TAG + "************* insert end  *************");
      }).catch((err) => {
        console.log(TAG + "insert with null table" + err);
        expect().assertFail();
      })
      let predicates = new data_Rdb.RdbPredicates("test");
      await store.query(predicates).then(async (resultSet) => {
        console.info(TAG + "************* query start*************");
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
        console.info(TAG + "************* query end*************");
        resultSet.close();
        resultSet = null;
      }).catch((err) => {
        console.info("query error " + err);
        expect().assertFail();
        done();
      })
      const valueBucket1 = {
        "name": "zhangsan",
        "age": 21,
        "salary": 100.5,
        "blobType": u8,
      }
      predicates.equalTo("name", "zhangsan");
      await store.update(valueBucket1, predicates).then(async (rows) => {
        console.info(TAG + "*************update start*************");
        console.info(TAG + "Updated row count:" + rows);
        expect(1).assertEqual(rows);
        console.info(TAG + "*************update end*************");
      }).catch((err) => {
        console.info("update error " + err);
        expect().assertFail();
        done();
      })
      let predicates1 = new data_Rdb.RdbPredicates("test");
      await store.query(predicates1).then(async (resultSet) => {
        console.info(TAG + "************* query start*************");
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
        expect(21).assertEqual(age)
        expect(100.5).assertEqual(salary)
        expect(1).assertEqual(blobType[0])
        expect(2).assertEqual(blobType[1])
        expect(3).assertEqual(blobType[2])
        expect(false).assertEqual(resultSet.goToNextRow())
        console.info(TAG + "************* query end*************");
        resultSet.close();
        resultSet = null;
      }).catch((err) => {
        console.info("query error " + err);
        expect().assertFail();
        done();
      })
      await store.delete(predicates).then(async (rows) => {
        console.info(TAG + "************* delete start*************")
        console.info(TAG + "delete done");
        expect(1).assertEqual(rows);
        console.info(TAG + "************* delete end*************")
      }).catch((err) => {
        console.info("delete error " + err)
        expect().assertFail();
        done();
      })
      await store.query(predicates1).then(async (resultSet) => {
        console.info(TAG + "resultSet query done");
        console.info(TAG + "************* query start*************")
        expect(0).assertEqual(resultSet.rowCount);
        console.info(TAG + "************* query end*************")
        resultSet.close();
        resultSet = null;
      }).catch((err) => {
        console.info("query error " + err);
        expect().assertFail();
        done();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      store = null;
      done();
      console.info(TAG + "************* CustomDirTest2700 end   *************");
    })

    /**
     * @tc.name RelationalStore store encrypt callback test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_4400
     * @tc.desc RelationalStore store encrypt callback test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomDirTest2800', 0, async function (done) {
      console.info(TAG + "************* CustomDirTest2800 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db2",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/test/rdbStore2.db"
      }
      data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, store) => {
        if (err == null) {
          console.info(TAG + "getRdbStore done: " + store);
          expect(store != null).assertTrue();
          await store.executeSql(CREATE_TABLE_TEST, null);
          let u8 = new Uint8Array([1, 2, 3]);
          const valueBucket = {
            "name": "zhangsan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          }
          await store.insert("test", valueBucket).then(async (ret) => {
            console.log(TAG + "************* insert start  *************");
            console.info(TAG + "insert  done: " + ret)
            expect(1).assertEqual(ret);
            console.log(TAG + "************* insert end  *************");
          }).catch((err) => {
            console.log(TAG + "insert with null table" + err);
            expect().assertFail();
          })
          let predicates = new data_Rdb.RdbPredicates("test");
          await store.query(predicates).then(async (resultSet) => {
            console.info(TAG + "************* query start*************");
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
            console.info(TAG + "************* query end*************");
            resultSet.close();
            resultSet = null;
          }).catch((err) => {
            console.info("query error " + err);
            expect().assertFail();
            done();
          })
          const valueBucket1 = {
            "name": "zhangsan",
            "age": 21,
            "salary": 100.5,
            "blobType": u8,
          }
          predicates.equalTo("name", "zhangsan");
          await store.update(valueBucket1, predicates).then(async (rows) => {
            console.info(TAG + "*************update start*************");
            console.info(TAG + "Updated row count:" + rows);
            expect(1).assertEqual(rows);
            console.info(TAG + "*************update end*************");
          }).catch((err) => {
            console.info("update error " + err);
            expect().assertFail();
            done();
          })
          let predicates1 = new data_Rdb.RdbPredicates("test");
          await store.query(predicates1).then(async (resultSet) => {
            console.info(TAG + "************* query start*************");
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
            expect(21).assertEqual(age)
            expect(100.5).assertEqual(salary)
            expect(1).assertEqual(blobType[0])
            expect(2).assertEqual(blobType[1])
            expect(3).assertEqual(blobType[2])
            expect(false).assertEqual(resultSet.goToNextRow())
            console.info(TAG + "************* query end*************");
            resultSet.close();
            resultSet = null;
          }).catch((err) => {
            console.info("query error " + err);
            expect().assertFail();
            done();
          })
          await store.delete(predicates).then(async (rows) => {
            console.info(TAG + "************* delete start*************")
            console.info(TAG + "delete done");
            expect(1).assertEqual(rows);
            console.info(TAG + "************* delete end*************")
          }).catch((err) => {
            console.info("delete error " + err)
            expect().assertFail();
            done();
          })
          await store.query(predicates1).then(async (resultSet) => {
            console.info(TAG + "resultSet query done");
            console.info(TAG + "************* query start*************")
            expect(0).assertEqual(resultSet.rowCount);
            console.info(TAG + "************* query end*************")
            resultSet.close();
            resultSet = null;
          }).catch((err) => {
            console.info("query error " + err);
            expect().assertFail();
            done();
          })
          await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
          store = null;
          done();
          console.info(TAG + "************* CustomDirTest2800 end*************");
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          expect(null).assertFail();
          done()
        }
      })
    })
  })
}

