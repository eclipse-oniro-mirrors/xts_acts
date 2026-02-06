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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import common from '@ohos.app.ability.common';
import { relationalStore } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';

let context: common.UIAbilityContext;

const TAG = "[ttt]"
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbTest.db",
  securityLevel: relationalStore.SecurityLevel.S3
};
const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS EMPLOYEE (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL, age INTEGER, salary REAL, blobType BLOB)";

let store: relationalStore.RdbStore | undefined = undefined;

export default function relationalStoreEtsTest() {
  describe('relationalStoreEtsTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      try {
        store = await relationalStore.getRdbStore(context, STORE_CONFIG)
        console.info(TAG + 'Get RdbStore successfully.');
        await (store as relationalStore.RdbStore).executeSql(CREATE_TABLE_TEST);
      } catch (err) {
        console.error(TAG + `Get RdbStore failed, code is ${err.code},message is ${err.message}`);
      }

    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      store = undefined;
      await relationalStore.deleteRdbStore(context, "RdbTest.db");
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    });
    console.info(TAG + "*************Unit Test Begin*************");
    /**
     * @tc.name   testRdbStoreGetvalueEtstest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_getValueEtsAPI16Test_0100
     * @tc.desc   RelationalStore getValue test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreGetvalueEtstest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testRdbStoreGetvalueEtstest0100 start *************");
      let u8 = new Uint8Array()
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "blobType": u8,
      };
      try {
        let rowId = await (store as relationalStore.RdbStore).insert("EMPLOYEE", valueBucket)
        console.info(TAG + `Insert is successful, val = ${rowId}`);
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        let result = await (store as relationalStore.RdbStore).query(predicates)
        resultSet = result;
        expect((resultSet as relationalStore.ResultSet).goToFirstRow()).assertTrue();
        const codes = (resultSet as relationalStore.ResultSet).getValue((resultSet as relationalStore.ResultSet).getColumnIndex("blobType"));
        console.info(TAG + "codes:" + codes)
		    expect(codes).assertInstanceOf("Uint8Array");
        const row = (resultSet as relationalStore.ResultSet).getRow();
        console.info(TAG + "row.blobType:" + JSON.stringify(row.blobType));
        expect(row.blobType).assertInstanceOf("Uint8Array");
        resultSet = undefined;
        done()
      } catch (err) {
        console.error(TAG + `Insert is failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail()
      }
      console.info(TAG + "************* testRdbStoreGetvalueEtstest0100 end *************");
    });

    console.info(TAG + " *************Unit Test End*************");
  })
}
