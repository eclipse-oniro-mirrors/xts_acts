/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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
import ability_featureAbility from '@ohos.ability.featureAbility'

var context = ability_featureAbility.getContext()

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
     * @tc.name   CustomDirTest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_1700
     * @tc.desc   RelationalStore store Single level directory getRdbStore callback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* CustomDirTest0100 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "test"
      }
      try {
        await data_Rdb.getRdbStore(context, STORE_CONFIG)
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG)
      } catch (err) {
        console.info(TAG + "CustomDirTest0100 failed, error is" + JSON.stringify(err));
      }
      console.info(TAG + "************* CustomDirTest0100 end*************");
    })
    /**
     * @tc.name   CustomDirTest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_1800
     * @tc.desc   RelationalStore store Single level directory getRdbStore promise test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG).then(() => {
        console.info(TAG + "Delete RdbStore successfully");
      }).catch((err) => {
        console.info(TAG + "Delete RdbStore failed" + err.code + err.message);
      })
      done();
      console.info(TAG + "************* CustomDirTest0200 end   *************");
    })
    /**
     * @tc.name   CustomDirTest0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_1900
     * @tc.desc   RelationalStore store Single level directory insert update delete query test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* CustomDirTest0300start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "test"
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
        console.info(TAG + "delete done:" + rows);
        expect(1).assertEqual(rows);
        console.info(TAG + "************* delete end*************")
      }).catch((err) => {
        console.info("delete error " + err)
      })
      await store.query(predicates1).then(async (resultSet) => {
        console.info(TAG + "resultSet query done");
        console.info(TAG + "************* query start*************")
        console.info(TAG + "query result:" + resultSet.rowCount);
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
     * @tc.name   CustomDirTest0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2000
     * @tc.desc   RelationalStore store Multi-level directory getRdbStore callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
          await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
          done();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          done();
          expect(null).assertFail();
        }
      })
      console.info(TAG + "************* CustomDirTest0400 end *************");
    })
    /**
     * @tc.name   CustomDirTest0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2100
     * @tc.desc   cRelationalStore store Multi-level directory getRdbStore promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
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
      console.info(TAG + "************* CustomDirTest0500 end   *************");
    })
    /**
     * @tc.name   CustomDirTest0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2200
     * @tc.desc   RelationalStore store Multi-level directory insert update delete query test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
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
        console.info(TAG + "delete done:" + rows);
        expect(1).assertEqual(rows);
        console.info(TAG + "************* delete end*************")
      }).catch((err) => {
        console.info("delete error " + err)
      })
      await store.query(predicates1).then(async (resultSet) => {
        console.info(TAG + "resultSet query done");
        console.info(TAG + "************* query start*************")
        console.info(TAG + "query result:" + resultSet.rowCount);
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
      console.info(TAG + "************* CustomDirTest0600 end   *************");
    })

    /**
     * @tc.name   CustomDirTest0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2300
     * @tc.desc   RelationalStore store customDir: "" getRdbStore test callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
          await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
          done();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          done();
          expect(null).assertFail();
        }
      })
      console.info(TAG + "************* CustomDirTest0700 end *************");

    })
    /**
     * @tc.name   CustomDirTest0800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2400
     * @tc.desc   RelationalStore store customDir: "" getRdbStore test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
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
      console.info(TAG + "************* CustomDirTest0800 end   *************");
    })
    /**
     * @tc.name   CustomDirTest0900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2500
     * @tc.desc   RelationalStore store customDir:null getRdbStore test callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
          await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
          done();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          done();
          expect(null).assertFail();
        }
      })
      console.info(TAG + "************* CustomDirTest0900 end *************");
    })

    /**
     * @tc.name   CustomDirTest1000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2600
     * @tc.desc   RelationalStore store customDir:null getRdbStore test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
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
      console.info(TAG + "************* CustomDirTest1000 end   *************");
    })
    /**
     * @tc.name   CustomDirTest1100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2700
     * @tc.desc   RelationalStore store customDir: undefined getRdbStore test callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
          await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
          done();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          done();
          expect(null).assertFail();
        }
      })
      console.info(TAG + "************* CustomDirTest1100 end *************");

    })
    /**
     * @tc.name   CustomDirTest1200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2800
     * @tc.desc   RelationalStore store customDir: undefined getRdbStore test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
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
      console.info(TAG + "************* CustomDirTest1200 end   *************");
    })
    /**
     * @tc.name   CustomDirTest1300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_2900
     * @tc.desc   RelationalStore store customDir:"*"  getRdbStore test callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
          data_Rdb.deleteRdbStore(context, STORE_CONFIG, async (err) => {
            if (err) {
              done();
              console.error(TAG + `Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
            }
            done();
            console.info(TAG + `Delete RdbStore successfully.`);
          })
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          done();
          expect(null).assertFail();
        }
      })
      console.info(TAG + "************* CustomDirTest1300 end *************");
    })
    /**
     * @tc.name   CustomDirTest1400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3000
     * @tc.desc   RelationalStore store customDir:"*"  getRdbStore test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
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
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG).then(() => {
        console.info(TAG + "Delete RdbStore successfully");
      }).catch((err) => {
        console.info(TAG + "Delete RdbStore failed" + err.code + err.message);
      })
      console.info(TAG + "************* CustomDirTest1400 end   *************");
    })

    /**
     * @tc.name   CustomDirTest1500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3100
     * @tc.desc   RelationalStore store Sandbox Path 128 bytes customDir:Multi-level directory getRdbStore test callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
          await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
          done();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          done();
          expect(null).assertFail();
        }
      })
      console.info(TAG + "************* CustomDirTest1500 end*************");
    })
    /**
     * @tc.name   CustomDirTest1600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3200
     * @tc.desc   RelationalStore store Sandbox Path 128 bytes customDir:Multi-level directory getRdbStore test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* CustomDirTest1600 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/ttst/tee00/11/tee2288000000/#% 0t00/123323vjkdfn/48378498/nvnvnvn/88999/vvbbb/nvjdnvj/8"
      }
      await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
        console.info(TAG + "getRdbStore done: " + rdbStore);
        expect(rdbStore != null).assertTrue();
      }).catch((err) => {
        console.info(`Get RdbStore failed,code is ${err.code},message is ${err.message}`);
        expect(null).assertFail();
      })
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      console.info(TAG + "************* CustomDirTest1600 end   *************");
    })
    /**
     * @tc.name   CustomDirTest1700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3300
     * @tc.desc   RelationalStore store Sandbox Path 129 bytes customDir:Multi-level directory  getRdbStore test callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* CustomDirTest1700 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/ttst/tee00/11/tee2288000000/#% 0t00/123323vjkdfn/48378498/nvnvnvn/88999/vvbbb/nvjdnvj/78"
      }
      try {
        data_Rdb.getRdbStore(context, STORE_CONFIG, async (err, store) => {
          if (err) {
            console.error(TAG + "catch err: Get RdbStore failed, err: code=" + err.code + " message=" + err.message);
            done()
            expect(null).assertFail()
          } else {
            done()
            expect(null).assertFail()
          }
        })
      } catch (err) {
        console.error(TAG + "catch err:  code=" + err.code + " message=" + err.message);
        done()
        expect("401").assertEqual(err.code);
        console.info(TAG + "************* CustomDirTest1700 end *************");
      }
    })
    /**
     * @tc.name   CustomDirTest1800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3400
     * @tc.desc   RelationalStore store Sandbox Path 129 bytes customDir:Multi-level directory  getRdbStore test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* CustomDirTest1800 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/ttst/tee00/11/tee2288000000/#% 0t00/123323vjkdfn/48378498/nvnvnvn/88999/vvbbb/nvjdnvj/78"
      }
      try {
        await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
          expect(null).assertFail();
        }).catch((err) => {
          console.info(TAG + `Get RdbStore failed, err: code= ${err.code}, message = ${err.message}`);
          expect(null).assertFail();
        })
      } catch (err) {
        console.info(TAG, "catch err: Get RdbStore failed, err: code=" + err.code + " message=" + err.message);
        expect("401").assertEqual(err.code);
        console.info(TAG + "************* CustomDirTest1800 end   *************");
      }

    })

    /**
     * @tc.name   CustomDirTest1900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3500
     * @tc.desc   RelationalStore getrdbStore-deleteRdbStore-getrdbStore test callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* CustomDirTest1900 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/test"
      }
      try {
        let rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      } catch (e) {
        expect(true).assertFail();
      }
      const STORE_CONFIG1 = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/test"
      }
      try {
        await data_Rdb.getRdbStore(context, STORE_CONFIG1);
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG1);
      } catch (err) {
        expect(true).assertFail();
      }
      console.info(TAG + "************* CustomDirTest1900 end*************");
    })
    /**
     * @tc.name   CustomDirTest2000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3600
     * @tc.desc   RelationalStore getrdbStore-deleteRdbStore-getrdbStore test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* CustomDirTest2000 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/test"
      }
      try {
        let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        await store.executeSql(CREATE_TABLE_TEST, null);
        console.info(TAG + "getRdbStore done: " + store);
      } catch (e) {
        expect(null).assertFail();
      }
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG).then(() => {
        console.info(TAG + "Delete RdbStore successfully.");
      }).catch((err) => {
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
      console.info(TAG + "************* CustomDirTest2000 end   *************");
    })
    /**
     * @tc.name   CustomDirTest2100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3700
     * @tc.desc   RelationalStore store Sandbox Path 128 bytes customDir:Single level directory  getRdbStore test callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
          await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
          done();
        } else {
          console.info(TAG + `Get RdbStore failed,code is"+${err.code}+"message is"+${err.message}`)
          done();
          expect(null).assertFail();
        }
      })
      console.info(TAG + "************* CustomDirTest2100 end*************");
    })
    /**
     * @tc.name   CustomDirTest2200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3800
     * @tc.desc   RelationalStore store Sandbox Path 128 bytes customDir:Single level directory  getRdbStore test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
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
      console.info(TAG + "************* CustomDirTest2200 end   *************");
    })
    /**
     * @tc.name   CustomDirTest2300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_3900
     * @tc.desc   RelationalStore store Sandbox Path 129 bytes customDir:Single level directory getRdbStore test callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + "************* CustomDirTest2300 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "dataappel66teeeeeeeee67eeeehfghfgheeeeeeeee!@#@$$#%%(*  (eeee9988711ssssssssss+_)25555555555555hfhfg55gggggghgfhhhfghfghgfhfhfgh5"
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
     * @tc.name   CustomDirTest2400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_4000
     * @tc.desc   RelationalStore store Sandbox Path 129 bytes customDir:Single level directory getRdbStore test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* CustomDirTest2400 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "dataappel66teeeeeeeee67eeeehfghfgheeeeeeeee!@#@$$#%%(*  (eeee9988711ssssssssss+_)25555555555555hfhfg55gggggghgfhhhfghfghgfhfhfgh5"
      }
      try {
        await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (rdbStore) => {
          expect(null).assertFail();
        }).catch((err) => {
          console.info(TAG + `catch err: failed: err: code= ${err.code}, message = ${err.message}`);
          expect(null).assertFail();
        })
      } catch (err) {
        console.error(TAG, "catch err: Get RdbStore failed, err: code=" + err.code + " message=" + err.message);
        expect("401").assertEqual(err.code);
        console.info(TAG + "************* CustomDirTest2400 end   *************");
      }
    })

    /**
     * @tc.name   CustomDirTest2500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_4100
     * @tc.desc   RelationalStore store backup and restore promise test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
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
      try {
        await store.backup(backupName);
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
        await store.restore(backupName);
      } catch (errInfo) {
        console.info(TAG + "BackupCallbackTest error: " + errInfo)
        expect().assertFail();
      }

      let predicates = new data_Rdb.RdbPredicates("test");
      let resultSet = await store.query(predicates);
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
      resultSet.close();
      resultSet = null;
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      console.info(TAG + "************* CustomDirTest2500 end   *************");
    })

    /**
     * @tc.name   CustomDirTest2600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_4200
     * @tc.desc   RelationalStore store backup and restore callback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* CustomDirTest2600 start *************");
      let backupName = "BackupTest003.db"
      const STORE_CONFIG = {
        name: "rdbStore.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/test/rdbStore1.db"
      }

      let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      expect(store != null).assertTrue();
      await store.executeSql(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let ret = await store.insert("test", valueBucket);
      expect(1).assertEqual(ret);
      await store.backup(backupName);
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      await store.restore(backupName);

      let predicates = new data_Rdb.RdbPredicates("test");
      let resultSet = await store.query(predicates)
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
      resultSet.close();
      resultSet = null;
      data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      console.info(TAG + "************* CustomDirTest2600 end*************");
    })

    /**
     * @tc.name   CustomDirTest2700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_4300
     * @tc.desc   RelationalStore store encrypt promise test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* CustomDirTest2700start *************");
      const STORE_CONFIG = {
        name: "rdbStore1.db",
        securityLevel: data_Rdb.SecurityLevel.S1,
        encrypt: true,
        customDir: "data/app/el2/100/database/bundleName/rdb/test/rdbStore1.db"
      }
      let store = null;
      store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await store.executeSql(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let ret = await store.insert("test", valueBucket);
      expect(1).assertEqual(ret);
      let predicates = new data_Rdb.RdbPredicates("test");
      let resultSet = await store.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      let id = resultSet.getLong(resultSet.getColumnIndex("id"))
      let name = resultSet.getString(resultSet.getColumnIndex("name"))
      let age = resultSet.getLong(resultSet.getColumnIndex("age"))
      let salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
      let blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
      console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
      expect(1).assertEqual(id);
      expect("zhangsan").assertEqual(name)
      expect(18).assertEqual(age)
      expect(100.5).assertEqual(salary)
      expect(1).assertEqual(blobType[0])
      expect(2).assertEqual(blobType[1])
      expect(3).assertEqual(blobType[2])
      expect(false).assertEqual(resultSet.goToNextRow())
      resultSet.close();
      resultSet = null;
      const valueBucket1 = {
        "name": "zhangsan",
        "age": 21,
        "salary": 100.5,
        "blobType": u8,
      }
      predicates.equalTo("name", "zhangsan");
      let rows = await store.update(valueBucket1, predicates)
      expect(1).assertEqual(rows);
      let predicates1 = new data_Rdb.RdbPredicates("test");
      resultSet = await store.query(predicates1);
      expect(true).assertEqual(resultSet.goToFirstRow())
      id = resultSet.getLong(resultSet.getColumnIndex("id"))
      name = resultSet.getString(resultSet.getColumnIndex("name"))
      age = resultSet.getLong(resultSet.getColumnIndex("age"))
      salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
      blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
      console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
      expect(1).assertEqual(id);
      expect("zhangsan").assertEqual(name)
      expect(21).assertEqual(age)
      expect(100.5).assertEqual(salary)
      expect(1).assertEqual(blobType[0])
      expect(2).assertEqual(blobType[1])
      expect(3).assertEqual(blobType[2])
      expect(false).assertEqual(resultSet.goToNextRow())
      resultSet.close();
      resultSet = null;
      rows = await store.delete(predicates);
      expect(1).assertEqual(rows);
      resultSet = await store.query(predicates1);
      expect(0).assertEqual(resultSet.rowCount);
      resultSet.close();
      resultSet = null;

      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      store = null;
      console.info(TAG + "************* CustomDirTest2700 end   *************");
    })

    /**
     * @tc.name   CustomDirTest2800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_4400
     * @tc.desc   RelationalStore store encrypt callback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomDirTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* CustomDirTest2800 start *************");
      const STORE_CONFIG = {
        name: "rdbStore.db2",
        securityLevel: data_Rdb.SecurityLevel.S1,
        customDir: "data/app/el2/100/database/bundleName/rdb/test/rdbStore2.db"
      }
      let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      expect(store != null).assertTrue();
      await store.executeSql(CREATE_TABLE_TEST, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let ret = await store.insert("test", valueBucket);
      expect(1).assertEqual(ret);
      let predicates = new data_Rdb.RdbPredicates("test");
      let resultSet = await store.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      let id = resultSet.getLong(resultSet.getColumnIndex("id"))
      let name = resultSet.getString(resultSet.getColumnIndex("name"))
      let age = resultSet.getLong(resultSet.getColumnIndex("age"))
      let salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
      let blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
      console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
      expect(1).assertEqual(id);
      expect("zhangsan").assertEqual(name)
      expect(18).assertEqual(age)
      expect(100.5).assertEqual(salary)
      expect(1).assertEqual(blobType[0])
      expect(2).assertEqual(blobType[1])
      expect(3).assertEqual(blobType[2])
      expect(false).assertEqual(resultSet.goToNextRow())
      resultSet.close();
      resultSet = null;
      const valueBucket1 = {
        "name": "zhangsan",
        "age": 21,
        "salary": 100.5,
        "blobType": u8,
      }
      predicates.equalTo("name", "zhangsan");
      let rows = await store.update(valueBucket1, predicates);
      expect(1).assertEqual(rows);
      let predicates1 = new data_Rdb.RdbPredicates("test");
      resultSet = await store.query(predicates1)
      expect(true).assertEqual(resultSet.goToFirstRow())
      id = resultSet.getLong(resultSet.getColumnIndex("id"))
      name = resultSet.getString(resultSet.getColumnIndex("name"))
      age = resultSet.getLong(resultSet.getColumnIndex("age"))
      salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
      blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
      console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
      expect(1).assertEqual(id);
      expect("zhangsan").assertEqual(name)
      expect(21).assertEqual(age)
      expect(100.5).assertEqual(salary)
      expect(1).assertEqual(blobType[0])
      expect(2).assertEqual(blobType[1])
      expect(3).assertEqual(blobType[2])
      expect(false).assertEqual(resultSet.goToNextRow())
      resultSet.close();
      resultSet = null;
      rows = await store.delete(predicates);
      expect(1).assertEqual(rows);
      resultSet = await store.query(predicates1);
      expect(0).assertEqual(resultSet.rowCount);
      resultSet.close();
      resultSet = null;
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      store = null;
      console.info(TAG + "************* CustomDirTest2800 end*************");

    })
  })
}