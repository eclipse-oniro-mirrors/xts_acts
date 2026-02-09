import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let context:common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000;
const TAG = "[RdbErrorCode14800032]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 INTEGER, " + "data3 INTEGER," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
const DROP_TABLE_TEST_STA = "DROP TABLE IF EXISTS test_sta";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST4 = "CREATE TABLE IF NOT EXISTS test4 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST_STA = "CREATE TABLE IF NOT EXISTS test_sta (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 float32Array," + "data8 UNLIMITED INT" + ")";

const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";

const DATABASE_BACKUP_NAME = "Backup.db"

const STORE_CONFIG:relationalStore.StoreConfig = {
  name: "RdbErrorCode14800032_1.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1:relationalStore.StoreConfig = {
  name: "RdbErrorCode14800032_2.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
let rdbStore: relationalStore.RdbStore | undefined;

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

let options:relationalStore.TransactionOptions = {
  transactionType:relationalStore.TransactionType.IMMEDIATE
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

async function attachBatchInsert(store: relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": 18 as long,
    "salary": 100.5,
    "blobType": u8,
  };
  let valueBucketArray:relationalStore.ValuesBucket[] = [];
  for (let i = 0; i < 10; i++) {
    valueBucketArray.push(valueBucket);
  }
  await store.batchInsert(tableName, valueBucketArray);
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

async function deleteCheck(store: relationalStore.RdbStore, tableName: string, count: int) {
  let predicates = new relationalStore.RdbPredicates(tableName);
  let ret = await store.delete(predicates);
}

async function attachCheck(store: relationalStore.RdbStore) {
  await attachInsert(store, "test1");
  await insertCheck(store, "test1", 2);
  await updateCheck(store, "test1");
  await attachBatchInsert(store, "test1");
  await insertCheck(store, "test1", 12);
  await deleteCheck(store, "test1", 12);

  await attachInsert(store, "test4");
  await insertCheck(store, "test4", 1);
  await updateCheck(store, "test4");
  await attachBatchInsert(store, "test4");
  await insertCheck(store, "test4", 11);
  await deleteCheck(store, "test4", 11);
}

export default function RdbErrorCode14800032() {

  describe("RdbErrorCode14800032", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    });
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      let attachStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
      await attachStore.executeSql(CREATE_TABLE_TEST1);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_TEST4);
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      let u8 = new Uint8Array([3 as long, 4 as long, 5 as long]);
      const valueBucket :relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30 as long,
        "salary":2000 as long,
        "data4":u8
      }
      const valueBucket2 :relationalStore.ValuesBucket = {
        "name": "Lisa",
        "age": 31 as long,
        "salary":2000 as long,
        "data4":u8
      }
      await rdbStore!.insert("employee", valueBucket);
      await rdbStore!.insert("employee", valueBucket2);
    });

    afterEach(async (): Promise<void> => {
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
    });

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      console.info(TAG + "*************Unit Test end*************");
    });

    /**
     * @tc.name   testRdbGetColumnTypeSync14800032_001
     * @tc.number   testRdbGetColumnTypeSync14800032_001
     * @tc.desc   testRdbGetColumnTypeSync14800032_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnTypeSync14800032_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbGetColumnTypeSync14800032_001 start *************");
      try {
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
        await rdbStore!.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSyncErrcode0100 insert failed " + err);
      }
      try {
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type:relationalStore.ColumnType;
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("id"));
        expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data1"));
        expect(type).assertEqual(relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data2"));
        expect(type).assertEqual(relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data3"));
        expect(type).assertEqual(relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data4"));
        expect(type).assertEqual(relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data5"));
        expect(type).assertEqual(relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data6"));
        expect(type).assertEqual(relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data7"));
        expect(type).assertEqual(relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data8"));
        expect(type).assertEqual(relationalStore.ColumnType.NULL);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSyncErrcode0100" + err.code + err.message);
        expect(err.code == 14800032).assertTrue();
        done();
      }
      console.log(TAG + "************* testRdbGetColumnTypeSync14800032_001 end *************");
    });

    /**
     * @tc.name   testRdbGetColumnType14800032_002
     * @tc.number   testRdbGetColumnType14800032_002
     * @tc.desc   testRdbGetColumnType14800032_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnType14800032_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbGetColumnType14800032_002 start *************");
      try {
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
        await rdbStore!.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeErrcode0100 insert failed " + err);
      }
      try {
        let resultSet: relationalStore.ResultSet = await rdbStore!.querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type: relationalStore.ColumnType | undefined;
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
        console.error(TAG + "testgetColumnTypeErrcode0100" + err.code + err.message);
        expect(err.code == 14800032).assertTrue();
        done();
      }
      console.log(TAG + "************* testRdbGetColumnType14800032_002 end *************");
    });

    /**
     * @tc.name   testRdbBatchInsertWithConflictResolution14800032_003
     * @tc.number   testRdbBatchInsertWithConflictResolution14800032_003
     * @tc.desc   testRdbBatchInsertWithConflictResolution14800032_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBatchInsertWithConflictResolution14800032_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "age": 18 as long,
          "salary": 100.5,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = [];
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        await rdbStore!.batchInsertWithConflictResolution("test1", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbBatchInsertWithConflictResolution14800032_003 batch failed")
        done();
      } catch (err) {
        console.log(TAG + err +"testRdbBatchInsertWithConflictResolution14800032_003 failed" + err.code);
        expect(err.code == 14800032).assertTrue();
        done();
      }
      console.log(TAG + "************* testRdbBatchInsertWithConflictResolution14800032_003 end *************");
    })

    /**
     * @tc.name   testRdbBatchInsertWithConflictResolutionSync14800032_004
     * @tc.number   testRdbBatchInsertWithConflictResolutionSync14800032_004
     * @tc.desc   testRdbBatchInsertWithConflictResolutionSync14800032_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBatchInsertWithConflictResolutionSync14800032_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "age": 18 as long,
          "salary": 100.5,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = [];
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let conflict: relationalStore.ConflictResolution = relationalStore.ConflictResolution.ON_CONFLICT_REPLACE;
        rdbStore!.batchInsertWithConflictResolutionSync("test1", valueBucketArray,conflict);
        console.log(TAG + "testRdbBatchInsertWithConflictResolutionSync14800032_004 batch failed")
        done();
      } catch (err) {
        console.log(TAG + err +"testRdbBatchInsertWithConflictResolutionSync14800032_004 failed" + err.code);
        expect(err.code == 14800032).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbBatchInsertWithConflictResolutionSync14800032_004 end *************");
    })

    /**
     * @tc.name   testRdbAttach14800032_005
     * @tc.number   testRdbAttach14800032_005
     * @tc.desc   testRdbAttach14800032_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbAttach14800032_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbAttach14800032_005 start *************");
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.executeSql(CREATE_TABLE_TEST1);
      await rdbStore!.executeSql(CREATE_TABLE_TEST4);
      await attachInsert(rdbStore!, "test1");
      try {
        let num = await rdbStore!.attach(context!, STORE_CONFIG1, "attachDB");
        expect(1).assertEqual(num);
      } catch(e) {
        console.log("testRdbStoreAttach0016 : failed, err: code=" + e.code + " message=" + e.message);
        expect('14800032').assertEqual(e.code);
        done();
      }
      await attachCheck(rdbStore!);
      expect(0).assertEqual(await rdbStore!.detach("attachDB"))
      console.log(TAG + "************* testRdbAttach14800032_005 end *************");
      done();
    })

    /**
     * @tc.name   testRdbAttach14800032_006
     * @tc.number   testRdbAttach14800032_006
     * @tc.desc   testRdbAttach14800032_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbAttach14800032_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbAttach14800032_006 start *************");
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      await attachInsert(rdbStore!, "test1");
      try {
        console.log(TAG + "************* testRdbStoreAttach0018 attach start *************");
        let dataBaseDir = context!.databaseDir + "/rdb/";
        let num = await rdbStore!.attach(dataBaseDir + "RdbErrorCode14800032_2.db", "attachDB");
      } catch(e) {
        console.log("testRdbStoreAttach0018 err: failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
        done();
      }
      await attachCheck(rdbStore!);
      expect(0).assertEqual(await rdbStore!.detach("attachDB"));
      console.log(TAG + "************* testRdbAttach14800032_006 end *************");
      done();
    })

    /**
     * @tc.name   testRdbInsertSync14800032_007
     * @tc.number   testRdbInsertSync14800032_007
     * @tc.desc   testRdbInsertSync14800032_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbInsertSync14800032_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest001 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      const valueBucket :relationalStore.ValuesBucket = {
        "age": 30 as long,
        "salary":2000 as long
      }
      try{
        rdbStore!.insertSync("employee",valueBucket);
        expect().assertFail();
      }catch (e) {
        console.error(TAG + "relationalStoreTest001 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
        done();
      }
      done();
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })

    /**
     * @tc.name   testRdbInsertSyncWithConflict14800032_008
     * @tc.number   testRdbInsertSyncWithConflict14800032_008
     * @tc.desc   testRdbInsertSyncWithConflict14800032_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbInsertSyncWithConflict14800032_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest002 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      const valueBucket :relationalStore.ValuesBucket = {
        "age": 30 as long,
        "salary":2000 as long,
      }
      try{
        rdbStore!.insertSync("employee",valueBucket,relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        expect().assertFail();
      }catch (e) {
        console.error(TAG + "relationalStoreTest002 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* relationalStoreTest002 end *************");
    })

    /**
     * @tc.name   testRdbBatchInsertSync14800032_009
     * @tc.number   testRdbBatchInsertSync14800032_009
     * @tc.desc   testRdbBatchInsertSync14800032_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBatchInsertSync14800032_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest003 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      let values: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
      const valueBucket :relationalStore.ValuesBucket = {
        "age": 30  as long,
        "salary":2000  as long
      }
      values.push(valueBucket)
      try{
        rdbStore!.batchInsertSync("employee",values);
        console.info(TAG + "relationalStoreTest003 success ");
      }catch (e) {
        console.error(TAG + "relationalStoreTest003 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* relationalStoreTest003 end *************");
    })

    /**
     * @tc.name   testRdbBatchInsert14800032_010
     * @tc.number   testRdbBatchInsert14800032_010
     * @tc.desc   testRdbBatchInsert14800032_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBatchInsert14800032_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest004 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      let values: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
      const valueBucket :relationalStore.ValuesBucket = {
        "age": 30  as long,
        "salary":2000  as long
      }
      values.push(valueBucket)
      try{
        await rdbStore!.batchInsert("employee",values);
        console.info(TAG + "relationalStoreTest004 success ");
      }catch (e) {
        console.error(TAG + "relationalStoreTest004 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* relationalStoreTest004 end *************");
    })

    /**
     * @tc.name   testRdbUpdateSync14800032_011
     * @tc.number   testRdbUpdateSync14800032_011
     * @tc.desc   testRdbUpdateSync14800032_011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbUpdateSync14800032_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest006 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      const valueBucket :relationalStore.ValuesBucket = {
        "age": 30 as long,
        "salary":2000 as long
      }
      try{
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        rdbStore!.updateSync(valueBucket,predicates);
        console.info(TAG + `relationalStoreTest006 updateSync is successful`);
      } catch (e) {
        console.error(TAG + "relationalStoreTest006 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testRdbDeleteSync14800032_012
     * @tc.number   testRdbDeleteSync14800032_012
     * @tc.desc   testRdbDeleteSync14800032_012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbDeleteSync14800032_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest012 start *************");
      try{
        await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        rdbStore!.deleteSync(predicates);
        console.info(TAG + "deleteSync success ");
      } catch (e) {
        console.error(TAG + "relationalStoreTest012 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testRdbGetModifyTime14800032_013
     * @tc.number   testRdbGetModifyTime14800032_013
     * @tc.desc   testRdbGetModifyTime14800032_013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetModifyTime14800032_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbGetModifyTime14800032_013 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      await rdbStore!.setDistributedTables(
        ["employee"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, {autoSync: false});
      try {
        let PRIKey:	relationalStore.PRIKeyType[] = [1 as long, 4 as long, 2 as long];
        await rdbStore!.getModifyTime("employee", "id", PRIKey);
      } catch (e) {
        console.error(TAG + "relationalStoreTest015 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
      console.log(TAG + "************* testRdbGetModifyTime14800032_013 end *************");
    })

    /**
     * @tc.name   testRdbCleanDirtyData14800032_014
     * @tc.number   testRdbCleanDirtyData14800032_014
     * @tc.desc   testRdbCleanDirtyData14800032_014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbCleanDirtyData14800032_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest016 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      await rdbStore!.setDistributedTables(
        ["employee"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, {autoSync: false});
      try{
        await rdbStore!.cleanDirtyData('employee');
      } catch (e) {
        console.error(TAG + "relationalStoreTest016 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testRdbExecuteSync14800032_015
     * @tc.number   testRdbExecuteSync14800032_015
     * @tc.desc   testRdbExecuteSync14800032_015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbExecuteSync14800032_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbExecuteSync14800032_015 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      const SQL_DELETE_TABLE = 'DELETE FROM employee';
      try{
        rdbStore!.executeSync(SQL_DELETE_TABLE);
      } catch (e) {
        console.error(TAG + "testRdbExecuteSync14800032_015 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testRdbBackup14800032_016
     * @tc.number   testRdbBackup14800032_016
     * @tc.desc   testRdbBackup14800032_016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBackup14800032_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbBackup14800032_016 start *************");
      try{
        await rdbStore!.backup("backup.db");
      } catch (e) {
        console.error(TAG + "relationalStoreTest032 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testRdbRestore14800032_017
     * @tc.number   testRdbRestore14800032_017
     * @tc.desc   testRdbRestore14800032_017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbRestore14800032_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbRestore14800032_017 start *************");
      await rdbStore!.backup("backup2.db");
      try{
        await rdbStore!.restore("backup2.db");
      } catch (e) {
        console.error(TAG + "relationalStoreTest033 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testRdbGetRows14800032_018
     * @tc.number   testRdbGetRows14800032_018
     * @tc.desc   testRdbGetRows14800032_018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetRows14800032_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let predicates = new relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore!.query(predicates);
      try {
        await resultSet.getRows(1);
        resultSet.close();
        done();
      } catch (e) {
        console.error(TAG + "SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPIgetRowsTest_0200 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
        done();
      }
    })

    /**
     * @tc.name   testRdbLockRow14800032_019
     * @tc.number   testRdbLockRow14800032_019
     * @tc.desc   testRdbLockRow14800032_019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbLockRow14800032_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbLockRow14800032_019 start *************");
      await rdbStore!.setDistributedTables(["employee"],relationalStore.DistributedType.DISTRIBUTED_CLOUD);
      try {
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("id", "1");
        await rdbStore!.lockRow(predicates);
      } catch (e) {
        console.error(TAG + "testRdbStoreLockRow0003 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
        done();
      }
      console.log(TAG + "************* testRdbLockRow14800032_019 end   *************");
      done();
    })

    /**
     * @tc.name   testRdbQueryLockedRow14800032_020
     * @tc.number   testRdbQueryLockedRow14800032_020
     * @tc.desc   testRdbQueryLockedRow14800032_020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbQueryLockedRow14800032_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbQueryLockedRow14800032_020 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        await rdbStore!.queryLockedRow(predicates,[]);
      } catch (e) {
        console.error(TAG + "testRdbStoreQueryLockedRow0003 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
      console.log(TAG + "************* testRdbQueryLockedRow14800032_020 end   *************");
    });

    /**
     * @tc.name   testRdbUnlockRow14800032_021
     * @tc.number   testRdbUnlockRow14800032_021
     * @tc.desc   testRdbUnlockRow14800032_021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbUnlockRow14800032_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbUnlockRow14800032_021 start *************");
      await rdbStore!.setDistributedTables(["employee"],relationalStore.DistributedType.DISTRIBUTED_CLOUD);
      try {
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        await rdbStore!.unlockRow(predicates);
      } catch (e) {
        console.error(TAG + "testRdbStoreUnLockRow0003 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
        done();
      }
      console.log(TAG + "************* testRdbUnlockRow14800032_021 end   *************");
      done();
    });

    /**
     * @tc.name   testRdbBatchInsertWithConflictResolutionInTransaction14800032_022
     * @tc.number   testRdbBatchInsertWithConflictResolutionInTransaction14800032_022
     * @tc.desc   testRdbBatchInsertWithConflictResolutionInTransaction14800032_022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBatchInsertWithConflictResolutionInTransaction14800032_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbBatchInsertWithConflictResolutionInTransaction14800032_022 start *************");
      await rdbStore!.execute(CREATE_TABLE_TEST4);
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await rdbStore!.createTransaction();
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "id": 2 as long,
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        await transaction.insert("test4", valueBucket);
        let valueBucketArray:relationalStore.ValuesBucket[] = [];
        for (let i = 0; i < 5; i++) {
          let vb:relationalStore.ValuesBucket = {
            "id": i as long,
            "name": "zhangsan",
            "age": 19 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          valueBucketArray.push(vb);
        }
        let num = await transaction.batchInsertWithConflictResolution("test4", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0700 failed num " + num);
        expect(null).assertFail();
      } catch (err) {
        console.info(TAG, ` testbatchInsertWithConflictResolutionInTransaction0700 failed, errCode:${err.code}, message:${err.message}`);
        expect(14800032).assertEqual(err.code);
        await transaction.rollback();
      }
      done();
      console.log(TAG + "************* testRdbBatchInsertWithConflictResolutionInTransaction14800032_022 end *************");
    })

    /**
     * @tc.name   testRdbBatchInsertWithConflictResolutionSyncInTransaction14800032_023
     * @tc.number   testRdbBatchInsertWithConflictResolutionSyncInTransaction14800032_023
     * @tc.desc   testRdbBatchInsertWithConflictResolutionSyncInTransaction14800032_023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbBatchInsertWithConflictResolutionSyncInTransaction14800032_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbBatchInsertWithConflictResolutionSyncInTransaction14800032_023 start *************");
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await rdbStore!.createTransaction();
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": null,
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray:relationalStore.ValuesBucket[] = [];
        valueBucketArray.push(valueBucket);
        let num = transaction.batchInsertWithConflictResolutionSync("test1", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction1200 insert num " + num);
      } catch (err) {
        console.info(TAG, `testbatchInsertWithConflictResolutionSyncInTransaction1200 failed, errCode:${err.code}, message:${err.message}`);
        expect(14800032).assertEqual(err.code);
        await transaction.rollback();
      }
      done();
      console.log(TAG + "************* testRdbBatchInsertWithConflictResolutionSyncInTransaction14800032_023 end *************");
    })

    /**
     * @tc.name   testRdbInsertReadOnly14800032_024
     * @tc.number testRdbInsertReadOnly14800032_024
     * @tc.desc   testRdbInsertReadOnly14800032_024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbInsertReadOnly14800032_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbInsertReadOnly14800032_024 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        await rdbStore!.insert("test_sta", valueBucket1);
        console.info(TAG + "testRdbInsertReadOnly14800032_024 insert success");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.info(TAG + "testRdbInsertReadOnly14800032_024 err: " + e);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   testRdbInsertWithConflictReadOnly14800032_025
     * @tc.number testRdbInsertWithConflictReadOnly14800032_025
     * @tc.desc   testRdbInsertWithConflictReadOnly14800032_025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbInsertWithConflictReadOnly14800032_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbInsertWithConflictReadOnly14800032_025 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        await rdbStore!.insert("test_sta", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + "testRdbInsertWithConflictReadOnly14800032_025 insert success");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.info(TAG + "testRdbInsertWithConflictReadOnly14800032_025 err: " + e);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   testRdbInsertSyncReadOnly14800032_026
     * @tc.number testRdbInsertSyncReadOnly14800032_026
     * @tc.desc   testRdbInsertSyncReadOnly14800032_026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbInsertSyncReadOnly14800032_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbInsertSyncReadOnly14800032_026 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        rdbStore!.insertSync("test_sta", valueBucket1);
        console.info(TAG + "testRdbInsertSyncReadOnly14800032_026 insert success");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.info(TAG + "testRdbInsertSyncReadOnly14800032_026 err: " + e);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   testRdbInsertSyncWithConflictReadOnly14800032_027
     * @tc.number testRdbInsertSyncWithConflictReadOnly14800032_027
     * @tc.desc   testRdbInsertSyncWithConflictReadOnly14800032_027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbInsertSyncWithConflictReadOnly14800032_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbInsertSyncWithConflictReadOnly14800032_027 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        rdbStore!.insertSync("test_sta", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + "testRdbInsertSyncWithConflictReadOnly14800032_027 insert success");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.info(TAG + "testRdbInsertSyncWithConflictReadOnly14800032_027 err: " + e);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   testRdbDeleteReadOnly14800032_028
     * @tc.number testRdbDeleteReadOnly14800032_028
     * @tc.desc   testRdbDeleteReadOnly14800032_028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbDeleteReadOnly14800032_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbDeleteReadOnly14800032_028 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE DELETE ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows: long = await rdbStore!.delete(predicates);
        console.info(TAG + "testRdbDeleteReadOnly14800032_028 rows: " + rows);
        expect(rows == 1).assertFail();
        done();
      } catch (e) {
        console.info(TAG + "testRdbDeleteReadOnly14800032_028 err: " + e);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   testRdbDeleteSyncReadOnly14800032_029
     * @tc.number testRdbDeleteSyncReadOnly14800032_029
     * @tc.desc   testRdbDeleteSyncReadOnly14800032_029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbDeleteSyncReadOnly14800032_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbDeleteSyncReadOnly14800032_029 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE DELETE ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows: long = rdbStore!.deleteSync(predicates);
        console.info(TAG + "testRdbDeleteSyncReadOnly14800032_029 rows: " + rows);
        expect(rows == 1).assertFail();
        done();
      } catch (e) {
        console.info(TAG + "testRdbDeleteSyncReadOnly14800032_029 err: " + e);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   testRdbUpdateReadOnly14800032_030
     * @tc.number testRdbUpdateReadOnly14800032_030
     * @tc.desc   testRdbUpdateReadOnly14800032_030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbUpdateReadOnly14800032_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbUpdateReadOnly14800032_030 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows: long = await rdbStore!.update(valueBucket0, predicates);
        console.info(TAG + "testRdbUpdateReadOnly14800032_030 rows: " + rows);
        expect(rows == 1).assertFail();
        done();
      } catch (e) {
        console.info(TAG + "testRdbUpdateReadOnly14800032_030 err: " + e);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   testRdbUpdateSyncReadOnly14800032_031
     * @tc.number testRdbUpdateSyncReadOnly14800032_031
     * @tc.desc   testRdbUpdateSyncReadOnly14800032_031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbUpdateSyncReadOnly14800032_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbUpdateSyncReadOnly14800032_031 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows: long = rdbStore!.updateSync(valueBucket0, predicates);
        console.info(TAG + "testRdbUpdateSyncReadOnly14800032_031 rows: " + rows);
        expect(rows == 1).assertFail();
        done();
      } catch (e) {
        console.info(TAG + "testRdbUpdateSyncReadOnly14800032_031 err: " + e);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   testRdbUpdateWithConflictReadOnly14800032_032
     * @tc.number testRdbUpdateWithConflictReadOnly14800032_032
     * @tc.desc   testRdbUpdateWithConflictReadOnly14800032_032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbUpdateWithConflictReadOnly14800032_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbUpdateWithConflictReadOnly14800032_032 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows: long = await rdbStore!.update(valueBucket0, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(TAG + "testRdbUpdateWithConflictReadOnly14800032_032 rows: " + rows);
        expect(rows == 1).assertFail();
        done();
      } catch (e) {
        console.info(TAG + "testRdbUpdateWithConflictReadOnly14800032_032 err: " + e);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   testRdbUpdateSyncWithConflictReadOnly14800032_033
     * @tc.number testRdbUpdateSyncWithConflictReadOnly14800032_033
     * @tc.desc   testRdbUpdateSyncWithConflictReadOnly14800032_033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbUpdateSyncWithConflictReadOnly14800032_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbUpdateSyncWithConflictReadOnly14800032_033 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows: long = rdbStore!.updateSync(valueBucket0, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(TAG + "testRdbUpdateSyncWithConflictReadOnly14800032_033 rows: " + rows);
        expect(rows == 1).assertFail();
        done();
      } catch (e) {
        console.info(TAG + "testRdbUpdateSyncWithConflictReadOnly14800032_033 err: " + e);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   testRdbExecuteReadOnly14800032_034
     * @tc.number testRdbExecuteReadOnly14800032_034
     * @tc.desc   testRdbExecuteReadOnly14800032_034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbExecuteReadOnly14800032_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbExecuteReadOnly14800032_034 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows = await rdbStore!.execute("UPDATE test_sta SET data1 = '王五'");
        console.info(TAG + "testRdbExecuteReadOnly14800032_034 rows: " + rows);
        expect(rows == 1).assertFail();
        done();
      } catch (e) {
        console.info(TAG + "testRdbExecuteReadOnly14800032_034 err: " + e);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   testRdbTxnDeleteSyncReadOnly14800032_035
     * @tc.number testRdbTxnDeleteSyncReadOnly14800032_035
     * @tc.desc   testRdbTxnDeleteSyncReadOnly14800032_035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTxnDeleteSyncReadOnly14800032_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbTxnDeleteSyncReadOnly14800032_035 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore!.createTransaction();
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE DELETE ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows: number = trans.deleteSync(predicates);
        console.info(TAG + "testRdbTxnDeleteSyncReadOnly14800032_035 rows: " + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        done();
      } catch (err) {
        console.info(TAG + "testRdbTxnDeleteSyncReadOnly14800032_035 err: " + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        done();
      }
      console.info(TAG + "************* testRdbTxnDeleteSyncReadOnly14800032_035 end *************");
    })

    /**
     * @tc.name   testRdbTxnInsertSyncWithConflictReadOnly14800032_036
     * @tc.number testRdbTxnInsertSyncWithConflictReadOnly14800032_036
     * @tc.desc   testRdbTxnInsertSyncWithConflictReadOnly14800032_036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTxnInsertSyncWithConflictReadOnly14800032_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbTxnInsertSyncWithConflictReadOnly14800032_036 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore!.createTransaction();
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows: number = trans.insertSync("test_sta", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + "testRdbTxnInsertSyncWithConflictReadOnly14800032_036 rows: " + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        done();
      } catch (err) {
        console.info(TAG + "testRdbTxnInsertSyncWithConflictReadOnly14800032_036 err: " + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        done();
      }
      console.info(TAG + "************* testRdbTxnInsertSyncWithConflictReadOnly14800032_036 end *************");
    })

    /**
     * @tc.name   testRdbTxnInsertSyncReadOnly14800032_037
     * @tc.number testRdbTxnInsertSyncReadOnly14800032_037
     * @tc.desc   testRdbTxnInsertSyncReadOnly14800032_037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTxnInsertSyncReadOnly14800032_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbTxnInsertSyncReadOnly14800032_037 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore!.createTransaction();
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows: number = trans.insertSync("test_sta", valueBucket1);
        console.info(TAG + "testRdbTxnInsertSyncReadOnly14800032_037 rows: " + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        done();
      } catch (err) {
        console.info(TAG + "testRdbTxnInsertSyncReadOnly14800032_037 err: " + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        done();
      }
      console.info(TAG + "************* testRdbTxnInsertSyncReadOnly14800032_037 end *************");
    })

    /**
     * @tc.name   testRdbTxnInsertReadOnly14800032_038
     * @tc.number testRdbTxnInsertReadOnly14800032_038
     * @tc.desc   testRdbTxnInsertReadOnly14800032_038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTxnInsertReadOnly14800032_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbTxnInsertReadOnly14800032_038 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore!.createTransaction();
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows = await trans.insert("test_sta", valueBucket1);
        console.info(TAG + "testRdbTxnInsertReadOnly14800032_038 rows: " + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        done();
      } catch (err) {
        console.info(TAG + "testRdbTxnInsertReadOnly14800032_038 err: " + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        done();
      }
      console.info(TAG + "************* testRdbTxnInsertReadOnly14800032_038 end *************");
    })

    /**
     * @tc.name   testRdbTxnInsertWithConflictReadOnly14800032_039
     * @tc.number testRdbTxnInsertWithConflictReadOnly14800032_039
     * @tc.desc   testRdbTxnInsertWithConflictReadOnly14800032_039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTxnInsertWithConflictReadOnly14800032_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbTxnInsertWithConflictReadOnly14800032_039 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore!.createTransaction();
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows = await trans.insert("test_sta", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + "testRdbTxnInsertWithConflictReadOnly14800032_039 rows: " + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        done();
      } catch (err) {
        console.info(TAG + "testRdbTxnInsertWithConflictReadOnly14800032_039 err: " + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        done();
      }
      console.info(TAG + "************* testRdbTxnInsertWithConflictReadOnly14800032_039 end *************");
    })

    /**
     * @tc.name   testRdbTxnUpdateReadOnly14800032_040
     * @tc.number testRdbTxnUpdateReadOnly14800032_040
     * @tc.desc   testRdbTxnUpdateReadOnly14800032_040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTxnUpdateReadOnly14800032_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbTxnUpdateReadOnly14800032_040 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore!.createTransaction();
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows = await trans.update(valueBucket0, predicates);
        console.info(TAG + "testRdbTxnUpdateReadOnly14800032_040 rows: " + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        done();
      } catch (err) {
        console.info(TAG + "testRdbTxnUpdateReadOnly14800032_040 err: " + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        done();
      }
      console.info(TAG + "************* testRdbTxnUpdateReadOnly14800032_040 end *************");
    })

    /**
     * @tc.name   testRdbTxnUpdateWithConflictReadOnly14800032_041
     * @tc.number testRdbTxnUpdateWithConflictReadOnly14800032_041
     * @tc.desc   testRdbTxnUpdateWithConflictReadOnly14800032_041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTxnUpdateWithConflictReadOnly14800032_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbTxnUpdateWithConflictReadOnly14800032_041 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore!.createTransaction();
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows = await trans.update(valueBucket0, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(TAG + "testRdbTxnUpdateWithConflictReadOnly14800032_041 rows: " + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        done();
      } catch (err) {
        console.info(TAG + "testRdbTxnUpdateWithConflictReadOnly14800032_041 err: " + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        done();
      }
      console.info(TAG + "************* testRdbTxnUpdateWithConflictReadOnly14800032_041 end *************");
    })

    /**
     * @tc.name   testRdbTxnUpdateSyncReadOnly14800032_042
     * @tc.number testRdbTxnUpdateSyncReadOnly14800032_042
     * @tc.desc   testRdbTxnUpdateSyncReadOnly14800032_042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbTxnUpdateSyncReadOnly14800032_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testRdbTxnUpdateSyncReadOnly14800032_042 start *************");
      await rdbStore!.execute(DROP_TABLE_TEST_STA);
      await rdbStore!.execute(CREATE_TABLE_TEST_STA);
      const valueBucket2: relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore!.insert("test_sta", valueBucket2);
      let predicates = new relationalStore.RdbPredicates("test_sta");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore!.createTransaction();
      await rdbStore!.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test_sta BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows = trans.updateSync(valueBucket0, predicates);
        console.info(TAG + "testRdbTxnUpdateSyncReadOnly14800032_042 rows: " + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        done();
      } catch (err) {
        console.info(TAG + "testRdbTxnUpdateSyncReadOnly14800032_042 err: " + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        done();
      }
      console.info(TAG + "************* testRdbTxnUpdateSyncReadOnly14800032_042 end *************");
    })
  })

}