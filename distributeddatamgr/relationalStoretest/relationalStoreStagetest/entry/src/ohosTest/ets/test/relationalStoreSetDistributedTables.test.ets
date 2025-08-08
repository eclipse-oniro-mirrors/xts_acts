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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
const TAG = "[RELATIONAL_STORE_TEST]";
const STORE_NAME = "cloud_rdb.db"
var rdbStore = undefined;
let context: common.UIAbilityContext;
const valueBucket = {
  'name': 'zhangsan',
  'age': 18,
}

export default function relationalStoreSetDistributedTablesTest() {
  describe('relationalStoreSetDistributedTablesTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      const config = {
        "name": STORE_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      try {
        rdbStore = await relationalStore.getRdbStore(context, config);
        console.log(TAG + "create rdb store success")
      } catch (err) {
        console.log(TAG + "create rdb store failed" + `, error code is ${err.code}, message is ${err.message}`)
      }
    })

    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      let sqlStatement = "CREATE TABLE IF NOT EXISTS employee (" +
          "id INTEGER PRIMARY KEY AUTOINCREMENT," +
          "name TEXT NOT NULL," +
          "age INTEGER)"
        await rdbStore.executeSql(sqlStatement, null)
        console.log(TAG + "create table employee success")
    })

    afterEach(async () => {
      console.info(TAG + 'afterEach');
      let sqlStatement1 = "DROP TABLE IF EXISTS employee";
      await rdbStore.executeSql(sqlStatement1, null);
      console.log(TAG + "drop table employee success")
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll');
      rdbStore = null
      await relationalStore.deleteRdbStore(context, STORE_NAME);
      console.log(TAG + "delete rdb store success")
    })

    console.log(TAG + "*************Unit Test Begin*************");


    /**
     * @tc.name setDistributedTables with callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_AsyncDownloadAsset_1000
     * @tc.desc setDistributedTables with callback
     */
    it('testRdbSetDistributedTables001', 0, async function (done) {
      console.log(TAG + "************* testRdbSetDistributedTables001 start *************");
      try {
        let config = {
          autoSync: false,
        }
        rdbStore.setDistributedTables(['employee'],
          relationalStore.DistributedType.DISTRIBUTED_DEVICE, config, async(err) => {
            if(err == null)
            {
              console.log(TAG + "testRdbsetDistributedTables001 set employee to be distributed cloud table success");
              await rdbStore.insert('employee', valueBucket);
              let predicates = new relationalStore.RdbPredicates('employee')
              predicates.equalTo('name', 'zhangsan')
              let resultSet = await rdbStore.query(predicates)
              expect(1).assertEqual(resultSet.rowCount)
              console.log(TAG + "************* testRdbSetDistributedTables001 end *************");
              done();
            }
            else
            {
              console.log(TAG + `testRdbsetDistributedTables001 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
              expect().assertFail();
              done()
            }
        })
      } catch (err) {
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name setDistributedTables with callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_AsyncDownloadAsset_1100
     * @tc.desc setDistributedTables with callback
     */
    it('testRdbSetDistributedTables002', 0, async function (done) {
      console.log(TAG + "************* testRdbSetDistributedTables002 start *************");
      try {
        rdbStore.setDistributedTables(['employee'], async(err) => {
          if(err == null)
          {
            console.log(TAG + "testRdbsetDistributedTables002 set employee to be distributed cloud table success");
            await rdbStore.insert('employee', valueBucket);
            let predicates = new relationalStore.RdbPredicates('employee')
            predicates.equalTo('name', 'zhangsan')
            let resultSet = await rdbStore.query(predicates)
            expect(1).assertEqual(resultSet.rowCount)
            console.log(TAG + "************* testRdbSetDistributedTables002 end *************");
            done();
          }
          else
          {
            console.log(TAG + `testRdbsetDistributedTables002 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
            expect().assertFail();
            done()
          }
        })
      } catch (err) {
        expect().assertFail();
        done()
      }
    })
    console.log(TAG + "*************Unit Test End*************");
  })}
