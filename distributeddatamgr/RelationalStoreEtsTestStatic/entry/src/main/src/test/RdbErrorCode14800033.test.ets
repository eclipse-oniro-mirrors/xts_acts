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
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Want } from '@kit.AbilityKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TABLE = 'ErrorCodeTestTable';
const TAG = "[RdbErrorCode1480033]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const CREATE_TABLE_EMPLOYEE1 =
  "CREATE TABLE IF NOT EXISTS employee1 (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbStore14800033.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1: relationalStore.StoreConfig = {
  name: "myrdbStore14800033.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let context: common.UIAbilityContext;
let rdbStore: relationalStore.RdbStore;
let dataBaseDir: String;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

async function createTest(rdbStore: relationalStore.RdbStore) {
  console.log(TAG + "createTest data start");
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: relationalStore.ValuesBucket = {
      "data1": "hello",
      "data2": 10 as long,
      "data3": 1.0,
      "data4": u8,
    };
    await rdbStore.insert("employee", valueBucket);
  }
  {
    let u8 = new Uint8Array([3, 4, 5]);
    const valueBucket: relationalStore.ValuesBucket = {
      "data1": "2",
      "data2": -5 as long,
      "data3": 2.5,
      "data4": u8,
    };
    await rdbStore.insert("employee", valueBucket);
  }
  {
    let u8 = new Uint8Array(0);
    const valueBucket: relationalStore.ValuesBucket = {
      "data1": "hello world",
      "data2": 3 as long,
      "data3": 1.8,
      "data4": u8,
    };
    await rdbStore.insert("employee", valueBucket);
  }
  console.log(TAG + "createTest data end");
}

async function attachInsert(store: relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": 18 as long,
    "salary": 100.5,
    "blobType": u8,
  };
  await store.insert(tableName, valueBucket);
}

async function insertCheck(store: relationalStore.RdbStore, tableName: string, ret: int) {
  let predicates = new relationalStore.RdbPredicates(tableName);
  let resultSet = await store.query(predicates);
  let count = resultSet.rowCount;
  resultSet.close();
}

async function updateCheck(store: relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([4, 5, 6]);
  const valueBucket: relationalStore.ValuesBucket = {
    "name": "lisi",
    "age": 20 as long,
    "salary": 200.5,
    "blobType": u8,
  };
  let predicates = new relationalStore.RdbPredicates(tableName);
  predicates.equalTo("id", "1");
  let ret = await store.update(valueBucket, predicates);
  expect(1).assertEqual(ret);
}

async function attachBatchInsert(store: relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": 18 as long,
    "salary": 100.5,
    "blobType": u8,
  };
  let valueBucketArray = new Array<relationalStore.ValuesBucket>();
  for (let i = 0; i < 10; i++) {
    valueBucketArray.push(valueBucket);
  }
  await store.batchInsert(tableName, valueBucketArray);
}

async function deleteCheck(store: relationalStore.RdbStore, tableName: string, count: int) {
  let predicates = new relationalStore.RdbPredicates(tableName);
  let ret = await store.delete(predicates);
}

async function attachCheck(store: relationalStore.RdbStore) {
  await attachInsert(store, "test");
  await insertCheck(store, "test", 2);
  await updateCheck(store, "test");
  await attachBatchInsert(store, "test");
  await insertCheck(store, "test", 12);
  await deleteCheck(store, "test", 12);

  await attachInsert(store, "test1");
  await insertCheck(store, "test1", 1);
  await updateCheck(store, "test1");
  await attachBatchInsert(store, "test1");
  await insertCheck(store, "test1", 11);
  await deleteCheck(store, "test1", 11);
}

export default function RdbErrorCode14800033() {

  describe("RdbErrorCode14800033", (): void => {
    beforeAll(async (): Promise<void> => {
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      let attachStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      console.info(TAG + 'beforeEach context databasedir: ' + context.databaseDir);
      dataBaseDir = context.databaseDir + "/rdb/";
      console.info(TAG + 'beforeEach STORE_CONFIG1 success');
      await attachStore.executeSql(CREATE_TABLE_TEST1);
    });
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      dataBaseDir = context.databaseDir + "/rdb/";
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST1);
      await rdbStore.execute(CREATE_TABLE_EMPLOYEE1);
      let u8 = new Uint8Array([3, 4, 5])
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30 as long,
        "salary": 2000.0,
        "data4": u8
      }
      const valueBucket2: relationalStore.ValuesBucket = {
        "name": "Lisa",
        "age": 31 as long,
        "salary": 2000.0,
        "data4": u8
      }
      await rdbStore.insert("employee1", valueBucket);
      await rdbStore.insert("employee1", valueBucket2);
    });
    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
    });
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      console.info(TAG + "*************Unit Test end*************");
    });

    /**
     * @tc.name   testRdbInsertSync14800033_001
     * @tc.number testRdbInsertSync14800033_001
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbInsertSync14800033_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + "************* testRdbInsertSync14800033_001 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.0
        }
        try {
          rdbStore.insertSync("test", valueBucket);
          expect().assertFail();
        } catch (e) {
          console.error(TAG + "testRdbInsertSync14800033_001 fail code is " + e.code + " message is " + e.message);
          expect(14800033).assertEqual(e.code);
        }
        console.info(TAG + "************* testRdbInsertSync14800033_001 end *************");
        done();
      })

    /**
     * @tc.name   testRdbInsertSync14800033_002
     * @tc.number testRdbInsertSync14800033_002
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbInsertSync14800033_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + "************* testRdbInsertSync14800033_002 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.0
        }
        try {
          rdbStore.insertSync("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          expect().assertFail();
        } catch (e) {
          console.error(TAG + "testRdbInsertSync14800033_002 fail code is " + e.code + " message is " + e.message);
          expect(14800033).assertEqual(e.code);
        }
        console.info(TAG + "************* testRdbInsertSync14800033_002 end *************");
        done();
      })

    /**
     * @tc.name   testRdbBatchInsertSync14800033_003
     * @tc.number testRdbBatchInsertSync14800033_003
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBatchInsertSync14800033_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + "************* testRdbBatchInsertSync14800033_003 start *************");
        let values: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.0
        }
        values.push(valueBucket)
        try {
          rdbStore.batchInsertSync("test", values);
          console.info(TAG + "testRdbBatchInsertSync14800033_003 success ");
        } catch (e) {
          console.error(TAG + "testRdbBatchInsertSync14800033_003 fail code is " + e.code + " message is " + e.message);
          expect(14800033).assertEqual(e.code);
        }
        console.info(TAG + "************* testRdbBatchInsertSync14800033_003 end *************");
        done();
      })


    /**
     * @tc.name   testRdbUpdateSync14800033_004
     * @tc.number testRdbUpdateSync14800033_004
     * @tc.desc   update success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbUpdateSync14800033_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + "************* testRdbUpdateSync14800033_004 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "age": 30 as long,
          "salary": 2000.0
        }
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Jim");
          rdbStore.updateSync(valueBucket, predicates);
          console.info(TAG + `testRdbUpdateSync14800033_004 updateSync is successful`);
        } catch (e) {
          console.error(TAG + "testRdbUpdateSync14800033_004 fail code is " + e.code + " message is " + e.message);
          expect(14800033).assertEqual(e.code);
        }
        done();
      })

    /**
     * @tc.name   testRdbDeleteSync14800033_005
     * @tc.number testRdbDeleteSync14800033_005
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbDeleteSync14800033_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + "************* testRdbDeleteSync14800033_005 start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Jim");
          rdbStore.deleteSync(predicates);
          console.info(TAG + "deleteSync success ");
        } catch (e) {
          console.error(TAG + "testRdbDeleteSync14800033_005 fail code is " + e.code + " message is " + e.message);
          expect(14800033).assertEqual(e.code);
        }
        done();
      })

    /**
     * @tc.name   testRdbCleanDirtyData14800033_006
     * @tc.number testRdbCleanDirtyData14800033_006
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbCleanDirtyData14800033_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + "************* testRdbCleanDirtyData14800033_006 start *************");
        try {
          await rdbStore.cleanDirtyData('employee', 100).then(() => {
            console.info(TAG + 'clean dirty data  succeeded');
          }).catch((err) => {
            console.error(TAG + `clean dirty data failed, code is ${err.code},message is ${err.message}`);
          });
        } catch (e) {
          console.error(TAG + "testRdbCleanDirtyData14800033_006 fail code is " + e.code + " message is " + e.message);
          expect(14800033).assertEqual(e.code);
        }
        done();
      })


    /**
     * @tc.name   testRdbExecuteSync14800033_007
     * @tc.number testRdbExecuteSync14800033_007
     * @tc.desc   executeSync success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbExecuteSync14800033_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + "************* testRdbExecuteSync14800033_007 start *************");
        const SQL_DELETE_TABLE = 'DELETE FROM employee1';
        try {
          rdbStore.executeSync(SQL_DELETE_TABLE);
        } catch (e) {
          console.error(TAG + "testRdbExecuteSync14800033_007 fail code is " + e.code + " message is " + e.message);
          expect(14800033).assertEqual(e.code);
        }
        done();
      })

    /**
     * @tc.name   testRdbBackup14800033_008
     * @tc.number testRdbBackup14800033_008
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBackup14800033_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* testRdbBackup14800033_008 start *************");
      try {
        await rdbStore.backup("backup.db");
      } catch (e) {
        console.error(TAG + "testRdbBackup14800033_008 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testRdbRestore14800033_009
     * @tc.number testRdbRestore14800033_009
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbRestore14800033_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* testRdbRestore14800033_009 start *************");
      await rdbStore.backup("backup2.db");
      try {
        await rdbStore.restore("backup2.db");
      } catch (e) {
        console.error(TAG + "testRdbRestore14800033_009 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testRdbGetRows14800033_010
     * @tc.number testRdbGetRows14800033_010
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetRows14800033_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* testRdbGetRows14800033_010 start *************");
      let predicates = new relationalStore.RdbPredicates('employee1');
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        await resultSet.getRows(1);
        resultSet.close();
      } catch (e) {
        console.error(TAG + `testRdbGetRows14800033_010 failed, code is ${e.code},message is ${e.message}`);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testRdbGetUnLockRow14800033_011
     * @tc.number testRdbGetUnLockRow14800033_011
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUnLockRow14800033_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbGetUnLockRow14800033_011 start *************");
        await rdbStore.setDistributedTables(["employee1"], relationalStore.DistributedType.DISTRIBUTED_CLOUD);
        try {
          let predicates = new relationalStore.RdbPredicates("employee1");
          predicates.equalTo("name", "Jim");
          await rdbStore.unlockRow(predicates);
        } catch (e) {
          console.error(TAG + `unlockRow failed, code is ${e.code},message is ${e.message}`);
          expect(14800033).assertEqual(e.code);
        }
        console.log(TAG + "************* testRdbGetUnLockRow14800033_011 end   *************");
        done();
      });

    /**
     * @tc.name   testRdbGetLockRow14800033_012
     * @tc.number testRdbGetLockRow14800033_012
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetLockRow14800033_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbGetLockRow14800033_012 start *************");
        await rdbStore.setDistributedTables(["employee1"], relationalStore.DistributedType.DISTRIBUTED_CLOUD);
        try {
          let predicates = new relationalStore.RdbPredicates("employee1");
          predicates.equalTo("id", "1");
          await rdbStore.lockRow(predicates);
        } catch (e) {
          console.error(TAG + `lockRow failed, code is ${e.code},message is ${e.message}`);
          expect(14800033).assertEqual(e.code);
        }
        done();
        console.log(TAG + "************* testRdbGetLockRow14800033_012 end   *************");
      })

    /**
     * @tc.name   testRdbQueryLockedRow14800033_013
     * @tc.number testRdbQueryLockedRow14800033_013
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbQueryLockedRow14800033_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbQueryLockedRow14800033_013 start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Jim");
          await rdbStore.queryLockedRow(predicates, []);
        } catch (e) {
          console.error(TAG + `lockRow failed, code is ${e.code},message is ${e.message}`);
          expect(14800033).assertEqual(e.code);
        }
        console.log(TAG + "************* testRdbQueryLockedRow14800033_013 end   *************");
        done();
      })

    /**
     * @tc.name   testRdbExecute14800033_014
     * @tc.number testRdbExecute14800033_014
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbExecute14800033_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* testRdbExecute14800033_014 start *************");
      const SQL_DELETE_TABLE = 'DELETE FROM employee1';
      try {
        await rdbStore.execute(SQL_DELETE_TABLE);
      } catch (e) {
        console.error(TAG + "testRdbExecute14800033_014 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testRdbGetColumnType14800033_015
     * @tc.number testRdbGetColumnType14800033_015
     * @tc.desc   getColumnType errcode is 14800033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnType14800033_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbGetColumnType14800033_015 start *************");
        try {
          await rdbStore.execute(CREATE_TABLE_EMPLOYEE);
          await createTest(rdbStore);
          const valueBucket: relationalStore.ValuesBucket = {
            "data1": null,
            "data2": null,
            "data3": null,
            "data4": null,
            "data5": null,
            "data6": null,
            "data7": null,
            "data8": null
          };
          await rdbStore.insert("employee", valueBucket);
        } catch (err) {
          console.error(TAG + "testRdbGetColumnType14800033_015 insert failed " + err);
        }
        try {
          let resultSet = await rdbStore.querySql("SELECT * FROM employee");
          let count = resultSet.rowCount;
          expect(true).assertEqual(resultSet!.goToRow(count - 1));
          let type = relationalStore.ColumnType.NULL;
          type = await resultSet!.getColumnType(resultSet!.getColumnIndex("id"));
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data1"));
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data2"));
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data3"));
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data4"));
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data5"));
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data6"));
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data7"));
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data8"));
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          resultSet?.close();
          done();
        } catch (err) {
          console.error(TAG + "testRdbGetColumnType14800033_015  failed " + err.code + err.message);
          expect(14800033).assertEqual(err.code);
          done();
        }
        done();
        console.log(TAG + "************* testRdbGetColumnType14800033_015 end *************");
      });

    /**
     * @tc.name   testRdbBatchInsertWithConflictResolution14800033_016
     * @tc.number testRdbBatchInsertWithConflictResolution14800033_016
     * @tc.desc   testRdbBatchInsertWithConflictResolution14800033_016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBatchInsertWithConflictResolution14800033_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbBatchInsertWithConflictResolution14800033_016 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "id": "sdf",
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          await rdbStore.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
          console.log(TAG + "batchInsertWithConflictResolution failed");
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolution failed" + err.code);
          expect(14800033).assertEqual(err.code);
          done();
        }
        done();
        console.log(TAG + "************* testRdbBatchInsertWithConflictResolution14800033_016 end *************");
      })

    /**
     * @tc.name   testRdbBatchInsertWithConflictResolutionSync14800033_017
     * @tc.number testRdbBatchInsertWithConflictResolutionSync14800033_017
     * @tc.desc   testRdbBatchInsertWithConflictResolutionSync14800033_017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBatchInsertWithConflictResolutionSync14800033_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.log(TAG +
          "************* testRdbBatchInsertWithConflictResolutionSync14800033_017 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "id": "sdf",
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          rdbStore.batchInsertWithConflictResolutionSync("test",
            valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
          console.log(TAG + "testRdbStorebatchInsertWithConflictResolutionSync failed");
          done();
        } catch (err) {
          console.log(TAG + err + "testRdbStorebatchInsertWithConflictResolutionSync failed" + err.code);
          expect(14800033).assertEqual(err.code);
          done();
        }
        done();
        console.log(TAG +
          "************* testRdbBatchInsertWithConflictResolutionSync14800033_017 end *************");
      })

    /**
     * @tc.name   testRdbAttach14800033_018
     * @tc.number testRdbAttach14800033_018
     * @tc.desc   non encrypted database attach non encrypted database
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbAttach14800033_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbAttach14800033_018 start *************");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await attachInsert(rdbStore, "test");
      try {
        let num = await rdbStore.attach(context, STORE_CONFIG1, "attachDB");
      } catch (e) {
        console.log("testRdbAttach14800033_018 : failed, err: code=" + e.code + " message=" + e.message);
        expect(14800033).assertEqual(e.code);
        done();
      }
      await attachCheck(rdbStore);
      expect(0).assertEqual(await rdbStore.detach("attachDB"))
      console.log(TAG + "************* testRdbAttach14800033_018 end *************");
      done();
    })

    /**
     * @tc.name   testRdbAttach14800033_019
     * @tc.number testRdbAttach14800033_019
     * @tc.desc   non encrypted database attach non encrypted database
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbAttach14800033_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbAttach14800033_019 start *************");
      await rdbStore.execute(CREATE_TABLE_TEST);
      await attachInsert(rdbStore, "test");
      try {
        let num: int = await rdbStore.attach(dataBaseDir + "rdbStore14800033.db", "attachDB");
      } catch (e) {
        console.log("attach err: failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
        done();
      }
      await attachCheck(rdbStore);
      expect(0).assertEqual(await rdbStore.detach("attachDB"));
      done();
      console.log(TAG + "************* testRdbAttach14800033_019 end *************");
    })

    /**
     * @tc.name   testRdbTransactionbatchInsertSync14800033_020
     * @tc.number testRdbTransactionbatchInsertSync14800033_020
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransactionbatchInsertSync14800033_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbTransactionbatchInsertSync14800033_020 start *************");
        await rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.0
          }
          let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket1);
          try {
            let rowId: number = transaction.batchInsertSync("test", valueBuckets);
            transaction.commit();
            console.info(TAG + `batchInsertSync is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `batchInsertSync is failed, code is ${e.code},message is ${e.message}`);
            expect(14800033).assertEqual(e.code);
            done();
          }
          ;
        }).catch((err) => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect(14800033).assertEqual(err.code);
          done();
        });
        done();
        console.log(TAG + "************* testRdbTransactionbatchInsertSync14800033_020 end   *************");
      })


    /**
     * @tc.name   testRdbTransactionBatchInsertWithConflictResolution14800033_021
     * @tc.number testRdbTransactionBatchInsertWithConflictResolution14800033_021
     * @tc.desc   testRdbTransactionBatchInsertWithConflictResolution14800033_021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransactionBatchInsertWithConflictResolution14800033_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.log(TAG +
          "************* testRdbTransactionBatchInsertWithConflictResolution14800033_021 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);

          }
          await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.log(TAG + "testRdbTransactionBatchInsertWithConflictResolution14800033_021 error");
          expect(null).assertFail()
          done();
        } catch (err) {
          console.log(TAG + err + " code: " + err.code);
          expect(14800033).assertEqual(err.code);
          done();
        }
        done();
        console.log(TAG + "testRdbTransactionBatchInsertWithConflictResolution14800033_021 end");
      })


    /**
     * @tc.name   testRdbTransactionBatchInsertWithConflictResolutionSync14800033_022
     * @tc.number testRdbTransactionBatchInsertWithConflictResolutionSync14800033_022
     * @tc.desc   testRdbTransactionBatchInsertWithConflictResolutionSync14800033_022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransactionBatchInsertWithConflictResolutionSync14800033_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.log(TAG +
          "************* testRdbTransactionBatchInsertWithConflictResolutionSync14800033_022 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await rdbStore.createTransaction();
        try {
          const valueBucket: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.log(TAG + "testRdbTransactionBatchInsertWithConflictResolutionSync14800033_022 error");
          expect(null).assertFail()
          done();
        } catch (err) {
          console.log(TAG + err + " code: " + err.code);
          expect(14800033).assertEqual(err.code);
          done();
        }
        done();
        console.log(TAG + "testRdbTransactionBatchInsertWithConflictResolutionSync14800033_022 end");
      })

    /**
     * @tc.name   testRdbTransactionDeleteSync14800033_023
     * @tc.number testRdbTransactionDeleteSync14800033_023
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransactionDeleteSync14800033_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbTransactionDeleteSync14800033_023 start *************");
        await rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Jim");
          try {
            let rowId: number = transaction.deleteSync(predicates);
            transaction.commit();
            console.info(TAG + `deleteSync is successful, rowId = ${rowId}`);
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `deleteSync is failed, code is ${e.code},message is ${e.message}`);
            expect(14800033).assertEqual(e.code);
          }
          ;
        }).catch((err) => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransactionDeleteSync14800033_023 end   *************");
      })

    /**
     * @tc.name   testRdbTransactionExecute14800033_024
     * @tc.number testRdbTransactionExecute14800033_024
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransactionExecute14800033_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbTransactionExecute14800033_024 start *************");
        await rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          try {
            const SQL_DELETE_TABLE = 'DELETE FROM employee1';
            await transaction.execute(SQL_DELETE_TABLE);
            transaction.commit();
            console.info(TAG + `execute is successful`);
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `execute is failed, code is ${e.code},message is ${e.message}`);
            expect(14800033).assertEqual(e.code);
          }
          ;
        }).catch((err) => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransactionExecute14800033_024 end   *************");
      });

    /**
     * @tc.name   testRdbTransactionExecuteSync14800033_025
     * @tc.number testRdbTransactionExecuteSync14800033_025
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransactionExecuteSync14800033_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbTransactionExecuteSync14800033_025 start *************");
        await rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          try {
            const SQL_DELETE_TABLE = 'DELETE FROM employee1';
            transaction.executeSync(SQL_DELETE_TABLE);
            transaction.commit();
            console.info(TAG + `executeSync is successful`);
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `executeSync is failed, code is ${e.code},message is ${e.message}`);
            expect(14800033).assertEqual(e.code);
          }
          ;
        }).catch((err) => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransactionExecuteSync14800033_025 end   *************");
      })

    /**
     * @tc.name   testRdbTransactionInsertSync14800033_026
     * @tc.number testRdbTransactionInsertSync14800033_026
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransactionInsertSync14800033_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbTransactionInsertSync14800033_026 start *************");
        await rdbStore.createTransaction().then((transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.0
          }
          try {
            let rowId: number = (transaction as relationalStore.Transaction).insertSync("test", valueBucket1,
              relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            transaction.commit();
            console.info(TAG + `Insert is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `Insert is failed, code is ${e.code},message is ${e.message}`);
            expect(14800033).assertEqual(e.code);
          }
          ;
        }).catch((err) => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransactionInsertSync14800033_026 end   *************");
      })

    /**
     * @tc.name   testRdbTransactionUpdateSync14800033_027
     * @tc.number testRdbTransactionUpdateSync14800033_027
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTransactionUpdateSync14800033_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransactionUpdateSync14800033_027 start *************");
      await rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
        const valueBucket1: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.0
        }
        let predicates = new relationalStore.RdbPredicates("employee1");
        predicates.equalTo("name", "Jim");
        try {
          let rowId: number =
            transaction.updateSync(valueBucket1, predicates,
              relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          transaction.commit();
          console.info(TAG + `updateSync is successful, rowId = ${rowId}`);
          expect().assertFail();
        } catch (e) {
          transaction.rollback();
          console.error(TAG + `updateSync is failed, code is ${e.code},message is ${e.message}`);
          expect(14800033).assertEqual(e.code);
        }
        ;
      }).catch((err) => {
        console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      });
      done();
      console.log(TAG + "************* testRdbTransactionUpdateSync14800033_027 end   *************");
    })

    /**
     * @tc.name testRdbInsertSync14800033_028
     * @tc.number testRdbInsertSync14800033_028
     * @tc.desc testRdbInsertSync14800033_028
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbInsertSync14800033_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbInsertSync14800033_028 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        try {
          rdbStore.insertSync("employee1", valueBucket);
          expect().assertFail();
        } catch (e) {
          console.error(TAG + "testRdbInsertSync14800033_028 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbInsertSync14800033_028 end *************");
      })

    /**
     * @tc.name testRdbInsertSync14800033_029
     * @tc.number testRdbInsertSync14800033_029
     * @tc.desc testRdbInsertSync14800033_029
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbInsertSync14800033_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbInsertSync14800033_029 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        try {
          rdbStore.insertSync("employee1", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          expect().assertFail();
        } catch (e) {
          console.error(TAG + "testRdbInsertSync14800033_029 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbInsertSync14800033_029 end *************");
      })

    /**
     * @tc.name testRdbInsert14800033_030
     * @tc.number testRdbInsert14800033_030
     * @tc.desc testRdbInsert14800033_030
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbInsert14800033_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbInsert14800033_030 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        try {
          await rdbStore.insert("employee1", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          expect().assertFail();
        } catch (e) {
          console.error(TAG + "insert fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbInsert14800033_030 end *************");
      })

    /**
     * @tc.name testRdbInsert14800033_031
     * @tc.number testRdbInsert14800033_031
     * @tc.desc testRdbInsert14800033_031
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbInsert14800033_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbInsert14800033_031 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        try {
          await rdbStore.insert("employee1", valueBucket);
          expect().assertFail();
        } catch (e) {
          console.error(TAG + "insert fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbInsert14800033_031 end *************");
      })

    /**
     * @tc.name testRdbBatchInsert14800033_032
     * @tc.number testRdbBatchInsert14800033_032
     * @tc.desc testRdbBatchInsert14800033_032
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbBatchInsert14800033_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbBatchInsert14800033_032 start *************");
        let values: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        values.push(valueBucket)
        try {
          rdbStore.batchInsertSync("employee1", values);
        } catch (e) {
          console.error(TAG + "batchInsertSync fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        try {
          await rdbStore.batchInsert("employee1", values);
        } catch (e) {
          console.error(TAG + "batchInsert fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbBatchInsert14800033_032 end *************");
      })

    /**
     * @tc.name testRdbUpdateSync14800033_033
     * @tc.number testRdbUpdateSync14800033_033
     * @tc.desc update success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbUpdateSync14800033_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbUpdateSync14800033_033 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        let predicates = new relationalStore.RdbPredicates("employee1");
        predicates.equalTo("name", "Jim");
        try {
          rdbStore.updateSync(valueBucket, predicates);
          expect().assertFail();
        } catch (e) {
          console.error(TAG + "updateSync fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbUpdateSync14800033_033 end *************");
      })

    /**
     * @tc.name testRdbUpdate14800033_034
     * @tc.number testRdbUpdate14800033_034
     * @tc.desc update success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbUpdate14800033_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbUpdate14800033_034 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        let predicates = new relationalStore.RdbPredicates("employee1");
        predicates.equalTo("name", "Jim");
        try {
          await rdbStore.update(valueBucket, predicates);
          expect().assertFail();
        } catch (e) {
          console.error(TAG + "update fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbUpdate14800033_034 end *************");
      })

    /**
     * @tc.name testRdbUpdate14800033_035
     * @tc.number testRdbUpdate14800033_035
     * @tc.desc update success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbUpdate14800033_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbUpdate14800033_035 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        let predicates = new relationalStore.RdbPredicates("employee1");
        predicates.equalTo("name", "Jim");
        try {
          await rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          expect().assertFail();
        } catch (e) {
          console.error(TAG + "update fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbUpdate14800033_035 end *************");
      })

    /**
     * @tc.name testRdbDeleteSync14800033_036
     * @tc.number testRdbDeleteSync14800033_036
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbDeleteSync14800033_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbDeleteSync14800033_036 start *************");
        let predicates = new relationalStore.RdbPredicates("employee1");
        predicates.equalTo("name", "Jim");
        try {
          rdbStore.deleteSync(predicates);
        } catch (e) {
          console.error(TAG + "deleteSync fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbDeleteSync14800033_036 end *************");
      })

    /**
     * @tc.name testRdbDelete14800033_037
     * @tc.number testRdbDelete14800033_037
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbDelete14800033_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbDelete14800033_037 start *************");
        let predicates = new relationalStore.RdbPredicates("employee1");
        predicates.equalTo("name", "Jim");
        try {
          await rdbStore.delete(predicates);
        } catch (e) {
          console.error(TAG + "testRdbDelete14800033_037 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbDelete14800033_037 end *************");
      })

    /**
     * @tc.name testRdbExecute14800033_038
     * @tc.number testRdbExecute14800033_038
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbExecute14800033_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbExecute14800033_038 start *************");
        const SQL_DELETE_TABLE = 'DELETE FROM employee1';
        try {
          await rdbStore.execute(SQL_DELETE_TABLE);
        } catch (e) {
          console.error(TAG + "testRdbExecute14800033_038 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbExecute14800033_038 end *************");
      })

    /**
     * @tc.name testRdbExecute14800033_039
     * @tc.number testRdbExecute14800033_039
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbExecute14800033_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbExecute14800033_039 start *************");
        try {
          const SQL_DELETE_TABLE = 'delete FROM employee1 WHERE name = ?';
          await rdbStore.execute(SQL_DELETE_TABLE, ['Jim'])
        } catch (e) {
          console.error(TAG + "execute fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbExecute14800033_039 end *************");
      })

    /**
     * @tc.name testRdbExecute14800033_040
     * @tc.number testRdbExecute14800033_040
     * @tc.desc cleanDirtyData success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbExecute14800033_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbExecute14800033_040 start *************");
        const SQL_DELETE_TABLE = 'delete FROM employee1';
        try {
          await rdbStore.execute(SQL_DELETE_TABLE);
        } catch (e) {
          console.error(TAG + "testRdbExecute14800033_040 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbExecute14800033_040 end *************");
      })

    /**
     * @tc.name testRdbGetColumnIndex14800033_041
     * @tc.number testRdbGetColumnIndex14800033_041
     * @tc.desc testGetColumnIndex0001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGetColumnIndex14800033_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGetColumnIndex14800033_041 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getColumnIndex('id')
          resultSet.close();
        } catch (e) {
          console.error(TAG + `getColumnIndex failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGetColumnIndex14800033_041 end *************");
      })

    /**
     * @tc.name testRdbGetColumnName14800033_042
     * @tc.number testRdbGetColumnName14800033_042
     * @tc.desc testGetColumnName0002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGetColumnName14800033_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGetColumnName14800033_042 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getColumnName(1)
          resultSet.close();
        } catch (e) {
          console.error(TAG + `getColumnName failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGetColumnName14800033_042 end *************");
      })

    /**
     * @tc.name testRdbGoToFirstRow14800033_043
     * @tc.number testRdbGoToFirstRow14800033_043
     * @tc.desc testRdbGoToFirstRow14800033_043
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGoToFirstRow14800033_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGoToFirstRow14800033_043 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        try {
          resultSet.goToFirstRow()
          resultSet.close();
        } catch (e) {
          console.error(TAG + `goToFirstRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGoToFirstRow14800033_043 end *************");
      })

    /**
     * @tc.name testRdbGoToNextRow14800033_044
     * @tc.number testRdbGoToNextRow14800033_044
     * @tc.desc testRdbGoToNextRow14800033_044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGoToNextRow14800033_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGoToNextRow14800033_044 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.goToNextRow()
          resultSet.close();
        } catch (e) {
          console.error(TAG + `goToNextRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGoToNextRow14800033_044 start *************");
      })

    /**
     * @tc.name testRdbGoToLastRow14800033_045
     * @tc.number testRdbGoToLastRow14800033_045
     * @tc.desc testRdbGoToLastRow14800033_045
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGoToLastRow14800033_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGoToLastRow14800033_045 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        try {
          resultSet.goToLastRow()
          resultSet.close();
        } catch (e) {
          console.error(TAG + `goToLastRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGoToLastRow14800033_045 end *************");
      })

    /**
     * @tc.name testRdbGoToRow14800033_046
     * @tc.number testRdbGoToRow14800033_046
     * @tc.desc testRdbGoToRow14800033_046
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGoToRow14800033_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGoToRow14800033_046 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.goToRow(0)
          resultSet.close();
        } catch (e) {
          console.error(TAG + `goToRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGoToRow14800033_046 end *************");
      })

    /**
     * @tc.name testRdbGoTo14800033_047
     * @tc.number testRdbGoTo14800033_047
     * @tc.desc testRdbGoTo14800033_047
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGoTo14800033_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGoTo14800033_047 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.goTo(0)
          resultSet.close();
        } catch (e) {
          console.error(TAG + `goTo failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGoTo14800033_047 end *************");
      })

    /**
     * @tc.name testRdbGoToPreviousRow14800033_048
     * @tc.number testRdbGoToPreviousRow14800033_048
     * @tc.desc testRdbGoToPreviousRow14800033_048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGoToPreviousRow14800033_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGoToPreviousRow14800033_048 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.goToPreviousRow()
          resultSet.close();
        } catch (e) {
          console.error(TAG + `goToPreviousRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGoToPreviousRow14800033_048 end *************");
      })

    /**
     * @tc.name testRdbGetBlob14800033_049
     * @tc.number testRdbGetBlob14800033_049
     * @tc.desc testRdbGetBlob14800033_049
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGetBlob14800033_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGetBlob14800033_049 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getBlob(resultSet.getColumnIndex('data4'))
          resultSet.close();
        } catch (e) {
          console.error(TAG + `getBlob failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGetBlob14800033_049 end *************");
      })

    /**
     * @tc.name testRdbGetString14800033_050
     * @tc.number testRdbGetString14800033_050
     * @tc.desc testRdbGetString14800033_050
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGetString14800033_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGetString14800033_050 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getString(resultSet.getColumnIndex('name'))
          resultSet.close();
        } catch (e) {
          console.error(TAG + `getString failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGetString14800033_050 end *************");
      })

    /**
     * @tc.name testRdbGetLong14800033_051
     * @tc.number testRdbGetLong14800033_051
     * @tc.desc testRdbGetLong14800033_051
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGetLong14800033_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGetLong14800033_051 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getLong(resultSet.getColumnIndex('age'))
          resultSet.close();
        } catch (e) {
          console.error(TAG + `getLong failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGetLong14800033_051 end *************");
      })

    /**
     * @tc.name testRdbGetDouble14800033_052
     * @tc.number testRdbGetDouble14800033_052
     * @tc.desc testRdbGetDouble14800033_052
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGetDouble14800033_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGetDouble14800033_052 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getDouble(resultSet.getColumnIndex('salary'))
          resultSet.close();
        } catch (e) {
          console.error(TAG + `getDouble failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGetDouble14800033_052 end *************");
      })

    /**
     * @tc.name testRdbGetAsset14800033_053
     * @tc.number testRdbGetAsset14800033_053
     * @tc.desc testRdbGetAsset14800033_053
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGetAsset14800033_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGetAsset14800033_053 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getAsset(resultSet.getColumnIndex('data5'));
          resultSet.close();
        } catch (e) {
          console.error(TAG + `getAsset failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGetAsset14800033_053 end *************");
      })

    /**
     * @tc.name testRdbGetAsset14800033_054
     * @tc.number testRdbGetAsset14800033_054
     * @tc.desc testRdbGetAsset14800033_054
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGetAsset14800033_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGetAsset14800033_054 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getAsset(resultSet.getColumnIndex('data6'));
          resultSet.close();
        } catch (e) {
          console.error(TAG + `getAssets failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGetAsset14800033_054 end *************");
      })

    /**
     * @tc.name testRdbGetValue14800033_055
     * @tc.number testRdbGetValue14800033_055
     * @tc.desc testRdbGetValue14800033_055
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGetValue14800033_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGetValue14800033_055 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getValue(resultSet.getColumnIndex('salary'))
          resultSet.close();
        } catch (e) {
          console.error(TAG + `getValue failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGetValue14800033_055 end *************");
      })

    /**
     * @tc.name testRdbGetRow14800033_056
     * @tc.number testRdbGetRow14800033_056
     * @tc.desc testRdbGetRow14800033_056
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbGetRow14800033_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbGetRow14800033_056 start *************");
        let predicates = new relationalStore.RdbPredicates('employee1');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getRow()
          resultSet.close();
        } catch (e) {
          console.error(TAG + `getRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testRdbGetRow14800033_056 end *************");
      })

    /**
     * @tc.number testRdbTransaction14800033_057
     * @tc.name testRdbTransaction14800033_057
     * @tc.desc testRdbTransaction14800033_057
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbTransaction14800033_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbTransaction14800033_057 start *************");
        rdbStore.createTransaction().then((transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          try {
            let rowId: long = (transaction as relationalStore.Transaction).insertSync("employee1", valueBucket1,
              relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            transaction.commit();
            console.info(TAG + `Insert is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `Insert is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          }
          ;
        }).catch((err): void => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransaction14800033_057 end   *************");
      })

    /**
     * @tc.number testRdbTransaction14800033_058
     * @tc.name testRdbTransaction14800033_058
     * @tc.desc testRdbTransaction14800033_058
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbTransaction14800033_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbTransaction14800033_058 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          try {
            let rowId: long =
              await transaction.insert("employee1", valueBucket1,
                relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            transaction.commit();
            console.info(TAG + `Insert is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `Insert is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          }
          ;
        }).catch((err): void => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransaction14800033_058 end   *************");
      })

    /**
     * @tc.number testRdbTransaction14800033_059
     * @tc.name testRdbTransaction14800033_059
     * @tc.desc testRdbTransaction14800033_059
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbTransaction14800033_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbTransaction14800033_059 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket1);
          try {
            let rowId: long = await transaction.batchInsert("employee1", valueBuckets);
            transaction.commit();
            console.info(TAG + `batchInsert is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `batchInsert is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          }
          ;
        }).catch((err): void => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransaction14800033_059 end   *************");
      })

    /**
     * @tc.number testRdbTransaction14800033_060
     * @tc.name testRdbTransaction14800033_060
     * @tc.desc testRdbTransaction14800033_060
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbTransaction14800033_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbTransaction14800033_060 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket1);
          try {
            let rowId: long = transaction.batchInsertSync("employee1", valueBuckets);
            transaction.commit();
            console.info(TAG + `batchInsertSync is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `batchInsertSync is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          }
          ;
        }).catch((err): void => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransaction14800033_060 end   *************");
      })

    /**
     * @tc.number testRdbTransaction14800033_061
     * @tc.name testRdbTransaction14800033_061
     * @tc.desc testRdbTransaction14800033_061
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbTransaction14800033_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbTransaction14800033_061 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          let predicates = new relationalStore.RdbPredicates("employee1");
          predicates.equalTo("name", "Jim");
          try {
            let rowId: long =
              transaction.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
            transaction.commit();
            console.info(TAG + `updateSync is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `updateSync is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          }
          ;
        }).catch((err): void => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransaction14800033_061 end   *************");
      })

    /**
     * @tc.number testRdbTransaction14800033_062
     * @tc.name testRdbTransaction14800033_062
     * @tc.desc testRdbTransaction14800033_062
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbTransaction14800033_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbTransaction14800033_062 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          let predicates = new relationalStore.RdbPredicates("employee1");
          predicates.equalTo("name", "Jim");
          try {
            let rowId: long =
              await transaction.update(valueBucket1, predicates,
                relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
            transaction.commit();
            console.info(TAG + `update is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          }
          ;
        }).catch((err): void => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransaction14800033_062 end   *************");
      })

    /**
     * @tc.number testRdbTransaction14800033_063
     * @tc.name testRdbTransaction14800033_063
     * @tc.desc testRdbTransaction14800033_063
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbTransaction14800033_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbTransaction14800033_063 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          let predicates = new relationalStore.RdbPredicates("employee1");
          predicates.equalTo("name", "Jim");
          try {
            let rowId: long = await transaction.delete(predicates);
            transaction.commit();
            console.info(TAG + `delete is successful, rowId = ${rowId}`);
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `delete is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          }
          ;
        }).catch((err): void => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransaction14800033_063 end   *************");
      })

    /**
     * @tc.number testRdbTransaction14800033_064
     * @tc.name testRdbTransaction14800033_064
     * @tc.desc testRdbTransaction14800033_064
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbTransaction14800033_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* testRdbTransaction14800033_064 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          let predicates = new relationalStore.RdbPredicates("employee1");
          predicates.equalTo("name", "Jim");
          try {
            let rowId: long = transaction.deleteSync(predicates);
            transaction.commit();
            console.info(TAG + `deleteSync is successful, rowId = ${rowId}`);
          } catch (e) {
            transaction.rollback();
            console.error(TAG + `deleteSync is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          }
          ;
        }).catch((err): void => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbTransaction14800033_064 end   *************");
      })
  })
}