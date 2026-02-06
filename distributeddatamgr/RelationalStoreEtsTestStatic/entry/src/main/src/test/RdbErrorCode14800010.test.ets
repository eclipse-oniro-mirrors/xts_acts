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
const TAG = "[RdbErrorCode14800010]"

const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " +
    "salary REAL, " + "blobType BLOB)";
const DATABASE_BACKUP_NAME = "Backup.db"
const DATABASE_BACKUP_NAME1 = "Backup1.db"

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbErrorCode14800010.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1: relationalStore.StoreConfig = {
  name: "RdbErrorCode14800010_01.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  pluginLibs: ["/data/app/el1/bundle/public/"],
  encrypt: false,
}

let STORE_CONFIG_MEMORY: relationalStore.StoreConfig = {
  name: "MemoryRdbErrorCode14800010.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  persist: false,
}

let context: common.UIAbilityContext | undefined;
let rdbStore: relationalStore.RdbStore | undefined;

const dbName = STORE_CONFIG_MEMORY.name;
const dataBaseDir = "/data/storage/el2/database/entry/rdb/"
const dbPath = dataBaseDir + dbName;

async function RenameDbName() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(TAG + "fileExist:" + fileExist)
    expect(fileExist).assertTrue();
    await fs.rename(dbPath, dataBaseDir + "in@valid.db");
  } catch (err) {
    console.info(TAG, `RenameDbName err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(TAG, `quit rename store name`);
}

async function attachBatchInsert(store: relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": 18 as long,
    "salary": 100.5,
    "blobType": u8,
  };
  let valueBucketArray: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
  for (let i = 0; i < 10; i++) {
    valueBucketArray.push(valueBucket);
  }
  await store.batchInsert(tableName, valueBucketArray);
}

export default function RdbErrorCode1480011() {

  describe("RdbErrorCode14800010", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll begin');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      console.info(TAG + 'beforeAll end');
    })

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach begin');
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
      await attachBatchInsert(rdbStore!, "test");
      console.info(TAG + 'beforeEach end');
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach begin');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      console.info(TAG + 'afterEach end');
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name   RdbAttach14800010_001
     * @tc.number RdbAttach14800010_001
     * @tc.desc   input error path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbAttach14800010_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbAttach14800010_001 start *************");
        try {
          await rdbStore!.attach("/path/errPath/attach.db", "attachDB");
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', `RdbAttach14800010_001 + ${err.code} + ${err.message}`);
          expect(14800010).assertEqual(err.code);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', "************* RdbAttach14800010_001 end *************");
      })

    /**
     * @tc.name   RdbAttach14800010_002
     * @tc.number RdbAttach14800010_002
     * @tc.desc   the alias cannot be empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbAttach14800010_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbAttach14800010_002 start *************");
        try {
          await rdbStore!.attach(context!, STORE_CONFIG1, "");
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', `RdbAttach14800010_002 + ${err.code} + ${err.message}`);
          expect(14800010).assertEqual(err.code);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', "************* RdbAttach14800010_002 end *************");
      })

    /**
     * @tc.name   RdbBackup14800010_001
     * @tc.number RdbBackup14800010_001
     * @tc.desc   RelationalStore restore function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbBackup14800010_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbBackup14800010_001 start *************");
        try {
          await rdbStore!.backup(DATABASE_BACKUP_NAME);
          await rdbStore!.restore(DATABASE_BACKUP_NAME1);
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', `RdbBackup14800010_001 + ${err.code} + ${err.message}`);
          expect(14800010).assertEqual(err.code);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', "************* RdbBackup14800010_001 end *************");
      })

    /**
     * @tc.name       RdbGetRdbStore14800010_001
     * @tc.number     RdbGetRdbStore14800010_001
     * @tc.desc       Transaction goTo
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbGetRdbStore14800010_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', "************* RdbGetRdbStore14800010_001 start *************");
        try {
          await relationalStore.getRdbStore(context!, STORE_CONFIG1);
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, TAG, '%{public}s', "getRdbStore, error code: " + err.code, "err message:" + err.message);
          expect(err.code).assertEqual(14800010);
        }
        done();
        hilog.info(domain, TAG, '%{public}s', "************* RdbGetRdbStore14800010_001 end *************");
      })
  })
}