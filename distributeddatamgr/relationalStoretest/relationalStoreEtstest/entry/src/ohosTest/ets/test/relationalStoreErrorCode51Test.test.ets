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
import common from '@ohos.app.ability.common';

let context: common.UIAbilityContext;
const TAG = "[ttt]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";
let rdbStore:relationalStore.RdbStore;

const STORE_CONFIG : relationalStore.StoreConfig= {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

export default function relationalStoreErrorCode51Test() {
  describe('relationalStoreErrorCode51Test', ()=> {
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
    it('setDistributedTablesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* setDistributedTablesTest001 start *************");
      try{
        await rdbStore.setDistributedTables(["employee"],relationalStore.DistributedType.DISTRIBUTED_CLOUD)
      }catch (e) {
        console.error(TAG + `setDistributedTables failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800051);
      }
      console.info(TAG + "************* setDistributedTablesTest001 end *************");
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setDistributedTablesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* setDistributedTablesTest002 start *************");
      try{
        await rdbStore.setDistributedTables(["employee"],relationalStore.DistributedType.DISTRIBUTED_CLOUD,{autoSync: false})
      }catch (e) {
        console.error(TAG + `setDistributedTables failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800051);
      }
      console.info(TAG + "************* setDistributedTablesTest002 end *************");
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setDistributedTablesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (done:Function) =>{
      console.info(TAG + "************* setDistributedTablesTest003 start *************");
      try{
        rdbStore.setDistributedTables(["employee"],relationalStore.DistributedType.DISTRIBUTED_DEVICE,{autoSync: true}, (err) => {
          console.info(TAG +'SetDistributedTables successfully.');
          done();
        })
      }catch (e) {
        console.error(TAG + `setDistributedTables failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800051);
        done();
      }
      console.info(TAG + "************* setDistributedTablesTest003 end *************");
    });
  })
}