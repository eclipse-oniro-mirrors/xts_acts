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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium";
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fileio from '@ohos.file.fs'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';

let context:common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int  = 0x0000;
let tag: string = 'testTag';


const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
  + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)"
const DATABASE_DIR = "/data/storage/el2/database/entry/rdb/"
let RdbStore: relationalStore.RdbStore | undefined;

const DATABASE_BACKUP_NAME: string = "Backup.db"
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "BackupResotreTest.db",
  securityLevel: relationalStore.SecurityLevel.S1
}
const STORE_CONFIG_BACKUP1: relationalStore.StoreConfig = {
  name: DATABASE_BACKUP_NAME,
  securityLevel:relationalStore.SecurityLevel.S1
}
const STORE_CONFIG_BACKUP2: relationalStore.StoreConfig = {
  name: "BackupTest003.db",
  securityLevel:relationalStore.SecurityLevel.S1
}

async function CreatRdbStore(context: common.UIAbilityContext, StoreConfig: relationalStore.StoreConfig): Promise<relationalStore.RdbStore> {
  let RdbStore = await relationalStore.getRdbStore(context, StoreConfig)
  await RdbStore!.executeSql(CREATE_TABLE_TEST)
  let u8 = new Uint8Array([1, 2, 3])

  const valueBucket1: relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": 18 as Long,
    "salary": 100.5,
    "blobType": u8,
  }
  await RdbStore!.insert("test", valueBucket1)


  const valueBucket2: relationalStore.ValuesBucket = {
    "name": "lisi",
    "age": 28 as Long,
    "salary": 100.5,
    "blobType": u8,
  }
  await RdbStore!.insert("test", valueBucket2)


  const valueBucket3: relationalStore.ValuesBucket = {
    "name": "wangwu",
    "age": 38 as Long,
    "salary": 90.0,
    "blobType": u8,
  }
  await RdbStore!.insert("test", valueBucket3)

  return RdbStore
}


export default function relationalStoreBackupRestorePromiseTest() {
  describe('relationalStoreBackupRestorePromiseTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(tag + 'beforeAll')
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
    })

    beforeEach(async (): Promise<void> => {
      console.info(tag + 'beforeEach')
      RdbStore = await CreatRdbStore(context!, STORE_CONFIG)
    })

    afterEach(async (): Promise<void> => {
      console.info(tag + 'afterEach')
      try {
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG)
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG_BACKUP1)
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG_BACKUP2)
      } catch (err) {
        console.info(tag + "deleteRdbStore err" + JSON.stringify(err))
      }
    })

    afterAll(async (): Promise<void> => {
      console.info(tag + 'afterAll')
    })

    console.info(tag + "*************Unit Test Begin*************")

    /**
     * @tc.name   RdbBackupRestoreTest0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_1400
     * @tc.desc   RelationalStore backup and restore function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RdbBackupRestoreTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info(tag + "************* RdbBackupRestoreTest_0010 start *************")

      // RDB backup function test
      await RdbStore!.backup(DATABASE_BACKUP_NAME)
      try {
        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
        fileio.accessSync(DATABASE_DIR + STORE_CONFIG.name)
      } catch (err) {
        console.info("RdbBackupRestoreTest_0010 backup success")
        expect(false).assertTrue()
      }
      // RDB before restored, delete data
      let deleteData = new relationalStore.RdbPredicates("test")
      deleteData.equalTo("name", "zhangsan")
      await RdbStore!.delete(deleteData)

      // RDB restore function test
      await RdbStore!.restore(DATABASE_BACKUP_NAME)
      try {
        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
        console.info(tag + "RdbBackupRestoreTest_0010 restore success")
      } catch (err) {
        expect(false).assertTrue()
      }

      try {
        fileio.accessSync(DATABASE_DIR + STORE_CONFIG.name)
      } catch (err) {
        expect(false).assertTrue()
      }
      // RDB after restored, data query test
      let predicates = new relationalStore.RdbPredicates("test")
      predicates.equalTo("name", "zhangsan")
      let resultSet = await RdbStore!.query(predicates)
      try {
        console.info(tag + "After restore resultSet query done")
        resultSet.goToFirstRow();
        expect(true).assertEqual(resultSet.goToFirstRow())
        console.info("RdbBackupRestoreTest_0010 goto first row success")
        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
        console.info("RdbBackupRestoreTest_0010 get dolumnindex id success")
        const name = resultSet.getString(resultSet.getColumnIndex("name"))
        console.info("RdbBackupRestoreTest_0010 get dolumnindex name success")
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
        console.info(`RdbBackupRestoreTest_0010 id is ${id},name id ${name}`)
        expect(1).assertEqual(id)
        expect("zhangsan").assertEqual(name)
        expect(1).assertEqual(blobType[0])
      } catch (err) {
        console.info(tag + 'RdbBackupRestoreTest_0010 accessSync err4:  ' + err)
        expect(false).assertTrue()
      }
      resultSet.close()

      done()
      console.info(tag + "************* RdbBackupRestoreTest_0010 end *************")
    })


    /**
     * @tc.name   RdbBackupRestoreTest0030
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_1600
     * @tc.desc   RelationalStore restore function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RdbBackupRestoreTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info(tag + "************* RdbBackupRestoreTest_0030 start *************")
      let backupName = "BackupTest003.db"
      try {
        await RdbStore!.backup(backupName)
        console.log(tag + "backup success")
      }catch (err) {
        expect(true).assertFail()
        console.log(tag + "err" + err.code + err.message)
      }

      done()
      console.info(tag + "************* RdbBackupRestoreTest_0030 end *************")
    })

    /**
     * @tc.name   RdbBackupRestoreTest0040
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_1700
     * @tc.desc   RelationalStore restore function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RdbBackupRestoreTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info(tag + "************* RdbBackupRestoreTest_0040 start *************")
      let dbName = "notExistName.db"

      // RelationalStore restore function test, backup file does not exists
      try {
        fileio.accessSync(DATABASE_DIR + dbName)
        expect(false == fileio.accessSync(DATABASE_DIR + dbName)).assertTrue()
        //ReStoreTest(dbName)
        try {
          await RdbStore!.restore(dbName);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          console.log(tag + "err:" + err.code + err.message);
          expect("14800010").assertEqual(String(err.code))
        }
      } catch (err) {
        expect(false).assertTrue()
      }
      done()
      console.info(tag + "************* RdbBackupRestoreTest_0040 end *************")
    })

    /**
     * @tc.name   RdbBackupRestoreTest0050
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_1800
     * @tc.desc   RelationalStore restore function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RdbBackupRestoreTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info(tag + "************* RdbBackupRestoreTest_0050 start *************")

      try {
        await RdbStore!.backup(DATABASE_BACKUP_NAME);
        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME);
        console.info(tag + 'Backup database success');
      } catch (err) {
        expect(false).assertTrue();
      }

      try {
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG_BACKUP1);
        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME);
      } catch (err) {
        console.info(tag + 'error2  ' + err);
        expect(false).assertTrue();
      }

      try {
        await RdbStore!.backup(DATABASE_BACKUP_NAME);
        console.info(tag + 'Backup database success');
        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
      } catch (err) {
        console.info(tag + 'error3  ' + err);
        expect(false).assertTrue();
      }
      done()
      console.info(tag + "************* RdbBackupRestoreTest_0050 end *************")
    })

    console.info(tag + "*************Unit Test End*************")
  })
}
