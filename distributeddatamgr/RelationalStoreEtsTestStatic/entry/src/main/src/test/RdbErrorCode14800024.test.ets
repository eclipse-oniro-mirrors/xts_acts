import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import relationalStore from '@ohos.data.relationalStore';
import fs from '@ohos.file.fs';

let context:common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let name = "a".repeat(10);

const TAG = "[RdbErrorCode14800024]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

let STORE_CONFIG :relationalStore.StoreConfig = {
  name: "RdbErrorCode14800024.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

const DROP_TABLE_TESTTRANS = "DROP TABLE IF EXISTS testTrans";

let rdbStore : relationalStore.RdbStore | undefined;
let vbs :Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>(3);
const valueBucket0 :relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long,
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket1 :relationalStore.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
const valueBucket2 :relationalStore.ValuesBucket = {
  "data1": "hello world",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}
vbs[0] = valueBucket0
vbs[1] = valueBucket1
vbs[2] = valueBucket2

const valueBucket3 :relationalStore.ValuesBucket = {
  "data1": "hello 00000000",
  "data2": 10 as long,
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket4 :relationalStore.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
const valueBucket5: relationalStore.ValuesBucket = {
  "data1": name,
  "data2": 10 as long,
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
// 新增：事务冲突场景配置
const STORE_CONFIG_TXN24: relationalStore.StoreConfig = {
  name: "RdbErrorCode14800024_txn.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  customDir: "data/app/el2/100/database/bundleName/rdb"
}

const CREATE_TABLE_TEST_TXN24 = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 VARCHAR(10)," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 float32Array," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let options: relationalStore.TransactionOptions = {
  transactionType: relationalStore.TransactionType.DEFERRED
}

let rdbStoreTxn24: relationalStore.RdbStore | undefined;

export default function RdbErrorCode14800024() {

  describe("RdbErrorCode14800024", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(DROP_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      let num = await rdbStore!.batchInsert("test", vbs);
    });

    afterAll(async (): Promise<void> => {
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
    })

    afterEach(async (): Promise<void> => {
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
    })
    /**
     * @tc.name   testRdbResultSetGetRows14800024_001
     * @tc.number   testRdbResultSetGetRows14800024_001
     * @tc.desc   testRdbResultSetGetRows14800024_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbResultSetGetRows14800024_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + '************* testRdbResultSetGetRows14800024_001 start *************');
        let predicates = new relationalStore.RdbPredicates('test');
        let resultSet: relationalStore.ResultSet = await rdbStore!.query(predicates);
        let MaxCount = 1;
        let columnIndex = 1;
        try {
          let row = await (resultSet as relationalStore.ResultSet).getRows(MaxCount);
        } catch (e) {
          expect(e.code).assertEqual(14800024);
        }

        try {
          resultSet.goToFirstRow();
          let row = (resultSet as relationalStore.ResultSet).isColumnNull(columnIndex);
        } catch (e) {
          expect(e.code).assertEqual(14800024);
        }
        resultSet.close();

        done();
        console.info(TAG + '************* testRdbResultSetGetRows14800024_001 end *************');
      })

    /**
     * @tc.name   testRdbApi14800024_002
     * @tc.number   testRdbApi14800024_002
     * @tc.desc   testRdbApi14800024_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbApi14800024_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************* testRdbApi14800024_002 start *************');
      let predicates = new relationalStore.RdbPredicates('test');
      let resultSet: relationalStore.ResultSet = await rdbStore!.query(predicates);
      const SQL_DELETE_TABLE = "DELETE FROM test WHERE data1 = 'zhangsan123'";
      const SQL_DELETE_TABLE1 = "DELETE FROM test WHERE name = ?";
      const SQL_CHECK_INTEGRITY = 'PRAGMA integrity_check';

      try {
        await rdbStore!.attach("/path/errPath/attach.db", "attachDB");
      } catch (e) {
        if (e.code != 14800010) {
          expect(14800024).assertEqual(e.code);
        }
      }

      try {
        await rdbStore!.backup("dbBackup002.db");
      } catch (e) {
        e = e as BusinessError;
        expect(e.code).assertEqual(14800024);
      }

      try {
        await rdbStore!.attach(context!, STORE_CONFIG, "attachDB");
      } catch(e) {
        e = e as BusinessError;
        if (e.code == 14800024) {
          expect(14800024).assertEqual(e.code);
        }
      }

      try {
        rdbStore!.executeSync(SQL_CHECK_INTEGRITY);
      } catch (e) {
        if (e.code != 801) {
          expect(e.code).assertEqual(14800024);
        }
      }

      try {
        await rdbStore!.detach("attachDB");
      } catch (e) {
        if (e.code == 14800024) {
          expect(14800024).assertEqual(e.code);
        }
      }

      try {
        await rdbStore!.restore("dbBackup002.db");
      } catch (e) {
        expect(e.code).assertEqual(14800024);
      }

      resultSet.close();

      done();
      console.info(TAG + '************* testRdbApi14800024_002 end *************');
    })

    /**
     * @tc.name   testRdbTransaction14800024_003
     * @tc.number   testRdbTransaction14800024_003
     * @tc.desc   testRdbTransaction14800024_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransaction14800024_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + '************* testRdbTransaction14800024_003 start *************');
        let predicates = new relationalStore.RdbPredicates('test');
        let resultSet: relationalStore.ResultSet = await rdbStore!.query(predicates);
        predicates.equalTo("data", "Lisa");

        try {
          await rdbStore!.lockRow(predicates)
        } catch (e) {
          if (e.code == 14800024) {
            expect(14800024).assertEqual(e.code);
          }
        }

        try {
          await rdbStore!.queryLockedRow(predicates)
        } catch (e) {
          if (e.code == 14800024) {
            expect(14800024).assertEqual(e.code);
          }
        }

        try {
          await rdbStore!.unlockRow(predicates)
        } catch (e) {
          if (e.code == 14800024) {
            expect(14800024).assertEqual(e.code);
          }
        }

        if (rdbStore!) {
          rdbStore!.createTransaction().then((transaction: relationalStore.Transaction) => {
            transaction.execute("DELETE FROM test WHERE data1 = ? OR data2 = ?", [21 as long, 20 as long]).then(() => {
            }).catch((e) => {
              try {
                transaction.rollback();
              } catch (e) {
                if (e.code == 14800024) {
                  expect(14800024).assertEqual(e.code);
                }
              }
              if (e.code == 14800024) {
                expect(14800024).assertEqual(e.code);
              }
            });

            let u8 = new Uint8Array(0);
            const valueBucket1: relationalStore.ValuesBucket = {
              'data1': 'hello world',
              'data2': 3 as long,
              'data3': 1.8,
            };

            const record: relationalStore.ValuesBucket = {
              'data1': 'hello world',
              'data2': 4 as long,
            }

            try {
              transaction.insertSync("test", valueBucket1,
                relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            } catch (e) {
              expect(14800024).assertEqual(e.code);
            }

            try {
              await transaction.batchInsertWithConflictResolution("test", [valueBucket1],
                relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            } catch (e) {
              expect(14800024).assertEqual(e.code);
            }

            try {
              transaction.insertSync("test", valueBucket1,
                relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            } catch (e) {
              expect(14800024).assertEqual(e.code);
            }

            try {
              transaction.batchInsertWithConflictResolutionSync("test", [valueBucket1],
                relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            } catch (e) {
              expect(14800024).assertEqual(e.code);
            }

            let predicates1 = new relationalStore.RdbPredicates('test');
            predicates1.equalTo("id", 1 as long);

            try {
              let rowId = transaction.updateSync(record, predicates1,
                relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
              console.info(TAG + "update one record success " + rowId)
            } catch (e) {
              expect(e.code).assertEqual(14800024);
            }

            try {
              await transaction.execute("PRAGMA integrity_check");
            } catch (e) {
              expect(e.code).assertEqual(14800024);
            }

            try {
              let predicates3 = new relationalStore.RdbPredicates('test');
              predicates3.equalTo("id", 2 as long);
              transaction.deleteSync(predicates3);
            } catch (e) {
              expect(e.code).assertEqual(14800024);
            }

            try {
              let resultSet = transaction.querySqlSync("SELECT * FROM test");
            } catch (e) {
              expect(e.code).assertEqual(14800024);
            }


          }).catch((err) => {
            console.error(`createTransaction faided, code is ${err.code},message is ${err.message}`);
            if (err.code == 14800024) {
              expect(14800024).assertEqual(err.code);
            }
          });
        }
        resultSet.close();

        done();
        console.info(TAG + '************* testRdbTransaction14800024_003 end *************');
      })

    /**
     * @tc.name   testRdbDistributed14800024_004
     * @tc.number   testRdbDistributed14800024_004
     * @tc.desc   testRdbDistributed14800024_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbDistributed14800024_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + '************* testRdbDistributed14800024_004 start *************');
        let predicates = new relationalStore.RdbPredicates('test');
        let resultSet: relationalStore.ResultSet = await rdbStore!.query(predicates);
        let PRIKey: relationalStore.PRIKeyType[] = [1 as long, 4 as long, 2 as long, 3 as long];
        try {
          rdbStore!.getModifyTime("test", "data2", PRIKey);
        } catch (e) {
          expect(e.code).assertEqual(14800024);
        }
        try {
          rdbStore!.cleanDirtyData('test_table', 100);
        } catch (e) {
          if (e.code != 801) {
            expect(e.code).assertEqual(14800024);
          }
        }
        resultSet.close();
        done();
        console.info(TAG + '************* testRdbDistributed14800024_004 end *************');
      })

    /**
     * @tc.name        testRdbInsert14800024_005
     * @tc.number      testRdbInsert14800024_005
     * @tc.desc        testRdbInsert14800024_005
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbInsert14800024_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbInsert14800024_005 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = await rdbStoreTxn24!.insert("test", valueBucket5);
          console.info(TAG + '************* testRdbInsert14800024_005 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbInsert14800024_005 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbInsert14800024_005 end *************');
      })

    /**
     * @tc.name        testRdbInsertSync14800024_006
     * @tc.number      testRdbInsertSync14800024_006
     * @tc.desc        testRdbInsertSync14800024_006
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbInsertSync14800024_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbInsertSync14800024_006 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = rdbStoreTxn24!.insertSync("test", valueBucket5);
          console.info(TAG + '************* testRdbInsertSync14800024_006 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbInsertSync14800024_006 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbInsertSync14800024_006 end *************');
      })

    /**
     * @tc.name        testRdbInsert14800024_007
     * @tc.number      testRdbInsert14800024_007
     * @tc.desc        testRdbInsert14800024_007
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbInsert14800024_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbInsert14800024_007 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num =
            await rdbStoreTxn24!.insert("test", valueBucket5, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.info(TAG + '************* testRdbInsert14800024_007 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbInsert14800024_007 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbInsert14800024_007 end *************');
      })

    /**
     * @tc.name        testRdbInsertSync14800024_008
     * @tc.number      testRdbInsertSync14800024_008
     * @tc.desc        testRdbInsertSync14800024_008
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbInsertSync14800024_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbInsertSync14800024_008 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = rdbStoreTxn24!.insertSync("test", valueBucket5, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.info(TAG + '************* testRdbInsertSync14800024_008 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbInsertSync14800024_008 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbInsertSync14800024_008 end *************');
      })

    /**
     * @tc.name        testRdbUpdate14800024_009
     * @tc.number      testRdbUpdate14800024_009
     * @tc.desc        testRdbUpdate14800024_009
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbUpdate14800024_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbUpdate14800024_009 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        await rdbTrans.insert("test", valueBucket5);
        try {
          let rows: number = await rdbStoreTxn24!.update(valueBucket4, predicates);
          console.info(TAG + '************* testRdbUpdate14800024_009 ************* rows ' + rows);
          expect(rows == 1).assertFail();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbUpdate14800024_009 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbUpdate14800024_009 end *************');
      })


    /**
     * @tc.name        testRdbUpdateSync14800024_010
     * @tc.number      testRdbUpdateSync14800024_010
     * @tc.desc        testRdbUpdateSync14800024_010
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbUpdateSync14800024_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbUpdateSync14800024_010 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        await rdbTrans.insert("test", valueBucket5);
        try {
          let rows: number = rdbStoreTxn24!.updateSync(valueBucket4, predicates);
          console.info(TAG + '************* testRdbUpdateSync14800024_010 ************* rows ' + rows);
          expect(rows == 1).assertFail();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbUpdateSync14800024_010 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbUpdateSync14800024_010 end *************');
      })
    /**
     * @tc.name        testRdbUpdate14800024_011
     * @tc.number      testRdbUpdate14800024_011
     * @tc.desc        testRdbUpdate14800024_011
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbUpdate14800024_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbUpdate14800024_011 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = await rdbStoreTxn24!.update(valueBucket5, predicates,
            relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.info(TAG + '************* testRdbUpdate14800024_011 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbUpdate14800024_011 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbUpdate14800024_011 end *************');
      })
    /**
     * @tc.name        testRdbUpdateSync14800024_012
     * @tc.number      testRdbUpdateSync14800024_012
     * @tc.desc        testRdbUpdateSync14800024_012
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbUpdateSync14800024_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbUpdateSync14800024_012 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num =
            rdbStoreTxn24!.updateSync(valueBucket5, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.info(TAG + '************* testRdbUpdateSync14800024_012 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbUpdateSync14800024_012 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbUpdateSync14800024_012 end *************');
      })
    /**
     * @tc.name        testRdbDelete14800024_013
     * @tc.number      testRdbDelete14800024_013
     * @tc.desc        testRdbDelete14800024_013
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbDelete14800024_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbDelete14800024_013 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = await rdbStoreTxn24!.delete(predicates);
          console.info(TAG + '************* testRdbDelete14800024_013 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbDelete14800024_013 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbDelete14800024_013 end *************');
      })
    /**
     * @tc.name        testRdbDeleteSync14800024_014
     * @tc.number      testRdbDeleteSync14800024_014
     * @tc.desc        testRdbDeleteSync14800024_014
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbDeleteSync14800024_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbDeleteSync14800024_014 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = rdbStoreTxn24!.deleteSync(predicates);
          console.info(TAG + '************* testRdbDeleteSync14800024_014 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbDeleteSync14800024_014 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbDeleteSync14800024_014 end *************');
      })
    /**
     * @tc.name        testRdbExecute14800024_015
     * @tc.number      testRdbExecute14800024_015
     * @tc.desc        testRdbExecute14800024_015
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbExecute14800024_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbExecute14800024_015 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = await rdbStoreTxn24!.execute("INSERT INTO test (data1, data2, data3)  VALUES  ('name',10,1.0)");
          console.info(TAG + '************* testRdbExecute14800024_015 ************* num ' + num);
          expect(num == "ok").assertFail();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbExecute14800024_015 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbExecute14800024_015 end *************');
      })

    /**
     * @tc.name        testRdbTransInsert14800024_016
     * @tc.number      testRdbTransInsert14800024_016
     * @tc.desc        testRdbTransInsert14800024_016
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransInsert14800024_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransInsert14800024_016 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        const rdbTrans1 = await rdbStoreTxn24!.createTransaction();
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = await rdbTrans1.insert("test", valueBucket5);
          console.info(TAG + '************* testRdbTransInsert14800024_016 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbTransInsert14800024_016 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbTransInsert14800024_016 end *************');
      })

    /**
     * @tc.name        testRdbTransInsertSync14800024_017
     * @tc.number      testRdbTransInsertSync14800024_017
     * @tc.desc        testRdbTransInsertSync14800024_017
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransInsertSync14800024_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransInsertSync14800024_017 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        const rdbTrans1 = await rdbStoreTxn24!.createTransaction();
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = rdbTrans1.insertSync("test", valueBucket5);
          console.info(TAG + '************* testRdbTransInsertSync14800024_017 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbTransInsertSync14800024_017 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans1.rollback();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbTransInsertSync14800024_017 end *************');
      })

    /**
     * @tc.name        testRdbTransInsert14800024_018
     * @tc.number      testRdbTransInsert14800024_018
     * @tc.desc        testRdbTransInsert14800024_018
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransInsert14800024_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransInsert14800024_018 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        const rdbTrans1 = await rdbStoreTxn24!.createTransaction();
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num =
            await rdbTrans1.insert("test", valueBucket5, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.info(TAG + '************* testRdbTransInsert14800024_018 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbTransInsert14800024_018 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbTransInsert14800024_018 end *************');
      })

    /**
     * @tc.name        testRdbTransInsertSync14800024_019
     * @tc.number      testRdbTransInsertSync14800024_019
     * @tc.desc        testRdbTransInsertSync14800024_019
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransInsertSync14800024_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransInsertSync14800024_019 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        const rdbTrans1 = await rdbStoreTxn24!.createTransaction();
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num =
            rdbTrans1.insertSync("test", valueBucket5, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.info(TAG + '************* testRdbTransInsertSync14800024_019 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbTransInsertSync14800024_019 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbTransInsertSync14800024_019 end *************');
      })

    /**
     * @tc.name        testRdbTransUpdate14800024_020
     * @tc.number      testRdbTransUpdate14800024_020
     * @tc.desc        testRdbTransUpdate14800024_020
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransUpdate14800024_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransUpdate14800024_020 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        const rdbTrans1 = await rdbStoreTxn24!.createTransaction();
        await rdbTrans.insert("test", valueBucket5);
        try {
          let rows: number = await rdbTrans1.update(valueBucket4, predicates);
          console.info(TAG + '************* testRdbTransUpdate14800024_020 ************* rows ' + rows);
          expect(rows == 1).assertFail();
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbTransUpdate14800024_020 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbTransUpdate14800024_020 end *************');
      })


    /**
     * @tc.name        testRdbTransUpdateSync14800024_021
     * @tc.number      testRdbTransUpdateSync14800024_021
     * @tc.desc        testRdbTransUpdateSync14800024_021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransUpdateSync14800024_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransUpdateSync14800024_021 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        const rdbTrans1 = await rdbStoreTxn24!.createTransaction();
        await rdbTrans.insert("test", valueBucket5);
        try {
          let rows: number = rdbTrans1.updateSync(valueBucket4, predicates);
          console.info(TAG + '************* testRdbTransUpdateSync14800024_021 ************* rows ' + rows);
          expect(rows == 1).assertFail();
          rdbTrans1.rollback();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbTransUpdateSync14800024_021 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans1.rollback();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbTransUpdateSync14800024_021 end *************');
      })
    /**
     * @tc.name        testRdbTransUpdate14800024_022
     * @tc.number      testRdbTransUpdate14800024_022
     * @tc.desc        testRdbTransUpdate14800024_022
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransUpdate14800024_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransUpdate14800024_022 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        const rdbTrans1 = await rdbStoreTxn24!.createTransaction();
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = await rdbTrans1.update(valueBucket5, predicates,
            relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.info(TAG + '************* testRdbTransUpdate14800024_022 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbTransUpdate14800024_022 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans1.rollback();
          rdbTrans.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbTransUpdate14800024_022 end *************');
      })
    /**
     * @tc.name        testRdbTransUpdateSync14800024_023
     * @tc.number      testRdbTransUpdateSync14800024_023
     * @tc.desc        testRdbTransUpdateSync14800024_023
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransUpdateSync14800024_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransUpdateSync14800024_023 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        const rdbTrans1 = await rdbStoreTxn24!.createTransaction();
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num =
            rdbTrans1.updateSync(valueBucket5, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.info(TAG + '************* testRdbTransUpdateSync14800024_023 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbTransUpdateSync14800024_023 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbTransUpdateSync14800024_023 end *************');
      })
    /**
     * @tc.name        testRdbTransDelete14800024_024
     * @tc.number      testRdbTransDelete14800024_024
     * @tc.desc        testRdbTransDelete14800024_024
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransDelete14800024_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransDelete14800024_024 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        const rdbTrans1 = await rdbStoreTxn24!.createTransaction();
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = await rdbTrans1.delete(predicates);
          console.info(TAG + '************* testRdbTransDelete14800024_024 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbTransDelete14800024_024 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbTransDelete14800024_024 end *************');
      })
    /**
     * @tc.name        testRdbTransDeleteSync14800024_025
     * @tc.number      testRdbTransDeleteSync14800024_025
     * @tc.desc        testRdbTransDeleteSync14800024_025
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransDeleteSync14800024_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransDeleteSync14800024_025 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        const rdbTrans1 = await rdbStoreTxn24!.createTransaction();
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = rdbTrans1.deleteSync(predicates);
          console.info(TAG + '************* testRdbTransDeleteSync14800024_025 ************* num ' + num);
          expect(num == 1).assertFail();
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbTransDeleteSync14800024_025 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbTransDeleteSync14800024_025 end *************');
      })
    /**
     * @tc.name        testRdbExecute14800024_026
     * @tc.number      testRdbExecute14800024_026
     * @tc.desc        testRdbExecute14800024_026
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbExecute14800024_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbExecute14800024_026 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(DROP_TABLE_TEST);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        const rdbTrans1 = await rdbStoreTxn24!.createTransaction();
        await rdbTrans.insert("test", valueBucket5);
        try {
          let num = await rdbStoreTxn24!.execute("INSERT INTO test (data1, data2, data3)  VALUES  ('name',10,1.0)");
          console.info(TAG + '************* testRdbExecute14800024_026 ************* num ' + num);
          expect(num == "ok").assertFail();
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        } catch (err) {
          console.info(TAG + '************* testRdbExecute14800024_026 ************* err ' + err.code);
          expect(err.code === 14800024).assertEqual(true);
          rdbTrans.rollback();
          rdbTrans1.rollback();
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG_TXN24);
          done();
        }
        console.info(TAG + '************* testRdbExecute14800024_026 end *************');
      })

    /**
     * @tc.name        testRdbBatchInsert14800024_027
     * @tc.number      testRdbBatchInsert14800024_027
     * @tc.desc        testRdbBatchInsert14800024_027
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbBatchInsert14800024_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbBatchInsert14800024_027 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        let values = new Array<relationalStore.ValuesBucket>();
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        values.push(valueBucket5);
        await rdbTrans.insert("test", valueBucket5);
        try {
          await rdbStoreTxn24!.batchInsert("test", values);
          expect().assertFail();
        } catch (err) {
          console.info(TAG + 'batchInsert errCode: ' + err.code);
          expect(err.code).assertEqual(14800024);
        }
        done();
        console.info(TAG + '************* testRdbBatchInsert14800024_027 end *************');
      })

    /**
     * @tc.name        testRdbBatchInsertSync14800024_028
     * @tc.number      testRdbBatchInsertSync14800024_028
     * @tc.desc        testRdbBatchInsertSync14800024_028
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbBatchInsertSync14800024_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbBatchInsertSync14800024_028 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        let values = new Array<relationalStore.ValuesBucket>();
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        values.push(valueBucket5);
        await rdbTrans.insert("test", valueBucket5);
        try {
          rdbStoreTxn24!.batchInsertSync("test", values);
          expect().assertFail();
        } catch (err) {
          console.info(TAG + 'batchInsertSync errCode: ' + err.code);
          expect(err.code).assertEqual(14800024);
        }
        done();
        console.info(TAG + '************* testRdbBatchInsertSync14800024_028 end *************');
      })


    /**
     * @tc.name        testRdbCreateTransaction14800024_029
     * @tc.number      testRdbCreateTransaction14800024_029
     * @tc.desc        createTransaction normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbCreateTransaction14800024_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbCreateTransaction14800024_029 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        let values = new Array<relationalStore.ValuesBucket>();
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        values.push(valueBucket5);
        await rdbTrans.insert("test", valueBucket5);
        try {
          await rdbStoreTxn24!.createTransaction();
        } catch (err) {
          console.info(TAG + 'createTransaction errCode: ' + err.code);
          expect(err.code).assertEqual(14800024);
        }
        done();
        console.info(TAG + '************* testRdbCreateTransaction14800024_029 end *************');
      })

    /**
     * @tc.name        testRdbTransBatchInsertSync14800024_030
     * @tc.number      testRdbTransBatchInsertSync14800024_030
     * @tc.desc        testRdbTransBatchInsertSync14800024_030
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransBatchInsertSync14800024_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransBatchInsertSync14800024_030 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        let values = new Array<relationalStore.ValuesBucket>();
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        values.push(valueBucket5);
        await rdbTrans.insert("test", valueBucket5);
        try {
          rdbTrans.batchInsertSync("test", values);
        } catch (err) {
          console.info(TAG + 'rdbTrans.batchInsertSync errCode: ' + err.code);
          expect(err.code).assertEqual(14800024);
        }
        done();
        console.info(TAG + '************* testRdbTransBatchInsertSync14800024_030 end *************');
      })

    /**
     * @tc.name        testRdbTransBatchInsert14800024_031
     * @tc.number      testRdbTransBatchInsert14800024_031
     * @tc.desc        testRdbTransBatchInsert14800024_031
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransBatchInsert14800024_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '************* testRdbTransBatchInsert14800024_031 start *************');
        rdbStoreTxn24 = await relationalStore.getRdbStore(context!, STORE_CONFIG_TXN24);
        await rdbStoreTxn24!.execute(CREATE_TABLE_TEST_TXN24);
        await rdbStoreTxn24!.insert("test", valueBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        let values = new Array<relationalStore.ValuesBucket>();
        predicates.equalTo("data1", "hello");
        const rdbTrans = await rdbStoreTxn24!.createTransaction(options);
        values.push(valueBucket5);
        await rdbTrans.insert("test", valueBucket5);
        try {
          await rdbTrans.batchInsert("test", values);
        } catch (err) {
          console.info(TAG + 'rdbTrans.batchInsert errCode: ' + err.code);
          expect(err.code).assertEqual(14800024);
        }
        done();
        console.info(TAG + '************* testRdbTransBatchInsert14800024_031 end *************');
      })
  })
}