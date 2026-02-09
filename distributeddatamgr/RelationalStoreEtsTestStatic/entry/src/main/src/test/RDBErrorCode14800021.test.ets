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

let num = "a".repeat((1024) * (1024) * 30);
let context: common.UIAbilityContext;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let domain: int = 0x0000;
let tag: string = 'testTag';
const TAG = "[RelationalStore_JSKITS_TEST]";
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
let rdbStore: relationalStore.RdbStore;

export default function RDBErrorCode14800021() {
  describe('RDBErrorCode14800021', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(7000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
    })

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      console.info(TAG + "*************Unit Test end*************");
    })

    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionErrcode0200
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionErrcode0200
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionErrcode0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0200 start *************");
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
          await rdbStore.batchInsertWithConflictResolution("test1", vbs,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect().assertFail();
        } catch (err: BusinessError) {
          console.log(TAG + err + "batchInsertWithConflictResolution failed" + err.code);
          expect(err.code).assertEqual(14800021);
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0200 end *************");
      })

    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0200
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0200
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0200 start *************");
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
          rdbStore.batchInsertWithConflictResolutionSync("test1", vbs,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect().assertFail();
        } catch (err: BusinessError) {
          console.log(TAG + err + "batchInsertWithConflictResolutionSync failed" + err.code);
          expect(err.code).assertEqual(14800021);
        }
        done();
        console.log(TAG +
          "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0200 end *************");
      })

    /**
     * @tc.name   testbatchInsertWithConflictResolutionInTransaction1200
     * @tc.number testbatchInsertWithConflictResolutionInTransaction1200
     * @tc.desc   testbatchInsertWithConflictResolutionInTransaction1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionInTransaction1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1200 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
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
          console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction1200 insert num " + num);
        } catch (e: BusinessError) {
          console.log(TAG + e + " code: " + e.code);
          expect(e.code).assertEqual(14800021);
        }
        done();
        console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction1200 end *************");
      })

    /**
     * @tc.name   testTransactionBatchInsertWithConflictResolutionErrcode0300
     * @tc.number testTransactionBatchInsertWithConflictResolutionErrcode0300
     * @tc.desc   testTransactionBatchInsertWithConflictResolutionErrcode0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransactionBatchInsertWithConflictResolutionErrcode0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.log(TAG +
          "************* testTransactionBatchInsertWithConflictResolutionErrcode0300 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
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
          console.log(TAG + "testTransactionBatchInsertWithConflictResolutionErrcode0300 error");
        } catch (err: BusinessError) {
          console.log(TAG + err + " code: " + err.code);
          expect(err.code).assertEqual(14800021);
        }
        done();
        console.log(TAG + "testTransactionBatchInsertWithConflictResolutionErrcode0300 end");
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0300
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0300
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore.insert("test1", valueBucket);
        try {
          rdbStore.backup("TransactionTest.db").then(() => {
            console.info('Backup success.');
          }).catch((err: Error) => {
            console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0400
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0400
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
        try {
          let promiseBackup = rdbStore.backup("TransactionTest.db");
          promiseBackup.then(() => {
            console.info('Backup success.');
          }).catch((err: Error) => {
            console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }

        try {
          let promiseRestore = rdbStore.restore("TransactionTest.db");
          promiseRestore.then(() => {
            console.info('Restore success.');
          }).catch((err: Error) => {
            console.error(`Restore failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }
        const dbPath = context.databaseDir + "/rdb/TransactionTest.db";
        try {
          rdbStore.attach(dbPath, "attachDB").then((number: int) => {
            console.info('attach succeeded');
          }).catch((err: Error) => {
            console.error(`attach failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }
        await rdbStore.executeSql("DROP TABLE IF EXISTS test1");
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0500
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0500
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbStore.insert("test1", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");

        try {
          rdbStore.lockRow(predicates).then(() => {
            console.info(`Lock success`);
          }).catch((err: Error) => {
            console.error(`Lock failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }

        try {
          rdbStore.unlockRow(predicates).then(() => {
            console.info(`Unlock success`);
          }).catch((err: Error) => {
            console.error(`Unlock failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }

        try {
          rdbStore.queryLockedRow(predicates, ["id", "name", "age", "salary"])
            .then((resultSet: relationalStore.ResultSet) => {
              console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
              // 释放数据集的内存，若不释放可能会引起fd泄露与内存泄露
              resultSet.close();
            })
            .catch((err: Error) => {
              console.error(`Query failed, code is ${err.code},message is ${err.message}`);
            })
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }
        let predicates1 = new relationalStore.RdbPredicates("test1");
        let resultSet: relationalStore.ResultSet = await rdbStore.query(predicates1);

        try {
          await resultSet.getRows(resultSet.columnCount);
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0700
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0700
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
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
        const rdbTrans = await rdbStore.createTransaction(options);

        try {
          rdbTrans.insert("test1", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(() => {
            rdbTrans.rollback();
          })
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }

        try {
          rdbTrans.insertSync("test1", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }

        let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket, valueBucket, valueBucket);
        try {
          rdbTrans.batchInsert("test1", valueBuckets).then(() => {
            rdbTrans.rollback();
          })
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }

        try {
          rdbTrans.batchInsertSync("test1", valueBuckets)
          rdbTrans.rollback();
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }
        await rdbStore.executeSql("DROP TABLE IF EXISTS test1");
        await rdbStore.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1200
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql("DROP TABLE IF EXISTS test1");
        let options: relationalStore.TransactionOptions = {
          transactionType: relationalStore.TransactionType.EXCLUSIVE
        }
        let rdbTrans = await rdbStore.createTransaction(options);
        let predicates = new relationalStore.RdbPredicates('test1');
        predicates.equalTo("NAME", "lisi");
        try {
          await rdbTrans.delete(predicates);
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          await rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }
        rdbTrans = await rdbStore.createTransaction(options);
        try {
          rdbTrans.deleteSync(predicates);
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          await rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0900
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0900
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
        try {
          rdbStore.attach(context, STORE_CONFIG1, "attachDB").then((number: int) => {
            console.info(`attach succeeded, number is ${number}`);
          }).catch((err: Error) => {
            console.error(`attach failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }
        try {
          rdbStore.detach("attachDB").then((number: int) => {
            console.info(`detach succeeded, number is ${number}`);
          }).catch((err: Error) => {
            console.error(`detach failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }
        try {
          rdbStore.detach("attachDB").then((number: int) => {
            console.info(`detach succeeded, number is ${number}`);
          }).catch((err: Error) => {
            console.error(`detach failed, code is ${err.code},message is ${err.message}`);
          })
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }
        await rdbStore.executeSql("DROP TABLE IF EXISTS test1");
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1000
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1000
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
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
        await rdbStore.insert("test1", valueBucket);
        let options: relationalStore.TransactionOptions = {
          transactionType: relationalStore.TransactionType.IMMEDIATE
        }
        const rdbTrans = await rdbStore.createTransaction(options);
        let predicates = new relationalStore.RdbPredicates('test1');
        predicates.equalTo("NAME", "lisi");
        try {
          rdbTrans.update(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(() => {
          })
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800021)
        }
        try {
          rdbTrans.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          rdbTrans.rollback();
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1100
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
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
        await rdbStore.insert("test1", valueBucket);
        let options: relationalStore.TransactionOptions = {
          transactionType: relationalStore.TransactionType.IMMEDIATE
        }
        const rdbTrans = await rdbStore.createTransaction(options);
        let predicates = new relationalStore.RdbPredicates('test1');
        predicates.equalTo("NAME", "lisi");
        try {
          rdbTrans.querySql("SELECT * FROM test1").then(() => {
            rdbTrans.rollback();
          })
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021);
        }
        try {
          rdbTrans.querySqlSync("SELECT * FROM test1");
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800021)
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1300
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1300
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
        const SQL_DELETE_TABLE = 'DELETE FROM test1';
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
        rdbStore.createTransaction().then((transaction: relationalStore.Transaction) => {
          try {
            let data = transaction.executeSync(SQL_DELETE_TABLE);
            transaction.commit();
            console.info(`delete result: ${data}`);
          } catch (err: BusinessError) {
            transaction.rollback();
            console.error(`delete failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(14800021)
          };
        }).catch((err: Error) => {
          console.error(`createTransaction failed, code is ${err.code},message is ${err.message}`);
        })
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
        rdbStore.createTransaction().then((transaction: relationalStore.Transaction) => {
          try {
            transaction.execute(SQL_DELETE_TABLE).then((data) => {
              transaction.commit();
              console.info(`delete result: ${data}`);
            }).catch((e: Error) => {
              transaction.rollback();
              console.error(`delete failed, code is ${e.code}, message is ${e.message}`);
            });
          } catch (err: BusinessError) {
            transaction.rollback();
            console.error(`delete failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(14800021)
          };
        }).catch((err: Error) => {
          console.error(`createTransaction failed, code is ${err.code},message is ${err.message}`);
        });
        await rdbStore.executeSql("DROP TABLE IF EXISTS test1");
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        done();
      })

    /**
     * @tc.name   errcode029
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_12600
     * @tc.desc   rdbStore.insertSync errcode is 14800021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* errcode029 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18 as long,
      }
      try{
        rdbStore.insertSync("employ", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect().assertFail();
      }catch(err: BusinessError){
        console.info(TAG + "err.code" + err.code + "err.message"+ err.message)
        expect(err.code).assertEqual(14800021);
      }
      done();
      console.info(TAG + "************* errcode029 end *************");
    })
  })
}