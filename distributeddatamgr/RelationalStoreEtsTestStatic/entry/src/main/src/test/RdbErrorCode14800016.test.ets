import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let context:common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const TAG = "[RdbErrorCode14800016]"

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test2 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG :relationalStore.StoreConfig = {
  name: "RdbErrorCode14800016.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let STORE_CONFIG1 :relationalStore.StoreConfig = {
  name: "myRdbErrorCode14800016.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

let rdbStore : relationalStore.RdbStore | undefined;

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

export default function RdbErrorCode14800016() {

  describe("RdbErrorCode14800016", (): void => {
    beforeAll(async () : Promise<void> => {
      console.info(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      await rdbStore!.close();
    });

    afterAll(async () : Promise<void> => {
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
    })

    /**
     * @tc.name testRdbAttach14800016_001
     * @tc.number testRdbAttach14800016_001
     * @tc.desc testRdbAttach14800016_001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRdbAttach14800016_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.log(TAG + "************* testRdbAttach14800016_001 start *************");
      let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      try{
        await store.execute(CREATE_TABLE_TEST);
        await attachBatchInsert(store, "test1");
      } catch(e){
        console.log("attachBatchInsert failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
      }
      try {
        let num = await store.attach(context!, STORE_CONFIG1, 'attachDB');
        expect(1).assertEqual(num);
      } catch(e) {
        console.log("attachOne failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
      }
      try {
        await store.attach(context!, STORE_CONFIG1, 'attachDB');
        expect().assertFail();
      } catch(e) {
        console.log("attachTwo  failed, err: code=" + e.code + " message=" + e.message);
        expect(14800016).assertEqual(e.code);
      }
      expect(0).assertEqual(await store.detach("attachDB"));
      relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
      console.log(TAG + "************* testRdbAttach14800016_001 end *************");
      done();
    })

  })

}