import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let context:common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let dataBaseDir : String;
let domain: int  = 0x00fe;
const TAG = "[RdbErrorCode14800016]"

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test2 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG :data_relationalStore.StoreConfig = {
  name: "test9.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

let STORE_CONFIG1 :data_relationalStore.StoreConfig = {
  name: "test10.db",
  securityLevel: data_relationalStore.SecurityLevel.S1
}

let rdbStore : data_relationalStore.RdbStore
let rdbStore1 : data_relationalStore.RdbStore

export async function attachBatchInsert(store: data_relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: data_relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": 18 as long,
    "salary": 100.5,
    "blobType": u8,
  };
  let valueBucketArray = new Array<data_relationalStore.ValuesBucket>();
  for (let i = 0; i < 10; i++) {
    valueBucketArray.push(valueBucket);
  }
  await store.batchInsert(tableName, valueBucketArray);
}

export default function RdbErrorCode14800016() {

  describe("RdbErrorCode14800016", (): void => {
    beforeAll(async () : Promise<void> => {
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.execute(CREATE_TABLE_TEST1);
      await rdbStore.close();
    });

    afterAll(async () : Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1);
    })

    /**
     * @tc.name   testRdbStoreAttach0009
     * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0090
     * @tc.desc   repeat attach using the same alias
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreAttach0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.log(TAG + "************* testRdbStoreAttach0009 start *************");
      let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      try{
        await store.execute(CREATE_TABLE_TEST);
        await attachBatchInsert(store, "test1");
      } catch(e: BusinessError){
        console.log("testRdbStoreAttach0009: execute failed1, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
      }
      try {
        let num = await store.attach(context, STORE_CONFIG1, 'attachDB');
        expect(1).assertEqual(num);
      } catch(e: BusinessError) {
        console.log("testRdbStoreAttach0009: attachOne failed1, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
      }
      try {
        await store.attach(context, STORE_CONFIG1, 'attachDB');
        expect().assertFail();
      } catch(e: BusinessError) {
        console.log("testRdbStoreAttach0009: attachTne  failed2, err: code=" + e.code + " message=" + e.message);
        expect(14800016).assertEqual(e.code);
      }
      expect(0).assertEqual(await store.detach("attachDB"));
      data_relationalStore.deleteRdbStore(context, STORE_CONFIG1);
      console.log(TAG + "************* testRdbStoreAttach0009 end *************");
      done();
    })

  })

}