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

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../hypium";

import relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

const TAG = "[RDB_STORE_DATACHANGE_TEST]";
let rdbStore:relationalStore.RdbStore | undefined;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let context: common.UIAbilityContext | undefined;
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function RdbStoreDataChangeTestEts() {
  describe('rdbStoreDataChangeTestEts', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll')
      delegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
    })
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      expect(rdbStore != undefined).assertTrue();
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
    })
    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    })
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name testPerfStat001
     * @tc.number testPerfStat001
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPerfStat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testPerfStat001 start *************");
      let status1 = 0;
      let status2 = 0;
      let storeObserver1 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
        console.info(TAG + " storeObserver1 into");
        status1 = 1;
      };
      let storeObserver2 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
        console.info(TAG + " storeObserver2 into");
        status2 = 1;
      };
      let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      expect(rdbStore2 != undefined).assertTrue();
      rdbStore?.onPerfStat(storeObserver1);
      rdbStore2?.onPerfStat(storeObserver2);
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18 as long,
        'salary': 25000 as long,
      };
      await rdbStore!.insert("test", valueBucket);
      await Utils.msSleep(500);
      expect(status1).assertEqual(1);
      expect(status2).assertEqual(1);
      rdbStore?.offPerfStat(storeObserver1);
      rdbStore2?.offPerfStat(storeObserver2);
      done();
      console.log(TAG + "************* testPerfStat001 end *************");
    })

    /**
     * @tc.name testPerfStat002
     * @tc.number testPerfStat002
     * @tc.desc 1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPerfStat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testPerfStat002 start *************");
      let status1 = 0;
      let status2 = 0;
      let storeObserver1 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
        console.info(TAG + " storeObserver1 into");
        status1 = 1;
      };
      let storeObserver2 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
        console.info(TAG + " storeObserver2 into");
        status2 = 1;
      };
      let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      expect(rdbStore2 != undefined).assertTrue();
      rdbStore?.onPerfStat(storeObserver1);
      rdbStore2?.onPerfStat(storeObserver2);
      await rdbStore2.close();
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18 as long,
        'salary': 25000 as long,
      };
      await rdbStore!.insert("test", valueBucket);
      await Utils.msSleep(500);
      expect(status1).assertEqual(1);
      expect(status2).assertEqual(1);
      rdbStore?.offPerfStat(storeObserver1);
      done();
      console.log(TAG + "************* testPerfStat002 end *************");
    })
  })
}