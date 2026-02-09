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

const TABLE = 'ErrorCodeTestTable';
const TAG = "[RdbErrorCode14800051]"

const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbStore14800051.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
let context: common.UIAbilityContext;
let rdbStore: relationalStore.RdbStore;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function RdbErrorCode14800051() {

  describe("RdbErrorCode14800051", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
    });

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
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

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    /**
     * @tc.name   testRdbSetDistributedTables14800051_001
     * @tc.number testRdbSetDistributedTables14800051_001
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbSetDistributedTables14800051_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* testRdbSetDistributedTables14800051_001 start *************");
      try {
        console.info(TAG + "************* testRdbSetDistributedTables14800051_001 start *************");
        await rdbStore.setDistributedTables(["employee"], relationalStore.DistributedType.DISTRIBUTED_CLOUD)
      } catch (e) {
        console.error(TAG + `setDistributedTables failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800051);
      }
      done();
      console.info(TAG + "************* testRdbSetDistributedTables14800051_001 end *************");
    })
  })
}