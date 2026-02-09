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
import hilog from '@ohos.hilog'
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import relationalStore from '@ohos.data.relationalStore';
import data_Rdb from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let context: common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()

const TAG = "[RelationalStore_Ets_TEST >>>>>> ]";

let domain: int = 0x0000;
let tag: string = TAG;
const RDB_DB_ICUNAME = "VectorStoreTest.db";

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test(id INTEGER PRIMARY KEY,repr floatvector(8));";

const STORE_CONFIG: data_Rdb.StoreConfig = {
  name: RDB_DB_ICUNAME,
  securityLevel: data_Rdb.SecurityLevel.S1,
  tokenizer: data_Rdb.Tokenizer.ICU_TOKENIZER,
  vector: true,
}

let rdbStore: data_Rdb.RdbStore;

export default function VectorStoreTest() {
  describe('VectorStoreTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
    });
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
    });
    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');

    });
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
    });
    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   VectorStoreTest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0100
     * @tc.desc   VectorEtsAPITest isVectorSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VectorStoreTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      const res = data_Rdb.isVectorSupported();
      console.info(TAG + "VectorStoreTest0100 res=" + res);
      if (res == false) {
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAG + "VectorStoreTest0100 success getRdbStore. rdbStore=" + rdbStore);
          expect().assertFail();
          done()
        } catch(err: BusinessError){
          console.info(TAG + "VectorStoreTest0100 fail getRdbStore, code=" + err.code + err.message);
          expect(801).assertEqual(err.code);
          done()
        }
      } else {
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAG + "VectorStoreTest0100 getRdbStore is successful, rdbStore = " + rdbStore);
          expect(rdbStore != null).assertTrue();
          await rdbStore.execute(CREATE_TABLE_TEST, 0 ,undefined);
          await rdbStore!.execute("INSERT INTO test VALUES(0,'[5,8,9,7,1,3,1,3]');",0,undefined);
          const CREATE_IVFFLAT_INDEX = "CREATE INDEX test_idx ON test USING GSIVFFLAT(repr L2);"
          await rdbStore!.execute(CREATE_IVFFLAT_INDEX,0,undefined);
          let resultSet: data_Rdb.ResultSet;
          const QUERY_VECTOR_TEST = "select id,repr <-> '[20,26,32,48,19,10,20,45]' " +
            "from test ORDER BY repr <-> '[20,26,32,48,19,10,20,45]';";
          resultSet = await rdbStore.querySql(QUERY_VECTOR_TEST);
          console.log(TAG + "resultSet.rowCount:" + resultSet.rowCount)
          expect(resultSet.rowCount).assertEqual(1);
          done();
        } catch(err: BusinessError){
          console.info(TAG + "VectorStoreTest0100 getRdbStore is failed, code=" + err.code + err.message);
          expect().assertFail();
          done();
        }
      }
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.name   VectorStoreTest0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0600
     * @tc.desc   isVectorSupported test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VectorStoreTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> =>  {
      const res = data_Rdb.isVectorSupported();
      console.info(TAG + "VectorStoreTest0600 res=" + res);
      if (res == false) {
        expect(res).assertEqual(false);
        done();
      } else {
        expect(res).assertEqual(true);
        done();
      }
      console.info(TAG + " ************* End*************");
    });
    console.info(TAG + " *************Unit Test End*************");
  })
}
