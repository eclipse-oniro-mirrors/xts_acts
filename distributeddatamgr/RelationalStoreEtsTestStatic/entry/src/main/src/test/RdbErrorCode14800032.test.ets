import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let context:common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TAG = "[RdbErrorCode14800032]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 INTEGER, " + "data3 INTEGER," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";


const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";

const CREATE_TABLE_TEST4 = "CREATE TABLE IF NOT EXISTS test4 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";


const DATABASE_BACKUP_NAME = "Backup.db"

const STORE_CONFIG:data_relationalStore.StoreConfig = {
  name: "store.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1:data_relationalStore.StoreConfig = {
  name: "store1.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let rdbStore:data_relationalStore.RdbStore | undefined | null;

async function attachInsert(store: data_relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: data_relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": 18 as long,
    "salary": 100.5,
    "blobType": u8,
  };
  await store.insert(tableName, valueBucket);
}

async function attachBatchInsert(store: data_relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: data_relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": 18 as long,
    "salary": 100.5,
    "blobType": u8,
  };
  let valueBucketArray:data_relationalStore.ValuesBucket[] = [];
  for (let i = 0; i < 10; i++) {
    valueBucketArray.push(valueBucket);
  }
  await store.batchInsert(tableName, valueBucketArray);
}

async function insertCheck(store: data_relationalStore.RdbStore, tableName: string, ret: int) {
  let predicates = new data_relationalStore.RdbPredicates(tableName);
  let resultSet = await store.query(predicates);
  let count = resultSet.rowCount;
  // expect(ret).assertEqual(count);
  resultSet.close();
}

async function updateCheck(store: data_relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([4, 5, 6]);
  const valueBucket: data_relationalStore.ValuesBucket = {
    "name": "lisi",
    "age": 20 as long,
    "salary": 200.5,
    "blobType": u8,
  };
  let predicates = new data_relationalStore.RdbPredicates(tableName);
  predicates.equalTo("id", "1");
  let ret = await store.update(valueBucket, predicates);
  expect(1).assertEqual(ret);
}

async function deleteCheck(store: data_relationalStore.RdbStore, tableName: string, count: int) {
  let predicates = new data_relationalStore.RdbPredicates(tableName);
  let ret = await store.delete(predicates);
  //expect(count).assertEqual(ret);
}

async function attachCheck(store: data_relationalStore.RdbStore) {
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
      hilog.info(domain, tag, '%{public}s', 'start beforeAll');
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      hilog.info(domain, tag, '%{public}s', 'beforeAll:start context');
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'beforeAll:' + context.databaseDir);
    });
    beforeEach(async (): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1);
      hilog.info(domain, tag, '%{public}s', 'beforeEach: delete rdbStore success');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      let attachStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await attachStore.executeSql(CREATE_TABLE_TEST1);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_TEST4);
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      let u8 = new Uint8Array([3 as long, 4 as long, 5 as long]);
      const valueBucket :data_relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30 as long,
        "salary":2000 as long,
        "data4":u8
      }
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "name": "Lisa",
        "age": 31 as long,
        "salary":2000 as long,
        "data4":u8
      }
      await (rdbStore as data_relationalStore.RdbStore).insert("employee", valueBucket);
      await (rdbStore as data_relationalStore.RdbStore).insert("employee", valueBucket2);
      hilog.info(domain, tag, '%{public}s', 'beforeEach: creat rdbStore success');
    });

    afterEach(async (): Promise<void> => {
    });

    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] afterEach');
      rdbStore = undefined;
      // await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    });

    /**
     * @tc.name   testgetColumnTypeSyncErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5000
     * @tc.desc   getColumnTypeSync errcode is 14800032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeSyncErrcode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testgetColumnTypeSyncErrcode0100 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
          "data2": null,
          "data3": null,
          "data4": null,
          "data5": null,
          "data6": null,
          "data7": null,
          "data8": null
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSyncErrcode0100 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type:data_relationalStore.ColumnType;
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("id"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data1"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data2"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data3"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data4"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data5"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data6"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data7"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data8"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        resultSet?.close();
        done();
      } catch (err: BusinessError) {
        console.error(TAG + "testgetColumnTypeSyncErrcode0100" + err.code + err.message);
        expect(err.code == 14800032).assertTrue();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSyncErrcode0100 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5300
     * @tc.desc   getColumnType errcode is 14800032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeErrcode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testgetColumnTypeErrcode0100 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
          "data2": null,
          "data3": null,
          "data4": null,
          "data5": null,
          "data6": null,
          "data7": null,
          "data8": null
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeErrcode0100 insert failed " + err);
      }
      try {
        let resultSet: data_relationalStore.ResultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type: data_relationalStore.ColumnType | undefined;
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("id"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data1"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data2"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data3"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data4"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data5"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data6"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data7"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data8"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        resultSet?.close();
        done();
      } catch (err: BusinessError) {
        console.error(TAG + "testgetColumnTypeErrcode0100" + err.code + err.message);
        expect(err.code == 14800032).assertTrue();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeErrcode0100 end *************");
    });

    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionErrcode0500
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionErrcode0500
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionErrcode0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "age": 18 as long,
          "salary": 100.5,
        }
        let valueBucketArray:data_relationalStore.ValuesBucket[] = [];
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolution("test1", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionErrcode0500 batch failed")
        done();
      } catch (err: BusinessError) {
        console.log(TAG + err +"testRdbStoreBatchInsertWithConflictResolutionErrcode0500 failed" + err.code);
        expect(err.code == 14800032).assertTrue();
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0500 end *************");
    })

    /**
     * @tc.name   testRdbStorebatchInsertWithConflictResolutionSyncErrcode0500
     * @tc.number testRdbStorebatchInsertWithConflictResolutionSyncErrcode0500
     * @tc.desc   testRdbStorebatchInsertWithConflictResolutionSyncErrcode0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorebatchInsertWithConflictResolutionSyncErrcode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "age": 18 as long,
          "salary": 100.5,
        }
        let valueBucketArray:data_relationalStore.ValuesBucket[] = [];
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let conflict: data_relationalStore.ConflictResolution = data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE;
        (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test1", valueBucketArray,conflict);
        console.log(TAG + "testRdbStorebatchInsertWithConflictResolutionSyncErrcode0500 batch failed")
        done();
      } catch (err: BusinessError) {
        console.log(TAG + err +"testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0500 failed" + err.code);
        expect(err.code == 14800032).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0500 end *************");
    })

    /**
     * @tc.name   testRdbStoreAttach0016
     * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0020
     * @tc.desc   non encrypted database attach non encrypted database
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreAttach0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStoreAttach0016 start *************");
      let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await store.executeSql(CREATE_TABLE_TEST1);
      await store.executeSql(CREATE_TABLE_TEST4);
      await attachInsert(store, "test1");
      try {
        let num = await store.attach(context, STORE_CONFIG1, "attachDB");
        expect(1).assertEqual(num);
      } catch(e: BusinessError) {
        console.log("testRdbStoreAttach0016 : failed, err: code=" + e.code + " message=" + e.message);
        expect('14800032').assertEqual(e.code);
        done();
      }
      await attachCheck(store);
      expect(0).assertEqual(await store.detach("attachDB"))
      console.log(TAG + "************* testRdbStoreAttach0016 end *************");
      done();
    })

    /**
     * @tc.name   testRdbStoreAttach0018
     * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0050
     * @tc.desc   non encrypted database attach non encrypted database
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreAttach0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStoreAttach0018 start *************");
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      await attachInsert(rdbStore!, "test1");
      try {
        console.log(TAG + "************* testRdbStoreAttach0018 attach start *************");
        let dataBaseDir = context.databaseDir + "/rdb/";
        let num = await rdbStore!.attach(dataBaseDir + "store1.db", "attachDB");
      } catch(e: BusinessError) {
        console.log("testRdbStoreAttach0018 err: failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
        done();
      }
      await attachCheck(rdbStore!);
      expect(0).assertEqual(await rdbStore!.detach("attachDB"));
      console.log(TAG + "************* testRdbStoreAttach0018 end *************");
      done();
    })

    /**
     * @tc.name   relationalStoreTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_01500
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest001 start *************");
      hilog.info(domain, tag, '%{public}s', 'testRdbStoreBatchInsertWithConflictResolutionErrcode0500: rdbStore = ' + rdbStore);
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      const valueBucket :data_relationalStore.ValuesBucket = {
        "age": 30 as long,
        "salary":2000 as long
      }
      try{
        rdbStore!.insertSync("employee",valueBucket);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.error(TAG + "relationalStoreTest001 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
        done();
      }
      done();
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })

    /**
     * @tc.name   relationalStoreTest002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_01600
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest002 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      const valueBucket :data_relationalStore.ValuesBucket = {
        "age": 30 as long,
        "salary":2000 as long,
      }
      try{
        rdbStore!.insertSync("employee",valueBucket,data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.error(TAG + "relationalStoreTest002 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* relationalStoreTest002 end *************");
    })

    /**
     * @tc.name   relationalStoreTest003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_01700
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest003 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      let values: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>();
      const valueBucket :data_relationalStore.ValuesBucket = {
        "age": 30  as long,
        "salary":2000  as long
      }
      values.push(valueBucket)
      try{
        rdbStore!.batchInsertSync("employee",values);
        console.info(TAG + "relationalStoreTest003 success ");
      }catch (e: BusinessError) {
        console.error(TAG + "relationalStoreTest003 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* relationalStoreTest003 end *************");
    })

    /**
     * @tc.name   relationalStoreTest004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_01800
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest004 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      let values: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>();
      const valueBucket :data_relationalStore.ValuesBucket = {
        "age": 30  as long,
        "salary":2000  as long
      }
      values.push(valueBucket)
      try{
        await rdbStore!.batchInsert("employee",values);
        console.info(TAG + "relationalStoreTest004 success ");
      }catch (e: BusinessError) {
        console.error(TAG + "relationalStoreTest004 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* relationalStoreTest004 end *************");
    })

    /**
     * @tc.name   relationalStoreTest006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_01900
     * @tc.desc   update success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest006 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      const valueBucket :data_relationalStore.ValuesBucket = {
        "age": 30 as long,
        "salary":2000 as long
      }
      try{
        let predicates = new data_relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        rdbStore!.updateSync(valueBucket,predicates);
        console.info(TAG + `relationalStoreTest006 updateSync is successful`);
      } catch (e: BusinessError) {
        console.error(TAG + "relationalStoreTest006 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   relationalStoreTest012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_02000
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest012 start *************");
      try{
        await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
        let predicates = new data_relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        rdbStore!.deleteSync(predicates);
        console.info(TAG + "deleteSync success ");
      } catch (e: BusinessError) {
        console.error(TAG + "relationalStoreTest012 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   relationalStoreTest015
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_02100
     * @tc.desc   getModifyTime success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* relationalStoreTest015 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      await rdbStore!.setDistributedTables(
        ["employee"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {autoSync: false});
      try {
        let PRIKey:	data_relationalStore.PRIKeyType[] = [1 as long, 4 as long, 2 as long];
        await rdbStore!.getModifyTime("employee", "id", PRIKey);
      } catch (e: BusinessError) {
        console.error(TAG + "relationalStoreTest015 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
      console.log(TAG + "************* relationalStoreTest015 end *************");
    })

    /**
     * @tc.name   relationalStoreTest016
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_02200
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest016 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      await rdbStore!.setDistributedTables(
        ["employee"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {autoSync: false});
      try{
        await rdbStore!.cleanDirtyData('employee');
      } catch (e: BusinessError) {
        console.error(TAG + "relationalStoreTest016 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RDBFGAPIexecuteTest_02300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPIexecuteTest_02300
     * @tc.desc   executeSync success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDBFGAPIexecuteTest_02300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* SUB_DistributedData_RelationalStore_SDK_RDBFGAPIexecuteTest_02300 start *************");
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      const SQL_DELETE_TABLE = 'DELETE FROM employee';
      try{
        rdbStore!.executeSync(SQL_DELETE_TABLE);
      } catch (e: BusinessError) {
        console.error(TAG + "SUB_DistributedData_RelationalStore_SDK_RDBFGAPIexecuteTest_02300 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   relationalStoreTest032
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_02400
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest032 start *************");
      try{
        await rdbStore!.backup("backup.db");
      } catch (e: BusinessError) {
        console.error(TAG + "relationalStoreTest032 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   relationalStoreTest033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_02500
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* relationalStoreTest033 start *************");
      await rdbStore!.backup("backup2.db");
      try{
        await rdbStore!.restore("backup2.db");
      } catch (e: BusinessError) {
        console.error(TAG + "relationalStoreTest033 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPIgetRowsTest_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPIgetRowsTest_0200
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPIgetRowsTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let predicates = new data_relationalStore.RdbPredicates('employee');
      let resultSet = await rdbStore!.query(predicates);
      try {
        await resultSet.getRows(1);
        resultSet.close();
        done();
      } catch (e: BusinessError) {
        console.error(TAG + "SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPIgetRowsTest_0200 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
        done();
      }
    })

    /**
     * @tc.name   testRdbStoreLockRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0600
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreLockRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStoreLockRow0003 start *************");
      await rdbStore!.setDistributedTables(["employee"],data_relationalStore.DistributedType.DISTRIBUTED_CLOUD);
      try {
        let predicates = new data_relationalStore.RdbPredicates("employee");
        predicates.equalTo("id", "1");
        await rdbStore!.lockRow(predicates);
      } catch (e: BusinessError) {
        console.error(TAG + "testRdbStoreLockRow0003 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
        done();
      }
      console.log(TAG + "************* testRdbStoreLockRow0003 end   *************");
      done();
    })

    /**
     * @tc.name   testRdbStoreQueryLockedRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QUERYLockRow_0700
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreQueryLockedRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStoreQueryLockedRow0003 start *************");
      try {
        let predicates = new data_relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        await rdbStore!.queryLockedRow(predicates,[]);
      } catch (e: BusinessError) {
        console.error(TAG + "testRdbStoreQueryLockedRow0003 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
      }
      done();
      console.log(TAG + "************* testRdbStoreQueryLockedRow0003 end   *************");
    });

    /**
     * @tc.name   testRdbStoreUnLockRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UNLockRow_0800
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreUnLockRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRdbStoreUnLockRow0003 start *************");
      await rdbStore!.setDistributedTables(["employee"],data_relationalStore.DistributedType.DISTRIBUTED_CLOUD);
      try {
        let predicates = new data_relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        await rdbStore!.unlockRow(predicates);
      } catch (e: BusinessError) {
        console.error(TAG + "testRdbStoreUnLockRow0003 fail code is "+e.code + " message is "+ e.message);
        expect(14800032).assertEqual(e.code);
        done();
      }
      console.log(TAG + "************* testRdbStoreUnLockRow0003 end   *************");
      done();
    });

    /**
      * @tc.name   testbatchInsertWithConflictResolutionInTransaction0700
      * @tc.number testbatchInsertWithConflictResolutionInTransaction0700
      * @tc.desc   testbatchInsertWithConflictResolutionInTransaction0700
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it('testbatchInsertWithConflictResolutionInTransaction0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0700 start *************");
      await rdbStore!.execute(CREATE_TABLE_TEST4);
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "id": 2 as long,
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        await transaction.insert("test4", valueBucket);
        let valueBucketArray:data_relationalStore.ValuesBucket[] = [];
        for (let i = 0; i < 5; i++) {
          let vb:data_relationalStore.ValuesBucket = {
            "id": i as long,
            "name": "zhangsan",
            "age": 19 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          valueBucketArray.push(vb);
        }
        let num = await transaction.batchInsertWithConflictResolution("test4", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "testbatchInsertWithConflictResolutionInTransaction0700 failed num " + num);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.info(TAG, ` testbatchInsertWithConflictResolutionInTransaction0700 failed, errCode:${err.code}, message:${err.message}`);
        expect(14800032).assertEqual(err.code);
        await transaction.rollback();
      }
      done();
      console.log(TAG + "************* testbatchInsertWithConflictResolutionInTransaction0700 end *************");
    })

    /**
     * @tc.name   testbatchInsertWithConflictResolutionSyncInTransaction1200
     * @tc.number testbatchInsertWithConflictResolutionInSyncTransaction1200
     * @tc.desc   testbatchInsertWithConflictResolutionInSyncTransaction1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbatchInsertWithConflictResolutionSyncInTransaction1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testbatchInsertWithConflictResolutionSyncInTransaction1200 start *************");
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      let u8 = new Uint8Array([1, 2, 3]);
      let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": null,
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray:data_relationalStore.ValuesBucket[] = [];
        valueBucketArray.push(valueBucket);
        let num = transaction.batchInsertWithConflictResolutionSync("test1", valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "testbatchInsertWithConflictResolutionSyncInTransaction1200 insert num " + num);
      } catch (err: BusinessError) {
        console.info(TAG, `testbatchInsertWithConflictResolutionSyncInTransaction1200 failed, errCode:${err.code}, message:${err.message}`);
        expect(14800032).assertEqual(err.code);
        await transaction.rollback();
      }
      done();
      console.log(TAG + "************* testbatchInsertWithConflictResolutionSyncInTransaction1200 end *************");
    })

  })
}