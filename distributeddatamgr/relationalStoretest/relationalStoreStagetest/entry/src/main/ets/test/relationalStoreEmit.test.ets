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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import data_Rdb from '@ohos.data.relationalStore';

const TAG = "[RelationalStore_Emit_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test ("
+ "id INTEGER PRIMARY KEY AUTOINCREMENT, "
+ "name TEXT NOT NULL, "
+ "age INTEGER, "
+ "salary REAL, "
+ "blobType BLOB)";

let rdbStore;
const STORE_CONFIG = {
  name: "rdbstoreEmit.db",
  securityLevel: data_Rdb.SecurityLevel.S1
};

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function relationalStoreEmitTest() {
  describe('relationalStoreEmitTest', function () {
    beforeAll(async function () {
      console.info(TAG + 'beforeAll');
    })

    beforeEach(async function () {
      console.info(TAG + 'beforeEach');
      rdbStore = await data_Rdb.getRdbStore(globalThis.abilityContext, STORE_CONFIG)
      await rdbStore.executeSql(CREATE_TABLE_TEST);
    })

    afterEach(async function () {
      console.info(TAG + 'afterAll');
      data_Rdb.deleteRdbStore(globalThis.abilityContext, "rdbstoreEmit.db");
    })

    afterAll(async function () {
      console.info(TAG + 'afterAll');
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsApiTest_0400
     * @tc.name relationalStore emit test
     * @tc.desc relationalStore emit test
     */
    it('testRdbStoreDistributed0012', 0, async function (done) {
      async function subscribeInsert() {
        console.info(TAG + "subscribeInsert start");
        const valueBucket = {
          "name": "zhangsan"
        }
        await rdbStore.insert("test", valueBucket)
        console.info(TAG + "subscribeInsert end");
      }

      try {
        rdbStore.on('storeObserverInsert', false, subscribeInsert);
        rdbStore.emit('storeObserverInsert');
        await sleep(2000);
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        console.info(TAG + "resultSet = " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        rdbStore.off('storeObserverInsert', false, subscribeInsert);
        resultSet.close();
        resultSet = null;
        done();
      } catch (err) {
        console.error(`failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail()
        done();
      }
    })

  })
}