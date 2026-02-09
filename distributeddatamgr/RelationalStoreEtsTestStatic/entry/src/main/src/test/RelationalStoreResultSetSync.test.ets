
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let context:common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int  = 0x0000;
let tag: string = "testTag";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "Resultset.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
let rdbStore:relationalStore.RdbStore | undefined;

async function createTest(rdbStore:relationalStore.RdbStore) {
  console.log(tag + "createTest data start");
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: relationalStore.ValuesBucket = {
      "data1": "hello",
      "data2": 10 as Long,
      "data3": 1.0,
      "data4": u8,
    };
    await rdbStore.insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array([3, 4, 5]);
    const valueBucket: relationalStore.ValuesBucket = {
      "data1": "2",
      "data2": -5 as Long,
      "data3": 2.5,
      "data4": u8,
    };
    await rdbStore.insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array(0);
    const valueBucket: relationalStore.ValuesBucket = {
      "data1": "hello world",
      "data2": 3 as  Long,
      "data3": 1.8,
      "data4": u8,
    };
    await rdbStore.insert("test", valueBucket);
  }
  console.log(tag + "createTest data end");
}


export default function rdbResultSetSyncTest() {
  describe('rdbResultSetSyncTest', () => {
    beforeAll(async () : Promise<void> => {
      console.info(tag + 'beforeAll');
      await Utils.msSleep(2000)
      hilog.info(domain, tag, 'abilityDelegator:' );
      hilog.info(domain, tag, 'abilityDelegator:' + JSON.stringify(abilityDelegator));
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
      hilog.info(domain, tag, 'context:' + JSON.stringify(context!))
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
    });
    beforeEach(async (): Promise<void> => {
      console.info(tag + 'beforeEach');
      if (rdbStore != undefined) {
        await rdbStore!.executeSql(CREATE_TABLE_TEST);
        await createTest(rdbStore!);
        hilog.info(domain, tag, 'RS0098:')
      }
    });
    afterEach(async (): Promise<void> => {
      console.info(tag + 'afterEach');
      if (rdbStore != undefined) {
        await rdbStore!.executeSql(DROP_TABLE_TEST);
      }
    });
    afterAll(async () : Promise<void>=> {
      console.info(tag + 'afterAll');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    });

    /**
     * @tc.name   testgetColumnTypeSync0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0100
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(tag + "************* testgetColumnTypeSync0100 start *************");
      hilog.info(domain, tag, 'RS0122:')
      try {
        hilog.info(domain, tag, 'RS0123:')
        const asset:relationalStore.Asset = {
          name: "name4",
          uri: "uri4",
          createTime: "createTime4",
          modifyTime: "modifyTime4",
          size: "size4",
          path: "path4",
        };
        hilog.info(domain, tag, 'RS0132:')
        const assets = [asset];
        hilog.info(domain, tag, 'RS0134:')
        const valueBucket: relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as Long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        hilog.info(domain, tag, 'RS0145:')
        await rdbStore!.insert("test", valueBucket);
        hilog.info(domain, tag, 'RS0147:')
      } catch (err) {
        console.error(tag + "testgetColumnTypeSync001 insert failed " + err);
        hilog.error(domain, tag, 'RS0146:')
      }
      hilog.info(domain, tag, 'RS0153:')
      try {
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        hilog.info(domain, tag, 'RS0151:')
        expect(true).assertEqual(resultSet.goToRow(count - 1));
        let type = relationalStore.ColumnType.NULL;
        type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("id"));
        expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
        type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data1"));
        expect(type).assertEqual(relationalStore.ColumnType.TEXT);
        type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data2"));
        expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
        type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data3"));
        expect(type).assertEqual(relationalStore.ColumnType.REAL);
        type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data4"));
        expect(type).assertEqual(relationalStore.ColumnType.BLOB);
        type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data5"));
        expect(type).assertEqual(relationalStore.ColumnType.ASSET);
        type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data6"));
        expect(type).assertEqual(relationalStore.ColumnType.ASSETS);
        type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data7"));
        hilog.info(domain, tag, 'RS0175:data7 type' + type);
        hilog.info(domain, tag, 'RS0175:data7 type' + JSON.stringify(type));
        expect(type).assertEqual(relationalStore.ColumnType.FLOAT_VECTOR);
        type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data8"));
        hilog.info(domain, tag, 'RS0171:');
        hilog.info(domain, tag, 'RS0178: type' + JSON.stringify(type));
        hilog.info(domain, tag, 'RS0179: relationalStore.ColumnType.UNLIMITED_INT' + JSON.stringify(relationalStore.ColumnType.UNLIMITED_INT));
        expect(type).assertEqual(relationalStore.ColumnType.UNLIMITED_INT);
        resultSet.close();
        done();
      } catch (err) {
        console.error(tag + "testgetColumnTypeSync0100  failed " + err.code + err.message);
        hilog.error(domain, tag, 'RS0177:')
        expect().assertFail();
        done();
      }
      console.log(tag + "************* testgetColumnTypeSync0100 end *************");
    });

    console.log(tag + "*************Unit Test End*************");
  })
}
