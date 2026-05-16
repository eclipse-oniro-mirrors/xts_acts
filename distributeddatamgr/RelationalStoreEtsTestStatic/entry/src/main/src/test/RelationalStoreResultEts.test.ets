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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let context:common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int  = 0x0000;
let tag: string = 'testTag';
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG :data_relationalStore.StoreConfig = {
  name: "test.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
const CREATE_TABLE_TESTTRANS = "CREATE TABLE IF NOT EXISTS testTrans (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const DROP_TABLE_TESTTRANS = "DROP TABLE IF EXISTS testTrans";

const TABLE_NAME = "testTrans"

let STORE_CONFIG1 :data_relationalStore.StoreConfig = {
  name: "test1.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  encrypt:false,
}
const CREATE_TABLE_TESTERRCODE = "CREATE TABLE IF NOT EXISTS testerrcode (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 TEXT NOT NULL," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TESTERRCODE = "DROP TABLE IF EXISTS testerrcode";

let STORE_CONFIG2 :data_relationalStore.StoreConfig = {
  name: "test2.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let rdbStore : data_relationalStore.RdbStore
let rdbStore1 : data_relationalStore.RdbStore
let rdbStore2 : data_relationalStore.RdbStore
let vbs :Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(3);
const valueBucket0 :data_relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long,
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket1 :data_relationalStore.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
const valueBucket2 :data_relationalStore.ValuesBucket = {
  "data1": "hello world",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}
vbs[0] = valueBucket0
vbs[1] = valueBucket1
vbs[2] = valueBucket2

let options:data_relationalStore.TransactionOptions = {
  transactionType:data_relationalStore.TransactionType.DEFERRED
}

export default function RdbResultSetTest() {
  describe('RdbResultSetTest', ():void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(2000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      rdbStore2 = await data_relationalStore.getRdbStore(context, STORE_CONFIG2);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.batchInsert("test", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
    });

    /**
     * @tc.name        testGetColumnIndex0001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_0100
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGetColumnIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0001 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      expect(true).assertEqual(resultSet.goToFirstRow())
      expect(true).assertEqual(resultSet.getColumnIndex("data1")==1)
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0001 end *************');
    })

    /**
     * @tc.name        testGetColumnIndex0002
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_0200
     * @tc.desc        getColumnIndex errcode test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGetColumnIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0002 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test1");
      try {
        resultSet.getColumnIndex("data1")
      } catch(err) {
        err = err as BusinessError;
        let e = err as BusinessError
        hilog.info(domain, tag, "business error code %{public}d", e.code)
        expect(true).assertEqual(e.code==14800021)
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0002 end *************');
    })

    /**
     * @tc.name        testGetColumnIndex0003
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_0300
     * @tc.desc        getColumnIndex errcode test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGetColumnIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0003 start *************');
      let resultSet =await rdbStore.querySql("SELECT * FROM test")
      try {
        resultSet.getColumnIndex("dataX")
      } catch(err) {
        err = err as BusinessError;
        let e = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", e.code)
        expect(true).assertEqual(e.code==14800000)
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0003 end *************');
    })
    /**
     * @tc.name        testGetColumnIndex0004
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_0400
     * @tc.desc        getColumnIndex errcode test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGetColumnIndex0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0004 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test")
      try {
        resultSet.getColumnIndex("")
      } catch(err) {
        err = err as BusinessError;
        let e = err as BusinessError
        hilog.info(domain, tag, "business error code %{public}d", e.code)
        expect(true).assertEqual(e.code==14800000)
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0004 end *************');
    })
    /**
     * @tc.name        testGetLong0001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_0500
     * @tc.desc        getLong normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGetLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetLong0001 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test")
      try {
        expect(true).assertEqual(resultSet.goToFirstRow())
        const id = resultSet.getLong(resultSet.getColumnIndex("id"))
        const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"))
        hilog.info(domain, tag, "id=%{public}d, data2=%{public}d", id, data2)
        expect(true).assertEqual(data2==10);
      } catch (e) {
        e = e as BusinessError;
        expect(null).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGetLong0001 end *************');
    })
    /**
     * @tc.name        testGetString0001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_0600
     * @tc.desc        getString normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGetString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetString0001 start *************');
      let resultSet = await  rdbStore.querySql("SELECT * FROM test")
      expect(true).assertEqual(resultSet.goToFirstRow())
      const data1 = resultSet.getString(resultSet.getColumnIndex("data1"))
      expect("hello").assertEqual(data1)
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGetString0001 end *************');
    })
    /**
     * @tc.name        testGetString0002
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_0700
     * @tc.desc        getString normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGetString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetString0002 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test")
      expect(true).assertEqual(resultSet.goToFirstRow())
      const data2 = resultSet.getString(resultSet.getColumnIndex("data2"))
      expect("10").assertEqual(data2);
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGetString0002 end *************');
    })
    /**
     * @tc.name        testRdbTransactionInsert0001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_0800
     * @tc.desc        beginTransaction normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransactionInsert0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRdbTransactionInsert0001 start *************');
      await rdbStore1.execute(CREATE_TABLE_TESTTRANS);
      let vbs :Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(1);
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const rdbTrans = await rdbStore1.createTransaction(options);
        const valueBucket :data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 180 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        vbs[0] = valueBucket
        let num = await rdbTrans.batchInsert(TABLE_NAME, vbs);
        hilog.info(domain, tag, 'Insert %{public}d rows.', num);

        await rdbTrans.commit();
        let predicates = new data_relationalStore.RdbPredicates(TABLE_NAME);
        num = await rdbStore1.delete(predicates)
        expect(true).assertEqual(num==1)
      } catch (e) {
        e = e as BusinessError;
        expect(null).assertFail()
        hilog.info(domain, tag, '%{public}s', "testRdbTransactionInsert0001 failed");
      }
      await rdbStore1.execute(DROP_TABLE_TESTTRANS);
      done();
      hilog.info(domain, tag, '%{public}s', '************* testRdbTransactionInsert0001 end *************');
    })
    /**
     * @tc.name        testRdbTransactionInsert0002
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_0900
     * @tc.desc        beginTransaction normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransactionInsert0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRdbTransactionInsert0002 start *************');
      await rdbStore1.execute(CREATE_TABLE_TESTTRANS);
      let vbs :Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(3);
      let u8 = new Uint8Array([1, 2, 3]);
      try {
        const rdbTrans = await rdbStore1.createTransaction(options);
        const valueBucket :data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 180 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        vbs[0] = valueBucket

        const valueBucket1 :data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 200 as long,
          "salary": 9.5,
          "blobType": u8,
        }
        vbs[1] = valueBucket1

        const valueBucket2 :data_relationalStore.ValuesBucket = {
          "name": "wangwu",
          "age": 160 as long,
          "salary": 99.0,
          "blobType": u8,
        }
        vbs[2] = valueBucket2

        let num =await rdbTrans.batchInsert(TABLE_NAME, vbs);
        hilog.info(domain, tag, 'Insert %{public}d rows.', num)
        await rdbTrans.commit();
        let predicates = new data_relationalStore.RdbPredicates(TABLE_NAME);
        let num1 = await rdbStore1.delete(predicates)
        expect(true).assertEqual(num1==3)
      } catch (e) {
        e = e as BusinessError;
        expect(null).assertFail()
        hilog.info(domain, tag, '%{public}s', "testRdbTransactionInsert0002 failed");
      }
      await rdbStore1.execute(DROP_TABLE_TESTTRANS);
      done();
      hilog.info(domain, tag, '%{public}s', '************* testRdbTransactionInsert0002 end *************');
    })
    /**
     * @tc.name        testRdbTransactionRollBack0001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_1000
     * @tc.desc        rollBack normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testRdbTransactionRollBack0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testRdbTransactionRollBack0001 start *************');
      await rdbStore1.execute(CREATE_TABLE_TESTTRANS);
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const rdbTrans = await rdbStore1.createTransaction(options);
        const valueBucket2 :data_relationalStore.ValuesBucket = {
          "name": "wangwu",
          "age": 160 as long,
          "salary": 99.0,
          "blobType": u8,
        }
        await rdbTrans.insert(TABLE_NAME,valueBucket2);
        await rdbTrans.rollback()
        let predicates = new data_relationalStore.RdbPredicates(TABLE_NAME);
        let num = await rdbStore1.delete(predicates)
        expect(true).assertEqual(num==0)
      } catch (e) {
        e = e as BusinessError;
        expect(null).assertFail()
        hilog.info(domain, tag, '%{public}s', "testRdbTransactionRollBack0001 failed");
      }
      await rdbStore1.execute(DROP_TABLE_TESTTRANS);
      done();
      hilog.info(domain, tag, '%{public}s', '************* testRdbTransactionRollBack0001 end *************');
    })
    /**
     * @tc.name        testdeleteSync0001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_1100
     * @tc.desc        deleteSync success test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testdeleteSync0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testdeleteSync0001 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let num = rdbStore2.batchInsertSync("testerrcode", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
      let predicates = new data_relationalStore.RdbPredicates('testerrcode');
      predicates.equalTo("data1", "hello");
      try {
        let number1 = rdbStore2.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', 'delete success,num:',number1);
        expect(number1).assertEqual(1);
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'delete failed',err.code);
        expect().assertFail();
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* testdeleteSync0001 end *************');
    })

    /**
     * @tc.name        errcode002
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_1200
     * @tc.desc        getlong 14800013 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode002 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let num = rdbStore2.batchInsertSync("testerrcode", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
      let resultSet =await rdbStore2.querySql("SELECT * FROM testerrcode");
      try{
        resultSet.goToFirstRow();
        resultSet.getLong(9);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code == 14800013)
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* errcode002 end *************');
    })
    /**
     * @tc.name        errcode003
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_1300
     * @tc.desc        getString 14800013 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode002 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let num = rdbStore2.batchInsertSync("testerrcode", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
      let resultSet =await rdbStore2.querySql("SELECT * FROM testerrcode");
      try{
        resultSet.goToFirstRow();
        resultSet.getString(9);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code == 14800013)
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* errcode003 end *************');
    })

    /**
     * @tc.name        errcode004
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_1400
     * @tc.desc        getAssets 14800013 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode004 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let num = rdbStore2.batchInsertSync("testerrcode", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
      let resultSet =await rdbStore2.querySql("SELECT * FROM testerrcode");
      try{
        resultSet.goToFirstRow();
        resultSet.getAssets(9);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code == 14800013)
      }
      try{
        resultSet.goToFirstRow();
        resultSet.getAsset(9);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code == 14800013)
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* errcode004 end *************');
    })

    /**
     * @tc.name        getBlobErrCode13
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_3000
     * @tc.desc        getBlob 14800013 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('getBlobErrCode13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* getBlobErrCode13 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let num = rdbStore2.batchInsertSync("testerrcode", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
      let resultSet =await rdbStore2.querySql("SELECT * FROM testerrcode");
      resultSet.goToFirstRow();
      try{
        resultSet.getBlob(9);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code == 14800013)
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* getBlobErrCode13 end *************');
    })

    /**
     * @tc.name        getDoubleErrCode13
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_3001
     * @tc.desc        getDouble 14800013 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('getDoubleErrCode13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* getDoubleErrCode13 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let num = rdbStore2.batchInsertSync("testerrcode", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
      let resultSet =await rdbStore2.querySql("SELECT * FROM testerrcode");
      resultSet.goToFirstRow();
      try{
        resultSet.getDouble(9);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code == 14800013)
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* getDoubleErrCode13 end *************');
    })

    /**
     * @tc.name        getValueErrCode13
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_3002
     * @tc.desc        getValue 14800013 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('getValueErrCode13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* getValueErrCode13 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let num = rdbStore2.batchInsertSync("testerrcode", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
      let resultSet =await rdbStore2.querySql("SELECT * FROM testerrcode");
      resultSet.goToFirstRow();
      try{
        resultSet.getValue(9);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code == 14800013)
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* getValueErrCode13 end *************');
    })

    /**
     * @tc.name        isColumnNullErrCode13
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_3003
     * @tc.desc        isColumnNull 14800013 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('isColumnNullErrCode13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* isColumnNullErrCode13 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let num = rdbStore2.batchInsertSync("testerrcode", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
      let resultSet =await rdbStore2.querySql("SELECT * FROM testerrcode");
      resultSet.goToFirstRow();
      try{
        resultSet.isColumnNull(9);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code == 14800013)
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* isColumnNullErrCode13 end *************');
    })

    /**
     * @tc.name        isColumnNullErrCode12
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_3033
     * @tc.desc        isColumnNull 14800012 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('isColumnNullErrCode12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* isColumnNullErrCode12 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let num = rdbStore2.batchInsertSync("testerrcode", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
      let resultSet =await rdbStore2.querySql("SELECT * FROM testerrcode");
      try{
        resultSet.isColumnNull(resultSet.getColumnIndex("data5"));
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code == 14800012)
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* isColumnNullErrCode12 end *************');
    })

    /**
     * @tc.name        errcode044
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_1440
     * @tc.desc        getString 14800012 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode044 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let num = rdbStore2.batchInsertSync("testerrcode", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
      let resultSet =await rdbStore2.querySql("SELECT * FROM testerrcode");
      try{
        resultSet.getString(9);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code == 14800012)
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* errcode044 end *************');
    })
    /**
     * @tc.name        errcode005
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_1500
     * @tc.desc        getLong 14800012 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode005 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let num = rdbStore2.batchInsertSync("testerrcode", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num)
      let resultSet = await rdbStore2.querySql("SELECT * FROM testerrcode");
      try{
        resultSet.getLong(9);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code == 14800012)
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* errcode005 end *************');
    })

    /**
     * @tc.name        errcode008
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_1700
     * @tc.desc        getRdbStore promise 14800017 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode008 start *************');
      const STORE_CONFIGS1 :data_relationalStore.StoreConfig = {
        name: "rdbstore17.db",
        securityLevel: data_relationalStore.SecurityLevel.S1
      };
      const STORE_CONFIGS4 :data_relationalStore.StoreConfig = {
        name: "rdbstore17.db",
        securityLevel: data_relationalStore.SecurityLevel.S4
      };
      let store = await data_relationalStore.getRdbStore(context, STORE_CONFIGS4);
      hilog.info(domain, tag, '%{public}s', 'S4 Get RdbStore successfully');
      try {
        store = await data_relationalStore.getRdbStore(context, STORE_CONFIGS1)
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'Get RdbStore failed'+ err.code);
        expect(true).assertEqual(err.code == 14800017)
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* errcode008 end *************');
    })
    
    /**
     * @tc.name        errcode018
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_1800
     * @tc.desc        delete、 deleteSync 14800021 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode018 start *************');
      let predicates = new data_relationalStore.RdbPredicates('testerrcode4444');
      predicates.equalTo("data1", "xiiiiiiiiii");
      try {
        await rdbStore.delete(predicates);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'delete failed'+err.code);
        expect(err.code == 14800021).assertTrue();
      }
      try {
        rdbStore.deleteSync(predicates);
        expect().assertFail();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'delete failed'+err.code);
        expect(err.code == 14800021).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* errcode018 end *************');
    })
    /**
     * @tc.name        errcode019
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_1900
     * @tc.desc        delete callback 14800021 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode019 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let predicates = new data_relationalStore.RdbPredicates('testerrcode4444');
      predicates.equalTo("data1", "xiiiiiiiiii");
      try {
        await rdbStore2.delete(predicates);
        hilog.info(domain, tag, '%{public}s', 'delete successfully');
        expect().assertFail();
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'delete failed'+err.code);
        expect(err?.code == 14800021).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* errcode019 end *************');
    })
    /**
     * @tc.name        errcode020
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_2000
     * @tc.desc        executeSql callback 14800021 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode020 start *************');
      try {
        await rdbStore2.execute("select * FROM employee");
        hilog.info(domain, tag, '%{public}s', 'executeSql successfully');
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'executeSql failed',err.code,err.message);
        expect(err?.code == 14800021).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* errcode020 end *************');
    })
    /**
     * @tc.name        errcode022
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_2100
     * @tc.desc        executeSql promise 14800021 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode022 start *************');
      try {
        await rdbStore2.execute("select * FROM employee",  undefined);
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+ err.code);
        expect(err.code == 14800021).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* errcode022 end *************');
    })
    /**
     * @tc.name        errcode028
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_2200
     * @tc.desc        executeSql promise 14800032 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode028 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      try {
        await rdbStore2.execute("INSERT INTO testerrcode(data2, data3,data4) VALUES (?,?,?)",  [80 as long, 111188.1, new Uint8Array(0)])
        hilog.info(domain, tag, '%{public}s', 'executeSql suceess');
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+err.code);
        expect(err.code).assertEqual(14800032);
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* errcode028 end *************');
    })
    /**
     * @tc.name        errcode031
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_2300
     * @tc.desc        executeSql promise 14800033 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('errcode031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* errcode031 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      try {
        await rdbStore2.execute("INSERT INTO testerrcode(id, data1, data2, data3,data4) VALUES (?,?,?,?,?)",  ['abc','hello',80 as long, 111188.1, new Uint8Array(0)])
        hilog.info(domain, tag, '%{public}s', 'executeSql success');
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+err.code);
        expect(err.code).assertEqual(14800033);
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* errcode031 end *************');
    })

   /**
     * @tc.name        testGoToFirstRow001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_2400
     * @tc.desc        GoToFirstRow test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGoToFirstRow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGoToFirstRow001 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let resultSet = await rdbStore2.querySql("SELECT * FROM testerrcode");
      try{
        let bool1 = resultSet.goToFirstRow();
        hilog.info(domain, tag, '%{public}s', 'bool1:' + bool1);
        expect(bool1).assertEqual(false);
      }catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+ err.code);
        expect().assertFail();
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGoToFirstRow001 end *************');
    })
    /**
     * @tc.name        testGoToLastRow001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_2500
     * @tc.desc        testGoToLastRow001 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGoToLastRow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGoToLastRow001 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let resultSet = await rdbStore2.querySql("SELECT * FROM testerrcode");
      try{
        let bool1 = resultSet.goToLastRow();
        hilog.info(domain, tag, '%{public}s', 'bool1:' + bool1);
        expect(bool1).assertEqual(false);
      }catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+ err.code);
        expect().assertFail();
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGoToLastRow001 end *************');
    })
    /**
     * @tc.name        testGoToNextRow001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_2600
     * @tc.desc        testGoToNextRow001 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGoToNextRow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGoToNextRow001 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      let resultSet = await rdbStore2.querySql("SELECT * FROM testerrcode");
      try{
        let bool1 = resultSet.goToNextRow();
        hilog.info(domain, tag, '%{public}s', 'bool1:' + bool1);
        expect(bool1).assertEqual(false);
      }catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+ err.code);
        expect().assertFail();
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGoToNextRow001 end *************');
    })
    /**
     * @tc.name        testGoToPreviousRow001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_2700
     * @tc.desc        testGoToNextRow001 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGoToPreviousRow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGoToPreviousRow001 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.goToLastRow();
      try{
        let bool1 = resultSet.goToPreviousRow();
        hilog.info(domain, tag, '%{public}s', 'bool1:' + bool1);
        expect(bool1).assertEqual(true);
        done();
      }catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+ err.code);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testGoToPreviousRow001 end *************');
    })
    /**
     * @tc.name        testIsColumnNull001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_qiangjiAPITest_2800
     * @tc.desc        testIsColumnNull001 test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testIsColumnNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testIsColumnNull001 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.goToFirstRow();
      try{
        let bool1 = resultSet.isColumnNull(resultSet.getColumnIndex("data1"));
        hilog.info(domain, tag, '%{public}s', 'bool1:' + bool1);
        expect(bool1).assertEqual(false);
        done();
      }catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+ err.code);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testIsColumnNull001 end *************');
    })
  })
}
