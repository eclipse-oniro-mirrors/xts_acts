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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium";
import data_Rdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let context: common.UIAbilityContext;
let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const TAG = "testTag"
let rdbStore:data_Rdb.RdbStore |undefined = undefined;
const STORE_CONFIG: data_Rdb.StoreConfig = {
  name: "UpdataTest.db",
  securityLevel: data_Rdb.SecurityLevel.S1
}
const STORE_CONFIG1: data_Rdb.StoreConfig = {
  name: "12345.db",
  securityLevel: data_Rdb.SecurityLevel.S1,
  allowRebuild:true
}
const STORE_CONFIG2: data_Rdb.StoreConfig = {
  name: "123452.db",
  securityLevel: data_Rdb.SecurityLevel.S1,
  allowRebuild:true
}
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " + "dec TEXT)";

const dbName = "12345.db"
const dbPath = "/data/storage/el2/database/relationalstore/rdb/" + dbName;
const dbPathWal = "/data/storage/el2/database/relationalstore/rdb/" + dbName + "-wal";
const dbPathShm = "/data/storage/el2/database/relationalstore/rdb/" + dbName + "-shm";
let num ='a'.repeat((1024 * 1024-10));
let num1 = "p".repeat((1024 * 1024));
async function CreateCorruptDb() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(TAG + "fileExist:"+fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4)
    fs.truncateSync(dbPathShm, 4)
    let file = fs.openSync(dbPath, fs.OpenMode.READ_WRITE);
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
  } catch (err: BusinessError) {
    console.info(TAG, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(TAG, `quit create corrupt store`);
}



export default function RelationalStoreSyncApiTest() {
  describe('RelationalStoreSyncApiTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
      delegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    })

    beforeEach(async (done: () => void) => {
      console.info(TAG + 'beforeEach');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      done();
    })

    afterEach(async (done: () => void) => {
      console.info(TAG + 'afterEach');
      await rdbStore!.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      done();
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0100
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0100');
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_Rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18 as Long,
        "salary": 100.5 as Double,
        "blobType": u8,
      }
      try {
        let result = rdbStore!.insertSync("test", valueBucket);
        expect(result).assertEqual(1);
      }
      catch (err: BusinessError) {
        expect().assertFail();
      }
      await rdbStore!.execute("DELETE FROM test");
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_0100');
      done();
    })

  })
}