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
import relationalStore from '@ohos.data.relationalStore'
import { abilityAccessCtrl, Context, PermissionRequestResult, common } from '@kit.AbilityKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
const TAG = "[RdbErrorCode801]"

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";

const STORE_CONFIG_MEMORY: relationalStore.StoreConfig = {
  name: "MemoryRdbErrorCode801.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  persist: false,
}

const STORE_CONFIG_VECTOR: relationalStore.StoreConfig = {
  name: "VectorRdbErrorCode801.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  vector: true,
}

const STORE_CONFIG_READONLY: relationalStore.StoreConfig = {
  name: "ReadOnlyRdbErrorCode801.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  isReadOnly: true,
}

const valueBucket: relationalStore.ValuesBucket = {
  'name': 'zhangsan',
  'age': 18 as long,
  'salary': 25000.1,
  'blobType': new Uint8Array([1, 2, 3]),
};

const valueBucket1: relationalStore.ValuesBucket = {
  'name': 'lisi',
  'age': 19 as long,
  'salary': 30000.2,
  'blobType': new Uint8Array([1, 2, 3]),
};

let context: common.UIAbilityContext | undefined;
let rdbStoreMemory: relationalStore.RdbStore | undefined;
let rdbStoreVector: relationalStore.RdbStore | undefined;
let rdbStoreReadOnly: relationalStore.RdbStore | undefined;

export default function RdbErrorCode801() {
  describe("RdbErrorCode801", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll begin');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      let readOnlyConf: relationalStore.StoreConfig = {
        name: "ReadOnlyRdbErrorCode801.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      let rdbStore = await relationalStore.getRdbStore(context!, readOnlyConf);
      await rdbStore.executeSql(CREATE_TABLE_TEST1);
      await rdbStore.insert("test", valueBucket);
      await rdbStore.close();
      console.info(TAG + 'beforeAll end');
    })

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach begin');
      rdbStoreMemory = await relationalStore.getRdbStore(context!, STORE_CONFIG_MEMORY);
      await rdbStoreMemory!.executeSql(CREATE_TABLE_TEST);
      await rdbStoreMemory!.executeSql(CREATE_TABLE_TEST1);
      let u8 = new Uint8Array([3, 4, 5])
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30 as long,
        "salary": 2000.0,
        "data4": u8
      }
      await rdbStoreMemory!.insert("employee", valueBucket);
      if (relationalStore.isVectorSupported()) {
        rdbStoreVector = await relationalStore.getRdbStore(context!, STORE_CONFIG_VECTOR);
      }
      rdbStoreReadOnly = await relationalStore.getRdbStore(context!, STORE_CONFIG_READONLY);
      console.info(TAG + 'beforeEach end');
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach begin');
      await rdbStoreMemory!.close();
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG_MEMORY);
      if (relationalStore.isVectorSupported()) {
        await rdbStoreVector!.close();
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG_VECTOR);
      }
      await rdbStoreReadOnly!.close();
      console.info(TAG + 'afterEach end');
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll begin');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG_READONLY);
      console.info(TAG + 'afterAll end');
    })


    /**
     * @tc.name   RdbCleanDirtyData801_001
     * @tc.number RdbCleanDirtyData801_001
     * @tc.desc   Test cleanDirtyData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbCleanDirtyData801_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info(TAG + "-----RdbCleanDirtyData801_001 start-----")
        try {
          await rdbStoreMemory!.cleanDirtyData('test', 100);
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to cleanDirtyData.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(801);
        }
        console.info(TAG + "-----RdbCleanDirtyData801_001 end-----")
        done();
      })

    /**
     * @tc.name   RdbCloudSync801_001
     * @tc.number RdbCloudSync801_001
     * @tc.desc   rdbStoreMemory.cloudSync errcode is 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbCloudSync801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* RdbCloudSync801_001 start *************");
        try {
          await rdbStoreMemory!.cloudSync(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST,
            (progressDetail: relationalStore.ProgressDetails) => {
              console.info(`progress: ${progressDetail}`);
            });
          console.log(TAG + "RdbCloudSync801_001 success");
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code" + err.code + "err.message" + err.message);
          expect(801).assertEqual(err.code);
        }
        console.info(TAG + "************* RdbCloudSync801_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbCloudSync801_002
     * @tc.number RdbCloudSync801_002
     * @tc.desc   Test cloudSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbCloudSync801_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "-----RdbCloudSync801_002 start-----")
        const tables = ["table1", "table2"];
        try {
          await rdbStoreMemory!.cloudSync(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, tables,
            (progressDetail: relationalStore.ProgressDetails) => {
              console.info(TAG + `progress: ${progressDetail}`);
            });
          console.info(TAG + 'Cloud sync succeeded');
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to cloudSync.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(801);
        }
        console.info(TAG + "-----RdbCloudSync801_002 end-----")
        done();
      })

    /**
     * @tc.name   RdbEmit801_001
     * @tc.number RdbEmit801_001
     * @tc.desc   Test emit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbEmit801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "-----RdbEmit801_001 start-----")
        if (!relationalStore.isVectorSupported()) {
          console.info(TAG + "The device does not support the vector database.");
          done();
          return;
        }
        try {
          rdbStoreVector!.emit('storeObserver');
          console.info(TAG + 'emit success.');
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(801);
        }
        console.info(TAG + "-----RdbEmit801_001 end-----")
        done();
      })

    /**
     * @tc.name   RdbOnAutoSyncProgress801_001
     * @tc.number RdbOnAutoSyncProgress801_001
     * @tc.desc   Test onAutoSyncProgress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbOnAutoSyncProgress801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "-----RdbOnAutoSyncProgress801_001 start-----")
        let progressDetail = (progressDetail: relationalStore.ProgressDetails) => {
          console.info(`progress: ${progressDetail}`);
        }
        try {
          rdbStoreMemory!.onAutoSyncProgress(progressDetail);
          console.info(TAG + 'on success.');
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(801)
        }
        console.info(TAG + "-----RdbOnAutoSyncProgress801_001 end-----")
        done();
      })

    /**
     * @tc.name   RdbOnDataChange801_001
     * @tc.number RdbOnDataChange801_001
     * @tc.desc   Test onDataChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbOnDataChange801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "-----RdbOnDataChange801_001 start-----")
        let storeObserver = (devices: Array<string>) => {
          if (devices != undefined) {
            for (let i = 0; i < devices.length; i++) {
              console.info(TAG + `device= ${devices[i]} data changed`);
            }
          }
        }
        try {
          rdbStoreMemory!.onDataChange(
            relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            storeObserver);
          console.info(TAG + 'on success.');
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(801)
        }
        console.info(TAG + "-----RdbOnDataChange801_001 end-----")
        done();
      })

    /**
     * @tc.name   RdbOnDataChange801_002
     * @tc.number RdbOnDataChange801_002
     * @tc.desc   Test onDataChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbOnDataChange801_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "-----RdbOnDataChange801_002 start-----")
        let storeObserver = (devices: Array<string>) => {
          if (devices != undefined) {
            for (let i = 0; i < devices.length; i++) {
              console.info(`device= ${devices[i]} data changed`);
            }
          }
        }
        try {
          rdbStoreMemory!.onDataChange(
            relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            storeObserver);
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(801)
        }
        console.info(TAG + "-----RdbOnDataChange801_002 end-----")
        done();
      })

    /**
     * @tc.name   RdbOnSqliteErrorOccurred801_001
     * @tc.number RdbOnSqliteErrorOccurred801_001
     * @tc.desc   Test onSqliteErrorOccurred
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbOnSqliteErrorOccurred801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "-----RdbOnSqliteErrorOccurred801_001 start-----")
        if (!relationalStore.isVectorSupported()) {
          console.info(TAG + "The device does not support the vector database.");
          done();
          return;
        }
        let observer = (exceptionMessage: relationalStore.ExceptionMessage) => {
          console.info(TAG + 'in observer.');
          expect().assertFail();
        };
        try {
          rdbStoreVector!.onSqliteErrorOccurred(observer);
          console.info(TAG + 'on success.');
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(801);
        }
        console.info(TAG + "-----RdbOnSqliteErrorOccurred801_001 end-----")
        done();
      })

    /**
     * @tc.name   RdbOnPerfStat801_001
     * @tc.number RdbOnPerfStat801_001
     * @tc.desc   Test onPerfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbOnPerfStat801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "-----RdbOnPerfStat801_001 start-----");
        if (!relationalStore.isVectorSupported()) {
          console.info(TAG + "The device does not support the vector database.");
          done();
          return;
        }
        let observer = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(TAG + 'in observer.');
          expect().assertFail();
        };
        try {
          rdbStoreVector!.onPerfStat(observer);
          console.info(TAG + 'on success.');
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(801);
        }
        console.info(TAG + "-----RdbOnPerfStat801_001 end-----");
        done();
      })

    /**
     * @tc.name   RdbOn801_001
     * @tc.number RdbOn801_001
     * @tc.desc   Test on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbOn801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "-----RdbOn801_001 start-----")
        let storeObserver = () => {
          console.info(TAG + `storeObserver`);
        }
        try {
          rdbStoreMemory!.on('storeObserver', true, storeObserver);
          console.info(TAG + 'on success.')
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(801)
        }
        console.info(TAG + "-----RdbOn801_001 end-----")
        done();
      })

    /**
     * @tc.name   RdbSetDistributedTables801_001
     * @tc.number RdbSetDistributedTables801_001
     * @tc.desc   test setDistributedTables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbSetDistributedTables801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "-----RdbSetDistributedTables801_001 start-----")
        try {
          await rdbStoreMemory!.setDistributedTables(["test"]);
          expect(null).assertFail();
        } catch (err) {
          console.log("setDistributedTables catch err: failed, err: code=" + err.code + " message=" + err.message)
          expect(err.code).assertEqual(801);
        }
        console.info(TAG + "-----RdbSetDistributedTables801_001 end-----")
        done();
      })

    /**
     * @tc.name   RdbSync801_001
     * @tc.number RdbSync801_001
     * @tc.desc   test sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbSync801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "-----RdbSync801_001 start-----")
        let predicates = new relationalStore.RdbPredicates("test");
        try {
          await rdbStoreMemory!.sync(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
          expect(null).assertFail();
        } catch (err) {
          console.log("sync catch err: failed, err: code=" + err.code + " message=" + err.message)
          expect(err.code).assertEqual(801);
        }
        console.info(TAG + "-----RdbSync801_001 end-----")
        done();
      })

    /**
     * @tc.name   RdbCreateTransaction801_001
     * @tc.number RdbCreateTransaction801_001
     * @tc.desc   transaction.execute errcode is 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbCreateTransaction801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* RdbCreateTransaction801_001 start *************");
        try {
          let transaction = await rdbStoreReadOnly!.createTransaction();
          expect(null).assertFail();
        } catch (err) {
          console.log(TAG + "err.code" + err.code + "err.message" + err.message);
          expect(err.code).assertEqual(801);
        }
        console.info(TAG + "************* RdbCreateTransaction801_001 end *************");
        done();
      })

    /**
     * @tc.name RdbInsert801_001
     * @tc.number RdbInsert801_001
     * @tc.desc 1. set isReadOnly as true
     *          2. open read-only database
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('RdbInsert801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* RdbInsert801_001 start *************");
        try {
          await rdbStoreReadOnly!.insert("test", valueBucket);
          expect().assertFail();
        } catch (err) {
          console.error(TAG + `Insert is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(801);
        }
        console.log(TAG + "************* RdbInsert801_001 end *************");
        done();
      })
    /**
     * @tc.name RdbInsert801_002
     * @tc.number RdbInsert801_002
     * @tc.desc 1. set isReadOnly as true
     *          2. open read-only database
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('RdbInsert801_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* RdbInsert801_002 start *************");
        try {
          await rdbStoreReadOnly!.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.info(`RdbInsert801_002 insert is successful`);
          expect().assertFail();
        } catch (err) {
          console.error(TAG +
            `RdbInsert801_002 insert is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(801);
        }
        console.log(TAG + "************* RdbInsert801_002 end *************");
        done();
      })

    /**
     * @tc.name RdbExecute801_002
     * @tc.number RdbExecute801_002
     * @tc.desc 1. set isReadOnly as true
     *          2. open read-only database
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('RdbExecute801_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* RdbExecute801_002 start *************");
        try {
          await rdbStoreReadOnly!.execute("INSERT INTO test (name, age, salary, blobType) VALUES (?, ?, ?, ?)");
          expect().assertFail();
        } catch (err) {
          console.error(TAG +
            `RdbExecute801_002 execute is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(801);
        }
        console.log(TAG + "************* RdbExecute801_002 end *************");
        done();
      })

    /**
     * @tc.name RdbInsertSync801_001
     * @tc.number RdbInsertSync801_001
     * @tc.desc 1. set isReadOnly as true
     *          2. open read-only database
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('RdbInsertSync801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* RdbInsertSync801_001 start *************");
        try {
          rdbStoreReadOnly!.insertSync("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.info(TAG + `RdbInsertSync801_001 insertSync is successful`);
          expect().assertFail();
        } catch (err) {
          console.error(TAG +
            `RdbInsertSync801_001 insertSync is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(801);
        }
        console.log(TAG + "************* RdbInsertSync801_001 end *************");
        done();
      })

    /**
     * @tc.name RdbBatchInsert801_001
     * @tc.number RdbBatchInsert801_001
     * @tc.desc 1. set isReadOnly as true
     *          2. open read-only database
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('RdbBatchInsert801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* RdbBatchInsert801_001 start *************");
        let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket, valueBucket1);
        try {
          await rdbStoreReadOnly!.batchInsert("test", valueBuckets);
          expect().assertFail();
        } catch (err) {
          console.error(TAG +
            `RdbBatchInsert801_001 batchInsert is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(801);
        }
        console.log(TAG + "************* RdbBatchInsert801_001 end *************");
        done();
      })

    /**
     * @tc.name RdbBatchInsertSync801_001
     * @tc.number RdbBatchInsertSync801_001
     * @tc.desc 1. set isReadOnly as true
     *          2. open read-only database
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('RdbBatchInsertSync801_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* RdbBatchInsertSync801_001 start *************");
        let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket, valueBucket1);
        try {
          let rowId: long = rdbStoreReadOnly!.batchInsertSync("test", valueBuckets);
          console.info(TAG + `RdbBatchInsertSync801_001 batchInsertSync is successful, rowId = ${rowId}`);
          expect().assertFail();
        } catch (err) {
          console.error(TAG +
            `RdbBatchInsertSync801_001 batchInsertSync is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(801);
        }
        console.log(TAG + "************* RdbBatchInsertSync801_001 end *************");
        done();
      })

  })
}