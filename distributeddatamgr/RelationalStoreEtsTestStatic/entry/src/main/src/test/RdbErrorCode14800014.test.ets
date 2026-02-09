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
const TAG = "[RdbErrorCode14800014]"

let context: common.UIAbilityContext | undefined;
let deviceId: string | undefined = undefined;
let rdbStore: relationalStore.RdbStore | undefined;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbErrorCode14800014.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

const asset1: relationalStore.Asset = {
  name: "name1",
  uri: "uri1",
  createTime: "createTime1",
  modifyTime: "modifyTime1",
  size: "size1",
  path: "path1",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2: relationalStore.Asset = {
  name: "name2",
  uri: "uri2",
  createTime: "createTime2",
  modifyTime: "modifyTime2",
  size: "size2",
  path: "path2",
  status: relationalStore.AssetStatus.ASSET_INSERT,
}
const asset3: relationalStore.Asset = {
  name: "name3",
  uri: "uri3",
  createTime: "createTime3",
  modifyTime: "modifyTime3",
  size: "size3",
  path: "path3",
  status: relationalStore.AssetStatus.ASSET_UPDATE,
}
let vbs: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>(3);
const valueBucket0: relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long, //
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
const valueBucket3: relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 100 as long,
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}

export default function RdbErrorCode14800014() {
  describe("RdbErrorCode14800014", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll begin');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      console.info(TAG + 'beforeAll end');
    });
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach begin');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      hilog.info(domain, TAG, '%{public}s', 'beforeEach: delete rdbStore success');
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      hilog.info(domain, TAG, '%{public}s', 'beforeEach: creat rdbStore success');
      console.info(TAG + 'beforeEach');
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18 as long,
        'salary': 25000 as long,
      };
      await rdbStore!.insert('test1', valueBucket);
      console.info(TAG + 'beforeEach end');
    });
    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
    });
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll begin');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      console.info(TAG + 'afterAll end');
    });

    /**
     * @tc.name   RdbGetColumnTypeSync14800014_001
     * @tc.number RdbGetColumnTypeSync14800014_001
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetColumnTypeSync14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* RdbGetColumnTypeSync14800014_001 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore!.insert("test", valueBucket);
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        let count = resultSet!.rowCount;
        expect(true).assertEqual(resultSet!.goToRow(count - 1)!);
        resultSet!.close();
        try {
          resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("id")!);
          console.error(TAG + "RdbGetColumnTypeSync14800014_001 getColumnTypeSync success");
          expect(true).assertFail();
        } catch (err) {
          console.error(TAG + "RdbGetColumnTypeSync14800014_001 getColumnTypeSync failed. " + err);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbGetColumnTypeSync14800014_001 end *************");
        done();
      });

    /**
     * @tc.name   RdbBatchInsertWithConflictResolution14800014_001
     * @tc.number RdbBatchInsertWithConflictResolution14800014_001
     * @tc.desc   test batchInsertWithConflictResolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbBatchInsertWithConflictResolution14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* RdbBatchInsertWithConflictResolution14800014_001 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await rdbStore!.close();
        try {
          await rdbStore!.batchInsertWithConflictResolution("test1", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect(null).assertFail()
        } catch (err) {
          console.log(TAG + err + "RdbBatchInsertWithConflictResolution14800014_001 failed" + err.code);
          expect(err.code == 14800014).assertTrue()
        }
        console.log(TAG + "************* RdbBatchInsertWithConflictResolution14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbBatchInsertWithConflictResolutionSync14800014_001
     * @tc.number RdbBatchInsertWithConflictResolutionSync14800014_001
     * @tc.desc   test batchInsertWithConflictResolutionSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbBatchInsertWithConflictResolutionSync14800014_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.log(TAG +
          "************* RdbBatchInsertWithConflictResolutionSync14800014_001 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await rdbStore!.close();
        try {
          rdbStore!.batchInsertWithConflictResolutionSync("test1", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect(null).assertFail()
        } catch (err) {
          console.log(TAG + err + "RdbBatchInsertWithConflictResolutionSync14800014_001 failed" + err.code);
          expect(err.code == 14800014).assertTrue()
        }
        console.log(TAG + "************* RdbBatchInsertWithConflictResolutionSync14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbOffPerfStat14800014_001
     * @tc.number RdbOffPerfStat14800014_001
     * @tc.desc   1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbOffPerfStat14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* RdbOffPerfStat14800014_001 start *************");
        let observer = (SqlExeInfo: relationalStore.SqlExecutionInfo) => {
          expect().assertFail();
        };
        await rdbStore!.close();
        try {
          rdbStore!.offPerfStat(observer);
          expect().assertFail();
          done();
        } catch (err) {
          console.log(TAG + "err:" + err.code + err.message);
          expect(14800014).assertEqual(err.code);
          done();
        }
        console.log(TAG + "************* RdbOffPerfStat14800014_001 end *************");
      })

    /**
     * @tc.name   RdbOnPerfStat14800014_001
     * @tc.number RdbOnPerfStat14800014_001
     * @tc.desc   1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbOnPerfStat14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* RdbOnPerfStat14800014_001 start *************");
        let observer = (SqlExeInfo: relationalStore.SqlExecutionInfo) => {
          expect().assertFail();
        };
        await rdbStore!.close();
        try {
          rdbStore!.onPerfStat(observer);
          expect().assertFail();
          done();
        } catch (err) {
          console.log(TAG + "err" + err.code + err.message)
          expect(14800014).assertEqual(err.code);
          done();
        }
        console.log(TAG + "************* RdbOnPerfStat14800014_001 end *************");
      })

    /**
     * @tc.name   RdbOffSqliteErrorOccurred14800014_001
     * @tc.number RdbOffSqliteErrorOccurred14800014_001
     * @tc.desc   1.create db 2.close db 3.OnsqliteErrorOccurred
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbOffSqliteErrorOccurred14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* RdbOffSqliteErrorOccurred14800014_001 start *************");
        try {
          await rdbStore!.close();
          let exceptionMessage: relationalStore.ExceptionMessage;
          rdbStore!.offSqliteErrorOccurred(exceptionMessage => {
            console.log(TAG + `error log is ${exceptionMessage.code}`)
            expect().assertFail();
            done();
          });
        } catch (err) {
          expect(14800014).assertEqual(err.code);
          console.log(TAG + `error is failed code:${err.code},message:${err.message}`);
          done();
        }
        console.log(TAG + "************* RdbOffSqliteErrorOccurred14800014_001 end *************");
      })

    /**
     * @tc.name   RdbOnSqliteErrorOccurred14800014_001
     * @tc.number RdbOnSqliteErrorOccurred14800014_001
     * @tc.desc   1.create db 2.close db 3.OnsqliteErrorOccurred
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbOnSqliteErrorOccurred14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* RdbOnSqliteErrorOccurred14800014_001 start *************");
        try {
          await rdbStore!.close();
          let exceptionMessage: relationalStore.ExceptionMessage;
          rdbStore!.onSqliteErrorOccurred(exceptionMessage => {
            console.log(TAG + `error log is ${exceptionMessage.code}`)
            expect().assertFail();
            done();
          });
        } catch (err) {
          expect(14800014).assertEqual(err.code);
          console.log(TAG + `error is failed code:${err.code},message:${err.message}`);
          done();
        }
        console.log(TAG + "************* RdbOnSqliteErrorOccurred14800014_001 end *************");
      })

    /**
     * @tc.name   RdbSetDistributedTables14800014_001
     * @tc.number RdbSetDistributedTables14800014_001
     * @tc.desc   rdbStore.setDistributedTables  errcode is 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbSetDistributedTables14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + "************* RdbSetDistributedTables14800014_001 start *************");
        await rdbStore!.close();
        try {
          await rdbStore!.setDistributedTables(["employee"],
            relationalStore.DistributedType.DISTRIBUTED_CLOUD, { autoSync: true } as relationalStore.DistributedConfig)
          expect(null).assertFail();
        } catch (err) {
          console.info(TAG + "setDistributedTables failed" + `, error code is ${err.code}, message is ${err.message}`);
          expect(err.code == 14800014).assertTrue()
        }
        console.info(TAG + "************* RdbSetDistributedTables14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbDetach14800014_001
     * @tc.number RdbDetach14800014_001
     * @tc.desc   test detach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbDetach14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.info(TAG + "************* RdbDetach14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          await rdbStore!.detach("attachDB");
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        console.info(TAG + "************* RdbDetach14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbGetColumnType14800014_001
     * @tc.number RdbGetColumnType14800014_001
     * @tc.desc   getColumnType test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetColumnType14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* RdbGetColumnType14800014_001 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      await rdbStore!.delete(predicates);
      const valueBucket: relationalStore.ValuesBucket = {
        "data1": "zhangsan",
      };
      await rdbStore!.insert("test", valueBucket);
      let resultSet = await rdbStore!.querySql("SELECT data1 FROM test");
      let count = resultSet.rowCount;
      console.error(TAG + "RdbGetColumnType14800014_001 rowCount " + count);
      expect(true).assertEqual(resultSet?.goToRow(count - 1));
      resultSet!.close();
      try {
        await resultSet!.getColumnType(0);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "RdbGetColumnType14800014_001 success " + err.code + err.message);
        expect(14800014).assertEqual(err.code);
      }
      console.log(TAG + "************* RdbGetColumnType14800014_001 end *************");
      done();
    });

    /**
     * @tc.name   RdbGetRows14800014_001
     * @tc.number RdbGetRows14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbGetRows14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* RdbGetRows14800014_001 start *************");
        const assets1 = [asset1];
        const assets2 = [asset1, asset2, asset3];
        let valuesBucket: relationalStore.ValuesBucket = {
          "data1": asset1,
          "data2": asset2,
          "data3": assets1,
        }
        await rdbStore!.insert("test", valuesBucket);
        let valuesBucket2: relationalStore.ValuesBucket = {
          "data1": asset2,
          "data2": asset3,
          "data3": assets2,
        }
        await rdbStore!.insert("test", valuesBucket2);
        let valuesBucket3: relationalStore.ValuesBucket = {
          "data1": asset1,
          "data3": new Array<relationalStore.Asset>()
        }
        await rdbStore!.insert("test", valuesBucket3);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet: relationalStore.ResultSet = await rdbStore!.query(predicates);
        resultSet!.close();
        try {
          await resultSet.getRows(1);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        await rdbStore!.close();

        done();
        console.log(TAG + "************* RdbGetRows14800014_001 end *************");
      })


    /**
     * @tc.name   RdbAttach14800014_001
     * @tc.number RdbAttach14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbAttach14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* RdbAttach14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        const dbPath = context!.databaseDir + "/rdb/RdbErrorCode14800014.db";
        try {
          await rdbStore!.attach(dbPath, "attachDB");
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbAttach14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbAttach14800014_002
     * @tc.number RdbAttach14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbAttach14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* RdbAttach14800014_002 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        const dbPath = context!.databaseDir + "/rdb/RdbErrorCode14800014.db";
        try {
          await rdbStore!.attach(context!, STORE_CONFIG, "attachDB");
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbAttach14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbEmit14800014_001
     * @tc.number RdbEmit14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbEmit14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* RdbAttach14800014_002 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.emit('storeObserver');
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbAttach14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbOffAutoSyncProgress14800014_001
     * @tc.number RdbOffAutoSyncProgress14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbOffAutoSyncProgress14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* RdbOffAutoSyncProgress14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.offAutoSyncProgress((progressDetail: relationalStore.ProgressDetails) => {
            expect().assertFail();
          });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbOffAutoSyncProgress14800014_001 end *************");
        done();
      })


    /**
     * @tc.name   RdbOffDataChange14800014_001
     * @tc.number RdbOffDataChange14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbOffDataChange14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* RdbOffDataChange14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            (devices: Array<string>) => {
              expect().assertFail();
            });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbOffDataChange14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbOffDataChange14800014_002
     * @tc.number RdbOffDataChange14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbOffDataChange14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* RdbOffDataChange14800014_002 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            (devices: Array<relationalStore.ChangeInfo>) => {
              expect().assertFail();
            });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbOffDataChange14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbOffStatistics14800014_001
     * @tc.number RdbOffStatistics14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbOffStatistics14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* RdbOffStatistics14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.offStatistics((sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
            expect().assertFail();
          });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbOffStatistics14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbOffStatistics14800014_002
     * @tc.number RdbOffStatistics14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbOffStatistics14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* RdbOffStatistics14800014_002 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.offStatistics((sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
            expect().assertFail();
          });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbOffStatistics14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbOnAutoSyncProgress14800014_001
     * @tc.number RdbOnAutoSyncProgress14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbOnAutoSyncProgress14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* RdbOnAutoSyncProgress14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.onAutoSyncProgress((progressDetail: relationalStore.ProgressDetails) => {
            expect().assertFail();
          });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbOnAutoSyncProgress14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbOnDataChange14800014_001
     * @tc.number RdbOnDataChange14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbOnDataChange14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* RdbOnDataChange14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            (devices: Array<string>) => {
              expect().assertFail();
            });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbOnDataChange14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbOnDataChange14800014_002
     * @tc.number RdbOnDataChange14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbOnDataChange14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbOnDataChange14800014_002 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            (devices: Array<relationalStore.ChangeInfo>) => {
              expect().assertFail();
            });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbOnDataChange14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbOnStatistics14800014_001
     * @tc.number RdbOnStatistics14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbOnStatistics14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbOnStatistics14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.onStatistics((sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
            expect().assertFail();
          });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbOnStatistics14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbOn14800014_001
     * @tc.number RdbOn14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbOn14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbOn14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.on('storeObserver', false, () => {
            expect().assertFail();
          });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbOn14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbBackup14800014_001
     * @tc.number RdbBackup14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbBackup14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbBackup14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          await rdbStore!.backup("TransactionTest.db");
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbBackup14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbRestore14800014_001
     * @tc.number RdbRestore14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbRestore14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbRestore14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          await rdbStore!.restore();
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbRestore14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbRestore14800014_002
     * @tc.number RdbRestore14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbRestore14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbRestore14800014_002 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          await rdbStore!.restore("TransactionTest.db");
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbRestore14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbBatchInsertSync14800014_001
     * @tc.number RdbBatchInsertSync14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbBatchInsertSync14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbBatchInsertSync14800014_001 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.batchInsertSync("test1", [valueBucket, valueBucket]);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbBatchInsertSync14800014_001 end *************");
        done();
      })


    /**
     * @tc.name   RdbInsertSync14800014_001
     * @tc.number RdbInsertSync14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbInsertSync14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbInsertSync14800014_001 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.insertSync("test1", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbInsertSync14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbBatchInsertSync14800014_002
     * @tc.number RdbBatchInsertSync14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbBatchInsertSync14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbBatchInsertSync14800014_002 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.batchInsertSync("test1", [valueBucket, valueBucket]);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbBatchInsertSync14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbCleanDirtyData14800014_001
     * @tc.number RdbCleanDirtyData14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbCleanDirtyData14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbCleanDirtyData14800014_001 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          await rdbStore!.cleanDirtyData('test1', 10);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbCleanDirtyData14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbGetModifyTime14800014_001
     * @tc.number RdbGetModifyTime14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbGetModifyTime14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbGetModifyTime14800014_001 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        let PRIKey: Array<relationalStore.PRIKeyType> = [1 as long, 4 as long, 2 as long, 3 as long];
        try {
          await rdbStore!.getModifyTime("test1", "NAME", PRIKey);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbGetModifyTime14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbSync14800014_001
     * @tc.number RdbSync14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbSync14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbSync14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        let deviceIds: Array<string> = [];
        let predicates = new relationalStore.RdbPredicates('test1');
        predicates.inDevices(deviceIds);
        try {
          rdbStore!.sync(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbSync14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbCloudSync14800014_001
     * @tc.number RdbCloudSync14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbCloudSync14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbCloudSync14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          await rdbStore!.cloudSync(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST,
            (progressDetail: relationalStore.ProgressDetails) => {
              console.info(`progress: ${progressDetail}`);
              expect().assertFail();
            });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbCloudSync14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbCloudSync14800014_002
     * @tc.number RdbCloudSync14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbCloudSync14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbCloudSync14800014_002 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          await rdbStore!.cloudSync(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, ["test1"],
            (progressDetail: relationalStore.ProgressDetails) => {
              console.info(`progress: ${progressDetail}`);
              expect().assertFail();
            });
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbCloudSync14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbObtainDistributedTableName14800014_001
     * @tc.number RdbObtainDistributedTableName14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbObtainDistributedTableName14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbObtainDistributedTableName14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} RdbObtainDistributedTableName14800014_001 close succeeded`);
        try {
          await rdbStore!.obtainDistributedTableName("", "EMPLOYEE");
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbObtainDistributedTableName14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbRemoteQuery14800014_001
     * @tc.number RdbRemoteQuery14800014_001
     * @tc.desc   test remoteQuery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbRemoteQuery14800014_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbRemoteQuery14800014_001 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        let deviceIds: Array<string> = [];
        let predicates = new relationalStore.RdbPredicates('test1');
        predicates.inDevices(deviceIds);
        try {
          hilog.info(domain, TAG, '%{public}s', "RdbRemoteQuery14800014_001 remoteQuery start *************");
          await rdbStore!.remoteQuery("", "test1", predicates, ["id", "name", "age", "salary", "blobType"]);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "RdbRemoteQuery14800014_001 err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbRemoteQuery14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbSync14800014_002
     * @tc.number RdbSync14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbSync14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbSync14800014_002 start *************");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        let deviceIds: Array<string> = [];
        let predicates = new relationalStore.RdbPredicates('test1');
        predicates.inDevices(deviceIds);
        try {
          await rdbStore!.sync(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbSync14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbDeleteSync14800014_001
     * @tc.number RdbDeleteSync14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbDeleteSync14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbDeleteSync14800014_001 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          let rows: Number = rdbStore!.deleteSync(predicates)
          console.info(`Delete rows: ${rows}`);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbDeleteSync14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbExecuteSync14800014_001
     * @tc.number RdbExecuteSync14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbExecuteSync14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecuteSync14800014_001 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.executeSync("select * from test1");
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecuteSync14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbExecute14800014_001
     * @tc.number RdbExecute14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbExecute14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecute14800014_001 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          await rdbStore!.execute("DELETE FROM TEST1 WHERE age = ? OR age = ?", ["18", "20"]);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecute14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbExecuteSync14800014_002
     * @tc.number RdbExecuteSync14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbExecuteSync14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecuteSync14800014_002 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          rdbStore!.executeSync("select * from test1");
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecuteSync14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbLockRow14800014_001
     * @tc.number RdbLockRow14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbLockRow14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbLockRow14800014_001 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          await rdbStore!.lockRow(predicates);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbLockRow14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbQueryLockedRow14800014_001
     * @tc.number RdbQueryLockedRow14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbQueryLockedRow14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbQueryLockedRow14800014_001 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          await rdbStore!.queryLockedRow(predicates, ["id", "name", "age", "salary", "blobType"]);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbQueryLockedRow14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbUnlockRow14800014_001
     * @tc.number RdbUnlockRow14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbUnlockRow14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbUnlockRow14800014_001 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          await rdbStore!.unlockRow(predicates);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbUnlockRow14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbUpdate14800014_001
     * @tc.number RdbUpdate14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbUpdate14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdate14800014_001 start *************");
        let u8 = new Uint8Array(2);
        u8.fill(1);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 16.0,
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
        await rdbStore!.close();
        try {
          await rdbTrans.update(valueBucket1, predicates);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800014)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdate14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbQuerySqlSync14800014_001
     * @tc.number RdbQuerySqlSync14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbQuerySqlSync14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbQuerySqlSync14800014_001 start *************");
        let u8 = new Uint8Array(2);
        u8.fill(1);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let options: relationalStore.TransactionOptions = {
          transactionType: relationalStore.TransactionType.IMMEDIATE
        }
        const rdbTrans = await rdbStore!.createTransaction(options);
        await rdbStore!.close();
        try {
          rdbTrans.querySqlSync("SELECT * FROM test1");
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800014)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbQuerySqlSync14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbUpdate14800014_002
     * @tc.number RdbUpdate14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbUpdate14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdate14800014_002 start *************");
        let u8 = new Uint8Array(2);
        u8.fill(1);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 16.0,
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
        await rdbStore!.close();
        try {
          await rdbTrans.update(valueBucket1, predicates);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800014);
        }
        rdbTrans.rollback();
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdate14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbUpdate14800014_003
     * @tc.number RdbUpdate14800014_003
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbUpdate14800014_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdate14800014_003 start *************");
        let u8 = new Uint8Array(2);
        u8.fill(1);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 16.0,
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
        await rdbStore!.close();
        try {
          await rdbTrans.update(valueBucket1, predicates);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800014)
        }
        rdbTrans.rollback();
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdate14800014_003 end *************");
        done();
      })

    /**
     * @tc.name   RdbUpdateSync14800014_001
     * @tc.number RdbUpdateSync14800014_001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbUpdateSync14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdateSync14800014_001 start *************");
        let u8 = new Uint8Array(2);
        u8.fill(1);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 16.0,
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
        await rdbStore!.close();
        try {
          rdbTrans.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800014)
        }
        rdbTrans.rollback();
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdateSync14800014_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbDeleteSync14800014_002
     * @tc.number RdbDeleteSync14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbDeleteSync14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbDeleteSync14800014_002 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          let rows: Number = rdbStore!.deleteSync(predicates)
          console.info(`Delete rows: ${rows}`);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbDeleteSync14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbBatchInsertWithConflictResolution14800014_002
     * @tc.number RdbBatchInsertWithConflictResolution14800014_002
     * @tc.desc   test batchInsertWithConflictResolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbBatchInsertWithConflictResolution14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolution14800014_002 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await rdbStore!.close();
        try {
          await rdbStore!.batchInsertWithConflictResolution("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect(null).assertFail();
        } catch (err) {
          console.log(TAG + err + "RdbBatchInsertWithConflictResolution14800014_002 failed" + err.code);
          expect(err.code == 14800014).assertTrue()
        }
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolution14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbBatchInsertWithConflictResolutionSync14800014_002
     * @tc.number RdbBatchInsertWithConflictResolutionSync14800014_002
     * @tc.desc   test batchInsertWithConflictResolutionSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbBatchInsertWithConflictResolutionSync14800014_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolutionSync14800014_002 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray: relationalStore.ValuesBucket[] = new Array<relationalStore.ValuesBucket>();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await rdbStore!.close();
        try {
          rdbStore!.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect(null).assertFail();
        } catch (err) {
          console.log(TAG + err + "RdbBatchInsertWithConflictResolutionSync14800014_002 failed" + err.code);
          expect(err.code == 14800014).assertTrue()
        }
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolutionSync14800014_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbUpdateSync14800014_002
     * @tc.number RdbUpdateSync14800014_002
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RdbUpdateSync14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdateSync14800014_002 start *************");
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };

        await rdbStore!.insert("test1", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
        try {
          let rows: Number =
            rdbStore!.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.info(`Updated row count: ${rows}`);
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code)
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdateSync14800014_002 end *************");
        done();
      })

    /**
     * @tc.name       RdbInsert14800014_001
     * @tc.number     RdbInsert14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsert14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_001 start *************');
        await rdbStore!.close();
        try {
          let num = await rdbStore!.insert("test", valueBucket0);
          expect(num == 1).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_001 end *************');
      })

    /**
     * @tc.name       RdbInsert14800014_002
     * @tc.number     RdbInsert14800014_002
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsert14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_002 start *************');
        await rdbStore!.close();
        try {
          let num =
            await rdbStore!.insert("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          expect(num == 1).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_002 end *************');
      })

    /**
     * @tc.name       RdbInsertSync14800014_002
     * @tc.number     RdbInsertSync14800014_002
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsertSync14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_002 start *************');
        await rdbStore!.close();
        try {
          let num =
            rdbStore!.insertSync("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          expect(num == 1).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_002 end *************');
      })

    /**
     * @tc.name       RdbInsertSync14800014_003
     * @tc.number     RdbInsertSync14800014_003
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsertSync14800014_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_003 start *************');
        await rdbStore!.close();
        try {
          let num = rdbStore!.insertSync("test", valueBucket1);
          expect(num == 1).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_003 end *************');
      })

    /**
     * @tc.name       RdbBatchInsert14800014_001
     * @tc.number     RdbBatchInsert14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbBatchInsert14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800014_001 start *************');
        await rdbStore!.close();
        try {
          let num = await rdbStore!.batchInsert("test", vbs);
          expect(num == 3).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800014_001 end *************');
      })

    /**
     * @tc.name       RdbBatchInsertSync14800014_003
     * @tc.number     RdbBatchInsertSync14800014_003
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbBatchInsertSync14800014_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsertSync14800014_003 start *************');
        await rdbStore!.close();
        try {
          let num = rdbStore!.batchInsertSync("test", vbs);
          expect(num == 3).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsertSync14800014_003 end *************');
      })

    /**
     * @tc.name       RdbUpdate14800014_004
     * @tc.number     RdbUpdate14800014_004
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdate14800014_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_004 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows: number = await rdbStore!.update(valueBucket3, predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_004 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_004 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_004 end *************');
      })

    /**
     * @tc.name       RdbUpdateSync14800014_003
     * @tc.number     RdbUpdateSync14800014_003
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdateSync14800014_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_003 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows: number = rdbStore!.updateSync(valueBucket3, predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_003 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_003 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_003 end *************');
      })

    /**
     * @tc.name       RdbUpdate14800014_005
     * @tc.number     RdbUpdate14800014_005
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdate14800014_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_005 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows: number = await rdbStore!.update(valueBucket3, predicates,
            relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_005 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_005 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_005 end *************');
      })

    /**
     * @tc.name       RdbUpdateSync14800014_004
     * @tc.number     RdbUpdateSync14800014_004
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdateSync14800014_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_004 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows: number =
            rdbStore!.updateSync(valueBucket3, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_004 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_004 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_004 end *************');
      })

    /**
     * @tc.name       RdbDelete14800014_001
     * @tc.number     RdbDelete14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbDelete14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800014_001 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows = await rdbStore!.delete(predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800014_001 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800014_001 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800014_001 end *************');
      })

    /**
     * @tc.name       RdbDeleteSync14800014_003
     * @tc.number     RdbDeleteSync14800014_003
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbDeleteSync14800014_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800014_003 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows = rdbStore!.deleteSync(predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800014_003 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800014_003 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800014_003 end *************');
      })

    /**
     * @tc.name       RdbQuery14800014_001
     * @tc.number     RdbQuery14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbQuery14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuery14800014_001 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows = await rdbStore!.query(predicates, ["data1"]);
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbQuery14800014_001 rows *************' + rows.columnCount);
          expect(rows.columnCount == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbQuery14800014_001 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuery14800014_001 end *************');
      })

    /**
     * @tc.name       RdbQuery14800014_002
     * @tc.number     RdbQuery14800014_002
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbQuery14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuery14800014_002 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows = await rdbStore!.query(predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbQuery14800014_002 rows *************' + rows);
          expect(rows.columnCount == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbQuery14800014_002 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuery14800014_002 end *************');
      })

    /**
     * @tc.name       RdbQuerySync14800014_001
     * @tc.number     RdbQuerySync14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbQuerySync14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuerySync14800014_001 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows = rdbStore!.querySync(predicates, ["data1"]);
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbQuerySync14800014_001 rows *************' + rows.columnCount);
          expect(rows.columnCount == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbQuerySync14800014_001 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuerySync14800014_001 end *************');
      })

    /**
     * @tc.name       RdbQuerySync14800014_002
     * @tc.number     RdbQuerySync14800014_002
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbQuerySync14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuerySync14800014_002 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows = rdbStore!.querySync(predicates);
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbQuerySync14800014_002 rows *************' + rows.rowCount);
          expect(rows.columnCount == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbQuerySync14800014_002 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuerySync14800014_002 end *************');
      })

    /**
     * @tc.name       RdbQuerySql14800014_001
     * @tc.number     RdbQuerySql14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbQuerySql14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuerySql14800014_001 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows = await rdbStore!.querySql("SELECT * FROM test WHERE data1 = ?", ['hello']);
          hilog.info(domain, TAG, '%{public}s', 'RdbQuerySql14800014_001 rows.rowCount: ' + rows.rowCount);
          expect(rows.columnCount == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbQuerySql14800014_001 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuerySql14800014_001 end *************');
      })

    /**
     * @tc.name       RdbQueryWithoutRowCount14800014_001
     * @tc.number     RdbQueryWithoutRowCount14800014_001
     * @tc.desc       Transaction queryWithoutRowCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbQueryWithoutRowCount14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbQueryWithoutRowCount14800014_001 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows = await rdbStore!.queryWithoutRowCount(predicates, ['data1']);
          hilog.info(domain, TAG, '%{public}s', 'queryWithoutRowCount success');
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbQueryWithoutRowCount14800014_001 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        hilog.info(domain, TAG, '%{public}s', '************* RdbQueryWithoutRowCount14800014_001 end *************');
        done();
      })

    /**
     * @tc.name       RdbQueryWithoutRowCountSync14800014_001
     * @tc.number     RdbQueryWithoutRowCountSync14800014_001
     * @tc.desc       Transaction queryWithoutRowCountSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbQueryWithoutRowCountSync14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbQueryWithoutRowCountSync14800014_001 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        try {
          let rows = rdbStore!.queryWithoutRowCountSync(predicates, ['data1']);
          hilog.info(domain, TAG, '%{public}s', 'queryWithoutRowCountSync success');
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbQueryWithoutRowCountSync14800014_001 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbQueryWithoutRowCountSync14800014_001 end *************');
      })

    /**
     * @tc.name       RdbExecute14800014_002
     * @tc.number     RdbExecute14800014_002
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbExecute14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800014_002 start *************');
        let num = await rdbStore!.batchInsert("test", vbs);
        await rdbStore!.close();
        try {
          let rows = await rdbStore!.execute("select data1 from test");
          hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800014_002 rows *************' + rows);
          expect(rows).assertEqual("ok");
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800014_002 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800014_002 end *************');
      })

    /**
     * @tc.name       RdbExecute14800014_003
     * @tc.number     RdbExecute14800014_003
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbExecute14800014_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800014_003 start *************');
        let num = await rdbStore!.batchInsert("test", vbs);
        await rdbStore!.close();
        try {
          let rows = await rdbStore!.execute("select data1 from test where data1", []);
          hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800014_003 rows *************' + rows);
          expect(rows).assertEqual("ok");
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800014_003 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800014_003 end *************');
      })

    /**
     * @tc.name       RdbCreateTransaction14800014_001
     * @tc.number     RdbCreateTransaction14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbCreateTransaction14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbCreateTransaction14800014_001 start *************');
        let num = await rdbStore!.batchInsert("test", vbs);
        await rdbStore!.close();
        try {
          let rows = await rdbStore!.createTransaction();
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbCreateTransaction14800014_001 rows *************' + rows);
          expect(rows).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbCreateTransaction14800014_001 err *************' + err);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbCreateTransaction14800014_001 end *************');
      })

    /**
     * @tc.name       RdbInsert14800014_003
     * @tc.number     RdbInsert14800014_003
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsert14800014_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_003 start *************');
        let num = await rdbStore!.batchInsert("test", vbs);
        let trans = await rdbStore!.createTransaction();
        await rdbStore!.close();
        try {
          let rows = await trans.insert("test", valueBucket1);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_003 rows *************' + rows);
          expect(rows).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_003 err *************' + err);
          expect(err.code).assertEqual(14800014);;
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_003 end *************');
      })

    /**
     * @tc.name       RdbInsert14800014_004
     * @tc.number     RdbInsert14800014_004
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsert14800014_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_004 start *************');
        let num = await rdbStore!.batchInsert("test", vbs);
        let trans = await rdbStore!.createTransaction();
        await rdbStore!.close();
        try {
          let rows = await trans.insert("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_004 rows *************' + rows);
          expect(rows).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_004 err *************' + err);
          expect(err.code).assertEqual(14800014);;
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800014_004 end *************');
      })

    /**
     * @tc.name       RdbInsertSync14800014_004
     * @tc.number     RdbInsertSync14800014_004
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsertSync14800014_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_004 start *************');
        let num = await rdbStore!.batchInsert("test", vbs);
        let trans = await rdbStore!.createTransaction();
        await rdbStore!.close();
        try {
          let rows = trans.insertSync("test", valueBucket1);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_004 rows *************' + rows);
          expect(rows).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_004 err *************' + err);
          expect(err.code).assertEqual(14800014);;
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_004 end *************');
      })

    /**
     * @tc.name       RdbInsertSync14800014_005
     * @tc.number     RdbInsertSync14800014_005
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsertSync14800014_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_005 start *************');
        let num = await rdbStore!.batchInsert("test", vbs);
        let trans = await rdbStore!.createTransaction();
        await rdbStore!.close();
        try {
          let rows = trans.insertSync("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_005 rows *************' + rows);
          expect(rows).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_005 err *************' + err);
          expect(err.code).assertEqual(14800014);;
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800014_005 end *************');
      })

    /**
     * @tc.name       RdbBatchInsertSync14800014_004
     * @tc.number     RdbBatchInsertSync14800014_004
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbBatchInsertSync14800014_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsertSync14800014_004 start *************');
        await rdbStore!.insert("test", valueBucket0);
        await rdbStore!.close();
        try {
          let rows: number = rdbStore!.batchInsertSync("test", vbs);
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbBatchInsertSync14800014_004 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsertSync14800014_004 err *************' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsertSync14800014_004 end *************');
      })

    /**
     * @tc.name       RdbGetString14800014_001
     * @tc.number     RdbGetString14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetString14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetString14800014_001 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.goToFirstRow();
        resultSet.close();
        try {
          let res = resultSet.getString(resultSet.getColumnIndex("data1"));
          hilog.info(domain, TAG, '%{public}s', '************* RdbGetString14800014_001 res *************' + res);
          expect(res == "hello").assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetString14800014_001 err *************' + err.code + err.message);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetString14800014_001 end *************');
      })
    /**
     * @tc.name       RdbGetBlob14800014_001
     * @tc.number     RdbGetBlob14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetBlob14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetBlob14800014_001 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.goToFirstRow();
        let num = resultSet.getColumnIndex("data4")
        resultSet.close();
        try {
          let res = resultSet.getBlob(num);
          hilog.info(domain, TAG, '%{public}s', '************* RdbGetBlob14800014_001 res *************' + res);
          expect(JSON.stringify(res) == '{"0":1,"1":2,"2":3}').assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetBlob14800014_001 err *************' + err.code + err.message);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetBlob14800014_001 end *************');
      })
    /**
     * @tc.name       RdbGetLong14800014_001
     * @tc.number     RdbGetLong14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetLong14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetLong14800014_001 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.goToFirstRow();
        let num = resultSet.getColumnIndex("data2");
        resultSet.close();
        try {
          let res = resultSet.getLong(num);
          hilog.info(domain, TAG, '%{public}s', '************* RdbGetLong14800014_001 res *************' + res);
          expect(res == 10).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetLong14800014_001 err *************' + err.code + err.message);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetLong14800014_001 end *************');
      })

    /**
     * @tc.name       RdbGetDouble14800014_001
     * @tc.number     RdbGetDouble14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetDouble14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetDouble14800014_001 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.goToFirstRow();
        let num = resultSet.getColumnIndex("data3");
        resultSet.close();
        try {
          let res = resultSet.getDouble(num);
          hilog.info(domain, TAG, '%{public}s', '************* RdbGetDouble14800014_001 res *************' + res);
          expect(res == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetDouble14800014_001 err *************' + err.code + err.message);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetDouble14800014_001 end *************');
      })

    /**
     * @tc.name       RdbGetAsset14800014_001
     * @tc.number     RdbGetAsset14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetAsset14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetAsset14800014_001 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.goToFirstRow();
        let num = resultSet.getColumnIndex("data5");
        resultSet.close();
        try {
          let res = resultSet.getAsset(num);
          hilog.info(domain, TAG, '%{public}s', '************* RdbGetAsset14800014_001 res *************' + res);
          expect(JSON.stringify(res) == '{"size":"","uri":"","name":"","path":"","createTime":"","modifyTime":""}')
            .assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetAsset14800014_001 err *************' + err.code + err.message);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetAsset14800014_001 end *************');
      })

    /**
     * @tc.name       RdbGetValue14800014_001
     * @tc.number     RdbGetValue14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetValue14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetValue14800014_001 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.goToFirstRow();
        let num = resultSet.getColumnIndex("data5");
        resultSet.close();
        try {
          let res = resultSet.getValue(num);
          hilog.info(domain, TAG, '%{public}s', '************* RdbGetValue14800014_001 res *************' + res);
          expect(res == null).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetValue14800014_001 err *************' + err.code + err.message);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetValue14800014_001 end *************');
      })

    /**
     * @tc.name       RdbGetRow14800014_001
     * @tc.number     RdbGetRow14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetRow14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetRow14800014_001 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.goToFirstRow();
        resultSet.close();
        try {
          let res = resultSet.getRow();
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetRow14800014_001 JSON.stringify(res) *************' + JSON.stringify(res));
          expect(JSON.stringify(res) == '{"data1":"hello","data2":10,"data5":' + null +
            ',"data3":1,"data8":null,"id":1,"data4":{"BYTES_PER_ELEMENT":1,"buffer":{"data":[],"data6":null,"data7":null}')
            .assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetRow14800014_001 err *************' + err.code + err.message);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetRow14800014_001 end *************');
      })

    /**
     * @tc.name       RdbIsColumnNull14800014_001
     * @tc.number     RdbIsColumnNull14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbIsColumnNull14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbIsColumnNull14800014_001 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.goToFirstRow();
        let num = resultSet.getColumnIndex("data5");
        resultSet.close();
        try {
          let res = resultSet.isColumnNull(num);
          hilog.info(domain, TAG, '%{public}s', '************* RdbIsColumnNull14800014_001 res *************' + res);
          expect(res).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbIsColumnNull14800014_001 err *************' + err.code + err.message);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbIsColumnNull14800014_001 end *************');
      })
    /**
     * @tc.name       RdbGetFloat32Array14800014_001
     * @tc.number     RdbGetFloat32Array14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetFloat32Array14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetFloat32Array14800014_001 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.goToFirstRow();
        let num = resultSet.getColumnIndex("data7");
        resultSet.close();
        try {
          let res = resultSet.getFloat32Array(num);
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetFloat32Array14800014_001 err ************* ' + res.length);
          expect(res.length == 0).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetFloat32Array14800014_001 err *************' + err.code + err.message);
          expect(err.code).assertEqual(14800014);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetFloat32Array14800014_001 end *************');
      })

    /**
     * @tc.name       RdbDelete14800014_002
     * @tc.number     RdbDelete14800014_002
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbDelete14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800014_002 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await trans.commit();
        try {
          let rows = await trans.delete(predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800014_002 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800014_002 err *************' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800014_002 end *************');
      })
    /**
     * @tc.name       RdbBatchInsert14800014_002
     * @tc.number     RdbBatchInsert14800014_002
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbBatchInsert14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800014_002 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await trans.commit();
        try {
          let rows = await trans.batchInsert("test", vbs);
          hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800014_002 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800014_002 err *************' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800014_002 end *************');
      })
    /**
     * @tc.name       RdbBatchInsertSync14800014_005
     * @tc.number     RdbBatchInsertSync14800014_005
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbBatchInsertSync14800014_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsertSync14800014_005 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await trans.commit();
        try {
          let rows = trans.batchInsertSync("test", vbs);
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbBatchInsertSync14800014_005 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbBatchInsertSync14800014_005  err *************' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsertSync14800014_005 end *************');
      })
    /**
     * @tc.name       RdbDeleteSync14800014_004
     * @tc.number     RdbDeleteSync14800014_004
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbDeleteSync14800014_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800014_004 start *************');
        let trans = await rdbStore!.createTransaction();
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await trans.commit();
        try {
          let rows = trans.deleteSync(predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800014_004 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800014_004 err *************' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s',
          '************* RdbDeleteSync14800014_004 end *************');
      })

    /**
     * @tc.name       RdbUpdate14800014_006
     * @tc.number     RdbUpdate14800014_006
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdate14800014_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_006 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await trans.commit();
        try {
          let rows: number = await trans.update(valueBucket3, predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_006 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_006 err *************' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_006 end *************');
      })

    /**
     * @tc.name       RdbUpdate14800014_007
     * @tc.number     RdbUpdate14800014_007
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdate14800014_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_007 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await trans.commit();
        try {
          let rows: number =
            await trans.update(valueBucket3, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_007 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_007 err *************' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_007 end *************');
      })

    /**
     * @tc.name       RdbUpdateSync14800014_005
     * @tc.number     RdbUpdateSync14800014_005
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdateSync14800014_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_005 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await trans.commit();
        try {
          let rows: number = trans.updateSync(valueBucket3, predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_005 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_005 err *************' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_005 end *************');
      })

    /**
     * @tc.name       RdbUpdateSync14800014_006
     * @tc.number     RdbUpdateSync14800014_006
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdateSync14800014_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_006 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await trans.commit();
        try {
          let rows: number = trans.updateSync(valueBucket3, predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_006 rows *************' + rows);
          expect(rows == 1).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_006 err *************' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800014_006 end *************');
      })

    /**
     * @tc.name       RdbCommit14800014_001
     * @tc.number     RdbCommit14800014_001
     * @tc.desc       Transaction commit and rollback
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbCommit14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbCommit14800014_001 start *************');
        let trans = await rdbStore!.createTransaction();
        await rdbStore!.close();
        try {
          await trans.commit();
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', 'commit err' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbCommit14800014_001 end *************');
      })

    /**
     * @tc.name       RdbCommit14800014_002
     * @tc.number     RdbCommit14800014_002
     * @tc.desc       Transaction commit and rollback
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbCommit14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbCommit14800014_002 start *************');
        let trans = await rdbStore!.createTransaction();
        await trans.commit();
        try {
          await trans.commit();
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', 'commit err' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbCommit14800014_002 end *************');
      })

    /**
     * @tc.name       RdbRollback14800014_001
     * @tc.number     RdbRollback14800014_001
     * @tc.desc       Transaction commit and rollback
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbRollback14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbRollback14800014_001 start *************');
        let trans = await rdbStore!.createTransaction();
        await rdbStore!.close();
        try {
          await trans.rollback();
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', 'rollback err' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbRollback14800014_001 end *************');
      })

    /**
     * @tc.name       RdbRollback14800014_002
     * @tc.number     RdbRollback14800014_002
     * @tc.desc       Transaction commit and rollback
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbRollback14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbRollback14800014_002 start *************');
        let trans = await rdbStore!.createTransaction();
        await trans.rollback();
        try {
          await trans.rollback();
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', 'rollback err' + err);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbRollback14800014_002 end *************');
      })

    /**
     * @tc.name       RdbGetAssets14800014_001
     * @tc.number     RdbGetAssets14800014_001
     * @tc.desc       test getAssets
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetAssets14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetAssets14800014_001 start *************');
        const valueBucket2: relationalStore.ValuesBucket = {
          "data1": "Lisi",
          "data2": 10 as long,
          "data3": 1.0,
          "data4": new Uint8Array([1, 2, 3]),
        }
        await rdbStore!.insert("test", valueBucket2);
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet.close();
        await rdbStore!.close();
        try {
          let res = resultSet.getAssets(resultSet.getColumnIndex("data1"));
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', 'getAssets err' + err.code);
          expect(err.code).assertEqual(14800014);;
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetAssets14800014_001 end *************');
      })

    /**
     * @tc.name       RdbClose14800014_001
     * @tc.number     RdbClose14800014_001
     * @tc.desc       test getAssets
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbClose14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbClose14800014_001 start *************');
        let resultSet = await rdbStore!.querySql("SELECT * FROM test1");
        resultSet.close();
        try {
          resultSet.close();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', 'err.code: ' + err.code);
          expect(true).assertFail();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbClose14800014_001 end *************');
      })

    /**
     * @tc.name       RdbClose14800014_002
     * @tc.number     RdbClose14800014_002
     * @tc.desc       test getAssets
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbClose14800014_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbClose14800014_002 start *************');
        let resultSet = await rdbStore!.querySqlWithoutRowCount("SELECT * FROM test1");
        resultSet.close();
        try {
          resultSet.close();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', 'err.code: ' + err.code);
          expect(true).assertFail();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbClose14800014_002 end *************');
      })

    /**
     * @tc.name   RdbClose14800014_003
     * @tc.number RdbClose14800014_003
     * @tc.desc   rdbStore double close test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbClose14800014_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbClose14800014_003 start *************');
        await rdbStore!.close();
        try {
          await rdbStore!.close();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', 'err.code: ' + err.code);
          expect(true).assertFail();
        }
        hilog.info(domain, TAG, '%{public}s', '************* RdbClose14800014_003 start *************');
        done();
      })

  })
}