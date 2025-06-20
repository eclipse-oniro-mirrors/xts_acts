/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import common from '@ohos.app.ability.common';
let rdbStore: data_Rdb.RdbStore;
let context: common.UIAbilityContext;
async function subscribeInsert() {
  console.info(TAG + "subscribeInsert start");
  const valueBucket: data_Rdb. ValuesBucket = {
    "name": "zhangsan"
  }
  await rdbStore.insert("test", valueBucket)
  console.info(TAG + "subscribeInsert end");
}

const TAG = "[RelationalStore_Emit_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test ("
+ "id INTEGER PRIMARY KEY AUTOINCREMENT, "
+ "name TEXT NOT NULL, "
+ "age INTEGER, "
+ "salary REAL, "
+ "blobType BLOB)";


const STORE_CONFIG: data_Rdb.StoreConfig = {
  name: "rdbstoreEmit.db",
  securityLevel: data_Rdb.SecurityLevel.S1
};

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function relationalStoreEmitTest() {
  describe('relationalStoreEmitTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    })

    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG)
      await rdbStore.executeSql(CREATE_TABLE_TEST);
    })

    afterEach(async () => {
      console.info(TAG + 'afterAll');
      data_Rdb.deleteRdbStore(context, "rdbstoreEmit.db");
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsApiTest_0400
     * @tc.name relationalStore emit test
     * @tc.desc relationalStore emit test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testRdbStoreDistributed0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) =>{

      try {
        rdbStore.on('storeObserverInsert', false, subscribeInsert);
        rdbStore.emit('storeObserverInsert');
        await sleep(500);
        let resultSet: data_Rdb.ResultSet = await rdbStore.querySql("SELECT * FROM test");
        console.info(TAG + "resultSet = " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        rdbStore.off('storeObserverInsert', false, subscribeInsert);
        resultSet.close();
        
        done();
      } catch (err) {
        console.error(`failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail()
        done();
      }
    })

  })
}