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
import { ValuesBucket } from '@kit.ArkData';


let context: common.UIAbilityContext;
const TAG = "[ttt]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";
let rdbStore:relationalStore.RdbStore;
const STORE_CONFIG : relationalStore.StoreConfig= {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

export default function relationalStoreErrorCode02Test() {
  describe('relationalStoreErrorCode02Test', ()=> {
    beforeAll(async ()=> {
      console.info(TAG + "*************Unit Test Begin*************");
      console.info(TAG + 'beforeAll');
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    })

    beforeEach(async ()=> {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      let u8 = new Uint8Array([3, 4, 5])
      const valueBucket :relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
        "salary":2000,
        "data4":u8
      }
      await (rdbStore as relationalStore.RdbStore).insert("employee", valueBucket);
    })

    afterEach(async ()=> {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context,"rdbStore.db");

    })

    afterAll(async ()=> {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name   relationalStoreTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const STORE_CONFIG : relationalStore.StoreConfig= {
        name: "rdbStore.db",
        securityLevel: relationalStore.SecurityLevel.S1,
        dataGroupId:"47589"
      }
      try{
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      }catch (e) {
        console.error(TAG + `deleteRdbStore failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("14801002");
      }
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })

    /**
     * @tc.name   relationalStoreTest002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const STORE_CONFIG : relationalStore.StoreConfig= {
        name: "rdbStore.db",
        securityLevel: relationalStore.SecurityLevel.S1,
        dataGroupId:"47589"
      }
      try{
        relationalStore.deleteRdbStore(context, STORE_CONFIG, (err: BusinessError) => {
          console.log(`${TAG}, relationalStoreTest038 fail err is, ${JSON.stringify(err)} `)
          expect().assertFail()
          done();
        })
      }catch (e) {
        console.error(TAG + `deleteRdbStore failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("14801002");
        done();
      }
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })

    /**
     * @tc.name   testRdbStoreAttach0001
     * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0010
     * @tc.desc   non encrypted database attach non encrypted database
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreAttach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbStoreAttach0001 start *************");
      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: "rdbstore.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      const STORE_CONFIG1: relationalStore.StoreConfig = {
        name: "rdbstore1.db",
        securityLevel: relationalStore.SecurityLevel.S1,
        dataGroupId:"47589"
      }
      const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await store.executeSql(CREATE_TABLE_TEST);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      };
      try{
        await store.insert("test", valueBucket);
      }catch (e) {
        console.error(TAG + `insert failed, code is ${e.code},message is ${e.message}`);
        expect().assertFail()
      }
      try{
        let number = await store.attach(context, STORE_CONFIG1, "attachDB",2);
        expect(1).assertEqual(number);
      }catch (e) {
        console.error(TAG + `attach failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("14801002");
      }
      console.log(TAG + "************* testRdbStoreAttach0001 end *************");
    });
  })
}