import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let dataBaseDir: String;
let domain: int = 0x00ff;
const TAG = "[RdbErrorCode14800013]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbErrorCode14800013.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

const DROP_TABLE_TESTTRANS = "DROP TABLE IF EXISTS testTrans";

const TABLE_NAME = "testTrans"
let context: common.UIAbilityContext | undefined;
let rdbStore: relationalStore.RdbStore | undefined;
let vbs: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>(3);
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
const valueBucket2: relationalStore.ValuesBucket = {
  "data1": "hello world",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}
vbs[0] = valueBucket0
vbs[1] = valueBucket1
vbs[2] = valueBucket2

export default function RdbErrorCode14800013() {

  describe("RdbErrorCode14800013", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll begin');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(DROP_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      let num = await rdbStore!.batchInsert("test", vbs);
      hilog.info(domain, TAG, 'batchInsert %{public}d rows.', num);
      console.info(TAG + 'beforeAll end');
    });

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll begin');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      console.info(TAG + 'afterAll end');
    })

    /**
     * @tc.name   RdbGetColumnTypeSync14800013_001
     * @tc.number RdbGetColumnTypeSync14800013_001
     * @tc.desc   getColumnTypeSync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetColumnTypeSync14800013_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* RdbGetColumnTypeSync14800013_001 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore!.insert("test", valueBucket);
        let resultSet: relationalStore.ResultSet;
        resultSet = await rdbStore!.querySql("SELECT * FROM test");
        try {
          let count = resultSet.rowCount;
          expect(true).assertEqual(resultSet?.goToRow(count - 1));
          let columnCount = resultSet.columnCount;
          expect(9).assertEqual(columnCount);
          resultSet?.getColumnTypeSync(columnCount);
          console.error(TAG + "RdbGetColumnTypeSync14800013_001 getColumnType success ");
          expect(true).assertFail();
        } catch (err) {
          console.error(TAG + "RdbGetColumnTypeSync14800013_001 getColumnType failed " + err);
          expect(14800013).assertEqual(err.code);
        }
        resultSet?.close();
        console.log(TAG + "************* RdbGetColumnTypeSync14800013_001 end *************");
        done();
      });

    /**
     * @tc.name   RdbGetColumnType14800013_001
     * @tc.number RdbGetColumnType14800013_001
     * @tc.desc   getColumnType test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetColumnType14800013_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* RdbGetColumnType14800013_001 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "data1": null,
      };
      await rdbStore!.insert("test", valueBucket);
      let resultSet: relationalStore.ResultSet;
      resultSet = await rdbStore!.querySql("SELECT * FROM test");
      try {
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let columnCount = resultSet.columnCount;
        expect(9).assertEqual(columnCount);
        await resultSet.getColumnType(columnCount);
        console.error(TAG + "RdbGetColumnType14800013_001 getColumnType success ");
        expect(true).assertFail();
      } catch (err) {
        console.error(TAG + "RdbGetColumnType14800013_001 getColumnType failed " + err.code + err.message);
        expect(14800013).assertEqual(err.code);
      }
      resultSet?.close();
      console.log(TAG + "************* RdbGetColumnType14800013_001 end *************");
      done();
    });

    /**
     * @tc.name   RdbGetBlob14800013_001
     * @tc.number RdbGetBlob14800013_001
     * @tc.desc   errcode is 14800013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetBlob14800013_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetBlob14800013_001 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data2", "300");
      let resultSet = await rdbStore!.query(predicates);
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount);
      expect(resultSet.rowCount == 1).assertTrue();
      expect(resultSet.goToFirstRow()).assertEqual(true);
      let columnCount = resultSet.columnCount;
      expect(9).assertEqual(columnCount);
      try {
        resultSet.getBlob(columnCount);
        expect(true).assertFail();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message)
        expect(err.code).assertEqual(14800013);
      }
      resultSet.close()
      console.info(TAG + "************* RdbGetBlob14800013_001 end *************");
      done();
    })

    /**
     * @tc.name   RdbGetString14800013_001
     * @tc.number RdbGetString14800013_001
     * @tc.desc   errcode is 14800013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbGetString14800013_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* RdbGetString14800013_001 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data2", "300");
      let resultSet = await rdbStore!.query(predicates);
      console.log(TAG + "resultSet.rowCount" + resultSet.rowCount);
      expect(resultSet.rowCount == 1).assertTrue();
      expect(resultSet.goToFirstRow()).assertEqual(true);
      let columnCount = resultSet.columnCount;
      expect(9).assertEqual(columnCount);
      try {
        resultSet.getString(columnCount);
        expect(true).assertFail();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message)
        expect(err.code).assertEqual(14800013);
      }
      resultSet.close()
      console.info(TAG + "************* RdbGetString14800013_001 end *************");
      done();
    })

  })

}