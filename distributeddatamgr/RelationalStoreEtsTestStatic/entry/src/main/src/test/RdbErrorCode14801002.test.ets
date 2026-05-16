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
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TABLE = 'ErrorTestTable';
const TAG = "[RdbErrorCode14801002]"

const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbStore14801002.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let context: common.UIAbilityContext;
let rdbStore: relationalStore.RdbStore;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function RdbErrorCode14801002() {

  describe("RdbErrorCode14801002", (): void => {

    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
    });

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      let u8 = new Uint8Array([3, 4, 5])
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30 as long,
        "salary": 2000.0,
        "data4": u8
      }
      await rdbStore.insert("employee", valueBucket);
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
    })


    /**
     * @tc.name   testRdbAttach14801002_001
     * @tc.number testRdbAttach14801002_001
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbAttach14801002_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbAttach14801002_001 start *************");
      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: "rdbStore14801002.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      const STORE_CONFIG1: relationalStore.StoreConfig = {
        name: "rdbStore148010021.db",
        securityLevel: relationalStore.SecurityLevel.S1,
        dataGroupId: "47589"
      }
      const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await store!.executeSql(CREATE_TABLE_TEST);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18 as long,
        "salary": 100.5,
        "blobType": u8,
      };
      try {
        await store!.insert("test", valueBucket);
      } catch (e) {
        console.error(TAG + `insert failed, code is ${e.code},message is ${e.message}`);
        expect().assertFail()
      }
      try {
        let num = await store.attach(context, STORE_CONFIG1, "attachDB", 2);
        expect(1 as Int).assertEqual(num);
      } catch (e) {
        console.error(TAG + `deleteRdbStore failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14801002);
      }
      done();
      console.info(TAG + "************* testRdbAttach14801002_001 end *************");
    })
  })
}