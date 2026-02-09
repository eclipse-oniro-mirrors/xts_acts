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

const CREATE_TABLE_TESTERRCODE = "CREATE TABLE IF NOT EXISTS testerrcode (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 TEXT NOT NULL," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TESTERRCODE = "DROP TABLE IF EXISTS testerrcode";

let STORE_CONFIG2 :data_relationalStore.StoreConfig = {
  name: "test2.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let rdbStore : data_relationalStore.RdbStore
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

export default function relationalStoreCloudSyncEts() {
  describe('relationalStoreCloudSyncEts', ():void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      hilog.info(domain, tag, 'abilityDelegator:' );
      hilog.info(domain, tag, 'abilityDelegator:' + JSON.stringify(abilityDelegator));
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
    });
    
    beforeEach(async(): Promise<void> => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      rdbStore2 = await data_relationalStore.getRdbStore(context, STORE_CONFIG2);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
    })

    afterEach(async (): Promise<void> => {
      console.info(tag + 'afterEach');
    });

    afterAll(async () : Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG2);
    })
    

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_qiangjiAPItestGetColumnIndex0001Test_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_qiangjiAPItestGetColumnIndex0001Test_0100
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_qiangjiAPItestGetColumnIndex0001Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_SDK_qiangjiAPItestGetColumnIndex0001Test_0100 start *************');
      await rdbStore.batchInsert("test", vbs);
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      expect(true).assertEqual(resultSet.goToFirstRow())
      expect(true).assertEqual(resultSet.getColumnIndex("data1")==1)
      resultSet.close();
      done();
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_SDK_qiangjiAPItestGetColumnIndex0001Test_0100 end *************');
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_testGetColumnIndex0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testGetColumnIndex0002
     * @tc.desc   getColumnIndex errcode test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_testGetColumnIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_SDK_testGetColumnIndex0002 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test1");
      try {
        resultSet.getColumnIndex("data1")
      } catch(err: BusinessError) {
        hilog.info(domain, tag, "business error code %{public}d", err.code)
        expect(true).assertEqual(err.code==14800021)
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_SDK_testGetColumnIndex0002 end *************');
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_testGetColumnIndex0003
     * @tc.number SUB_DistributedData_RelationalStore_testGetColumnIndex0003
     * @tc.desc   getColumnIndex errcode test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_testGetColumnIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_testGetColumnIndex0003 start *************');
      let resultSet =await rdbStore.querySql("SELECT * FROM test")
      try {
        resultSet.getColumnIndex("dataX")
      } catch(err: BusinessError) {
        let e = err as BusinessError;
        hilog.info(domain, tag, "business error code %{public}d", e.code)
        expect(true).assertEqual(e.code==14800000)
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_testGetColumnIndex0003 end *************');
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_qiangjiquerySqlAPITest_0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_qiangjiquerySqlAPITest_0400
     * @tc.desc   getColumnIndex errcode test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_qiangjiquerySqlAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0004 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test")
      try {
        resultSet.getColumnIndex("")
      } catch(err: BusinessError) {
        let e = err as BusinessError
        hilog.info(domain, tag, "business error code %{public}d", e.code)
        expect(true).assertEqual(e.code==14800000)
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_SDK_qiangjiquerySqlAPITest_0400 end *************');
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_testGetString0001
     * @tc.number SUB_DistributedData_RelationalStore_testGetString0001
     * @tc.desc   getString normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_testGetString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_testGetString0001 start *************');
      await rdbStore.batchInsert("test", vbs);
      let resultSet = await  rdbStore.querySql("SELECT * FROM test")
      expect(true).assertEqual(resultSet.goToFirstRow())
      const data1 = resultSet.getString(resultSet.getColumnIndex("data1"))
      expect("hello").assertEqual(data1)
      done();
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_testGetString0001 end *************');
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_qiangjiAPItestGetString0002Test_0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_qiangjiAPItestGetString0002Test_0700
     * @tc.desc   getString normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_qiangjiAPItestGetString0002Test_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_SDK_qiangjiAPItestGetString0002Test_0700 start *************');
      await rdbStore.batchInsert("test", vbs);
      let resultSet = await rdbStore.querySql("SELECT * FROM test")
      expect(true).assertEqual(resultSet.goToFirstRow())
      const data2 = resultSet.getString(resultSet.getColumnIndex("data2"))
      expect("10").assertEqual(data2);
      done();
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_SDK_qiangjiAPItestGetString0002Test_0700 end *************');
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_testgetRdbStore0008
     * @tc.number SUB_DistributedData_RelationalStore_testgetRdbStore0008
     * @tc.desc   getRdbStore promise 14800017 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_testgetRdbStore0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_testgetRdbStore0008 start *************');
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
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'Get RdbStore failed'+ err.code);
        expect(true).assertEqual(err.code == 14800017)
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_testgetRdbStore0008 end *************');
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_executeerrcode020
     * @tc.number SUB_DistributedData_RelationalStore_SDK_executeerrcode020
     * @tc.desc   executeSql callback 14800021 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_executeerrcode020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_SDK_executeerrcode020 start *************');
      try {
        await rdbStore2.execute("select * FROM employee");
        hilog.info(domain, tag, '%{public}s', 'executeSql successfully');
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'executeSql failed',err.code,err.message);
        expect(err?.code == 14800021).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_SDK_executeerrcode020 end *************');
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_testexecuteerrcode022
     * @tc.number SUB_DistributedData_RelationalStore_testexecuteerrcode022
     * @tc.desc   executeSql promise 14800021 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_testexecuteerrcode022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_testexecuteerrcode022 start *************');
      try {
        await rdbStore2.execute("select * FROM employee", undefined);
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+ err.code);
        expect(err.code == 14800021).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_testexecuteerrcode022 end *************');
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_qiangjiAPIerrcode028Test_2200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_qiangjiAPIerrcode028Test_2200
     * @tc.desc   executeSql promise 14800032 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_qiangjiAPIerrcode028Test_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_SDK_qiangjiAPIerrcode028Test_2200 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      try {
        await rdbStore2.execute("INSERT INTO testerrcode(data2, data3,data4) VALUES (?,?,?)",  [80 as long, 111188.1, new Uint8Array(0)])
        hilog.info(domain, tag, '%{public}s', 'executeSql suceess');
        expect().assertFail();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+err.code);
        expect(err.code).assertEqual(14800032);
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_SDK_qiangjiAPIerrcode028Test_2200 end *************');
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_testexecuteSql0031
     * @tc.number SUB_DistributedData_RelationalStore_testexecuteSql0031
     * @tc.desc   executeSql promise 14800033 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_testexecuteSql0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_testexecuteSql0031 start *************');
      await rdbStore2.execute(CREATE_TABLE_TESTERRCODE);
      try {
        await rdbStore2.execute("INSERT INTO testerrcode(id, data1, data2, data3,data4) VALUES (?,?,?,?,?)",  ['abc','hello',80 as long, 111188.1, new Uint8Array(0)])
        hilog.info(domain, tag, '%{public}s', 'executeSql success');
        expect().assertFail();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+err.code);
        expect(err.code).assertEqual(14800033);
      }
      await rdbStore2.execute(DROP_TABLE_TESTERRCODE);
      done();
      hilog.info(domain, tag, '%{public}s', '************* SUB_DistributedData_RelationalStore_testexecuteSql0031 end *************');
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RdbAPItestInsert_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbAPItestInsert_0200
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RdbAPItestInsert_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s',
          '************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestInsert_0200 start *************');
        try {
          let num =
            await rdbStore.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          expect(num).assertEqual(1);
        } catch (err: BusinessError) {
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, '%{public}s',
          '************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestInsert_0200 end *************');
      })

  })
}
