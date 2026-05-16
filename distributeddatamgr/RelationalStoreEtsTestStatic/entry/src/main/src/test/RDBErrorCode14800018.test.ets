/*
* Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../hypium/index'
import relationalStore from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import Utils from './Util.test';

let num = "a".repeat((1024) * (1024) * 30);
let context: common.UIAbilityContext | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const TAG = "[RdbErrorCode14800018]";
const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " +
    "age INTEGER)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbErrorCode14800018.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let rdbStore: relationalStore.RdbStore | undefined;

export default function RDBErrorCode14800018() {
  describe('RDBErrorCode14800018', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    })

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      console.info(TAG + "*************Unit Test end*************");
    })

    /**
     * @tc.name testRdbLockRow14800018_001
     * @tc.number testRdbLockRow14800018_001
     * @tc.desc testRdbLockRow14800018_001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRdbLockRow14800018_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbLockRow14800018_001 start *************");
      const record: relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30 as long,
      }
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("age", 30 as long);
      try {
        await rdbStore!.insert("test", record);
        let resultSet = await rdbStore!.query(predicates);
        console.log(TAG + "resultSet.rowCount" + resultSet.rowCount);
        rdbStore!.lockRow(predicates);
        rdbStore!.unlockRow(predicates);
        expect(resultSet.rowCount == 1).assertTrue()
      } catch (err) {
        err = err as BusinessError;
        console.log(TAG + "err.code" + err.code + "err.message" + err.message)
        expect(err.code).assertEqual(14800018)
      }
      done();
      console.info(TAG + "************* testRdbLockRow14800018_001 end *************");
    })
  })
}