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
import relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TABLE = 'ErrorCodeTestTable';
const TAG = "[RdbErrorCode14800050]"
let bigdata = 'a'.repeat(100)
const CREATE_TABLE_TEST = 'CREATE TABLE IF NOT EXISTS test (' + 'id INTEGER PRIMARY KEY AUTOINCREMENT, ' + bigdata
  + ' text,' + '"邮箱：abc#$123@abc.com" long,' + '"@#$%^&*" text,' + '" " text,' + '年龄 long,' + '"null" text,'
  + 'data text,' + 'data1 text,' + 'data2 long, ' + 'data3 double,' + 'data4 blob,' + '"1" INTEGER)';
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: 'rdbStore14800050.db',
  securityLevel: relationalStore.SecurityLevel.S1
};
let context: common.UIAbilityContext;
const COLOUNM_NAMES = ["id", "data1", "data2", "data3", "data4"];
let rdbStore: relationalStore.RdbStore;
let resultSet: relationalStore.ResultSet;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

//插入数据
async function createTest(rdbStore: relationalStore.RdbStore) {
  console.info(TAG + 'createTest data start');
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: relationalStore.ValuesBucket = {
      'data1': 'hello',
      'data2': 10 as long,
      'data3': 1.0,
      'data4': u8,
      '"1"': 123 as long,
      'data': 'data',
      '年龄': 13 as long,
      '" "': 'kong',
      '"@#$%^&*"': 'special',
      '"邮箱：abc#$123@abc.com"': 'abc#$123@abc.com',
      '"null"': 'null'
    };
    await rdbStore.insert('test', valueBucket);
  }
  {
    let u8 = new Uint8Array([3, 4, 5]);
    const valueBucket: relationalStore.ValuesBucket = {
      'data1': '2',
      'data2': -5 as long,
      'data3': 2.5,
      'data4': u8,
    };
    await rdbStore.insert('test', valueBucket);
  }
  {
    let u8 = new Uint8Array(0);
    const valueBucket: relationalStore.ValuesBucket = {
      'data1': 'hello world',
      'data2': 3 as long,
      'data3': 1.8,
      'data4': u8,
    };
    await rdbStore.insert('test', valueBucket);
  }
  console.info(TAG + 'createTest data end');
}

export default function RdbErrorCode14800050() {

  describe("RdbErrorCode14800050", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
    })

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
    })

    afterEach(() => {
      console.info(TAG + 'afterEach');
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    /**
     * @tc.name   testRdbEmit14800050_001
     * @tc.number testRdbEmit14800050_001
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbEmit14800050_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + '************* testRdbEmit14800050_001 start *************');
        let predicates = new relationalStore.RdbPredicates('test');
        let resultSet = await rdbStore.query(predicates);
        let storeObserver = () => {
          console.info(`storeObserver`);
        }
        try {
          rdbStore.emit('storeObserver');
        } catch (e) {
          if (e.code != 801) {
            expect(e.code).assertEqual(14800050);
          }
        }
        resultSet.close();
        done();
        console.info(TAG + '************* testRdbEmit14800050_001 end *************');
      })

    /**
     * @tc.name   testRdbOn14800050_002
     * @tc.number testRdbOn14800050_002
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbOn14800050_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + '************* testRdbOn14800050_002 start *************');
        await createTest(rdbStore);
        let predicates = new relationalStore.RdbPredicates('test');
        let resultSet = await rdbStore.query(predicates);
        let storeObserver = () => {
          console.info(`storeObserver`);
        }
        try {
          rdbStore.on('storeObserver', false, storeObserver);
        } catch (e) {
          if (e.code != 801) {
            expect(e.code).assertEqual(14800050);
          }
        }
        resultSet.close();
        done();
        console.info(TAG + '************* testRdbOn14800050_002 end *************');
      })

    /**
     * @tc.name   testRdbOff14800050_003
     * @tc.number testRdbOff14800050_003
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbOff14800050_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + '************* testRdbOff14800050_003 start *************');
        await createTest(rdbStore);
        let predicates = new relationalStore.RdbPredicates('test');
        let resultSet = await rdbStore.query(predicates);
        let storeObserver = () => {
          console.info(`storeObserver`);
        }
        try {
          rdbStore.on('storeObserver', false, storeObserver);
        } catch (e) {
          if (e.code != 801) {
            expect(e.code).assertEqual(14800050);
          }
        }
        try {
          rdbStore.off('storeObserver', false, storeObserver);
        } catch (e) {
          if (e.code != 801) {
            expect(e.code).assertEqual(14800050);
          }
        }
        resultSet.close();
        done();
        console.info(TAG + '************* testRdbOff14800050_003 end *************');
      })
  })
}