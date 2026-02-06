/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
} from "../../../hypium/index";
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let context: common.UIAbilityContext | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let rdbStore: relationalStore.RdbStore | undefined;

const TAG = "[RdbLockRowTest]";

const dbName = "LockRowTest.db";
const TABLE = 'lockrowtest';
const LOG_TABLE = "naturalbase_rdb_aux_" + TABLE + "_log";
const CHECK_STATUS = "SELECT " + LOG_TABLE + ".status FROM " + LOG_TABLE + " INNER JOIN " + TABLE + " ON " +
  LOG_TABLE + ".data_key = " + TABLE + ".ROWID WHERE " + TABLE + ".name = '";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS " + TABLE + " (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB, data1 asset, data2 assets )";
let STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
}
const asset1: relationalStore.Asset = {
  name: "name1",
  uri: "uri1",
  createTime: "createTime1",
  modifyTime: "modifyTime1",
  size: "size1",
  path: "path1",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2: relationalStore.Asset = {
  name: "name2",
  uri: "uri2",
  createTime: "createTime2",
  modifyTime: "modifyTime2",
  size: "size2",
  path: "path2",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset3: relationalStore.Asset = {
  name: "name3",
  uri: "uri3",
  createTime: "createTime3",
  modifyTime: "modifyTime3",
  size: "size3",
  path: "path3",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset4: relationalStore.Asset = {
  name: "name4",
  uri: "uri4",
  createTime: "createTime4",
  modifyTime: "modifyTime4",
  size: "size4",
  path: "path4",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}

let checkName = 'zhangsan';
let checkName2 = 'lisi';
const UNLOCK: long = 0;

async function checkStatus(rdbStore: relationalStore.RdbStore, name: string, status: long) {
  try {
    let sql = CHECK_STATUS + name + "'";
    let resultSet = await rdbStore.querySql(sql);
    expect(true).assertEqual(resultSet.goToNextRow());
    expect(status).assertEqual(resultSet.getLong(0));
    console.log(TAG + `checkStatus success, status: ` + resultSet.getLong(0) + ', expert is ' + status);
    resultSet.close();
  } catch (err) {
    console.log(TAG + `checkStatus failed, err: ${JSON.stringify(err)}`);
    expect().assertFail();
  }
}

async function queryLockedData(rdbStore: relationalStore.RdbStore, count: int, name: string) {
  console.log(TAG + `queryLockedData start`);
  try {
    let predicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo("name", name);
    let resultSet = await rdbStore.queryLockedRow(predicates);
    expect(count).assertEqual(resultSet.rowCount);
    resultSet.close();
    console.log(TAG + `query all columns success`);
  } catch (err) {
    console.log(TAG + `query all columns failed, err: ${JSON.stringify(err)}`);
    expect().assertFail();
  }
  try {
    let predicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo("name", name);
    let resultSet = await rdbStore.queryLockedRow(predicates, ['name', 'age']);
    expect(count).assertEqual(resultSet.rowCount);
    resultSet.close();
    console.log(TAG + `query specified columns success`);
  } catch (err) {
    console.log(TAG + `query specified columns failed, err: ${JSON.stringify(err)}`);
    expect().assertFail();
  }
  console.log(TAG + `queryLockedData end`);
}

export default function RdbLockRowTest() {
  describe('RdbLockRowTest', () => {

    beforeAll(async () => {
      console.log(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
      try {
        let tableArray = [TABLE];
        const setConfig: relationalStore.DistributedConfig = {
          autoSync: false,
        }
        await rdbStore!.setDistributedTables(tableArray, relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect(null).assertFail();
      }
    })

    beforeEach(async () => {
      console.log(TAG + 'beforeEach');
    })

    afterEach(async () => {
      console.log(TAG + 'afterEach');
    })

    afterAll(async () => {
      console.log(TAG + 'afterAll');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    })
    console.log(TAG + "*************JS Test Begin*************");

    /**
     * @tc.name   testRdbStoreLockRow0001
     * @tc.number SUB_DistributedrelationalStore_SDK_LockRow_0100
     * @tc.desc   1.Insert data, check status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreLockRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreLockRow0001 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        const assets = [asset1, asset2];
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": checkName,
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
            "data1": asset3,
            "data2": assets
          }
          let ret = await rdbStore!.insert(TABLE, valueBucket);
          console.log(TAG + `insert end: ` + ret);
          expect(1).assertEqual(ret);
          await checkStatus(rdbStore!, checkName, UNLOCK);
          console.log(TAG + `checkStatus end`);
        } catch (err) {
          console.log(TAG + `init failed, err: ${JSON.stringify(err)}`);
          expect().assertFail();
        }
        await queryLockedData(rdbStore!, 0, checkName);
        try {
          let u8 = new Uint8Array([4, 5, 6]);
          const valueBucket: relationalStore.ValuesBucket = {
            "name": checkName,
            "age": 20 as long,
            "salary": 200.5,
            "blobType": u8,
            "data1": asset3,
            "data2": assets
          }
          let predicates = new relationalStore.RdbPredicates(TABLE);
          predicates.equalTo("name", checkName);
          let ret: long = await rdbStore!.update(valueBucket, predicates);
          expect(1).assertEqual(ret);
          await checkStatus(rdbStore!, checkName, UNLOCK);
        } catch (err) {
          console.log(TAG + `failed, err: ${JSON.stringify(err)}`);
          expect().assertFail();
        }
        await queryLockedData(rdbStore!, 0, checkName);
        done();
        console.log(TAG + "************* testRdbStoreLockRow0001 end   *************");
      })

    /**
     * @tc.name   testRdbStoreLockRow0002
     * @tc.number SUB_DistributedrelationalStore_SDK_LockRow_0200
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreLockRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreLockRow0002 start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("");
          await rdbStore!.lockRow(predicates);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + `failed, err: ${JSON.stringify(err)}`);
          expect(14800000).assertEqual(err.code);
        }
        done();
        console.log(TAG + "************* testRdbStoreLockRow0002 end   *************");
      })

    /**
     * @tc.name   testRdbStoreLockRow0003
     * @tc.number SUB_DistributedrelationalStore_SDK_LockRow_0300
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreLockRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreLockRow0003 start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("");
          await rdbStore!.unlockRow(predicates);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + `failed, err: ${JSON.stringify(err)}`);
          expect(14800000).assertEqual(err.code);
        }
        done();
        console.log(TAG + "************* testRdbStoreLockRow0003 end   *************");
      })
    console.log(TAG + "*************Unit Test End*************");
  })
}
