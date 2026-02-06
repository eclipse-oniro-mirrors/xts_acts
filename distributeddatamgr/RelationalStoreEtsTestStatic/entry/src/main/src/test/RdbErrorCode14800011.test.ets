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
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
const TAG = "[RdbErrorCode14800011]"

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbErrorCode14800011.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let context: common.UIAbilityContext | undefined;;
let rdbStore: relationalStore.RdbStore | undefined;

async function corruptDatabaseFile(fileName: string)
{
  let stat = await fs.stat(fileName);
  let file = await fs.open(fileName, fs.OpenMode.READ_WRITE);
  fs.lseek(file.fd, 0, fs.WhenceType.SEEK_SET);
  let bufferSize = stat.size;
  let buffer = new ArrayBuffer(bufferSize);
  let uint8Array = new Uint8Array(buffer);
  let fChar = 'F'.charCodeAt(0);
  uint8Array.fill(fChar);
  await fs.write(file.fd, buffer, { offset: 0, length: bufferSize });
}

async function createCorruptDb(context:common.UIAbilityContext, config:relationalStore.StoreConfig)
{
  console.info(TAG, `enter createCorruptDb`);
  let dbPath = context.databaseDir + "/rdb/" + config.name;
  let dbPathWal = dbPath + "-wal";
  let dbPathShm = dbPath + "-shm";
  await corruptDatabaseFile(dbPath);
  await corruptDatabaseFile(dbPathWal);
  await corruptDatabaseFile(dbPathShm);
  console.info(TAG, `quit createCorruptDb`);
}

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
let vbs: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>(2);
vbs[0] = valueBucket0
vbs[1] = valueBucket1

export default function RdbErrorCode14800011() {

  describe("RdbErrorCode14800011", (): void => {
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
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      console.info(TAG + 'beforeEach end');
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name   RdbAttach14800011_001
     * @tc.number RdbAttach14800011_001
     * @tc.desc   attachContext errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbAttach14800011_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbAttach14800011_001 start *************");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let resulet: int = await rdbStore!.attach(context!, STORE_CONFIG, "Resultset.db");
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', `RdbAttach14800011_001 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbAttach14800011_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbAttach14800011_002
     * @tc.number RdbAttach14800011_002
     * @tc.desc   attachFullPath errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbAttach14800011_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbAttach14800011_002 start *************");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          const dbPath = context!.databaseDir + "/rdb/RdbErrorCode14800011.db";
          let resulet: int = await rdbStore!.attach(dbPath, "Resultset.db");
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', `RdbAttach14800011_002 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbAttach14800011_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbBackup14800011_001
     * @tc.number RdbBackup14800011_001
     * @tc.desc   backup errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbBackup14800011_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbBackup14800011_001 start *************");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          await rdbStore!.backup("ResultsetBackup.db");
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', `RdbBackup14800011_001 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbBackup14800011_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbBatchInsertWithConflictResolution14800011_001
     * @tc.number RdbBatchInsertWithConflictResolution14800011_001
     * @tc.desc   batchInsertWithConflictResolution errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbBatchInsertWithConflictResolution14800011_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolution14800011_001 start *************");
        let valueBuckets: Array<relationalStore.ValuesBucket> =
          new Array<relationalStore.ValuesBucket>(valueBucket0, valueBucket0, valueBucket0);
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let conflict: relationalStore.ConflictResolution = relationalStore.ConflictResolution.ON_CONFLICT_REPLACE;
          await rdbStore!.batchInsertWithConflictResolution("test", valueBuckets, conflict);
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            `RdbBatchInsertWithConflictResolution14800011_001 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolution14800011_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbBatchInsertWithConflictResolution14800011_002
     * @tc.number RdbBatchInsertWithConflictResolution14800011_002
     * @tc.desc   batchInsertWithConflictResolutionSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbBatchInsertWithConflictResolution14800011_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolution14800011_002 start *************");
        let valueBuckets: Array<relationalStore.ValuesBucket> =
          new Array<relationalStore.ValuesBucket>(valueBucket0, valueBucket0, valueBucket0);
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let conflict: relationalStore.ConflictResolution = relationalStore.ConflictResolution.ON_CONFLICT_REPLACE;
          await rdbStore!.batchInsertWithConflictResolution("test", valueBuckets, conflict);
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            `RdbBatchInsertWithConflictResolution14800011_002 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolution14800011_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbDeleteSync14800011_001
     * @tc.number RdbDeleteSync14800011_001
     * @tc.desc   deleteSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbDeleteSync14800011_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbDeleteSync14800011_001 start *************");
        rdbStore!.insertSync("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let result = rdbStore!.deleteSync(predicates);
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', `RdbDeleteSync14800011_001 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbDeleteSync14800011_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbExecuteSync14800011_001
     * @tc.number RdbExecuteSync14800011_001
     * @tc.desc   executeSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbExecuteSync14800011_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecuteSync14800011_001 start *************");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          rdbStore!.executeSync(CREATE_TABLE_TEST);
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', `RdbExecuteSync14800011_001 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecuteSync14800011_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbInsertSync14800011_001
     * @tc.number RdbInsertSync14800011_001
     * @tc.desc   insertSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbInsertSync14800011_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbInsertSync14800011_001 start *************");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          rdbStore!.insertSync("test", valueBucket0);
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', `RdbInsertSync14800011_001 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbInsertSync14800011_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbUpdateSync14800011_001
     * @tc.number RdbUpdateSync14800011_001
     * @tc.desc   updateSync has argument errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbUpdateSync14800011_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdateSync14800011_001 start *************");
        let valueBuckets: Array<relationalStore.ValuesBucket> =
          new Array<relationalStore.ValuesBucket>(valueBucket0, valueBucket0, valueBucket0);
        rdbStore!.batchInsertSync("test", valueBuckets);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: Number = rdbStore!.updateSync(valueBucket1, predicates);
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', `RdbUpdateSync14800011_001 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbUpdateSync14800011_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbBatchInsertSync14800011_002
     * @tc.number RdbBatchInsertSync14800011_002
     * @tc.desc   Test batchInsertSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbBatchInsertSync14800011_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): void => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbBatchInsertSync14800011_002 start *************");
        let transaction = await rdbStore!.createTransaction();
        await createCorruptDb(context!, STORE_CONFIG);
        let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket0);
        try {
          let insertNum: number = transaction.batchInsertSync("test", valueBuckets);
          expect().assertFail();
        } catch (err) {
          await transaction.rollback();
          hilog.info(domain, TAG, '%{public}s', `RdbBatchInsertSync14800011_002 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbBatchInsertSync14800011_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbBatchInsertWithConflictResolution14800011_003
     * @tc.number RdbBatchInsertWithConflictResolution14800011_003
     * @tc.desc   Test batchInsertWithConflictResolution errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbBatchInsertWithConflictResolution14800011_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): void => {
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolution14800011_003 start *************");
        let transaction = await rdbStore!.createTransaction();
        let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket0);
        let conflict: relationalStore.ConflictResolution = relationalStore.ConflictResolution.ON_CONFLICT_REPLACE;
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let insertNum: number = await transaction.batchInsertWithConflictResolution("test", valueBuckets, conflict);
          expect().assertFail();
        } catch (err) {
          await transaction.rollback()
          hilog.info(domain, TAG, '%{public}s',
            `RdbBatchInsertWithConflictResolution14800011_003 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolution14800011_003 end *************");
        done();
      })

    /**
     * @tc.name   RdbBatchInsertWithConflictResolutionSync14800011_001
     * @tc.number RdbBatchInsertWithConflictResolutionSync14800011_001
     * @tc.desc   Test batchInsertWithConflictResolutionSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbBatchInsertWithConflictResolutionSync14800011_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): void => {
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolutionSync14800011_001 start *************");
        let transaction = await rdbStore!.createTransaction();
        let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket0);
        let conflict: relationalStore.ConflictResolution = relationalStore.ConflictResolution.ON_CONFLICT_REPLACE;
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let insertNum: number = transaction.batchInsertWithConflictResolutionSync("test", valueBuckets, conflict);
          expect().assertFail();
        } catch (err) {
          await transaction.rollback()
          hilog.info(domain, TAG, '%{public}s',
            `RdbBatchInsertWithConflictResolutionSync14800011_001 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s',
          "************* RdbBatchInsertWithConflictResolutionSync14800011_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbDeleteSync14800011_002
     * @tc.number RdbDeleteSync14800011_002
     * @tc.desc   Transaction deleteSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbDeleteSync14800011_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbDeleteSync14800011_002 start *************");
        rdbStore!.insertSync("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        let transaction = await rdbStore!.createTransaction();
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let result = transaction.deleteSync(predicates);
          expect().assertFail();
        } catch (err) {
          await transaction.rollback();
          hilog.info(domain, TAG, '%{public}s', `RdbDeleteSync14800011_002 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbDeleteSync14800011_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbExecute14800011_001
     * @tc.number RdbExecute14800011_001
     * @tc.desc   Transaction Execute errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbExecute14800011_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecute14800011_001 start *************");
        let transaction = await rdbStore!.createTransaction();
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let result = await transaction.execute(CREATE_TABLE_TEST);
          expect().assertFail();
        } catch (err) {
          await transaction.rollback();
          hilog.info(domain, TAG, '%{public}s', `RdbExecute14800011_001 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecute14800011_001 end *************");
        done();
      })

    /**
     * @tc.name   RdbExecuteSync14800011_002
     * @tc.number RdbExecuteSync14800011_002
     * @tc.desc   Transaction executeSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbExecuteSync14800011_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecuteSync14800011_002 start *************");
        let transaction = await rdbStore!.createTransaction();
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let result = transaction.executeSync(CREATE_TABLE_TEST);
          expect().assertFail();
        } catch (err) {
          await transaction.rollback();
          hilog.info(domain, TAG, '%{public}s', `RdbExecuteSync14800011_002 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbExecuteSync14800011_002 end *************");
        done();
      })

    /**
     * @tc.name   RdbInsertSync14800011_002
     * @tc.number RdbInsertSync14800011_002
     * @tc.desc   Transaction insertSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RdbInsertSync14800011_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbInsertSync14800011_002 start *************");
        let transaction = await rdbStore!.createTransaction();
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          transaction.insertSync("test", valueBucket0);
          expect().assertFail();
        } catch (err) {
          await transaction.rollback();
          hilog.info(domain, TAG, '%{public}s', `RdbInsertSync14800011_002 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);
        }
        hilog.info(domain, TAG, '%{public}s', "************* RdbInsertSync14800011_002 end *************");
        done();
      })

    /**
     * @tc.name       RdbInsert14800011_001
     * @tc.number     RdbInsert14800011_001
     * @tc.desc       test insert
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsert14800011_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_001 start *************');
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let num = await rdbStore!.insert("test", valueBucket1);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_001 ************* num ' + num);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_001 ************* err ' + err.code);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_001 end *************');
      })

    /**
     * @tc.name       RdbInsert14800011_002
     * @tc.number     RdbInsert14800011_002
     * @tc.desc       test insert
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsert14800011_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_002 start *************');
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let num = await rdbStore!.insert("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_002 ************* num ' + num);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_002 ************* err ' + err.code);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_002 end *************');
      })

    /**
     * @tc.name       RdbInsertSync14800011_003
     * @tc.number     RdbInsertSync14800011_003
     * @tc.desc       test insertSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsertSync14800011_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_003 start *************');
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let num = rdbStore!.insertSync("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_003 ************* num ' + num);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbInsertSync14800011_003 ************* err ' + err.code);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_003 end *************');
      })
    /**
     * @tc.name       RdbInsertSync14800011_004
     * @tc.number     RdbInsertSync14800011_004
     * @tc.desc       test insertSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsertSync14800011_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_004 start *************');
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let num = rdbStore!.insertSync("test", valueBucket1);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_004 ************* num ' + num);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbInsertSync14800011_004 ************* err ' + err.code);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_004 end *************');
      })

    /**
     * @tc.name       RdbUpdate14800011_001
     * @tc.number     RdbUpdate14800011_001
     * @tc.desc       test update
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdate14800011_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_001 start *************');
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: number = await rdbStore!.update(valueBucket1, predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_001 end *************' + rows);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_001 end *************' + err);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_001 end *************');
      })

    /**
     * @tc.name       RdbUpdateSync14800011_002
     * @tc.number     RdbUpdateSync14800011_002
     * @tc.desc       test updateSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdateSync14800011_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_002 start *************');
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: number = rdbStore!.updateSync(valueBucket1, predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_002 end *************' + rows);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_002 end *************' + err);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_002 end *************');
      })

    /**
     * @tc.name       RdbUpdate14800011_002
     * @tc.number     RdbUpdate14800011_002
     * @tc.desc       test update
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdate14800011_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_002 start *************');
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: number =
            await rdbStore!.update(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_002 rows *************' + rows);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_002 err *************' + err);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_002 end *************');
      })

    /**
     * @tc.name       RdbUpdateSync14800011_003
     * @tc.number     RdbUpdateSync14800011_003
     * @tc.desc       test updateSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdateSync14800011_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_003 start *************');
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: number =
            rdbStore!.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_003 rows *************' + rows);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_003 err *************' + err);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_003 end *************');
      })

    /**
     * @tc.name       RdbDelete14800011_001
     * @tc.number     RdbDelete14800011_001
     * @tc.desc       test delete
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbDelete14800011_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800011_001 start *************');
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows = await rdbStore!.delete(predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800011_001 rows *************' + rows);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800011_001 err *************' + err);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800011_001 end *************');
      })

    /**
     * @tc.name       RdbDeleteSync14800011_003
     * @tc.number     RdbDeleteSync14800011_003
     * @tc.desc       test deleteSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbDeleteSync14800011_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800011_003 start *************');
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows = rdbStore!.deleteSync(predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800011_003 rows *************' + rows);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800011_003 err *************' + err);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800011_003 end *************');
      })

    /**
     * @tc.name       RdbExecute14800011_002
     * @tc.number     RdbExecute14800011_002
     * @tc.desc       test execute
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbExecute14800011_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800011_002 start *************');
        await rdbStore!.insert("test", valueBucket0);
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows = await rdbStore!.execute("PRAGMA integrity_check");
          hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800011_002 rows *************' + rows);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800011_002 err *************' + err);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbExecute14800011_002 end *************');
      })

    /**
     * @tc.name       RdbInsert14800011_003
     * @tc.number     RdbInsert14800011_003
     * @tc.desc       test insert
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsert14800011_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_003 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows = await trans.insert("test", valueBucket1);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_003 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_003 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_003 end *************');
      })

    /**
     * @tc.name       RdbInsert14800011_004
     * @tc.number     RdbInsert14800011_004
     * @tc.desc       test insert
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsert14800011_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_004 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows = await trans.insert("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_004 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_004 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsert14800011_004 end *************');
      })

    /**
     * @tc.name       RdbInsertSync14800011_005
     * @tc.number     RdbInsertSync14800011_005
     * @tc.desc       test insertSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsertSync14800011_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_005 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows = trans.insertSync("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_005 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_005 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_005 end *************');
      })

    /**
     * @tc.name       RdbInsertSync14800011_006
     * @tc.number     RdbInsertSync14800011_006
     * @tc.desc       test insertSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbInsertSync14800011_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_006 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows = trans.insertSync("test", valueBucket1);
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_006 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_006 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbInsertSync14800011_006 end *************');
      })
    /**
     * @tc.name       RdbUpdate14800011_003
     * @tc.number     RdbUpdate14800011_003
     * @tc.desc       test update
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdate14800011_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_003 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: number = await trans.update(valueBucket1, predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_003 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_003 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_003 end *************');
      })

    /**
     * @tc.name       RdbUpdate14800011_004
     * @tc.number     RdbUpdate14800011_004
     * @tc.desc       test update
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdate14800011_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_004 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: number =
            await trans.update(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_004 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_004 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800011_004 end *************');
      })

    /**
     * @tc.name       RdbUpdateSync14800011_004
     * @tc.number     RdbUpdateSync14800011_004
     * @tc.desc       test updateSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdateSync14800011_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_004 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: number = trans.updateSync(valueBucket1, predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_004 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_004 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_004 end *************');
      })

    /**
     * @tc.name       RdbUpdateSync14800011_005
     * @tc.number     RdbUpdateSync14800011_005
     * @tc.desc       test updateSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdateSync14800011_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_005 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: number =
            trans.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_005 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_005 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdateSync14800011_005 end *************');
      })

    /**
     * @tc.name       RdbDeleteSync14800011_004
     * @tc.number     RdbDeleteSync14800011_004
     * @tc.desc       test deleteSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbDeleteSync14800011_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800011_004 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: number = trans.deleteSync(predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800011_004 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800011_004 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbDeleteSync14800011_004 end *************');
      })

    /**
     * @tc.name       RdbBatchInsertSync14800011_003
     * @tc.number     RdbBatchInsertSync14800011_003
     * @tc.desc       test batchInsertSync
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbBatchInsertSync14800011_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsertSync14800011_003 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: number = trans.batchInsertSync("test", vbs);
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbBatchInsertSync14800011_003 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsertSync14800011_003 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsertSync14800011_003 end *************');
      })

    /**
     * @tc.name       RdbBatchInsert14800011_001
     * @tc.number     RdbBatchInsert14800011_001
     * @tc.desc       test batchInsert
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbBatchInsert14800011_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800011_001 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows: number = await trans.batchInsert("test", vbs);
          hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800011_001 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800011_001 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800011_001 end *************');
      })
    /**
     * @tc.name       RdbGetColumnIndex14800011_001
     * @tc.number     RdbGetColumnIndex14800011_001
     * @tc.desc       test getColumnIndex
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetColumnIndex14800011_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetColumnIndex14800011_001 start *************');
        await createCorruptDb(context!, STORE_CONFIG);
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getColumnIndex("data1");
          hilog.info(domain, TAG, '%{public}s', '************* RdbGetColumnIndex14800011_001 res *************' + res);
          expect(res).assertEqual(-1);
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetColumnIndex14800011_001 err *************' + err.code + err.message);
          expect(true).assertFail();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetColumnIndex14800011_001 end *************');
      })

    /**
     * @tc.name       RdbGetColumnName14800011_001
     * @tc.number     RdbGetColumnName14800011_001
     * @tc.desc       test getColumnName
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetColumnName14800011_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetColumnName14800011_001 start *************');
        await createCorruptDb(context!, STORE_CONFIG);
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getColumnName(0);
          hilog.info(domain, TAG, '%{public}s', '************* RdbGetColumnName14800011_001 res *************' + res);
          expect(res).assertEqual("");
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetColumnName14800011_001 err *************' + err.code + err.message);
          expect(true).assertFail();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetColumnName14800011_001 end *************');
      })

    /**
     * @tc.name       RdbGetRow14800011_001
     * @tc.number     RdbGetRow14800011_001
     * @tc.desc       test getRow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetRow14800011_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetRow14800011_001 start *************');
        await createCorruptDb(context!, STORE_CONFIG);
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getRow();
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetRow14800011_001 end *************' + JSON.stringify(res));
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetRow14800011_001 end *************' + err.code + err.message);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetRow14800011_001 end *************');
      })

    /**
     * @tc.name       RdbIsColumnNull14800011_001
     * @tc.number     RdbIsColumnNull14800011_001
     * @tc.desc       test isColumnNull
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbIsColumnNull14800011_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbIsColumnNull14800011_001 start *************');
        await createCorruptDb(context!, STORE_CONFIG);
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let res = resultSet.isColumnNull(resultSet.getColumnIndex("data5"));
          hilog.info(domain, TAG, '%{public}s', '************* RdbIsColumnNull14800011_001 end *************' + res);
          expect(true).assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbIsColumnNull14800011_001 end *************' + err.code + err.message);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbIsColumnNull14800011_001 end *************');
      })

    /**
     * @tc.name       RdbGetRdbStore14800011_001
     * @tc.number     RdbGetRdbStore14800011_001
     * @tc.desc       test getRdbStore
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetRdbStore14800011_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetRdbStore14800011_001 start *************');
        await createCorruptDb(context!, STORE_CONFIG);
        await rdbStore!.close();
        try {
          await relationalStore.getRdbStore(context!, STORE_CONFIG);
          hilog.info(domain, TAG, '%{public}s', '************* RdbGetRdbStore14800011_001  ************* res');
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbGetRdbStore14800011_001  ************* err' + err.code + err.message);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbGetRdbStore14800011_001 end *************');
      })

    /**
     * @tc.name       RdbDelete14800011_002
     * @tc.number     RdbDelete14800011_002
     * @tc.desc       test delete
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbDelete14800011_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800011_002 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let trans = await rdbStore!.createTransaction();
        let predicates = new relationalStore.RdbPredicates("test");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          let rows = await trans.delete(predicates);
          hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800011_002 rows *************' + rows);
          expect(true).assertFail();
          trans.rollback();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800011_002 err *************' + err);
          expect(err.code).assertEqual(14800011);
          trans.rollback();
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800011_002 end *************');
      })
    /**
     * @tc.name       RdbCreateTransaction14800011_001
     * @tc.number     RdbCreateTransaction14800011_001
     * @tc.desc       test createTransaction
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbCreateTransaction14800011_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbCreateTransaction14800011_001 start *************');
        await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        await createCorruptDb(context!, STORE_CONFIG);
        try {
          await rdbStore!.createTransaction();
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbCreateTransaction14800011_001 1111111111111 *************');
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s',
            '************* RdbCreateTransaction14800011_001 err *************' + err);
          expect(err.code).assertEqual(14800011);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', '************* RdbCreateTransaction14800011_001 end *************');
      })

  })
}