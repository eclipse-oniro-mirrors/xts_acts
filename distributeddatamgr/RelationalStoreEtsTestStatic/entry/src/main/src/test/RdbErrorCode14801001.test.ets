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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import relationalStore from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TABLE = 'ErrorCodeTestTable';
const TAG = "[RdbErrorCode14801001]"

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbStore14801001.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let context: common.UIAbilityContext | undefined;
let rdbStore: relationalStore.RdbStore | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

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
  expect(ret).assertEqual(count);
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
  expect(count).assertEqual(ret);
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

export default function RdbErrorCode14801001() {

  describe("RdbErrorCode14801001", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
    });

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      try {
        let attachStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
        console.info(TAG + 'beforeEach context databasedir: ' + context!.databaseDir);
        console.info(TAG + 'beforeEach STORE_CONFIG success');
        await attachStore.executeSql(CREATE_TABLE_TEST1);
      } catch (e) {
        console.info(TAG + 'beforeEach error: err: code=" + e.code + " message=" + e.message');
      }
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');

    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    })

    /**
     * @tc.name   testRdbAttach14801001_001
     * @tc.number testRdbAttach14801001_001
     * @tc.desc   non encrypted database attach non encrypted database
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbAttach14801001_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbAttach14801001_001 start *************");
      let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      await store.execute(CREATE_TABLE_TEST);
      await attachInsert(store, "test");
      try {
        let num = await store.attach(context!, STORE_CONFIG, "attachDB");
        expect(1).assertEqual(num);
      } catch (e) {
        console.log("testRdbAttach14801001_001 : failed, err: code=" + e.code + " message=" + e.message);
        expect(14801001).assertEqual(e.code);
        done();
      }
      await attachCheck(store);
      expect(0).assertEqual(await store.detach("attachDB"))
      console.log(TAG + "************* testRdbAttach14801001_001 end *************");
      done();
    })

    /**
     * @tc.number testRdbGetRdbStore14801001_002
     * @tc.name testRdbGetRdbStore14801001_002
     * @tc.desc testRdbGetRdbStore14801001_002
     * @tc.type Function
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testRdbGetRdbStore14801001_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbGetRdbStore14801001_002 start *************");
        relationalStore.getRdbStore(context!, STORE_CONFIG).then(async (rdbStore: relationalStore.RdbStore) => {
          console.info('getRdbStore successfully.');
        }).catch((e) => {
          console.log("getRdbStore failed, err: code=" + e.code + " message=" + e.message);
          expect(14801001).assertEqual(e.code);
        });
        try {
          await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        } catch (e) {
          console.log("deleteRdbStore failed, err: code=" + e.code + " message=" + e.message);
          expect(14801001).assertEqual(e.code);
        }
        console.log(TAG + "************* testRdbGetRdbStore14801001_002 end *************");
        done();
      })
  })
}