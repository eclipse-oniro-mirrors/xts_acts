/*
 * Copyright (C) 2023-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';

const TAG = "testTag";
const STORE_NAME = "cursor_rdb.db";
let rdbStore: relationalStore.RdbStore | undefined;
let context: common.UIAbilityContext | undefined;
const config: relationalStore.StoreConfig = {
  "name": STORE_NAME,
  securityLevel: relationalStore.SecurityLevel.S1,
  autoCleanDirtyData: false,
}

export default function relationalStoreCloudCursor() {
    describe('relationalStoreCloudCursor', () => {
        beforeAll(async (): Promise<void> => {
            console.info(TAG + 'beforeAll')
            try {
              let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
              abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
              await Utils.msSleep(5000);
              context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
              rdbStore = await relationalStore.getRdbStore(context!, config);
              console.log(TAG + "create rdb store success")
              let sql = "CREATE TABLE IF NOT EXISTS query_tb (" +
                "data TEXT, " +
                "recycled BOOLEAN, " +
                "recycledTime INTEGER, " +
                "uuid TEXT PRIMARY KEY)";
              await rdbStore!.executeSql(sql);
              console.log(TAG + "create table query_tb success");
              const setConfig: relationalStore.DistributedConfig = {
                autoSync: false,
              }
              await rdbStore!.setDistributedTables(
                ["query_tb"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, setConfig);
                console.log(TAG + "setDistributedTables table query_tb success");
            } catch (err) {
              console.log(TAG + `failed, err: ${JSON.stringify(err)}`)
              expect().assertFail()
            }
        })
    
        beforeEach(async (): Promise<void> => {
            console.info(TAG + 'beforeEach');
            try {
                let vBucketArray1 = new Array<relationalStore.ValuesBucket>();
                for (let i = 0; i < 5; i++) {
                    let valueBucket: relationalStore.ValuesBucket = {
                        "data": "cloud_cursor_insert",
                        "recycled": true,
                        "recycledTime": 12345 as Long,
                        "uuid": "test_key" + i.toString(),
                    }
                    vBucketArray1.push(valueBucket);
                }
                await rdbStore!.batchInsert("query_tb", vBucketArray1);
                console.log(TAG + "batchInsert query_tb success");
            } catch (err) {
                console.log(TAG + `insert failed, err: ${JSON.stringify(err)}`)
                expect().assertFail()
            }
        })
    
        afterEach(async (): Promise<void> => {
            console.info(TAG + 'afterEach');
            try {
                let predicates = new relationalStore.RdbPredicates("query_tb");
                predicates.equalTo("data", "cloud_cursor_insert");
                await rdbStore!.delete(predicates);
                console.log(TAG + "delete table query_tb success");
            } catch (err) {
                console.log(TAG + `delete failed, err: ${JSON.stringify(err)}`)
                expect().assertFail()
            }
        })
    
        afterAll(async (): Promise<void> => {
            console.info(TAG + 'afterAll');
            try{
                await relationalStore.deleteRdbStore(context!, config)
                console.log(TAG + "deleteRdbStore success")
              }catch (err)
              {
                console.info(TAG+"deleteRdbStore fail"+err.code+err.message)
              }
        })
        console.log(TAG + "*************Unit Test Begin*************");

      /**
       * @tc.name   SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0100
       * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0100
       * @tc.desc   clean retain data with specified cursor promise.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0100',
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
          rdbStore = await relationalStore.getRdbStore(context!, config);
          if (rdbStore! != undefined) {
            try {
              rdbStore?.cleanDirtyData("wrongTest", 100, (err: BusinessError | null) => {
              })
              rdbStore?.cleanDirtyData("test", 100, (err: BusinessError | null) => {
              })
              await rdbStore!.cleanDirtyData("test");
              expect().assertFail();
            } catch (err) {
              console.error(TAG + 'Failed to cleanDirtyData: ' + err.code + ',message:' + err.message);
              expect(err.code).assertEqual(14800000)
            }
          }
          done();
          console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0100 end-----")
        })

         /**
          * @tc.name   testRdbCleanDirtyData0001
          * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudCursorJsAPITest_0600
          * @tc.desc   clean retain data with specified cursor promise.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL3
          */
         it('testRdbCleanDirtyData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbCleanDirtyData0001 start *************");
            if (rdbStore == undefined) {
                console.log(TAG + "testRdbCleanDirtyData0001 rdbStore == undefined");
                expect().assertFail();
                return;
            }
            let cursor = 3;
            try {
              let promise = rdbStore!.cleanDirtyData("query_tb", cursor);
              console.log(TAG + `testRdbCleanDirtyData0001 cleanDirtyData success`);
              done();
            } catch (err) {
              console.log(TAG + `testRdbCleanDirtyData0001 cleanDirtyData fail, errcode: ${JSON.stringify(err)}.`);
              expect().assertFail();
              done();
            }
            console.log(TAG + "************* testRdbCleanDirtyData0001 end *************");
        })
    
        /**
         * @tc.name   testRdbCleanDirtyData0002
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudCursorJsAPITest_0700
         * @tc.desc   clean retain data promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testRdbCleanDirtyData0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbCleanDirtyData0002 start *************");
            if (rdbStore == undefined) {
                console.log(TAG + "testRdbCleanDirtyData0002 rdbStore == undefined");
                expect().assertFail();
                return;
            }
            try {
              let promise = rdbStore!.cleanDirtyData("query_tb");
              console.log(TAG + `testRdbCleanDirtyData0002 cleanDirtyData success`);
              done();
            } catch (err) {
              console.log(TAG + `testRdbCleanDirtyData0002 cleanDirtyData fail, errcode: ${JSON.stringify(err)}.`);
              expect().assertFail();
              done();
            }
            console.log(TAG + "************* testRdbCleanDirtyData0002 end *************");
        })

        console.log(TAG + "*************Unit Test End*************");
    })
}

 