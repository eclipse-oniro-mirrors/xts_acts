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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import relationalStore from '@ohos.data.relationalStore';
import common from "@ohos.app.ability.common"

let context: common.UIAbilityContext

const TAG = "[ttt]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test ("
  + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
  + "name TEXT NOT NULL, "
  + "age INTEGER, "
  + "salary REAL, "
  + "blobType BLOB)";

let rdbStore;


export default function relationalStoreDataGroupIdPromise() {
  describe('relationalStoreDataGroupIdPromise', () => {
    beforeAll(() => {
      console.info(TAG + 'beforeAll')
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
    })

    beforeEach(() => {
      console.info(TAG + 'beforeEach')
    })

    afterEach(() => {
      console.info(TAG + 'afterEach')
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll')
    })

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_0500
     * @tc.name relationalStore dataGroupId null promise test
     * @tc.desc relationalStore getRdbStore dataGroupId null promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RelationalStore_DataGroupId_Promise_0100', 0, async () => {
      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: "RdbTest.db",
        securityLevel: relationalStore.SecurityLevel.S1,
        dataGroupId: null,
      };
      try {
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        console.info(TAG, `Get RdbStore successfully.`);
        expect(rdbStore != undefined).assertTrue();
        relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch (errInfo) {
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_0600
     * @tc.name relationalStore dataGroupId undefined callback test
     * @tc.desc relationalStore getRdbStore dataGroupId undefined callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RelationalStore_DataGroupId_Promise_0200', 0, async () => {
      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: "RdbTest.db",
        securityLevel: relationalStore.SecurityLevel.S1,
        dataGroupId: undefined,
      };
      try {
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        console.info(TAG, `Get RdbStore successfully.`);
        expect(rdbStore != undefined).assertTrue();
        relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch (errInfo) {
        expect().assertFail();
      }
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_0700
     * @tc.name relationalStore dataGroupId callback test
     * @tc.desc relationalStore getRdbStore dataGroupId callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RelationalStore_DataGroupId_Promise_0300', 0, async () => {
      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: "RdbTest.db",
        securityLevel: relationalStore.SecurityLevel.S1,
        dataGroupId: '112233',
      };
      try {
        await relationalStore.getRdbStore(context, STORE_CONFIG);
        console.info(TAG, `Get RdbStore successfully.`);
        expect().assertFail();
      } catch (errInfo) {
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('14801002');
      }
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRdbStoreJsAPITest_0800
     * @tc.name relationalStore dataGroupId callback test
     * @tc.desc relationalStore deleteRdbStore dataGroupId callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RelationalStore_DataGroupId_Promise_0400', 0, async () => {
      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: "RdbTest.db",
        securityLevel: relationalStore.SecurityLevel.S1,
        dataGroupId: '123456',
      };
      try {
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        console.info(TAG, `Get RdbStore successfully.`);
        expect(rdbStore != undefined).assertTrue();
        relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch (errInfo) {
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect().assertFail();
      }
    })

    console.info(TAG + "*************Unit Test End*************");
  })
}