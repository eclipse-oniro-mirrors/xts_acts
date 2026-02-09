import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let context:common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let rdbStore : relationalStore.RdbStore | undefined;
let dataBaseDir : String = "";
let domain: int  = 0x0000;

const TAG = "[RdbErrorCode14800015]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG :relationalStore.StoreConfig = {
  name: "RdbErrorCode14800015.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
const TABLE_NAME = "RdbErrorCode14800015"

let STORE_CONFIG1 :relationalStore.StoreConfig = {
  name: "myRdbErrorCode14800015.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  encrypt:false,
}

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

export async function attachBatchInsert(store: relationalStore.RdbStore, tableName: string) {
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

export default function RdbErrorCode14800015() {

  describe("RdbErrorCode14800015", (): void => {
    beforeAll(async () : Promise<void> => {
      console.info(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      dataBaseDir = context!.databaseDir + "/rdb/";
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
      await rdbStore!.execute(DROP_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_TEST);
    });

    afterAll(async () : Promise<void> => {
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
    })

    /**
     * @tc.name testRdbAttach14800015_001
     * @tc.number testRdbAttach14800015_001
     * @tc.desc testRdbAttach14800015_001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRdbAttach14800015_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.log(TAG + "************* testRdbAttach14800015_001 start *************");
        try {
        let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
        await store.executeSql(CREATE_TABLE_TEST1);
        await attachBatchInsert(store, "test1");
        let predicates = new relationalStore.RdbPredicates("test1");
        let resultSet = await store.query(predicates);
        let count = resultSet.rowCount;
        await store.attach(dataBaseDir + "myRdbErrorCode14800015.db", "attachDB");
        expect().assertFail();
      } catch(e) {
        e = e as BusinessError;
        console.log("testRdbStoreAttach0008 err: failed, err: code=" + e.code + " message=" + e.message);
        expect(14800015).assertEqual(e.code);
      }
      done();
      console.log(TAG + "************* testRdbAttach14800015_001 end *************");
    })

  })

}