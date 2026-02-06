import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import relationalStore from '@ohos.data.relationalStore';
import dataRdb from '@ohos.data.relationalStore';
import fs from '@ohos.file.fs';

let num = 'a'.repeat(1024 * 1024 * 2);
const valueBucket2m: relationalStore.ValuesBucket = {
  'name': num,
  'age': 19 as long,
};
const valueBucket2k: relationalStore.ValuesBucket = {
  'name': "zhangsan",
  'age': 19 as long,
};
let dataBaseDir: String;
let domain: int = 0x0000;
const TAG = "[RdbErrorCode14800012]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const CREATE_TABLE_EMPLOYEE =
  "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " +
    "age INTEGER," + "salary  REAL," + "data BLOB)";
const CREATE_TABLE_TEST1 =
  "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " +
    "age INTEGER, " + "salary REAL)";


const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbErrorCode14800012.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let context: common.UIAbilityContext | undefined;
let rdbStore: relationalStore.RdbStore | undefined;
let vbs: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>(3);
const valueBucket0: relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long,
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket1: relationalStore.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
const valueBucket2: relationalStore.ValuesBucket = {
  "data1": "hello world",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}
vbs[0] = valueBucket0
vbs[1] = valueBucket1
vbs[2] = valueBucket2

export async function attachBatchInsert(store: relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": "18",
    "salary": 100.5,
    "blobType": u8,
  };
  let valueBucketArray = new Array<relationalStore.ValuesBucket>();
  for (let i = 0; i < 10; i++) {
    valueBucketArray.push(valueBucket);
  }
  await store.batchInsert(tableName, valueBucketArray);
}

const valueBucketEqual2m: relationalStore.ValuesBucket = {
  'name': num,
};

const dbName = "RdbErrorCode14800012.db"
let dbPath = "";
let dbPathWal = "";
let dbPathShm = "";

async function CreateCorruptDb() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(TAG + "fileExist:" + fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4)
    fs.truncateSync(dbPathShm, 4)
    let file = fs.openSync(dbPath, fs.OpenMode.READ_ONLY | fs.OpenMode.TRUNC);
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
  } catch (err) {
    console.info(TAG, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(TAG, `quit create corrupt store`);
}

export default function RdbErrorCode14800012() {

  describe("RdbErrorCode14800012", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll begin');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      dbPath = context!.databaseDir + "/rdb/" + dbName;
      dbPathWal = context!.databaseDir + "/rdb/" + dbName + "-wal";
      console.info(TAG + 'beforeAll end');
    });

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach begin');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      hilog.info(domain, TAG, '%{public}s', 'beforeEach: delete rdbStore success');
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
      let num = await rdbStore!.batchInsert("test", vbs);
      hilog.info(domain, TAG, '%{public}s', 'beforeEach: creat rdbStore success');
      console.info(TAG + 'beforeEach end');
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name   RdbGetColumnTypeSync14800012_001
     * @tc.number RdbGetColumnTypeSync14800012_001
     * @tc.desc   getColumnTypeSync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetColumnTypeSync14800012_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbGetColumnTypeSync14800012_001 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore!.insert("test", valueBucket);
        let resultSet: relationalStore.ResultSet;
        resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          resultSet.getColumnTypeSync(0);
          console.error(TAG + "RdbGetColumnTypeSync14800012_001 getColumnType success ");
          expect(true).assertFail();
        } catch (err) {
          console.error(TAG + "RdbGetColumnTypeSync14800012_001 getColumnType failed " + err);
          expect(14800012).assertEqual(err.code);
          resultSet.close();
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbGetColumnTypeSync14800012_001 end *************");
        done();
      });


    /**
     * @tc.name   RdbGetColumnType14800012_001
     * @tc.number RdbGetColumnType14800012_001
     * @tc.desc   getColumnType test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetColumnType14800012_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      hilog.info(domain, TAG, '%{public}s', "************* RdbGetColumnType14800012_001 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "data1": null,
      };
      await rdbStore!.insert("test", valueBucket);
      let resultSet: relationalStore.ResultSet;
      resultSet = await rdbStore!.querySql("SELECT * FROM test");
      try {
        console.error(TAG + "RdbGetColumnType14800012_001 getColumnType success ");
        await resultSet.getColumnType(0);
        expect(true).assertFail();
      } catch (err) {
        expect(14800012).assertEqual(err.code);
        resultSet.close();
        console.error(TAG + "RdbGetColumnType14800012_001 getColumnType failed " + err);
      }
      hilog.info(domain, TAG, '%{public}s', "************* RdbGetColumnType14800012_001 end *************");
      done();
    });

    /**
     * @tc.name   RdbGetBlob14800012_003
     * @tc.number RdbGetBlob14800012_003
     * @tc.desc   offsetAs errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetBlob14800012_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetBlob14800012_003 start *************");
      let resultSet: relationalStore.ResultSet;
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore!.query(predicates)
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount)
      try {
        resultSet.getBlob(5);
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      resultSet.close();
      console.info(TAG + "************* RdbGetBlob14800012_003 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetString14800012_007
     * @tc.number RdbGetString14800012_007
     * @tc.desc   offsetAs errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetString14800012_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetString14800012_007 start *************");
      let resultSet: relationalStore.ResultSet;
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore!.query(predicates)
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount)
      try {
        resultSet.getString(5);
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      resultSet.close();
      console.info(TAG + "************* RdbGetString14800012_007 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetLong14800012_003
     * @tc.number RdbGetLong14800012_003
     * @tc.desc   offsetAs errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetLong14800012_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetLong14800012_003 start *************");
      let resultSet: relationalStore.ResultSet;
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore!.query(predicates)
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount)
      try {
        resultSet.getLong(5);
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      resultSet.close();
      console.info(TAG + "************* RdbGetLong14800012_003 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetDouble14800012_003
     * @tc.number RdbGetDouble14800012_003
     * @tc.desc   offsetAs errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetDouble14800012_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetDouble14800012_003 start *************");
      let resultSet: relationalStore.ResultSet;
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore!.query(predicates)
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount)
      try {
        resultSet.getDouble(5);
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      resultSet.close();
      console.info(TAG + "************* RdbGetDouble14800012_003 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetAsset14800012_003
     * @tc.number RdbGetAsset14800012_003
     * @tc.desc   offsetAs errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetAsset14800012_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetAsset14800012_003 start *************");
      let predicates = new relationalStore.RdbPredicates("employee")
      let resultSet = await rdbStore!.query(predicates)
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount)
      try {
        resultSet.getAsset(5);
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      resultSet.close();
      console.info(TAG + "************* RdbGetAsset14800012_003 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetAssets14800012_002
     * @tc.number RdbGetAssets14800012_002
     * @tc.desc   offsetAs errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetAssets14800012_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetAssets14800012_002 start *************");
      let predicates = new relationalStore.RdbPredicates("employee")
      let resultSet = await rdbStore!.query(predicates)
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount)
      try {
        resultSet.getAssets(5);
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      resultSet.close();
      console.info(TAG + "************* RdbGetAssets14800012_002 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetValue14800012_003
     * @tc.number RdbGetValue14800012_003
     * @tc.desc   offsetAs errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetValue14800012_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetValue14800012_003 start *************");
      let predicates = new relationalStore.RdbPredicates("employee")
      let resultSet = await rdbStore!.query(predicates)
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount)
      try {
        resultSet.getValue(5);
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      resultSet.close();
      console.info(TAG + "************* RdbGetValue14800012_003 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetRow14800012_001
     * @tc.number RdbGetRow14800012_001
     * @tc.desc   offsetAs errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetRow14800012_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetRow14800012_001 start *************");
      let predicates = new relationalStore.RdbPredicates("employee")
      let resultSet = await rdbStore!.query(predicates)
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount)
      try {
        resultSet.getRow();
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      resultSet.close();
      console.info(TAG + "************* RdbGetRow14800012_001 end *************");
      done();
    })

    /**
     * @tc.name   RdbIsColumnNull14800012_001
     * @tc.number RdbIsColumnNull14800012_001
     * @tc.desc   offsetAs errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbIsColumnNull14800012_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbIsColumnNull14800012_001 start *************");
      let predicates = new relationalStore.RdbPredicates("employee")
      let resultSet = await rdbStore!.query(predicates)
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount)
      try {
        resultSet.isColumnNull(-1);
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      resultSet.close();
      console.info(TAG + "************* RdbIsColumnNull14800012_001 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetString14800012_001
     * @tc.number RdbGetString14800012_001
     * @tc.desc   insertSync para greater than 2MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetString14800012_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetString14800012_001 start *************");
      console.info(TAG + "************* RdbGetString14800012_001 insertSync start *************");
      rdbStore!.insertSync("employee", valueBucket2m, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      console.info(TAG + "************* RdbGetString14800012_001 RdbPredicates start *************");
      let predicates = new relationalStore.RdbPredicates("employee")
      console.info(TAG + "************* RdbGetString14800012_001 query start *************");
      let resultSet = await rdbStore!.query(predicates);
      console.info(TAG + "************* RdbGetString14800012_001 goToFirstRow start *************");
      resultSet.goToFirstRow();
      try {
        console.info(TAG + "************* RdbGetString14800012_001 getString start *************");
        const name = resultSet.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "RdbGetString14800012_001 name:" + name);
        expect(true).assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      console.info(TAG + "************* RdbGetString14800012_001 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetString14800012_002
     * @tc.number RdbGetString14800012_002
     * @tc.desc   insert para greater than 2MB queryLockedRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetString14800012_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetString14800012_002 start *************");
      await rdbStore!.insert("employee", valueBucket2k);
      let predicates = new relationalStore.RdbPredicates("employee")
      let resultSet = await rdbStore!.queryLockedRow(predicates);
      resultSet.goToFirstRow();
      try {
        console.info(TAG + "************* RdbGetString14800012_002 start getString *************");
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        console.log(TAG + "RdbGetString14800012_002 name:" + name);
        expect(true).assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      console.info(TAG + "************* RdbGetString14800012_002 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetString14800012_003
     * @tc.number RdbGetString14800012_003
     * @tc.desc   updateSync param equal 2MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetString14800012_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetString14800012_003 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
      }
      await rdbStore!.insert("employee", valueBucket);
      let predicates = new relationalStore.RdbPredicates("employee")
      predicates.equalTo("name", "lisi")
      rdbStore!.updateSync(valueBucketEqual2m, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates1 = new relationalStore.RdbPredicates("employee");
      let resultSet = await rdbStore!.query(predicates1);
      resultSet.goToFirstRow();
      try {
        const name = resultSet.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(true).assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      console.info(TAG + "************* RdbGetString14800012_003 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetString14800012_004
     * @tc.number RdbGetString14800012_004
     * @tc.desc   updateSync param greater than 2MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetString14800012_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetString14800012_004 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
      }
      await rdbStore!.insert("employee", valueBucket);
      let predicates = new relationalStore.RdbPredicates("employee")
      predicates.equalTo("name", "lisi")
      rdbStore!.updateSync(valueBucket2m, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates1 = new relationalStore.RdbPredicates("employee");
      let resultSet = await rdbStore!.query(predicates1);
      resultSet.goToFirstRow();
      try {
        const name = resultSet.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(true).assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code + err.message);
        expect(err.code == 14800012).assertTrue();
      }
      console.info(TAG + "************* RdbGetString14800012_004 end *************");
      done();
    })

    /**
     * @tc.name       RdbGetLong14800012_001
     * @tc.number     RdbGetLong14800012_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetLong14800012_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetLong14800012_001 start *************');
        let resultSet = await rdbStore!.querySql("");
        try {
          let res = resultSet.getLong(resultSet.getColumnIndex("data2"));
          hilog.info(domain, TAG, '%{public}s', 'RelationStoreError12Test0001, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RelationStoreError12Test0001, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetLong14800012_001 end *************');
      })

    /**
     * @tc.name       RdbGetLong14800012_002
     * @tc.number     RdbGetLong14800012_002
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetLong14800012_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '*************  RdbGetLong14800012_002 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getLong(resultSet.getColumnIndex("data2"));
          hilog.info(domain, TAG, '%{public}s', 'RelationStoreError12Test0001, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RelationStoreError12Test0001, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '*************  RdbGetLong14800012_002 end *************');
      })

    /**
     * @tc.name       RdbGetDouble14800012_001
     * @tc.number     RdbGetDouble14800012_001
     * @tc.desc       Transaction getDouble
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetDouble14800012_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetDouble14800012_001 start *************');
        let resultSet = await rdbStore!.querySql("");
        try {
          let res = resultSet.getDouble(resultSet.getColumnIndex("data3"));
          hilog.info(domain, TAG, '%{public}s', 'RdbGetDouble14800012_001, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RdbGetDouble14800012_001, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetDouble14800012_001 end *************');
      })

    /**
     * @tc.name       RdbGetDouble14800012_002
     * @tc.number     RdbGetDouble14800012_002
     * @tc.desc       Transaction getDouble
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetDouble14800012_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '*************  RdbGetDouble14800012_002 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getDouble(resultSet.getColumnIndex("data3"));
          hilog.info(domain, TAG, '%{public}s', 'RdbGetDouble14800012_002, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RdbGetDouble14800012_002, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '*************  RdbGetDouble14800012_002 end *************');
      })

    /**
     * @tc.name       RdbGetString14800012_005
     * @tc.number     RdbGetString14800012_005
     * @tc.desc       Transaction getString
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetString14800012_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetString14800012_005 start *************');
        let resultSet = await rdbStore!.querySql("");
        try {
          let res = resultSet.getString(resultSet.getColumnIndex("data1"));
          hilog.info(domain, TAG, '%{public}s', 'RdbGetString14800012_005, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RdbGetString14800012_005, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetString14800012_005 end *************');
      })

    /**
     * @tc.name       RdbGetString14800012_006
     * @tc.number     RdbGetString14800012_006
     * @tc.desc       Transaction getString
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetString14800012_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '*************  RdbGetString14800012_006 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getString(resultSet.getColumnIndex("data1"));
          hilog.info(domain, TAG, '%{public}s', 'RdbGetString14800012_006, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RdbGetString14800012_006, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '*************  RdbGetString14800012_006 end *************');
      })

    /**
     * @tc.name       RdbGetBlob14800012_001
     * @tc.number     RdbGetBlob14800012_001
     * @tc.desc       Transaction getBlob
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetBlob14800012_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetBlob14800012_001 start *************');
        let resultSet = await rdbStore!.querySql("");
        try {
          let res = resultSet.getBlob(resultSet.getColumnIndex("data4"));
          hilog.info(domain, TAG, '%{public}s', 'RdbGetBlob14800012_001, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RdbGetBlob14800012_001, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetBlob14800012_001 end *************');
      })

    /**
     * @tc.name       RdbGetBlob14800012_002
     * @tc.number     RdbGetBlob14800012_002
     * @tc.desc       Transaction getBlob
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetBlob14800012_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '*************  RdbGetBlob14800012_002 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getBlob(resultSet.getColumnIndex("data4"));
          hilog.info(domain, TAG, '%{public}s', 'RdbGetBlob14800012_002, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RdbGetBlob14800012_002, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '*************  RdbGetBlob14800012_002 end *************');
      })

    /**
     * @tc.name       RdbGetAsset14800012_001
     * @tc.number     RdbGetAsset14800012_001
     * @tc.desc       Transaction getAsset
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetAsset14800012_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetAsset14800012_001 start *************');
        let resultSet = await rdbStore!.querySql("");
        try {
          let res = resultSet.getAsset(resultSet.getColumnIndex("data5"));
          hilog.info(domain, TAG, '%{public}s', 'RdbGetAsset14800012_001, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RdbGetAsset14800012_001, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetAsset14800012_001 end *************');
      })

    /**
     * @tc.name       RdbGetAsset14800012_002
     * @tc.number     RdbGetAsset14800012_002
     * @tc.desc       Transaction getAsset
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetAsset14800012_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetAsset14800012_002 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getAsset(resultSet.getColumnIndex("data5"));
          hilog.info(domain, TAG, '%{public}s', 'RdbGetAsset14800012_002, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RdbGetAsset14800012_002, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '*************  RdbGetAsset14800012_002 end *************');
      })

    /**
     * @tc.name       RdbGetValue14800012_001
     * @tc.number     RdbGetValue14800012_001
     * @tc.desc       Transaction getValue
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetValue14800012_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetValue14800012_001 start *************');
        let resultSet = await rdbStore!.querySql("");
        try {
          let res = resultSet.getValue(resultSet.getColumnIndex("data6"));
          hilog.info(domain, TAG, '%{public}s', 'RdbGetValue14800012_001, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RdbGetValue14800012_001, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetValue14800012_001 end *************');
      })

    /**
     * @tc.name       RdbGetValue14800012_002
     * @tc.number     RdbGetValue14800012_002
     * @tc.desc       Transaction getValue
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetValue14800012_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetValue14800012_002 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getValue(resultSet.getColumnIndex("data5"));
          hilog.info(domain, TAG, '%{public}s', 'RdbGetValue14800012_002, res: ' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RdbGetValue14800012_002, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '*************  RdbGetValue14800012_002 end *************');
      })

    /**
     * @tc.name       RdbGetAssets14800012_001
     * @tc.number     RdbGetAssets14800012_001
     * @tc.desc       getAssets test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetAssets14800012_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetAssets14800012_001 start *************');
        let asset: relationalStore.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status: relationalStore.AssetStatus.ASSET_NORMAL,
        };
        const assets = [asset];
        const valueBucket: relationalStore.ValuesBucket = {
          "data1": "hello world 1",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        let num = await rdbStore!.insert("test", valueBucket);
        await CreateCorruptDb();
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getAssets(resultSet.getColumnIndex("data6"));
          hilog.info(domain, TAG, '%{public}s', 'RdbGetAssets14800012_001, res.length: ' + res.length);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            'RdbGetAssets14800012_001, err.code: ' + err.code + 'err.message: ' + err.message);
          expect(err.code).assertEqual(14800012);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '*************  RdbGetAssets14800012_001 end *************');
      })

  })

}