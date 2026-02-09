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
import fs from '@ohos.file.fs';

let num = "a".repeat((1024) * (1024) * 30);
let context: common.UIAbilityContext | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const TAG = "[RdbErrorCode14800021]";
const CREATE_TABLE_EMPLOYEE =
  "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " +
    "age INTEGER)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG1: relationalStore.StoreConfig = {
  name: "TransactionTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
// 新增：数据库损坏场景配置
const STORE_CONFIG_CORRUPT: relationalStore.StoreConfig = {
  name: "RdbErrorCode14800021_corrupt.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

const CREATE_TABLE_TEST_CORRUPT = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 float32Array," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST_CORRUPT = "DROP TABLE IF EXISTS test";

// 新增：CreateCorruptDb函数（从源文件复制）
const dbName = "RdbErrorCode14800021_corrupt.db"
const dbPath = "/data/storage/el2/database/entry/rdb/" + dbName;
const dbPathWal = "/data/storage/el2/database/entry/rdb/" + dbName + "-wal";
const dbPathShm = "/data/storage/el2/database/entry/rdb/" + dbName + "-shm";

async function CreateCorruptDb() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(TAG + "fileExist:"+fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4)
    fs.truncateSync(dbPathShm, 4)
    let file = fs.openSync(dbPath, fs.OpenMode.READ_ONLY | fs.OpenMode.SYNC | fs.OpenMode.TRUNC );
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
  } catch (err) {
    console.info(TAG, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(TAG, `quit create corrupt store`);
}
const valueBucket2 :relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long,
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket3 :relationalStore.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
let vbs :Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>(2);
vbs[0] = valueBucket2
vbs[1] = valueBucket3

let rdbStore: relationalStore.RdbStore | undefined;
let rdbStore_2: relationalStore.RdbStore | undefined;

export default function RDBErrorCode14800021() {
  describe('RDBErrorCode14800021', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    })

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      rdbStore_2 = await relationalStore.getRdbStore(context!, STORE_CONFIG_CORRUPT);
      console.info(TAG + "create rdb store success")
      await rdbStore!.executeSql(CREATE_TABLE_EMPLOYEE);
      await rdbStore_2!.execute(DROP_TABLE_TEST_CORRUPT);
      await rdbStore_2!.execute(CREATE_TABLE_TEST_CORRUPT);
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG_CORRUPT);
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      console.info(TAG + "*************Unit Test end*************");
    })

    /**
     * @tc.name testRdbBatchInsertWithConflictResolution14800021_001
     * @tc.number testRdbBatchInsertWithConflictResolution14800021_001
     * @tc.desc testRdbBatchInsertWithConflictResolution14800021_001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRdbBatchInsertWithConflictResolution14800021_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbBatchInsertWithConflictResolution14800021_001 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        let vbs: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
        for (let i = 0; i < 2; i++) {
          vbs.push(valueBucket);
        }
        try {
          await rdbStore!.batchInsertWithConflictResolution("test1", vbs,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolution failed" + err.code);
          expect(err.code).assertEqual(14800021);
        }
        done();
        console.log(TAG + "************* testRdbBatchInsertWithConflictResolution14800021_001 end *************");
      })

    /**
     * @tc.name   testRdbBatchInsertWithConflictResolutionSync14800021_002
     * @tc.number   testRdbBatchInsertWithConflictResolutionSync14800021_002
     * @tc.desc   testRdbBatchInsertWithConflictResolutionSync14800021_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBatchInsertWithConflictResolutionSync14800021_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testRdbBatchInsertWithConflictResolutionSync14800021_002 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        let vbs: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
        for (let i = 0; i < 2; i++) {
          vbs.push(valueBucket);
        }
        try {
          rdbStore!.batchInsertWithConflictResolutionSync("test1", vbs,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolutionSync failed" + err.code);
          expect(err.code).assertEqual(14800021);
        }
        done();
        console.log(TAG +
          "************* testRdbBatchInsertWithConflictResolutionSync14800021_002 end *************");
      })

    /**
     * @tc.name   testRdbBatchInsertWithConflictResolutionInTransaction14800021_003
     * @tc.number   testRdbBatchInsertWithConflictResolutionInTransaction14800021_003
     * @tc.desc   testRdbBatchInsertWithConflictResolutionInTransaction14800021_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBatchInsertWithConflictResolutionInTransaction14800021_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbBatchInsertWithConflictResolutionInTransaction14800021_003 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore!.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": null,
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let vbs: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
          vbs.push(valueBucket);
          let num = transaction.batchInsertWithConflictResolutionSync("test", vbs,
            relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          console.log(TAG + "testRdbBatchInsertWithConflictResolutionInTransaction14800021_003 insert num " + num);
        } catch (e) {
          console.log(TAG + e + " code: " + e.code);
          expect(e.code).assertEqual(14800021);
        }
        done();
        console.log(TAG + "************* testRdbBatchInsertWithConflictResolutionInTransaction14800021_003 end *************");
      })

    /**
     * @tc.name   testRdbTransactionBatchInsertWithConflictResolution14800021_004
     * @tc.number   testRdbTransactionBatchInsertWithConflictResolution14800021_004
     * @tc.desc   testRdbTransactionBatchInsertWithConflictResolution14800021_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransactionBatchInsertWithConflictResolution14800021_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testRdbTransactionBatchInsertWithConflictResolution14800021_004 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore!.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let vbs: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            vbs.push(valueBucket);
          }
          await transaction.batchInsertWithConflictResolution("test1", vbs,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect().assertFail()
          console.log(TAG + "testRdbTransactionBatchInsertWithConflictResolution14800021_004 error");
        } catch (err) {
          console.log(TAG + err + " code: " + err.code);
          expect(err.code).assertEqual(14800021);
        }
        done();
        console.log(TAG + "testRdbTransactionBatchInsertWithConflictResolution14800021_004 end");
      })

    /**
     * @tc.name   testRdbBackup14800021_005
     * @tc.number   testRdbBackup14800021_005
     * @tc.desc   testRdbBackup14800021_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRdbBackup14800021_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        try {
          rdbStore!.backup("TransactionTest.db").then(() => {
            console.info('Backup success.');
          }).catch((err) => {
            console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   testRdbRestore14800021_006
     * @tc.number   testRdbRestore14800021_006
     * @tc.desc   testRdbRestore14800021_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRdbRestore14800021_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        try {
          let promiseBackup = rdbStore!.backup("TransactionTest.db");
          promiseBackup.then(() => {
            console.info('Backup success.');
          }).catch((err) => {
            console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }

        try {
          let promiseRestore = rdbStore!.restore("TransactionTest.db");
          promiseRestore.then(() => {
            console.info('Restore success.');
          }).catch((err) => {
            console.error(`Restore failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }
        const dbPath = context!.databaseDir + "/rdb/TransactionTest.db";
        try {
          rdbStore!.attach(dbPath, "attachDB").then((number: int) => {
            console.info('attach succeeded');
          }).catch((err) => {
            console.error(`attach failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }
        await rdbStore!.executeSql("DROP TABLE IF EXISTS test1");
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   testRdbLockRow14800021_007
     * @tc.number   testRdbLockRow14800021_007
     * @tc.desc   testRdbLockRow14800021_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRdbLockRow14800021_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");

        try {
          rdbStore!.lockRow(predicates).then(() => {
            console.info(`Lock success`);
          }).catch((err) => {
            console.error(`Lock failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }

        try {
          rdbStore!.unlockRow(predicates).then(() => {
            console.info(`Unlock success`);
          }).catch((err) => {
            console.error(`Unlock failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }

        try {
          rdbStore!.queryLockedRow(predicates, ["id", "name", "age", "salary"])
            .then((resultSet: relationalStore.ResultSet) => {
              console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
              // 释放数据集的内存，若不释放可能会引起fd泄露与内存泄露
              resultSet.close();
            })
            .catch((err) => {
              console.error(`Query failed, code is ${err.code},message is ${err.message}`);
            })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }
        let predicates1 = new relationalStore.RdbPredicates("test1");
        let resultSet: relationalStore.ResultSet = await rdbStore!.query(predicates1);

        try {
          await resultSet.getRows(resultSet.columnCount);
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   testRdbInsertSync14800021_008
     * @tc.number   testRdbInsertSync14800021_008
     * @tc.desc   testRdbInsertSync14800021_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRdbInsertSync14800021_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16 as long,
          "salary": 100.5,
          "blobType": u8,
        };

        let options: relationalStore.TransactionOptions = {
          transactionType: relationalStore.TransactionType.EXCLUSIVE
        }
        const rdbTrans = await rdbStore!.createTransaction(options);

        try {
          rdbTrans.insert("test1", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(() => {
            rdbTrans.rollback();
          })
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }

        try {
          rdbTrans.insertSync("test1", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }

        let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket, valueBucket, valueBucket);
        try {
          rdbTrans.batchInsert("test1", valueBuckets).then(() => {
            rdbTrans.rollback();
          })
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }

        try {
          rdbTrans.batchInsertSync("test1", valueBuckets)
          rdbTrans.rollback();
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }
        await rdbStore!.executeSql("DROP TABLE IF EXISTS test1");
        await rdbStore!.close();
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   testRdbDeleteSync14800021_009
     * @tc.number   testRdbDeleteSync14800021_009
     * @tc.desc   testRdbDeleteSync14800021_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRdbDeleteSync14800021_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore!.executeSql("DROP TABLE IF EXISTS test1");
        let options: relationalStore.TransactionOptions = {
          transactionType: relationalStore.TransactionType.EXCLUSIVE
        }
        let rdbTrans = await rdbStore!.createTransaction(options);
        let predicates = new relationalStore.RdbPredicates('test1');
        predicates.equalTo("NAME", "lisi");
        try {
          await rdbTrans.delete(predicates);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          await rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }
        rdbTrans = await rdbStore!.createTransaction(options);
        try {
          rdbTrans.deleteSync(predicates);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          await rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   testRdbAttach14800021_010
     * @tc.number   testRdbAttach14800021_010
     * @tc.desc   testRdbAttach14800021_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRdbAttach14800021_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        try {
          rdbStore!.attach(context!, STORE_CONFIG1, "attachDB").then((number: int) => {
            console.info(`attach succeeded, number is ${number}`);
          }).catch((err) => {
            console.error(`attach failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }
        try {
          rdbStore!.detach("attachDB").then((number: int) => {
            console.info(`detach succeeded, number is ${number}`);
          }).catch((err) => {
            console.error(`detach failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }
        try {
          rdbStore!.detach("attachDB").then((number: int) => {
            console.info(`detach succeeded, number is ${number}`);
          }).catch((err) => {
            console.error(`detach failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }
        await rdbStore!.executeSql("DROP TABLE IF EXISTS test1");
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   testRdbUpdateSync14800021_011
     * @tc.number   testRdbUpdateSync14800021_011
     * @tc.desc   testRdbUpdateSync14800021_011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRdbUpdateSync14800021_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 16 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let options: relationalStore.TransactionOptions = {
          transactionType: relationalStore.TransactionType.IMMEDIATE
        }
        const rdbTrans = await rdbStore!.createTransaction(options);
        let predicates = new relationalStore.RdbPredicates('test1');
        predicates.equalTo("NAME", "lisi");
        try {
          rdbTrans.update(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(() => {
          })
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800021)
        }
        try {
          rdbTrans.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          rdbTrans.rollback();
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   testRdbQuerySqlSync14800021_012
     * @tc.number   testRdbQuerySqlSync14800021_012
     * @tc.desc   testRdbQuerySqlSync14800021_012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRdbQuerySqlSync14800021_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 16 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let options: relationalStore.TransactionOptions = {
          transactionType: relationalStore.TransactionType.IMMEDIATE
        }
        const rdbTrans = await rdbStore!.createTransaction(options);
        let predicates = new relationalStore.RdbPredicates('test1');
        predicates.equalTo("NAME", "lisi");
        try {
          rdbTrans.querySql("SELECT * FROM test1").then(() => {
            rdbTrans.rollback();
          })
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021);
        }
        try {
          rdbTrans.querySqlSync("SELECT * FROM test1");
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   testRdbExecuteSync14800021_013
     * @tc.number   testRdbExecuteSync14800021_013
     * @tc.desc   testRdbExecuteSync14800021_013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRdbExecuteSync14800021_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
        const SQL_DELETE_TABLE = 'DELETE FROM test1';
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        rdbStore!.createTransaction().then((transaction: relationalStore.Transaction) => {
          try {
            let data = transaction.executeSync(SQL_DELETE_TABLE);
            transaction.commit();
            console.info(`delete result: ${data}`);
          } catch (err) {
            transaction.rollback();
            console.error(`delete failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(14800021)
          };
        }).catch((err) => {
          console.error(`createTransaction failed, code is ${err.code},message is ${err.message}`);
        })
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        rdbStore!.createTransaction().then((transaction: relationalStore.Transaction) => {
          try {
            transaction.execute(SQL_DELETE_TABLE).then((data) => {
              transaction.commit();
              console.info(`delete result: ${data}`);
            }).catch((e) => {
              transaction.rollback();
              console.error(`delete failed, code is ${e.code}, message is ${e.message}`);
            });
          } catch (err) {
            transaction.rollback();
            console.error(`delete failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(14800021)
          };
        }).catch((err) => {
          console.error(`createTransaction failed, code is ${err.code},message is ${err.message}`);
        });
        await rdbStore!.executeSql("DROP TABLE IF EXISTS test1");
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   testRdbInsertSync14800021_014
     * @tc.number   testRdbInsertSync14800021_014
     * @tc.desc   testRdbInsertSync14800021_014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbInsertSync14800021_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbInsertSync14800021_014 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18 as long,
      }
      try{
        rdbStore!.insertSync("employ", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect().assertFail();
      }catch(err){
        console.info(TAG + "err.code" + err.code + "err.message"+ err.message)
        expect(err.code).assertEqual(14800021);
      }
      done();
      console.info(TAG + "************* testRdbInsertSync14800021_014 end *************");
    })

    /**
     * @tc.name        testRdbTransInsert14800021_028
     * @tc.number      testRdbTransInsert14800021_028
     * @tc.desc        testRdbTransInsert14800021_028
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransInsert14800021_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbTransInsert14800021_028 start *************');
      let num = await rdbStore_2!.batchInsert("test", vbs);
      let trans = await rdbStore_2!.createTransaction();
      await CreateCorruptDb();
      try {
        let rows = await trans.insert("test", valueBucket3, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + '************* testRdbTransInsert14800021_028 rows *************' + rows);
        expect(rows).assertFail();
      } catch (err) {
        console.info(TAG + '************* testRdbTransInsert14800021_028 err *************' + err);
        expect(err.code).assertEqual(14800021);
      }
      trans.rollback();
      done();
      console.info(TAG + '************* testRdbTransInsert14800021_028 end *************');
    })

    /**
     * @tc.name        testRdbTransInsertSync14800021_029
     * @tc.number      testRdbTransInsertSync14800021_029
     * @tc.desc        testRdbTransInsertSync14800021_029
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransInsertSync14800021_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbTransInsertSync14800021_029 start *************');
      let num = await rdbStore_2!.batchInsert("test", vbs);
      let trans = await rdbStore_2!.createTransaction();
      await CreateCorruptDb();
      try {
        let rows = trans.insertSync("test", valueBucket3);
        console.info(TAG + '************* testRdbTransInsertSync14800021_029 rows *************' + rows);
      } catch (err) {
        console.info(TAG + '************* testRdbTransInsertSync14800021_029 err *************' + err);
        expect(err.code).assertEqual(14800021);
      }
      trans.rollback();
      done();
      console.info(TAG + '************* testRdbTransInsertSync14800021_029 end *************');
    })

    /**
     * @tc.name        testRdbTransInsertSync14800021_030
     * @tc.number      testRdbTransInsertSync14800021_030
     * @tc.desc        testRdbTransInsertSync14800021_030
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransInsertSync14800021_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbTransInsertSync14800021_030 start *************');
      let num = await rdbStore_2!.batchInsert("test", vbs);
      let trans = await rdbStore_2!.createTransaction();
      await CreateCorruptDb();
      try {
        let rows = trans.insertSync("test", valueBucket3, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + '************* testRdbTransInsertSync14800021_030 rows *************' + rows);
        expect(rows).assertFail();
      } catch (err) {
        console.info(TAG + '************* testRdbTransInsertSync14800021_030 err *************' + err);
        expect(err.code).assertEqual(14800021);
      }
      trans.rollback();
      done();
      console.info(TAG + '************* testRdbTransInsertSync14800021_030 end *************');
    })

    /**
     * @tc.name        testRdbTransUpdate14800021_031
     * @tc.number      testRdbTransUpdate14800021_031
     * @tc.desc        testRdbTransUpdate14800021_031
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransUpdate14800021_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransUpdate14800021_031 start *************');
        await rdbStore_2!.insert("test", valueBucket2);
        let trans = await rdbStore_2!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        await rdbStore_2!.execute(DROP_TABLE_TEST_CORRUPT);
        try {
          let rows: number = await trans.update(valueBucket3, predicates);
          console.info(TAG + '************* testRdbTransUpdate14800021_031 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          console.info(TAG + '************* testRdbTransUpdate14800021_031 err *************' + err);
          expect(err.code).assertEqual(14800021);
        }
        trans.rollback();
        done();
        console.info(TAG + '************* testRdbTransUpdate14800021_031 end *************');
      })

    /**
     * @tc.name        testRdbTransUpdate14800021_032
     * @tc.number      testRdbTransUpdate14800021_032
     * @tc.desc        testRdbTransUpdate14800021_032
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransUpdate14800021_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbTransUpdate14800021_032 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let trans = await rdbStore_2!.createTransaction();
      let predicates = new relationalStore.RdbPredicates("test");
      await rdbStore_2!.execute(DROP_TABLE_TEST_CORRUPT);
      try {
        let rows:number = await trans.update(valueBucket3, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(TAG + '************* testRdbTransUpdate14800021_032 rows *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        console.info(TAG + '************* testRdbTransUpdate14800021_032 err *************' + err);
        expect(err.code).assertEqual(14800021);
      }
      trans.rollback();
      done();
      console.info(TAG + '************* testRdbTransUpdate14800021_032 end *************');
    })

    /**
     * @tc.name        testRdbTransUpdateSync14800021_033
     * @tc.number      testRdbTransUpdateSync14800021_033
     * @tc.desc        testRdbTransUpdateSync14800021_033
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransUpdateSync14800021_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbTransUpdateSync14800021_033 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let trans = await rdbStore_2!.createTransaction();
      let predicates = new relationalStore.RdbPredicates("test");
      await rdbStore_2!.execute(DROP_TABLE_TEST_CORRUPT);
      try {
        let rows: number = trans.updateSync(valueBucket3, predicates);
        console.info(TAG + '************* testRdbTransUpdateSync14800021_033 rows *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        console.info(TAG + '************* testRdbTransUpdateSync14800021_033 err *************' + err);
        expect(err.code).assertEqual(14800021);
      }
      trans.rollback();
      done();
      console.info(TAG + '************* testRdbTransUpdateSync14800021_033 end *************');
    })

    /**
     * @tc.name        testRdbTransUpdateSync14800021_034
     * @tc.number      testRdbTransUpdateSync14800021_034
     * @tc.desc        testRdbTransUpdateSync14800021_034
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransUpdateSync14800021_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbTransUpdateSync14800021_034 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let trans = await rdbStore_2!.createTransaction();
      let predicates = new relationalStore.RdbPredicates("test");
      await rdbStore_2!.execute(DROP_TABLE_TEST_CORRUPT);
      try {
        let rows:number = trans.updateSync(valueBucket3, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(TAG + '************* testRdbTransUpdateSync14800021_034 rows *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        console.info(TAG + '************* testRdbTransUpdateSync14800021_034 err *************' + err);
        expect(err.code).assertEqual(14800021);
      }
      trans.rollback();
      done();
      console.info(TAG + '************* testRdbTransUpdateSync14800021_034 end *************');
    })

    /**
     * @tc.name        testRdbTransDeleteSync14800021_035
     * @tc.number      testRdbTransDeleteSync14800021_035
     * @tc.desc        testRdbTransDeleteSync14800021_035
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransDeleteSync14800021_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbTransDeleteSync14800021_035 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let trans = await rdbStore_2!.createTransaction();
      let predicates = new relationalStore.RdbPredicates("test");
      await rdbStore_2!.execute(DROP_TABLE_TEST_CORRUPT);
      try {
        let rows: number = trans.deleteSync(predicates);
        console.info(TAG + '************* testRdbTransDeleteSync14800021_035 rows *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        console.info(TAG + '************* testRdbTransDeleteSync14800021_035 err *************' + err);
        expect(err.code).assertEqual(14800021);
      }
      trans.rollback();
      done();
      console.info(TAG + '************* testRdbTransDeleteSync14800021_035 end *************');
    })

    /**
     * @tc.name        testRdbTransBatchInsertSync14800021_036
     * @tc.number      testRdbTransBatchInsertSync14800021_036
     * @tc.desc        testRdbTransBatchInsertSync14800021_036
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransBatchInsertSync14800021_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbTransBatchInsertSync14800021_036 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let trans = await rdbStore_2!.createTransaction();
      let predicates = new relationalStore.RdbPredicates("test");
      await rdbStore_2!.execute(DROP_TABLE_TEST_CORRUPT);
      try {
        let rows: number = trans.batchInsertSync("test", vbs);
        console.info(TAG + '************* testRdbTransBatchInsertSync14800021_036 rows *************' + rows);
        expect(rows == 1).assertFail();
      } catch (err) {
        console.info(TAG + '************* testRdbTransBatchInsertSync14800021_036 err *************' + err);
        expect(err.code).assertEqual(14800021);
      }
      trans.rollback();
      done();
      console.info(TAG + '************* testRdbTransBatchInsertSync14800021_036 end *************');
    })

    /**
     * @tc.name        testRdbTransBatchInsert14800021_037
     * @tc.number      testRdbTransBatchInsert14800021_037
     * @tc.desc        testRdbTransBatchInsert14800021_037
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransBatchInsert14800021_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbTransBatchInsert14800021_037 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let trans = await rdbStore_2!.createTransaction();
      let predicates = new relationalStore.RdbPredicates("test");
      await rdbStore_2!.execute(DROP_TABLE_TEST_CORRUPT);
      try {
        let rows:number = await trans.batchInsert("test", vbs);
        console.info(TAG + '************* testRdbTransBatchInsert14800021_037 rows *************' + rows);
        expect(rows == 3).assertFail();
      } catch(err) {
        console.info(TAG + '************* testRdbTransBatchInsert14800021_037 err *************' + err);
        expect(err.code).assertEqual(14800021);
      }
      trans.rollback();
      done();
      console.info(TAG + '************* testRdbTransBatchInsert14800021_037 end *************');
    })

    /**
     * @tc.name        testRdbResultSetGoToRow14800021_038
     * @tc.number      testRdbResultSetGoToRow14800021_038
     * @tc.desc        testRdbResultSetGoToRow14800021_038
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbResultSetGoToRow14800021_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_038 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let resultSet = await rdbStore_2!.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goTo(resultSet.getColumnIndex("data7"))
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_038 res *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_038 end *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_038 end *************');
    })

    /**
     * @tc.name        testRdbResultSetGoToRow14800021_039
     * @tc.number      testRdbResultSetGoToRow14800021_039
     * @tc.desc        testRdbResultSetGoToRow14800021_039
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbResultSetGoToRow14800021_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_039 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let resultSet = await rdbStore_2!.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goToRow(-1);
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_039 *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_039 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_039 end *************');
    })

    /**
     * @tc.name        testRdbResultSetGoToRow14800021_040
     * @tc.number      testRdbResultSetGoToRow14800021_040
     * @tc.desc        testRdbResultSetGoToRow14800021_040
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbResultSetGoToRow14800021_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_040 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let resultSet = await rdbStore_2!.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goToFirstRow();
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_040 *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_040 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_040 end *************');
    })

    /**
     * @tc.name        testRdbResultSetGoToRow14800021_041
     * @tc.number      testRdbResultSetGoToRow14800021_041
     * @tc.desc        testRdbResultSetGoToRow14800021_041
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbResultSetGoToRow14800021_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_041 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let resultSet = await rdbStore_2!.querySql("SELECT * FROM test1 where data3 = 20.0");
      try{
        let res = resultSet.goToLastRow();
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_041 *************' +res);
        expect(res).assertEqual(false);
      }catch(err) {
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_041 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_041 end *************');
    })

    /**
     * @tc.name        testRdbResultSetGoToRow14800021_042
     * @tc.number      testRdbResultSetGoToRow14800021_042
     * @tc.desc        testRdbResultSetGoToRow14800021_042
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbResultSetGoToRow14800021_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_042 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let resultSet = await rdbStore_2!.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goToNextRow();
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_042 *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_042 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_042 end *************');
    })

    /**
     * @tc.name        testRdbResultSetGoToRow14800021_043
     * @tc.number      testRdbResultSetGoToRow14800021_043
     * @tc.desc        testRdbResultSetGoToRow14800021_043
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbResultSetGoToRow14800021_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_043 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let resultSet = await rdbStore_2!.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goToPreviousRow();
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_043 *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_043 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_043 end *************');
    })

    /**
     * @tc.name        testRdbResultSetGoToRow14800021_044
     * @tc.number      testRdbResultSetGoToRow14800021_044
     * @tc.desc        testRdbResultSetGoToRow14800021_044
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbResultSetGoToRow14800021_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_044 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let resultSet = await rdbStore_2!.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.goToPreviousRow();
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_044 *************' + res);
        expect(res).assertEqual(false);
      } catch (err) {
        console.info(TAG + '************* testRdbResultSetGoToRow14800021_044 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      console.info(TAG + '************* testRdbResultSetGoToRow14800021_044 end *************');
    })
    /**
     * @tc.name        testRdbResultSetGetColumnIndex14800021_045
     * @tc.number      testRdbResultSetGetColumnIndex14800021_045
     * @tc.desc        testRdbResultSetGetColumnIndex14800021_045
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbResultSetGetColumnIndex14800021_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbResultSetGetColumnIndex14800021_045 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let resultSet = await rdbStore_2!.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.getColumnIndex("data1");
        console.info(TAG + '************* testRdbResultSetGetColumnIndex14800021_045 *************' + res);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.info(TAG + '************* testRdbResultSetGetColumnIndex14800021_045 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      console.info(TAG + '************* testRdbResultSetGetColumnIndex14800021_045 end *************');
    })

    /**
     * @tc.name        testRdbResultSetGetColumnName14800021_046
     * @tc.number      testRdbResultSetGetColumnName14800021_046
     * @tc.desc        testRdbResultSetGetColumnName14800021_046
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbResultSetGetColumnName14800021_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(TAG + '************* testRdbResultSetGetColumnName14800021_046 start *************');
      await rdbStore_2!.insert("test", valueBucket2);
      let resultSet = await rdbStore_2!.querySql("SELECT * FROM test1 where data3 = 20.0");
      try {
        let res = resultSet.getColumnName(0);
        console.info(TAG + '************* testRdbResultSetGetColumnName14800021_046 *************' + res);
        expect(res).assertEqual("");
      } catch (err) {
        console.info(TAG + '************* testRdbResultSetGetColumnName14800021_046 *************'+err.code + err.message);
        expect(true).assertFail();
      }
      done();
      console.info(TAG + '************* testRdbResultSetGetColumnName14800021_046 end *************');
    })
  })
}