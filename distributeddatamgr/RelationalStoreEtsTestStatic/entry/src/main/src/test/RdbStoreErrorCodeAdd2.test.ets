import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common'
import { fileIo as fs } from '@kit.CoreFileKit';
import contextConstant from '@ohos.app.ability.contextConstant';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let rdbStore:relationalStore.RdbStore;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let context:common.UIAbilityContext;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 real," + "data4 blob)";

const CREATE_ASSERT_TABLE_TEST = "CREATE TABLE IF NOT EXISTS asset_table (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 asset," + "data2 assets)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbQuery.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

const asset1 : relationalStore.Asset = {
  name: "name1",
  uri: "uri1",
  createTime: "createTime1",
  modifyTime: "modifyTime1",
  size: "size1",
  path: "path1",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2 : relationalStore.Asset = {
  name: "name2",
  uri: "uri2",
  createTime: "createTime2",
  modifyTime: "modifyTime2",
  size: "size2",
  path: "path2",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}

async function checkResultSetForNormalGet(resultSet : relationalStore.LiteResultSet){
  try {
    resultSet.goToNextRow();

    let index = resultSet.getColumnIndex("id");
    expect(index).assertEqual(0);
    let id : long = resultSet.getLong(index);
    expect(id).assertEqual(1);
    index = resultSet.getColumnIndex("data1");
    let data1 = resultSet.getString(index);
    expect(data1).assertEqual('zhangsan');
    index = resultSet.getColumnIndex("data2");
    let data2 = resultSet.getLong(index);
    expect(data2).assertEqual(18);
    index = resultSet.getColumnIndex("data3");
    let data3 = resultSet.getDouble(index);
    expect(data3).assertEqual(25000.0);
    index = resultSet.getColumnIndex("data4");
    let data4 = resultSet.getBlob(index);
    expect(data4[0]).assertEqual(1);
    expect(data4[1]).assertEqual(2);
    expect(data4[2]).assertEqual(3);

    resultSet.goToNextRow();

    index = resultSet.getColumnIndex("id");
    expect(index).assertEqual(0);
    id  = resultSet.getLong(index);
    expect(id).assertEqual(2);
    index = resultSet.getColumnIndex("data1");
    data1 = resultSet.getString(index);
    expect(data1).assertEqual('lisi');
    index = resultSet.getColumnIndex("data2");
    data2 = resultSet.getLong(index);
    expect(data2).assertEqual(20);
    index = resultSet.getColumnIndex("data3");
    data3 = resultSet.getDouble(index);
    expect(data3).assertEqual(20000.0);
    index = resultSet.getColumnIndex("data4");
    data4 = resultSet.getBlob(index);
    expect(data4[0]).assertEqual(1);
    expect(data4[1]).assertEqual(2);
    expect(data4[2]).assertEqual(3);
    resultSet?.close();
  } catch(e:BusinessError) {
    hilog.error(domain, tag, '%{public}s','checkResultSetForNormalGet failed, code is' + e.code + e.message);

    console.error(`checkResultSetForNormalGet failed message:'%{public}s', code:'%{public}d',`);
    expect().assertFail();
  }
}

export default function RdbStoreErrorCodeAdd2Test() {

  describe("RdbStoreErrorCodeAdd2Test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.helloworld")
      await Utils.msSleep(10000)
      context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      try {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        hilog.info(domain, tag, '%{public}s', 'contextDir' + context.databaseDir);

        expect(rdbStore != undefined).assertTrue();
        if (rdbStore != undefined) {
          await rdbStore.execute(CREATE_TABLE_TEST)
          await rdbStore.execute(CREATE_ASSERT_TABLE_TEST);
          let u8 = new Uint8Array([1, 2, 3])
          const valueBucket: relationalStore.ValuesBucket = {
            'data1': 'zhangsan',
            'data2': 18 as long,
            'data3': 25000.0,
            'data4': u8,
          };
          const valueBucket1: relationalStore.ValuesBucket = {
            'data1': 'lisi',
            'data2': 20 as long,
            'data3': 20000.0,
            'data4': u8,
          };
          const assets1 = [asset1];
          const assets2 = [asset1, asset2];
          const valueBucket2: relationalStore.ValuesBucket = {
            'data1': asset1,
            'data2': assets1
          };
          const valueBucket3: relationalStore.ValuesBucket = {
            'data1': asset2,
            'data2': assets2
          };
          await rdbStore.insert('test', valueBucket);
          await rdbStore.insert('test', valueBucket1);
          await rdbStore.insert('asset_table', valueBucket2);
          await rdbStore.insert('asset_table', valueBucket3);
        }
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', 'beforeEach failed');
        expect().assertFail();
      }
    })
    beforeEach(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach');
    })
    afterEach(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterEach');
    })
    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterAll');
      try {
        rdbStore?.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch(error) {
        hilog.info(domain, tag, '%{public}s', 'afterAll failed');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   RelationalStore_ErrCodeAdd2Test_normal_columns_0001
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0001
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* RelationalStore_ErrCodeAdd2Test_normal_columns_0001 start *************");
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0001 failed, code is' + e.code + e.message);
        expect().assertFail();
      }

      try {
        resultSet = await rdbStore.queryWithoutRowCount(predicates, ["data1"]);
        resultSet.goToNextRow();
        let data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        expect(data1).assertEqual('zhangsan');
        resultSet?.close();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0001 failed, code is' + e.code + e.message);
        expect().assertFail();
      }
      hilog.error(domain, tag, '%{public}s',"************* RelationalStore_ErrCodeAdd2Test_normal_columns_0001 end *************");
    })

    /**
     * @tc.name   RelationalStore_ErrCodeAdd2Test_normal_columns_0002
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0002
     * @tc.desc 1.Set columns to [].
     *          2.Set columns to [""].
     *          3.Set columns to ["", "data1"].
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates, []);
        }
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0002 failed, code is' + e.code + e.message);
        expect().assertFail();
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates, [""]);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let data1 = resultSet.getString(0);
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0002 failed, code is' + e.code + e.message);
        expect(e.code === 14800021).assertTrue();
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates, ["", "data1"]);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
          expect(data1).assertEqual('zhangsan');
          resultSet.close();
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0002 failed, code is' + e.code + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   RelationalStore_ErrCodeAdd2Test_normal_columns_0003
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0003
     * @tc.desc   Query when the store is closed
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      try {
        if (rdbStore) {
          await rdbStore.close();
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0003 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800014).assertTrue();
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0004
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0004
     * @tc.desc 1.The optional parameters bindArgs are not transferred.
     *          2.Set bindArgs to [""], sql is select * from test where data2 = 20
     *          3.Set bindArgs to [18], sql is select * from test where data2 = ?
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      const sql = "select * from test";
      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount(sql);
        }
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
          resultSet.close();
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0004 failed, code is' + e.code + e.message);
        expect().assertFail();
      }

      const sql1 = "select * from test where data2 = 20";
      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount(sql1, []);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
          expect("lisi").assertEqual(data1);
          resultSet.close();
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0004 failed, code is' + e.code + e.message);
        expect().assertFail();
      }

      const sql2 = "select * from test where data2 = ?";
      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount(sql2, [18 as long]);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
          expect(18).assertEqual(data2);
          resultSet.close();
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0004 failed, code is' + e.code + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0005
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0005
     * @tc.desc 1.sql is select * from test where data2 = ?
     *          2.Set bindArgs to [null]
     *          3.Set bindArgs to [undefined]
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      const valueBucket: relationalStore.ValuesBucket = {
        'data1': "wangwu",
        'data2': null,
      };

      const sql = "select * from test where data2 = ?";
      try {
        if (rdbStore) {
          await rdbStore.insert('test', valueBucket);
          resultSet = await rdbStore.querySqlWithoutRowCount(sql, []);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
        }
        expect().assertFail();
      } catch (e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0005 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue();
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("");
          expect().assertFail();
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0005 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0006
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0006
     * @tc.desc Query when the store is closed
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      const sql = "select * from test";
      try {
        if (rdbStore) {
          await rdbStore.close();
          resultSet = await rdbStore.querySqlWithoutRowCount(sql);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0006 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800014).assertTrue();
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0007
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0007
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.goToNextRow();
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0007 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.goToNextRow();
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0007 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.goToNextRow();
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0007 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0007 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800021).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0008
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0008
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      const STORE_CONFIG1: relationalStore.StoreConfig = {
        name: "rdbQuery1.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      let rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      let resultSet : relationalStore.LiteResultSet;
      try {
        let predicates = new relationalStore.RdbPredicates('test');
        if (rdbStore1) {
          await rdbStore1.execute(CREATE_TABLE_TEST)
        }
        fs.unlinkSync("/data/storage/el2/database/entry/rdb/rdbQuery1.db");
        if (rdbStore1) {
          resultSet = await rdbStore1.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0008 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        if (rdbStore1) {
          await rdbStore1.close();
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        expect(e.code === 14800028).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0009
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0009
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnIndex("");
        }
        expect().assertFail();
      } catch (e:BusinessError){
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0009-1 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.getColumnIndex("data1");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0009-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnIndex("data5");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0009-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getColumnIndex("data1")
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0009-4 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.getColumnIndex("data1")
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0009-5 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnIndex("data1");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_00096 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800021).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0010
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0010
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      const STORE_CONFIG1: relationalStore.StoreConfig = {
        name: "rdbQuery1.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      let rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      let resultSet : relationalStore.LiteResultSet;
      try {
        let predicates = new relationalStore.RdbPredicates('test');
        if (rdbStore1) {
          await rdbStore1.execute(CREATE_TABLE_TEST)
        }
        fs.unlinkSync("/data/storage/el2/database/entry/rdb/rdbQuery1.db");
        if (rdbStore1) {
          resultSet = await rdbStore1.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnIndex("data1");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0010 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        if (rdbStore1) {
          await rdbStore1.close();
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        expect(e.code === 14800028).assertTrue()
      }
    })


    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0011
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0011
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.getColumnName(1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0011 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }


      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnName(-1 as int);
        }
        expect().assertFail();
      } catch (e:BusinessError){
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0011-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnName(5);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0011-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getColumnName(1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0011-4 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.getColumnName(1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0011-5 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnName(1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0011-6 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800021).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0012
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0012
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      const STORE_CONFIG1: relationalStore.StoreConfig = {
        name: "rdbQuery1.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      let rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      let resultSet : relationalStore.LiteResultSet;
      try {
        let predicates = new relationalStore.RdbPredicates('test');
        if (rdbStore1) {
          await rdbStore1.execute(CREATE_TABLE_TEST)
        }
        fs.unlinkSync("/data/storage/el2/database/entry/rdb/rdbQuery1.db");
        if (rdbStore1) {
          resultSet = await rdbStore1.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnName(1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0012 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        if (rdbStore1) {
          await rdbStore1.close();
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        expect(e.code === 14800028).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0013
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0013
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let rows = await resultSet.getRows(2 as int);
          for (let i = 0; i < rows.length; i++) {
            if (i == 0) {
              let valueBucket_ret = rows[i] as relationalStore.ValuesBucket;
              expect(1 as int).assertEqual(valueBucket_ret["id"]);
              expect('zhangsan').assertEqual(valueBucket_ret["data1"]);
              expect(18 as int).assertEqual(valueBucket_ret["data2"]);
              expect(25000.0 as double).assertEqual(valueBucket_ret["data3"]);
            }
            if (i == 1) {
              let valueBucket_ret = rows[i] as relationalStore.ValuesBucket;
              expect(2 as int).assertEqual(valueBucket_ret["id"]);
              expect('lisi').assertEqual(valueBucket_ret["data1"]);
              expect(20 as int).assertEqual(valueBucket_ret["data2"]);
              expect(20000.0 as double).assertEqual(valueBucket_ret["data3"]);
            }
          }
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0013 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }

    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0014
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0014
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          await resultSet.getRows(2 as int);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0014 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getRows(-1 as int);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0014-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getRows(2  as int, -1 as int);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0014-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getRows(2  as int, 3 as int);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0014-4 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          await resultSet.getRows(2 as int);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0014-5 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          await resultSet.getRows(2 as int);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0014-6 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getRows(2 as int);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0014-7 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800021).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0015
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0015
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.getRow();
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0015 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getRow();
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0015-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getRow();
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0015-3 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.getRow();
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0015-4 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getRow();
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0015-5 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800021).assertTrue()
      }
    })


    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0016
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0016
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let valueBucket_ret = resultSet.getRow();
          if (valueBucket_ret) {
            expect(1 as int).assertEqual(valueBucket_ret["id"]);
            expect('zhangsan').assertEqual(valueBucket_ret["data1"]);
            expect(18 as int).assertEqual(valueBucket_ret["data2"]);
            expect(25000.0 as double).assertEqual(valueBucket_ret["data3"]);
          }
          resultSet.close();
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0016 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }

    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0017
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0017
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.isColumnNull(0);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0017-1 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.isColumnNull(0);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0017-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.isColumnNull(-1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0017-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.isColumnNull(5);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0017-4 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.isColumnNull(0);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0017-5 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.isColumnNull(0);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0017-6 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.isColumnNull(0);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0017-7 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800021).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0018
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0018
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getLong(0);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0018-1 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getLong(-1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0018-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getLong(5);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0018-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getLong(0);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0018-4 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0019
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0019
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getString(1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0019 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getString(-1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0019-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getString(5);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0019-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getString(1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0019-4 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0020
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0020
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getDouble(3);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0020-1 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getDouble(-1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0020-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {

          resultSet.goToNextRow();
          resultSet.getDouble(5);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0020-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getDouble(3);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0020-4 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0021
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0021
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getBlob(4);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0021-1 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getBlob(-1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0021-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getBlob(5);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0021-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getBlob(4);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0021-4 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0022
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0022
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getValue(0);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0022-1 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getValue(-1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0022-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getValue(5);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0022-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getValue(0);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0022-4 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0023
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0023
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getBlob(4);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0023-1, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getBlob(-1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0023-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getBlob(5);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0023-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getBlob(4);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0023-4 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0024
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0024
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          let id = resultSet.getValue(0);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0024 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getValue(-1);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0024-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getValue(5);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0024-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getValue(0);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0024-4 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0025
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0025
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let type = await resultSet.getColumnType(resultSet.getColumnIndex("id"))
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = await resultSet.getColumnType(resultSet.getColumnIndex("data1"));
          expect(type).assertEqual(relationalStore.ColumnType.TEXT);
          type = await resultSet.getColumnType(resultSet.getColumnIndex("data2"));
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = await resultSet.getColumnType(resultSet.getColumnIndex("data3"));
          expect(type).assertEqual(relationalStore.ColumnType.REAL);
          type = await resultSet.getColumnType(resultSet.getColumnIndex("data4"));
          expect(type).assertEqual(relationalStore.ColumnType.BLOB);

          type = await resultSet.getColumnType("id")
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = await resultSet.getColumnType("data1");
          expect(type).assertEqual(relationalStore.ColumnType.TEXT);
          type = await resultSet.getColumnType("data2");
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = await resultSet.getColumnType("data3");
          expect(type).assertEqual(relationalStore.ColumnType.REAL);
          type = await resultSet.getColumnType("data4");
          expect(type).assertEqual(relationalStore.ColumnType.BLOB);
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0025 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0026
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0026
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
          const valueBucket: relationalStore.ValuesBucket = {
            'data1': null,
            'data2': null,
            'data3': null,
            'data4': null,
          };
          await rdbStore.insert('test', valueBucket);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.goToNextRow();
          resultSet.goToNextRow();
          let type = await resultSet.getColumnType("id")
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = await resultSet.getColumnType("data2");
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          type = await resultSet.getColumnType("data3");
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
          type = await resultSet.getColumnType("data4");
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0026 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0027
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0027
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          await resultSet.getColumnType("id")
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0027 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          await resultSet.getColumnType(-1 as int);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0027-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          await resultSet.getColumnType("");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0027-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getColumnType("id")
        }
        expect().assertFail();
      } catch (e:BusinessError){
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0027-4 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getColumnType(0)
        }
        expect().assertFail();
      } catch (e:BusinessError){
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0027-5 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          await resultSet.getColumnType(5);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0027-6 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          await resultSet.getColumnType("id");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0027-7 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          await resultSet.getColumnType("id");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0027-8 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          await resultSet.getColumnType("id");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0027-9 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800021).assertTrue()
      }
    })


    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0028
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0028
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          let type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("id"))
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data1"));
          expect(type).assertEqual(relationalStore.ColumnType.TEXT);
          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data2"));
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data3"));
          expect(type).assertEqual(relationalStore.ColumnType.REAL);
          type = resultSet.getColumnTypeSync(resultSet.getColumnIndex("data4"));
          expect(type).assertEqual(relationalStore.ColumnType.BLOB);

          type = resultSet.getColumnTypeSync("id")
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = resultSet.getColumnTypeSync("data1");
          expect(type).assertEqual(relationalStore.ColumnType.TEXT);
          type = resultSet.getColumnTypeSync("data2");
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = resultSet.getColumnTypeSync("data3");
          expect(type).assertEqual(relationalStore.ColumnType.REAL);
          type = resultSet.getColumnTypeSync("data4");
          expect(type).assertEqual(relationalStore.ColumnType.BLOB);
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0028 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }
    })

    /**
     * @tc.name RelationalStore_ErrCodeAdd2Test_normal_columns_0029
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0029
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
          const valueBucket: relationalStore.ValuesBucket = {
            'data1': null,
            'data2': null,
            'data3': null,
            'data4': null,
          };
          await rdbStore.insert('test', valueBucket);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.goToNextRow();
          resultSet.goToNextRow();
          let type = resultSet.getColumnTypeSync("id")
          expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
          type = resultSet.getColumnTypeSync("data4");
          expect(type).assertEqual(relationalStore.ColumnType.NULL);
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0029 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect().assertFail();
      }
    })

    /**
     * @tc.name   RelationalStore_ErrCodeAdd2Test_normal_columns_0030
     * @tc.number SUB_DistributedData_RelationalStore_ErrCodeAdd2Test_0030
     * @tc.desc 1.The SQL statement for query is too short，return 14800001
     *          2.resultSet is closed, return 14800014
     *          3.Enter the inserted SQL statement through the query interface, return 14800019
     *          4.The query statement is incorrect, return 14800021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RelationalStore_ErrCodeAdd2Test_normal_columns_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      let resultSet : relationalStore.LiteResultSet;
      let predicates = new relationalStore.RdbPredicates('test');

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("se");
        }
        if (resultSet) {
          resultSet.getColumnTypeSync("id")
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0030 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getColumnTypeSync(-1 as int);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0030-2 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getColumnTypeSync("");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0030-3 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800001).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnTypeSync("id")
        }
        expect().assertFail();
      } catch (e:BusinessError){
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0030-4 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnTypeSync(0)
        }
        expect().assertFail();
      } catch (e:BusinessError){
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0030-5 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800012).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.goToNextRow();
          resultSet.getColumnTypeSync(5);
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0030-6 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800013).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.close();
          resultSet.getColumnTypeSync("id");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0030-7 failed, code is' + e.code + e.message);
        expect(e.code === 14800014).assertTrue()
      }

      try {
        if (rdbStore) {
          resultSet = await rdbStore.querySqlWithoutRowCount("insert into test (data1) values ('wangwu')");
        }
        if (resultSet) {
          resultSet.getColumnTypeSync("id");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0030-8 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800019).assertTrue()
      }

      try {
        if (rdbStore) {
          let predicates = new relationalStore.RdbPredicates('test1');
          resultSet = await rdbStore.queryWithoutRowCount(predicates);
        }
        if (resultSet) {
          resultSet.getColumnTypeSync("id");
        }
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s','RelationalStore_ErrCodeAdd2Test_normal_columns_0030-9 failed, code is' + e.code + e.message);
        if (resultSet) {
          resultSet.close();
        }
        expect(e.code === 14800021).assertTrue()
      }
    })
  })

}
