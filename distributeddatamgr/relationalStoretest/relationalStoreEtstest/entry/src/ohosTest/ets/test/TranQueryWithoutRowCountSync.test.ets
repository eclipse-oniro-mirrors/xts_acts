/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import  relationalStore  from '@ohos.data.relationalStore';

const TAG = "[RELATIONAL_STORE_TEST]";
let rdbStore:relationalStore.RdbStore | undefined = undefined;
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 real," + "data4 blob)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "transQuery.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

async function checkResultSetForNormalGet(resultSet : relationalStore.LiteResultSet){

  try {
    resultSet?.goToNextRow();
    let index = resultSet.getColumnIndex("id");
    expect(index).assertEqual(0);
    let id = resultSet.getLong(index);
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
    id = resultSet?.getLong(index);
    expect(id).assertEqual(2);
    index = resultSet.getColumnIndex("data1");
    data1 = resultSet?.getString(index);
    expect(data1).assertEqual('lisi');
    index = resultSet.getColumnIndex("data2");
    data2 = resultSet?.getLong(index);
    expect(data2).assertEqual(20);
    index = resultSet.getColumnIndex("data3");
    data3 = resultSet?.getDouble(index);
    expect(data3).assertEqual(20000.0);
    index = resultSet.getColumnIndex("data4");
    data4 = resultSet?.getBlob(index);
    expect(data4[0]).assertEqual(1);
    expect(data4[1]).assertEqual(2);
    expect(data4[2]).assertEqual(3);
    resultSet?.close();
  } catch(e) {
    console.error(`checkResultSetForNormalGet failed message:${e.message} code:${e.code}`);
    expect().assertFail();
  }
}

export default function transQueryWithoutRowCountSync() {
  describe('transQueryWithoutRowCountSync', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
      try {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        expect(rdbStore != undefined).assertTrue();
        await rdbStore?.executeSql(CREATE_TABLE_TEST);
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: relationalStore.ValuesBucket = {
          'data1': 'zhangsan',
          'data2': 18,
          'data3': 25000.0,
          'data4': u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          'data1': 'lisi',
          'data2': 20,
          'data3': 20000.0,
          'data4': u8,
        };
        await rdbStore?.insert('test', valueBucket);
        await rdbStore?.insert('test', valueBucket1);
      } catch(error) {
        console.error(TAG + 'beforeEach failed');
        expect().assertFail();
      }
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      try {
        rdbStore?.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch(error) {
        console.error(TAG + 'afterAll failed');
        expect().assertFail();
      }
    })

    /**
     * @tc.name     tranqueryWithoutRowCountSync_001
     * @tc.number   SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_2000
     * @tc.desc     1.The optional parameters columns are not transferred.
     *              2.Set columns to ["data1"].
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('tranqueryWithoutRowCountSync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranqueryWithoutRowCountSync_001 start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbTrans?.queryWithoutRowCountSync(predicates);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
        await rdbTrans?.commit();
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_001 failed message:${e.message} code:${e.code}`);
        await rdbTrans?.rollback();
        expect().assertFail();
      }

      rdbTrans = await rdbStore?.createTransaction();
      try {
        resultSet = await rdbTrans?.queryWithoutRowCountSync(predicates, ["data1"]);
        resultSet?.goToNextRow();
        let data1 = resultSet?.getString(resultSet.getColumnIndex("data1"));
        expect(data1).assertEqual('zhangsan');
        resultSet?.close();
        await rdbTrans?.commit();
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_001 failed message:${e.message} code:${e.code}`);
        await rdbTrans?.rollback();
        expect().assertFail();
      }
      console.log(TAG + "************* tranqueryWithoutRowCountSync_001 end *************");
    })

    /**
     * @tc.name     tranqueryWithoutRowCountSync_002
     * @tc.number   SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_2001
     * @tc.desc     1.Set columns to null
     *              2.Set columns to undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('tranqueryWithoutRowCountSync_002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranqueryWithoutRowCountSync_002 start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbTrans?.queryWithoutRowCountSync(predicates, null);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet)
        }
        await rdbTrans?.commit();
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_002 failed message:${e.message} code:${e.code}`);
        await rdbTrans?.rollback();
        expect().assertFail();
      }

      rdbTrans = await rdbStore?.createTransaction();
      try {
        resultSet = await rdbTrans?.queryWithoutRowCountSync(predicates, undefined);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet)
        }
        await rdbTrans?.commit();
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_002 failed message:${e.message} code:${e.code}`);
        await rdbTrans?.rollback();
        expect().assertFail();
      }
      console.log(TAG + "************* tranqueryWithoutRowCountSync_002 end *************");
    })

    /**
     * @tc.name     tranqueryWithoutRowCountSync_003
     * @tc.number   SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_2002
     * @tc.desc     1.Set columns to [null]
     *              2.Set columns to [undefined]
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('tranqueryWithoutRowCountSync_003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranqueryWithoutRowCountSync_003 start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbTrans?.queryWithoutRowCountSync(predicates, [null]);
        expect().assertFail();
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_003 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        await rdbTrans?.rollback();
        expect(e.code == 401).assertTrue();
      }

      rdbTrans = await rdbStore?.createTransaction();
      try {
        resultSet = await rdbTrans?.queryWithoutRowCountSync(predicates, [undefined]);
        expect().assertFail();
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_003 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        await rdbTrans?.rollback();
        expect(e.code == 401).assertTrue();
      }
      console.log(TAG + "************* tranqueryWithoutRowCountSync_003 end *************");
    })

    /**
     * @tc.name    tranqueryWithoutRowCountSync_004
     * @tc.number  SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_2003
     * @tc.desc    1.Set columns to [].
     *             2.Set columns to [""].
     *             3.Set columns to ["", "data1"].
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('tranqueryWithoutRowCountSync_004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranqueryWithoutRowCountSync_004 start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbTrans?.queryWithoutRowCountSync(predicates, []);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
        await rdbTrans?.commit();
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_004 failed message:${e.message} code:${e.code}`);
        await rdbTrans?.rollback();
        expect().assertFail();
      }

      rdbTrans = await rdbStore?.createTransaction();
      try {
        resultSet = await rdbTrans?.queryWithoutRowCountSync(predicates, [""]);
        resultSet?.goToNextRow();
        let data1 = resultSet?.getString(0);
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_004 failed message:${e.message} code:${e.code}`);
        await rdbTrans?.rollback();
        expect(e.code == 14800021).assertTrue();
      }

      rdbTrans = await rdbStore?.createTransaction();
      try {
        resultSet = await rdbTrans?.queryWithoutRowCountSync(predicates, ["", "data1"]);
        resultSet?.goToNextRow();
        let data1 = resultSet?.getString(resultSet.getColumnIndex("data1"));
        expect(data1).assertEqual('zhangsan');
        resultSet?.close();
        await rdbTrans?.commit();
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_004 failed message:${e.message} code:${e.code}`);
        await rdbTrans?.rollback();
        expect().assertFail();
      }
      console.log(TAG + "************* tranqueryWithoutRowCountSync_004 end *************");
    })

    /**
     * @tc.name    tranqueryWithoutRowCountSync_005
     * @tc.number  SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_2004
     * @tc.desc    1.Set RdbPredicates to [null]
     *             2.Set RdbPredicates to [undefined]
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('tranqueryWithoutRowCountSync_005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranqueryWithoutRowCountSync_005 start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;
      try {
        resultSet = await rdbTrans?.queryWithoutRowCountSync(undefined);
        expect().assertFail();
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_005 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        await rdbTrans?.rollback();
        expect(e.code == 401).assertTrue();
      }

      rdbTrans = await rdbStore?.createTransaction();
      try {
        resultSet = await rdbTrans?.queryWithoutRowCountSync(null);
        expect().assertFail();
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_005 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        await rdbTrans?.rollback();
        expect(e.code == 401).assertTrue();
      }
      console.log(TAG + "************* tranqueryWithoutRowCountSync_005 end *************");
    })

    /**
     * @tc.name   tranqueryWithoutRowCountSync_006
     * @tc.number SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_2005
     * @tc.desc   Query when the store is closed
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('tranqueryWithoutRowCountSync_006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranqueryWithoutRowCountSync_006 start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;
      try {
        await rdbStore?.close();
        let predicates = new relationalStore.RdbPredicates('test');
        resultSet = await rdbTrans?.queryWithoutRowCountSync(predicates);
        expect().assertFail();
      } catch(e) {
        console.error(`tranqueryWithoutRowCountSync_006 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        expect(e.code == 14800014).assertTrue();
      }
      console.log(TAG + "************* tranqueryWithoutRowCountSync_006 end *************");
    })

    /**
     * @tc.name    tranquerySqlWithoutRowCountSync_001
     * @tc.number  SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_2006
     * @tc.desc    1.The optional parameters bindArgs are not transferred.
     *             2.Set bindArgs to [""], sql is select * from test where data2 = 20
     *             3.Set bindArgs to [18], sql is select * from test where data2 = ?
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('tranquerySqlWithoutRowCountSync_001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_001 start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;
      const sql = "select * from test";
      try {
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync(sql);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
        resultSet?.close();
        await rdbTrans?.commit();
      } catch(e) {
        console.error(`tranquerySqlWithoutRowCountSync_001 failed message:${e.message} code:${e.code}`);
        await rdbTrans?.rollback();
        expect().assertFail();
      }

      rdbTrans = await rdbStore?.createTransaction();
      const sql1 = "select * from test where data2 = 20";
      try {
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync(sql1, []);
        resultSet?.goToNextRow();
        let data1 = resultSet?.getString(resultSet?.getColumnIndex("data1"));
        expect("lisi").assertEqual(data1);
        resultSet?.close();
        await rdbTrans?.commit();
      } catch(e) {
        console.error(`tranquerySqlWithoutRowCountSync_001 failed message:${e.message} code:${e.code}`);
        await rdbTrans?.rollback();
        expect().assertFail();
      }

      rdbTrans = await rdbStore?.createTransaction();
      const sql2 = "select * from test where data2 = ?";
      try {
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync(sql2, [18]);
        resultSet?.goToNextRow();
        let data2 = resultSet?.getLong(resultSet.getColumnIndex("data2"));
        expect(18).assertEqual(data2);
        resultSet?.close();
        await rdbTrans?.commit();
      } catch(e) {
        console.error(`tranquerySqlWithoutRowCountSync_001 failed message:${e.message} code:${e.code}`);
        await rdbTrans?.rollback();
        expect().assertFail();
      }
      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_001 end *************");
    })

    /**
     * @tc.name    tranquerySqlWithoutRowCountSync_002
     * @tc.number  SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_2007
     * @tc.desc    1.sql is select * from test where data2 = ?
     *             2.Set bindArgs to [null]
     *             3.Set bindArgs to [undefined]
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('tranquerySqlWithoutRowCountSync_002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_002 start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;
      const valueBucket: relationalStore.ValuesBucket = {
        'data1': "wangwu",
        'data2': null,
      };
      await rdbStore?.insert('test', valueBucket);

      const sql = "select * from test where data2 = ?";
      try {
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync(sql, [null]);
        resultSet?.goToNextRow();
        let data2 = resultSet?.getLong(resultSet.getColumnIndex("data2"));
        expect().assertFail();
      } catch (e) {
        console.error(`tranquerySqlWithoutRowCountSync_002 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        await rdbTrans?.rollback();
        expect(e.code == 14800012).assertTrue();
      }

      rdbTrans = await rdbStore?.createTransaction();
      try {
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync(sql, [undefined]);
        expect().assertFail();
      } catch (e) {
        console.error(`tranquerySqlWithoutRowCountSync_002 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        await rdbTrans?.rollback();
        expect(e.code == 401).assertTrue();
      }

      rdbTrans = await rdbStore?.createTransaction();
      try {
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync(sql, []);
        resultSet?.goToNextRow();
        let data2 = resultSet?.getLong(resultSet.getColumnIndex("data2"));
        expect().assertFail();
      } catch (e) {
        console.error(`tranquerySqlWithoutRowCountSync_002 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        await rdbTrans?.rollback();
        expect(e.code == 14800012).assertTrue();
      }

      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_002 end *************");
    })

    /**
     * @tc.name    tranquerySqlWithoutRowCountSync_003
     * @tc.number  SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_2008
     * @tc.desc    1.sql is undefined
     *             2.sql is null
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('tranquerySqlWithoutRowCountSync_003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_003_Abnormal_sql start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;
      try {
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync(undefined);
        expect().assertFail();
      } catch(e) {
        console.error(`tranquerySqlWithoutRowCountSync_003 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        await rdbTrans?.rollback();
        expect(e.code == 401).assertTrue()
      }

      rdbTrans = await rdbStore?.createTransaction();
      try {
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync(null);
        expect().assertFail();
      } catch(e) {
        console.error(`tranquerySqlWithoutRowCountSync_003 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        await rdbTrans?.rollback();
        expect(e.code == 401).assertTrue()
      }

      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_003 end *************");
    })

    /**
     * @tc.name    tranquerySqlWithoutRowCountSync_004
     * @tc.number  SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_2009
     * @tc.desc    Query when the store is closed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('tranquerySqlWithoutRowCountSync_004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_004 start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;
      const sql = "select * from test";
      try {
        await rdbStore?.close();
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync(sql);
        expect().assertFail();
      } catch(e) {
        console.error(`tranquerySqlWithoutRowCountSync_004 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        expect(e.code == 14800014).assertTrue();
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG)
      }
      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_004 end *************");
    })

    /**
     * @tc.name     tranquerySqlWithoutRowCountSync_005
     * @tc.number   SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_2010
     * @tc.desc     1.sql is select * from test where data2 = ?
     *              2.Set bindArgs to null
     *              3.Set bindArgs to undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('tranquerySqlWithoutRowCountSync_005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_005 start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;
      const valueBucket: relationalStore.ValuesBucket = {
        'data1': "wangwu",
        'data2': null,
      };
      await rdbStore?.insert('test', valueBucket);

      const sql = "select * from test where data2 = ?";
      try {
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync(sql, null);
        resultSet?.goToNextRow();
        let data2 = resultSet?.getLong(resultSet.getColumnIndex("data2"));
        expect().assertFail();
      } catch (e) {
        console.error(TAG +`tranquerySqlWithoutRowCountSync_005 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        await rdbTrans?.rollback();
        expect(e.code == 14800012).assertTrue();
      }

      rdbTrans = await rdbStore?.createTransaction();
      try {
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync(sql, undefined);
        resultSet?.goToNextRow();
        let data2 = resultSet?.getLong(resultSet.getColumnIndex("data2"));
        expect().assertFail();
      } catch (e) {
        console.error(TAG +`tranquerySqlWithoutRowCountSync_005 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        await rdbTrans?.rollback();
        expect(e.code == 14800012).assertTrue();
      }

      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_005 end *************");
    })

    /**
     * @tc.name     tranquerySqlWithoutRowCountSync_006
     * @tc.number   SUB_DistributedData_RelationalStore_queryWithoutRowCountJsApiTest_02011
     * @tc.desc     sql is ""
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('tranquerySqlWithoutRowCountSync_006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_006 start *************");
      let rdbTrans = await rdbStore?.createTransaction();
      let resultSet : relationalStore.LiteResultSet | undefined = undefined;

      try {
        resultSet = await rdbTrans?.querySqlWithoutRowCountSync("");
        expect().assertFail();
      } catch(e) {
        console.error(`tranquerySqlWithoutRowCountSync_006 failed message:${e.message} code:${e.code}`);
        resultSet?.close();
        expect(e.code == 14800001).assertTrue()
      }
      console.log(TAG + "************* tranquerySqlWithoutRowCountSync_006 end *************");
    })
  })
}