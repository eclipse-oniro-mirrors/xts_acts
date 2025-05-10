/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import data_Rdb from '@ohos.data.relationalStore'
import fileio from '@ohos.file.fs'
import common from '@ohos.app.ability.common';


const TAG = "[RelationalStore_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
  + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)"
const DATABASE_DIR = "/data/storage/el2/database/entry/rdb/"
var RdbStore
let context: common.UIAbilityContext;
const STORE_CONFIG = {
  name: "BackupResotreTest.db",
  securityLevel: data_Rdb.SecurityLevel.S1
}
const DATABASE_BACKUP_NAME = "Backup.db"

async function CreatRdbStore(context, STORE_CONFIG) {
  let RdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG)
  await RdbStore.executeSql(CREATE_TABLE_TEST, null)
  let u8 = new Uint8Array([1, 2, 3])

  const valueBucket1 = {
    "name": "zhangsan",
    "age": 18,
    "salary": 100.5,
    "blobType": u8,
  }
  await RdbStore.insert("test", valueBucket1)


  const valueBucket2 = {
    "name": "lisi",
    "age": 28,
    "salary": 100.5,
    "blobType": u8,
  }
  await RdbStore.insert("test", valueBucket2)


  const valueBucket3 = {
    "name": "wangwu",
    "age": 38,
    "salary": 90.0,
    "blobType": u8,
  }
  await RdbStore.insert("test", valueBucket3)

  return RdbStore
}

async function BackupTest(backupName) {
  try {
    let promiseRestore = RdbStore.backup(backupName)
    promiseRestore.then(() => {
      expect(false).assertTrue()
    }).catch((err) => {
      console.info(TAG + "Backup error: " + err)
      expect(true).assertTrue()
    })
    await promiseRestore
  } catch (errInfo) {
    console.info(TAG + "BackupTest error: " + errInfo)
    expect(true).assertTrue()
  }

  RdbStore = null
}

async function ReStoreTest(restoreName) {
  try {
    let promiseRestore = RdbStore.restore(restoreName)
    promiseRestore.then(() => {
      expect(false).assertTrue()
    }).catch((err) => {
      console.info(TAG + "Restore error: " + err)
      expect(true).assertTrue()
    })
    await promiseRestore
  } catch (errInfo) {
    console.info(TAG + "ReStoreTest error: " + errInfo)
    expect(true).assertTrue()
  }

  RdbStore = null
}

export default function relationalStoreBackupRestorePromiseTest() {
  describe('relationalStoreBackupRestorePromiseTest', function () {
    beforeAll(async function () {
      console.info(TAG + 'beforeAll')
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
    })

    beforeEach(async function () {
      console.info(TAG + 'beforeEach')
      RdbStore = await CreatRdbStore(context, STORE_CONFIG)
    })

    afterEach(async function () {
      console.info(TAG + 'afterEach')
      try {
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name)
        await data_Rdb.deleteRdbStore(context, DATABASE_BACKUP_NAME)
        await data_Rdb.deleteRdbStore(context, "BackupTest003.db")
      } catch (err) {
        console.info(TAG + "deleteRdbStore err" + JSON.stringify(err))
      }
    })

    afterAll(async function () {
      console.info(TAG + 'afterAll')
    })

    console.info(TAG + "*************Unit Test Begin*************")

    /**
     * @tc.name RdbBackupRestoreTest0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_1400
     * @tc.desc RelationalStore backup and restore function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RdbBackupRestoreTest0010', 0, async function (done) {
      console.info(TAG + "************* RdbBackupRestoreTest_0010 start *************")

      // RDB backup function test
      await RdbStore.backup(DATABASE_BACKUP_NAME)
      try {
        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
        fileio.accessSync(DATABASE_DIR + STORE_CONFIG.name)
      } catch (err) {
        console.info("RdbBackupRestoreTest_0010 backup success")
        expect(false).assertTrue()
      }
      // RDB before restored, delete data
      let deleteData = new data_Rdb.RdbPredicates("test")
      deleteData.equalTo("name", "zhangsan")
      await RdbStore.delete(deleteData)

      // RDB restore function test
      await RdbStore.restore(DATABASE_BACKUP_NAME)
      try {
        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
        console.info(TAG + "RdbBackupRestoreTest_0010 restore success")
      } catch (err) {
        expect(false).assertTrue()
      }

      try {
        fileio.accessSync(DATABASE_DIR + STORE_CONFIG.name)
      } catch (err) {
        expect(false).assertTrue()
      }
      // RDB after restored, data query test
      let predicates = new data_Rdb.RdbPredicates("test")
      predicates.equalTo("name", "zhangsan")
      let resultSet = await RdbStore.query(predicates)
      try {
        console.info(TAG + "After restore resultSet query done")
        resultSet.goToFirstRow();
        expect(true).assertEqual(resultSet.goToFirstRow())
        console.info("RdbBackupRestoreTest_0010 goto first row success")
        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
        console.info("RdbBackupRestoreTest_0010 get dolumnindex id success")
        const name = resultSet.getString(resultSet.getColumnIndex("name"))
        console.info("RdbBackupRestoreTest_0010 get dolumnindex name success")
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
        console.info(`RdbBackupRestoreTest_0010 id is ${id},name id ${name},blobType is ${blobType[0]}`)
        expect(1).assertEqual(id)
        expect("zhangsan").assertEqual(name)
        expect(1).assertEqual(blobType[0])
      } catch (err) {
        console.info(TAG + 'RdbBackupRestoreTest_0010 accessSync err4:  ' + err)
        expect(false).assertTrue()
      }
      resultSet.close()
      RdbStore = null

      done()
      console.info(TAG + "************* RdbBackupRestoreTest_0010 end *************")
    })

    /**
     * @tc.name RdbBackupRestoreTest0020
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_1500
     * @tc.desc RelationalStore backup function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RdbBackupRestoreTest0020', 0, async function () {
      console.info(TAG + "************* RdbBackupRestoreTest_0020 start *************")
      // RelationalStore backup function test, backup file name empty
      BackupTest("")

      // RelationalStore backup function test, backup file name already exists
      BackupTest(STORE_CONFIG.name)

      console.info(TAG + "************* RdbBackupRestoreTest_0020 end *************")
    })

    /**
     * @tc.name RdbBackupRestoreTest0030
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_1600
     * @tc.desc RelationalStore restore function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RdbBackupRestoreTest0030', 0, async function () {
      console.info(TAG + "************* RdbBackupRestoreTest_0030 start *************")
      let backupName = "BackupTest003.db"
      try {
        await RdbStore.backup(backupName)
      } catch (err) {
        expect(true).assertFail()
      }

      // RelationalStore restore function test, backup file name empty
      ReStoreTest("")

      // RelationalStore restore function test, backup file is specified to database name
      ReStoreTest(STORE_CONFIG.name)

      console.info(TAG + "************* RdbBackupRestoreTest_0030 end *************")
    })

    /**
     * @tc.name RdbBackupRestoreTest0040
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_1700
     * @tc.desc RelationalStore restore function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RdbBackupRestoreTest0040', 0, async function (done) {
      console.info(TAG + "************* RdbBackupRestoreTest_0040 start *************")
      let dbName = "notExistName.db"

      // RelationalStore restore function test, backup file does not exists
      try {
        fileio.accessSync(DATABASE_DIR + dbName)
        expect(false == fileio.accessSync(DATABASE_DIR + dbName)).assertTrue()
        ReStoreTest(dbName)
      } catch (err) {
        expect(false).assertTrue()
      }

      done()
      console.info(TAG + "************* RdbBackupRestoreTest_0040 end *************")
    })

    /**
     * @tc.name RdbBackupRestoreTest0050
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_1800
     * @tc.desc RelationalStore restore function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RdbBackupRestoreTest0050', 0, async function () {
      console.info(TAG + "************* RdbBackupRestoreTest_0050 start *************")

      try {
        await RdbStore.backup(DATABASE_BACKUP_NAME);
        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME);
        console.info(TAG + 'Backup database success');
      } catch (err) {
        expect(false).assertTrue();
      }

      try {
        await data_Rdb.deleteRdbStore(context, DATABASE_BACKUP_NAME);
        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME);
      } catch (err) {
        console.info(TAG + 'error2  ' + err);
        expect(false).assertTrue();
      }

      try {
        await RdbStore.backup(DATABASE_BACKUP_NAME);
        console.info(TAG + 'Backup database success');
        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
      } catch (err) {
        console.info(TAG + 'error3  ' + err);
        expect(false).assertTrue();
      }
      console.info(TAG + "************* RdbBackupRestoreTest_0050 end *************")
    })

    /**
     * @tc.name RdbBackupRestoreTest0060
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_1900
     * @tc.desc RelationalStore restore function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RdbBackupRestoreTest0060', 0, async function (done) {
      console.info(TAG + "************* RdbBackupRestoreTest_0060 start *************")
      // Backup file is specified to database name
      RdbStore.backup(STORE_CONFIG.name).then(() => {
        console.info(TAG + 'Backup database finish');
        expect(false).assertTrue();
      }).catch((err) => {
        console.info(TAG + "Backup database error");
        expect(err != null).assertTrue();
        done();
      })
    })
    /**
     * @tc.name RdbBackupRestoreTest0070
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_2000
     * @tc.desc RelationalStore restore function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RdbBackupRestoreTest0070', 0, async function (done) {
      console.info(TAG + "************* RdbBackupRestoreTest_0070 start *************")
      await RdbStore.backup(DATABASE_BACKUP_NAME)
      await data_Rdb.deleteRdbStore(context, DATABASE_BACKUP_NAME)
      try {
        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
      } catch (err) {
        console.info(TAG + 'deleteRdbStore done')
      }
      await RdbStore.restore(DATABASE_BACKUP_NAME).catch((err) => {
        console.info(TAG + 'Restore fail: ' + err.code);
        expect(err != null).assertTrue();
      })
      done();
      console.info(TAG + "************* RdbBackupRestoreTest_0070 end *************")
    })

    /**
     * @tc.name RdbBackupRestoreTest0090
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_2200
     * @tc.desc RelationalStore restore function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RdbBackupRestoreTest0090', 0, async function (done) {
      console.info(TAG + "************* RdbBackupRestoreTest_0090 start *************")
      BackupTest([DATABASE_BACKUP_NAME])
      done();
      console.info(TAG + "************* RdbBackupRestoreTest_0090 end *************")
    })

    /**
     * @tc.name RdbBackupRestoreTest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_2300
     * @tc.desc RelationalStore restore function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RdbBackupRestoreTest0100', 0, async function (done) {
      console.info(TAG + "************* RdbBackupRestoreTest_0100 start *************")
      try {
        await RdbStore.backup(DATABASE_BACKUP_NAME)
        await ReStoreTest([DATABASE_BACKUP_NAME])
      } catch (err) {
        expect(true).assertFail()
      }
      done();
      console.info(TAG + "************* RdbBackupRestoreTest_0100 end *************")
    })

    /**
     * @tc.name RdbBackupRestoreTest0120
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_2500
     * @tc.desc RelationalStore restore function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RdbBackupRestoreTest0120', 0, async function (done) {
      console.info(TAG + "************* RdbBackupRestoreTest_0120 start *************")
      await RdbStore.backup(DATABASE_BACKUP_NAME)
      await RdbStore.backup(DATABASE_BACKUP_NAME).then(() => {
        console.info(TAG + `Backup success.`);
        RdbStore.restore(DATABASE_BACKUP_NAME, function (err) {
          if (err) {
            console.error(TAG + `Restore failed, code is ${err.code},message is ${err.message}`);
            expect(err !== undefined).assertFail();
            done();
          }
          console.info(TAG + `Restore success.`);
          expect(err === undefined).assertTrue();
          done();
        })
      }).catch((err) => {
        console.error(TAG + `Backup failed, code is ${err.code},message is ${err.message}`);
        expect(err !== undefined).assertFail();
        done();
      });
      console.info(TAG + "************* RdbBackupRestoreTest_0120 end *************")
    })

    /**
     * @tc.name RdbBackupRestoreTest0130
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreEtsAPITest_2600
     * @tc.desc RelationalStore restore function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RdbBackupRestoreTest0130', 0, async function () {
      console.info(TAG + "************* RdbBackupRestoreTest_0130 start *************")
      try {
        await RdbStore.backup(DATABASE_BACKUP_NAME)
        await RdbStore.restore(DATABASE_BACKUP_NAME)
      } catch(err) {
        console.info(TAG + "error RdbBackupRestoreTest_0130" + JSON.stringify(err))
        expect(true).assertFail()
      }
      console.info(TAG + "************* RdbBackupRestoreTest_0130 end *************")
    })
    console.info(TAG + "*************Unit Test End*************")
  })
}
