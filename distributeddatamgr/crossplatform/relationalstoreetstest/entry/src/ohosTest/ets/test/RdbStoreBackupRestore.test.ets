/*
 * Copyright (C) 2023-2025 Huawei Device Co., Ltd.
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
import relationalStore from "@ohos.data.relationalStore";
import { ValuesBucket } from '@ohos.data.ValuesBucket';
import { BusinessError } from '@ohos.base';
import common from "@ohos.app.ability.common";

let context: common.UIAbilityContext;
const TAG = "[RDB_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS backupTest (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
let RdbStore: relationalStore.RdbStore | null;
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "BackupResotreTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};
const DATABASE_BACKUP_NAME = "Backup.db";

async function CreatRdbStore(context: Context, STORE_CONFIG: relationalStore.StoreConfig) {
  let RdbStore: relationalStore.RdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
  await RdbStore.executeSql(CREATE_TABLE_TEST, null);
  let u8 = new Uint8Array([1, 2, 3]);
  {
    const valueBucket: ValuesBucket = {
      name: "zhangsan",
      age: 18,
      salary: 100.5,
      blobType: u8,
    };
    await RdbStore.insert("backupTest", valueBucket);
  }
  {
    const valueBucket: ValuesBucket = {
      name: "lisi",
      age: 28,
      salary: 100.5,
      blobType: u8,
    };
    await RdbStore.insert("backupTest", valueBucket);
  }
  {
    const valueBucket: ValuesBucket = {
      name: "wangwu",
      age: 38,
      salary: 90.0,
      blobType: u8,
    };
    await RdbStore.insert("backupTest", valueBucket);
  }
  return RdbStore;
}

export default function RdbStoreBackupRestoreCallbackTest() {
  describe("RdbStoreBackupRestoreCallbackTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async () => {
      console.info(TAG + "beforeEach");
      RdbStore = await CreatRdbStore(context, STORE_CONFIG);
    });

    afterEach(async () => {
      console.info(TAG + "afterEach");
      await relationalStore.deleteRdbStore(context, STORE_CONFIG.name);
      await relationalStore.deleteRdbStore(context, DATABASE_BACKUP_NAME);
      await relationalStore.deleteRdbStore(context, "BackupTest003.db");
    });

    afterAll(async () => {
      console.info(TAG + "afterAll");
    });

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0280
     * @tc.name   : testRdbStoreBackupRestore001
     * @tc.desc   : RdbStore backup and restore callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBackupRestore001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBackupRestore001 start *************");
      RdbStore!.backup(DATABASE_BACKUP_NAME, async (err) => {
        if (err) {
          console.info(TAG + "backup err ttt:  " + err);
          expect(!err).assertTrue();
        } else {
          console.info(`Backup success.`);
          let deleteData = new relationalStore.RdbPredicates("backupTest");
          deleteData.equalTo("name", "zhangsan");
          await RdbStore!.delete(deleteData);
          RdbStore!.restore(DATABASE_BACKUP_NAME, async (err) => {
            if (err) {
              expect(!err).assertTrue();
            } else {
              let predicates = new relationalStore.RdbPredicates("backupTest");
              predicates.equalTo("name", "zhangsan");
              let resultSet: relationalStore.ResultSet | null = await RdbStore!.query(predicates);
              try {
                console.info(TAG + "After restore resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow());
                const id = resultSet.getLong(resultSet.getColumnIndex("id"));
                const name = resultSet.getString(resultSet.getColumnIndex("name"));
                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
                expect(1).assertEqual(id);
                expect("zhangsan").assertEqual(name);
                expect(1).assertEqual(blobType[0]);
                resultSet.close();
                done();
              } catch (err) {
                expect(!err).assertTrue();
              }
              resultSet = null;
              RdbStore = null;
            }
            console.info(TAG + "************* testRdbStoreBackupRestore001 end *************");
          });
        }
      });
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0270
     * @tc.name   : testRdbStoreBackupRestore002
     * @tc.desc   : RdbStore backup and restore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBackupRestore002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBackupRestore002 start *************");
      let promiseBackup = RdbStore!.backup(DATABASE_BACKUP_NAME);
      promiseBackup
        .then(async () => {
          console.info(`Backup success.`);
          let deleteData = new relationalStore.RdbPredicates("backupTest");
          deleteData.equalTo("name", "zhangsan");
          await RdbStore!.delete(deleteData);
          let promiseRestore = RdbStore!.restore(DATABASE_BACKUP_NAME);
          promiseRestore
            .then(async () => {
              console.info(`Restore success.`);
              let predicates = new relationalStore.RdbPredicates("backupTest");
              predicates.equalTo("name", "zhangsan");
              let resultSet: relationalStore.ResultSet | null = await RdbStore!.query(predicates);
              try {
                console.info(TAG + "After restore resultSet query done");
                expect(true).assertEqual(resultSet.goToFirstRow());
                const id = resultSet.getLong(resultSet.getColumnIndex("id"));
                const name = resultSet.getString(resultSet.getColumnIndex("name"));
                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
                expect(1).assertEqual(id);
                expect("zhangsan").assertEqual(name);
                expect(1).assertEqual(blobType[0]);
                resultSet.close();
                done();
              } catch (err) {
                console.info(TAG + "testRdbStoreBackupRestore002 error: " + err);
                expect(!err).assertTrue();
              }
              resultSet = null;
              RdbStore = null;
              console.info(TAG + "************* testRdbStoreBackupRestore002 end *************");
            })
            .catch((err: BusinessError) => {
              console.info(TAG + "Restore error: " + err);
              expect(!err).assertTrue();
            });
        })
        .catch((err: BusinessError) => {
          console.info(TAG + "Backup error: " + err);
          expect(!err).assertTrue();
        });
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0330
     * @tc.name   : testRdbStoreBackup001
     * @tc.desc   : RdbStore backup callback test: file name empty
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBackup001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async () => {
      console.info(TAG + "************* testRdbStoreBackup001 start *************");
      try {
        await RdbStore!.backup("");
        expect(true).assertFail();
      } catch (errInfo) {
        console.info(TAG + "testRdbStoreBackup001 error: " + errInfo);
        expect('401').assertEqual(errInfo.code);
      }
      console.info(TAG + "************* testRdbStoreBackup001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0310
     * @tc.name   : testRdbStoreBackup002
     * @tc.desc   : RdbStore backup callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBackup002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBackup002 start *************");
      try {
        RdbStore!.backup(STORE_CONFIG.name, async (err) => {
          console.info(TAG + "backup err ttt:  " + err.message + "code:  " + err.code);
          done();
          expect(err.code == 14800010).assertTrue();
        });
      } catch (errInfo) {
        console.info(TAG + "testRdbStoreBackup002 error: " + errInfo);
        expect(!errInfo).assertFail();
        done();
      }
      console.info(TAG + "************* testRdbStoreBackup002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0320
     * @tc.name   : testRdbStoreBackup003
     * @tc.desc   : RdbStore backup promise test: file name empty
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBackup003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async () => {
      console.info(TAG + "************* testRdbStoreBackup003 start *************");
      try {
        await RdbStore!.backup("");
        expect(true).assertFail();
      } catch (errInfo) {
        console.info(TAG + "testRdbStoreBackup003 error: " + errInfo);
        expect('401').assertEqual(errInfo.code);
      }
      console.info(TAG + "************* testRdbStoreBackup003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0300
     * @tc.name   : testRdbStoreBackup004
     * @tc.desc   : RdbStore backup promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBackup004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBackup004 start *************");
      try {
        let promiseBackup = RdbStore!.backup(STORE_CONFIG.name);
        promiseBackup
          .then(() => {
            console.info(`Backup success.`);
            expect(promiseBackup !== null).assertEqual(true);
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "backup err ttt1:  " + err.message + "code:  " + err.code);
            done();
            expect(err.code == 14800010).assertTrue();
          });
      } catch (err) {
        console.info(TAG + "testRdbStoreBackup004 error:  " + err.message + "code:  " + err.code);
        expect(!err).assertFail();
        done();
      }
      console.info(TAG + "************* testRdbStoreBackup004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0290
     * @tc.name   : testRdbStoreBackup005
     * @tc.desc   : RdbStore backup promise test: param type error
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBackup005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBackup005 start *************");
      try {
        let promiseBackup = RdbStore!.backup(null);
        promiseBackup
          .then(() => {
            console.info(`Backup success.`);
            expect(promiseBackup !== null).assertEqual(true);
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "backup err ttt1:  " + err.message + "code:  " + err.code);
            done();
            expect(err.code == 14800010).assertTrue();
          });
      } catch (err) {
        console.info(TAG + "testRdbStoreBackup005 param type error:  " + err.message + "code:  " + err.code);
        expect('401').assertEqual(err.code);
        done();
      }
      console.info(TAG + "************* testRdbStoreBackup005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0250
     * @tc.name   : testRdbStoreRestore001
     * @tc.desc   : RdbStore retore callback test: file name empty
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreRestore001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreRestore001 start *************");
      let backupName = "BackupTest003.db";
      await RdbStore!.backup(backupName);
      try {
        RdbStore!.restore("", async (err) => {
          console.info(`restore success.`);
          expect().assertFail();
          done();
        });
      } catch (errInfo) {
        console.info(TAG + "testRdbStoreRestore001 error: " + errInfo.code + errInfo.message);
        expect(errInfo.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbStoreRestore001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0230
     * @tc.name   : testRdbStoreRestore002
     * @tc.desc   : RdbStore retore callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreRestore002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreRestore002 start *************");
      let backupName = "BackupTest003.db";
      await RdbStore!.backup(backupName);
      try {
        RdbStore!.restore(STORE_CONFIG.name, async (err) => {
          expect(err !== null).assertTrue();
          console.info(TAG + "restore err ttt:  " + err);
          console.info(`Restore err: file name wrong.`);
          done();
        });
      } catch (errInfo) {
        console.info(TAG + "testRdbStoreRestore002 error: " + errInfo);
        expect(!errInfo).assertFail();
      }
      console.info(TAG + "************* testRdbStoreRestore002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0240
     * @tc.name   : testRdbStoreRestore003
     * @tc.desc   : RdbStore retore promise test: file name empty
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreRestore003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreRestore003 start *************");
      let backupName = "BackupTest003.db";
      await RdbStore!.backup(backupName);
      try {
        await RdbStore!.restore("");
        expect().assertFail();
        done();
      } catch (errInfo) {
        console.info(TAG + "testRdbStoreRestore003 error: " + errInfo.code + errInfo.message);
        expect(errInfo.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbStoreRestore003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0220
     * @tc.name   : testRdbStoreRestore004
     * @tc.desc   : RdbStore retore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreRestore004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreRestore004 start *************");
      let backupName = "BackupTest003.db";
      await RdbStore!.backup(backupName);
      try {
        await RdbStore!.restore(STORE_CONFIG.name);
        expect().assertFail();
        done();
      } catch (errInfo) {
        console.info(TAG + "testRdbStoreRestore004 error: " + errInfo.code + errInfo.message);
        expect(errInfo.code).assertEqual(14800010);
        done();
      }
      console.info(TAG + "************* testRdbStoreRestore004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0260
     * @tc.name   : testRdbStoreRestore005
     * @tc.desc   : RdbStore retore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreRestore005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreRestore005 start *************");
      let backupName = "BackupTest003.db";
      await RdbStore!.backup(backupName);
      try {
        let promise = await RdbStore!.restore();
        expect().assertFail();
        done();
      } catch (errInfo) {
        console.info(TAG + "testRdbStoreRestore005 error: " + errInfo.code + errInfo.message);
        expect(errInfo.code).assertEqual(14800010);
        done();
      }
      console.info(TAG + "************* testRdbStoreRestore005 end *************");
    });
  });
}
