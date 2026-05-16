/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

let context:common.UIAbilityContext | undefined;
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
let rdbStore: data_relationalStore.RdbStore | undefined;
let rdbStore2: data_relationalStore.RdbStore | undefined;
let vbs :Array<data_relationalStore.ValuesBucket> = [];
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
vbs.push(valueBucket0)
vbs.push(valueBucket1)
vbs.push(valueBucket2)

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
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      rdbStore2 = await data_relationalStore.getRdbStore(context!, STORE_CONFIG2);
      await rdbStore!.execute(DROP_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_TEST);
    })

    afterEach(async (): Promise<void> => {
      console.info(tag + 'afterEach');
    });

    afterAll(async () : Promise<void> => {
      await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG2);
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
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await rdbStore!.querySql("SELECT * FROM test");
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
      let resultSet = await rdbStore!.querySql("SELECT * FROM test1");
      try {
        resultSet.getColumnIndex("data1")
      } catch(err) {
        err = err as BusinessError;
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
      let resultSet =await rdbStore!.querySql("SELECT * FROM test")
      try {
        resultSet.getColumnIndex("dataX")
      } catch(err) {
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
      let resultSet = await rdbStore!.querySql("SELECT * FROM test")
      try {
        resultSet.getColumnIndex("")
      } catch(err) {
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
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await  rdbStore!.querySql("SELECT * FROM test")
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
      await rdbStore!.batchInsert("test", vbs);
      let resultSet = await rdbStore!.querySql("SELECT * FROM test")
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
      let store = await data_relationalStore.getRdbStore(context!, STORE_CONFIGS4);
      hilog.info(domain, tag, '%{public}s', 'S4 Get RdbStore successfully');
      try {
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIGS1)
      } catch (err) {
        err = err as BusinessError;
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
        await rdbStore2!.execute("select * FROM employee");
        hilog.info(domain, tag, '%{public}s', 'executeSql successfully');
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
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
        await rdbStore2!.execute("select * FROM employee", undefined);
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
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
      await rdbStore2!.execute(CREATE_TABLE_TESTERRCODE);
      try {
        await rdbStore2!.execute("INSERT INTO testerrcode(data2, data3,data4) VALUES (?,?,?)",  [80 as long, 111188.1, new Uint8Array(0)])
        hilog.info(domain, tag, '%{public}s', 'executeSql suceess');
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+err.code);
        expect(err.code).assertEqual(14800032);
      }
      await rdbStore2!.execute(DROP_TABLE_TESTERRCODE);
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
      await rdbStore2!.execute(CREATE_TABLE_TESTERRCODE);
      try {
        await rdbStore2!.execute("INSERT INTO testerrcode(id, data1, data2, data3,data4) VALUES (?,?,?,?,?)",  ['abc','hello',80 as long, 111188.1, new Uint8Array(0)])
        hilog.info(domain, tag, '%{public}s', 'executeSql success');
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'executeSql failed'+err.code);
        expect(err.code).assertEqual(14800033);
      }
      await rdbStore2!.execute(DROP_TABLE_TESTERRCODE);
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
            await rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          expect(num).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, '%{public}s',
          '************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestInsert_0200 end *************');
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressCodeStatic_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressCodeStatic_0100
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressCodeStatic_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s',
          '************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressCodeStatic_0100 start *************');
          try {
            console.log(tag + "SUCCESS=" + data_relationalStore.ProgressCode.SUCCESS);
            expect(data_relationalStore.ProgressCode.SUCCESS).assertEqual(0);
            expect(data_relationalStore.ProgressCode.UNKNOWN_ERROR).assertEqual(1);
            expect(data_relationalStore.ProgressCode.NETWORK_ERROR).assertEqual(2);
            expect(data_relationalStore.ProgressCode.CLOUD_DISABLED).assertEqual(3);
            expect(data_relationalStore.ProgressCode.LOCKED_BY_OTHERS).assertEqual(4);
            expect(data_relationalStore.ProgressCode.RECORD_LIMIT_EXCEEDED).assertEqual(5);
            expect(data_relationalStore.ProgressCode.NO_SPACE_FOR_ASSET).assertEqual(6);
            expect(data_relationalStore.ProgressCode.BLOCKED_BY_NETWORK_STRATEGY).assertEqual(7);
            done();
          } catch (err) {
            console.log(tag + `testRdbStoreProgressCode0010 fail, err code is ${err.code}, message is ${err.message}.`);
            expect().assertFail();
            done();
          }
        done();
        hilog.info(domain, tag, '%{public}s',
          '************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressCodeStatic_0100 end *************');
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0100
     * @tc.desc   test ProgressDetails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0100 start *************");
      let statistic1 : data_relationalStore.Statistic = {"total":10, "successful":6, "failed":3, "remained":1};
      let statistic2 : data_relationalStore.Statistic = {"total":100, "successful":60, "failed":30, "remained":10};
      let tableble: Record<string, data_relationalStore.TableDetails> = { "cloud_text": {"upload": statistic1, "download": statistic2} }
      let tableDetail : data_relationalStore.TableDetails = {"upload": statistic1, "download": statistic2};
      let progressDetail : data_relationalStore.ProgressDetails = {"schedule":data_relationalStore.Progress.SYNC_FINISH,"code":data_relationalStore.ProgressCode.SUCCESS,"details": tableble};
      expect(progressDetail.schedule).assertEqual(2);
      expect(progressDetail.code).assertEqual(0);
      console.log(tag, `${JSON.stringify(progressDetail.details)}`);
      expect(JSON.stringify(progressDetail.details)).assertContain('cloud_text');
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0100 end *************");
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0200
     * @tc.desc   test ProgressDetails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0200 start *************");
      let statistic1 : data_relationalStore.Statistic = {"total":10, "successful":6, "failed":3, "remained":1};
      let statistic2 : data_relationalStore.Statistic = {"total":100, "successful":60, "failed":30, "remained":10};
      let tableble: Record<string, data_relationalStore.TableDetails> = { "cloud_text": {"upload": statistic1, "download": statistic2} }
      let tableDetail : data_relationalStore.TableDetails = {"upload": statistic1, "download": statistic2};
      let progressDetail : data_relationalStore.ProgressDetails = {"schedule":data_relationalStore.Progress.SYNC_IN_PROGRESS,"code":data_relationalStore.ProgressCode.SUCCESS,"details": tableble};
      expect(progressDetail.schedule).assertEqual(1);
      expect(progressDetail.code).assertEqual(0);
      console.log(tag, `${JSON.stringify(progressDetail.details)}`);
      expect(JSON.stringify(progressDetail.details)).assertContain('cloud_text');
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0200 end *************");
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0300
     * @tc.desc   test ProgressDetails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0300 start *************");
      let statistic1 : data_relationalStore.Statistic = {"total":10, "successful":6, "failed":3, "remained":1};
      let statistic2 : data_relationalStore.Statistic = {"total":100, "successful":60, "failed":30, "remained":10};
      let tableble: Record<string, data_relationalStore.TableDetails> = { "cloud_text": {"upload": statistic1, "download": statistic2} }
      let tableDetail : data_relationalStore.TableDetails = {"upload": statistic1, "download": statistic2};
      let progressDetail : data_relationalStore.ProgressDetails = {"schedule":data_relationalStore.Progress.SYNC_BEGIN,"code":data_relationalStore.ProgressCode.SUCCESS,"details": tableble};
      expect(progressDetail.schedule).assertEqual(0);
      expect(progressDetail.code).assertEqual(0);
      console.log(tag, `${JSON.stringify(progressDetail.details)}`);
      expect(JSON.stringify(progressDetail.details)).assertContain('cloud_text');
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestProgressDetailsStatic_0300 end *************");
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RdbAPItestFieldStatic_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbAPItestFieldStatic_0100
     * @tc.desc   Field test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RdbAPItestFieldStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestFieldStatic_0100 start *************");
      console.log(tag, `Field test`);
      expect(data_relationalStore.Field.CURSOR_FIELD).assertEqual('#_cursor');
      expect(data_relationalStore.Field.ORIGIN_FIELD).assertEqual('#_origin');
      expect(data_relationalStore.Field.DELETED_FLAG_FIELD).assertEqual('#_deleted_flag');
      expect(data_relationalStore.Field.DATA_STATUS_FIELD).assertEqual('#_data_status');
      expect(data_relationalStore.Field.OWNER_FIELD).assertEqual('#_cloud_owner');
      expect(data_relationalStore.Field.PRIVILEGE_FIELD).assertEqual('#_cloud_privilege');
      expect(data_relationalStore.Field.SHARING_RESOURCE_FIELD).assertEqual('#_sharing_resource_field'	);
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestFieldStatic_0100 end *************");
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RdbAPItestOriginStatic_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbAPItestOriginStatic_0100
     * @tc.desc   Origin test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RdbAPItestOriginStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestOriginStatic_0100 start *************");
      console.log(tag, `Origin test`);
      expect(data_relationalStore.Origin.LOCAL).assertEqual(0);
      expect(data_relationalStore.Origin.CLOUD).assertEqual(1);
      expect(data_relationalStore.Origin.REMOTE).assertEqual(2);
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestOriginStatic_0100 end *************");
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RdbAPItestTableTypeStatic_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbAPItestTableTypeStatic_0100
     * @tc.desc   TableType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_RdbAPItestTableTypeStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestTableTypeStatic_0100 start *************");
      console.log(tag, `Origin test`);
      expect(data_relationalStore.DistributedTableType.DEVICE_COLLABORATION).assertEqual(0);
      expect(data_relationalStore.DistributedTableType.SINGLE_VERSION).assertEqual(1);
      console.log(tag + "************* SUB_DistributedData_RelationalStore_SDK_RdbAPItestTableTypeStatic_0100 end *************");
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_DistributedConfig_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DistributedConfig_0100
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:false,enableCloud:false,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_DistributedConfig_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag +
        "************* SUB_DistributedData_RelationalStore_SDK_DistributedConfig_0100 start *************");
        try {
          if (rdbStore != undefined) {
            (rdbStore as data_relationalStore.RdbStore).setDistributedTables(["EMPLOYEE"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
              autoSync: true,
              asyncDownloadAsset: true,
              enableCloud: true,
            })
            console.log(tag, `SetDistributedTables success`);
          } else {
            expect().assertFail();
          }
        } catch (e) {
          let error: BusinessError = e as BusinessError;
          console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
          expect().assertFail();
        }
      console.log(tag +
        "************* SUB_DistributedData_RelationalStore_SDK_DistributedConfig_0100 end *************");
    });

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_DistributedConfig_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DistributedConfig_0200
     * @tc.desc   DistributedConfig test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_DistributedConfig_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag +
        "************* SUB_DistributedData_RelationalStore_SDK_DistributedConfig_0200 start *************");
        try {
          if (rdbStore != undefined) {
            (rdbStore as data_relationalStore.RdbStore).setDistributedTables(["EMPLOYEE"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
              autoSync: false,
              asyncDownloadAsset: false,
              enableCloud: false,
            })
            console.log(tag, `SetDistributedTables success`);
          } else {
            expect().assertFail();
          }
        } catch (e) {
          let error: BusinessError = e as BusinessError;
          console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
          expect().assertFail();
        }
      console.log(tag +
        "************* SUB_DistributedData_RelationalStore_SDK_DistributedConfig_0200 end *************");
    });

     /**
     * @tc.name   testRdbStoreCloudSync0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_0100
     * @tc.desc   cloudSync without tables SYNC_MODE_NATIVE_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreCloudSync0001 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      try {
         rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_NATIVE_FIRST,
          (progressDetail: data_relationalStore.ProgressDetails) => {
            console.info(`progress: ${progressDetail}`);
            expect(typeof(progressDetail) === "object").assertTrue();
          }, (err) => {
            console.log(tag + "cloudSync success");
            done();
          });
      } catch (err) {
        console.log(tag + "testRdbStoreCloudSync0001 err.code" + err.code + "err.message" + err.message);
        expect(801).assertEqual(err.code)
        done();
      }
      console.log(tag + '************* testRdbStoreCloudSync0001 end *************');
        
    })

    /**
     * @tc.name   testRdbStoreCloudSync0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_0200
     * @tc.desc   cloudSync without tables SYNC_MODE_TIME_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreCloudSync0002 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      try {
         rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_TIME_FIRST,
          (progressDetail: data_relationalStore.ProgressDetails) => {
            console.info(`progress: ${progressDetail}`);
            expect(typeof(progressDetail) === "object").assertTrue();
          }, (err) => {
            console.log(tag + "cloudSync success");
            done();
          });
      } catch (err) {
        console.log(tag + "testRdbStoreCloudSync0002 err.code" + err.code + "err.message" + err.message);
        expect(801).assertEqual(err.code)
        done();
      }
      console.log(tag + '************* testRdbStoreCloudSync0002 end *************');
            
    })

    /**
     * @tc.name   testRdbStoreCloudSync0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_0300
     * @tc.desc   cloudSync without tables SYNC_MODE_PUSH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreCloudSync0002 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      try {
         rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_PUSH,
          (progressDetail: data_relationalStore.ProgressDetails) => {
            console.info(`progress: ${progressDetail}`);
            expect(typeof(progressDetail) === "object").assertTrue();
          }, (err) => {
            console.log(tag + "cloudSync success");
            done();
          });
      } catch (err) {
        console.log(tag + "testRdbStoreCloudSync0003 err.code" + err.code + "err.message" + err.message);
        expect(801).assertEqual(err.code)
        done();
      }
      console.log(tag + '************* testRdbStoreCloudSync0002 end *************');
                
    })

    /**
     * @tc.name   testRdbStoreCloudSync0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_0400
     * @tc.desc   cloudSync without tables SYNC_MODE_PULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.log(tag + '************* testRdbStoreCloudSync0002 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        await rdbStore!.execute(CREATE_TABLE_TEST);
        try {
           rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_PULL,
            (progressDetail: data_relationalStore.ProgressDetails) => {
              console.info(`progress: ${progressDetail}`);
              expect(typeof(progressDetail) === "object").assertTrue();
            }, (err) => {
              console.log(tag + "cloudSync success");
              done();
            });
        } catch (err) {
          console.log(tag + "testRdbStoreCloudSync0004 err.code" + err.code + "err.message" + err.message);
          expect(801).assertEqual(err.code)
          done();
        }
        console.log(tag + '************* testRdbStoreCloudSync0004 end *************');
                  
    })

    /**
     * @tc.name   testRdbStoreCloudSync0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_0500
     * @tc.desc   cloudSync without tables SYNC_MODE_PULL, SYNC_MODE_PUSH promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
          console.log(tag + '************* testRdbStoreCloudSync0005 start *************');
          rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
          await rdbStore!.execute(CREATE_TABLE_TEST);
          try {
            await rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_PULL,
              (progressDetail: data_relationalStore.ProgressDetails) => {
                console.info(`progress: ${progressDetail}`);
                expect(typeof(progressDetail) === "object").assertTrue();
              });
              console.log(tag + "cloudSync success");
              done();
          } catch (err) {
            console.log(tag + "testRdbStoreCloudSync0005 err.code" + err.code + "err.message" + err.message);
            expect(14800000).assertEqual(err.code)
            done();
          }

          try {
            await rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_PUSH,
              (progressDetail: data_relationalStore.ProgressDetails) => {
                console.info(`progress: ${progressDetail}`);
                expect(typeof(progressDetail) === "object").assertTrue();
              });
              console.log(tag + "cloudSync success");
              done();
          } catch (err) {
            console.log(tag + "testRdbStoreCloudSync0005 err.code" + err.code + "err.message" + err.message);
            expect(14800000).assertEqual(err.code)
            done();
          }
          console.log(tag + '************* testRdbStoreCloudSync0005 end *************');
                    
    })

    /**
     * @tc.name   testRdbStoreCloudSync0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_0600
     * @tc.desc   cloudSync without tables SYNC_MODE_TIME_FIRST promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.log(tag + '************* testRdbStoreCloudSync0006 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        await rdbStore!.execute(CREATE_TABLE_TEST);
        try {
          await rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_TIME_FIRST,
            (progressDetail: data_relationalStore.ProgressDetails) => {
              console.info(`progress: ${progressDetail}`);
              expect(typeof(progressDetail) === "object").assertTrue();
            });
            console.log(tag + "cloudSync success");
            done();
        } catch (err) {
          console.log(tag + "testRdbStoreCloudSync0006 err.code" + err.code + "err.message" + err.message);
          expect(801).assertEqual(err.code)
          done();
        }
      console.log(tag + '************* testRdbStoreCloudSync0006 end *************');
                
    })

    /**
     * @tc.name   testRdbStoreCloudSync0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_0700
     * @tc.desc   cloudSync without tables SYNC_MODE_NATIVE_FIRST promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreCloudSync0007 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      try {
        await rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_NATIVE_FIRST,
          (progressDetail: data_relationalStore.ProgressDetails) => {
            console.info(`progress: ${progressDetail}`);
            expect(typeof(progressDetail) === "object").assertTrue();
          });
          console.log(tag + "cloudSync success");
          done();
      } catch (err) {
        console.log(tag + "testRdbStoreCloudSync0007 err.code" + err.code + "err.message" + err.message);
        expect(801).assertEqual(err.code)
        done();
      }
    console.log(tag + '************* testRdbStoreCloudSync0007 end *************');
              
    })

    /**
     * @tc.name   testRdbStoreCloudSync0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_0800
     * @tc.desc   cloudSync with tables SYNC_MODE_NATIVE_FIRST promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreCloudSync0008 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      try {
        await rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_NATIVE_FIRST, ['test'], 
          (progressDetail: data_relationalStore.ProgressDetails) => {
            console.info(`progress: ${progressDetail}`);
            expect(typeof(progressDetail) === "object").assertTrue();
          });
          console.log(tag + "cloudSync success");
          done();
      } catch (err) {
        console.log(tag + "testRdbStoreCloudSync0008 err.code" + err.code + "err.message" + err.message);
        expect(801).assertEqual(err.code)
        done();
      }
      console.log(tag + '************* testRdbStoreCloudSync0008 end *************');
                  
    })

    /**
     * @tc.name   testRdbStoreCloudSync0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_0900
     * @tc.desc   cloudSync with tables SYNC_MODE_TIME_FIRST promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreCloudSync0009 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      try {
        await rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, ['test'], 
          (progressDetail: data_relationalStore.ProgressDetails) => {
            console.info(`progress: ${progressDetail}`);
            expect(typeof(progressDetail) === "object").assertTrue();
          });
          console.log(tag + "cloudSync success");
          done();
      } catch (err) {
        console.log(tag + "testRdbStoreCloudSync0009 err.code" + err.code + "err.message" + err.message);
        expect(801).assertEqual(err.code)
        done();
      }
      console.log(tag + '************* testRdbStoreCloudSync0009 end *************');
                      
    })

    /**
     * @tc.name   testRdbStoreCloudSync0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_1100
     * @tc.desc   cloudSync with tables SYNC_MODE_PUSH,SYNC_MODE_PULL  promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.log(tag + '************* testRdbStoreCloudSync0010 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        await rdbStore!.execute(CREATE_TABLE_TEST);
        try {
          await rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_PUSH, ['test'], 
            (progressDetail: data_relationalStore.ProgressDetails) => {
              console.info(`progress: ${progressDetail}`);
              expect(typeof(progressDetail) === "object").assertTrue();
            });
            console.log(tag + "cloudSync success");
            done();
        } catch (err) {
          console.log(tag + "testRdbStoreCloudSync0010 err.code" + err.code + "err.message" + err.message);
          expect(14800000).assertEqual(err.code)
          done();
        }

        try {
          await rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_PULL, ['test'], 
            (progressDetail: data_relationalStore.ProgressDetails) => {
              console.info(`progress: ${progressDetail}`);
              expect(typeof(progressDetail) === "object").assertTrue();
            });
            console.log(tag + "cloudSync success");
            done();
        } catch (err) {
          console.log(tag + "testRdbStoreCloudSync0010 err.code" + err.code + "err.message" + err.message);
          expect(14800000).assertEqual(err.code)
          done();
        }
        console.log(tag + '************* testRdbStoreCloudSync0010 end *************');
                        
    })

    /**
     * @tc.name   testRdbStoreCloudSync0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_1500
     * @tc.desc   cloudSync with tables SYNC_MODE_PULL,SYNC_MODE_PUSH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
      it('testRdbStoreCloudSync0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.log(tag + '************* testRdbStoreCloudSync0011 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        await rdbStore!.execute(CREATE_TABLE_TEST);
        try {
           rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_PULL, ['test'], 
            (progressDetail: data_relationalStore.ProgressDetails) => {
              console.info(`progress: ${progressDetail}`);
              expect(typeof(progressDetail) === "object").assertTrue();
            }, (err) => {
              console.log(tag + "cloudSync success");
              done();
            });
        } catch (err) {
          console.log(tag + "testRdbStoreCloudSync0011 err.code" + err.code + "err.message" + err.message);
          expect(801).assertEqual(err.code)
          done();
        }

        try {
          rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_PUSH, ['test'], 
           (progressDetail: data_relationalStore.ProgressDetails) => {
             console.info(`progress: ${progressDetail}`);
             expect(typeof(progressDetail) === "object").assertTrue();
           }, (err) => {
             console.log(tag + "cloudSync success");
             done();
           });
       } catch (err) {
         console.log(tag + "testRdbStoreCloudSync0011 err.code" + err.code + "err.message" + err.message);
         expect(801).assertEqual(err.code)
         done();
       }
        console.log(tag + '************* testRdbStoreCloudSync0011 end *************');
                  
    })

    /**
     * @tc.name   testRdbStoreCloudSync0012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_1200
     * @tc.desc   cloudSync with tables SYNC_MODE_NATIVE_FIRST, SYNC_MODE_TIME_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreCloudSync0012 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      try {
         rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_NATIVE_FIRST, ['test'], 
          (progressDetail: data_relationalStore.ProgressDetails) => {
            console.info(`progress: ${progressDetail}`);
            expect(typeof(progressDetail) === "object").assertTrue();
          }, (err) => {
            console.log(tag + "cloudSync success");
            done();
          });
      } catch (err) {
        console.log(tag + "testRdbStoreCloudSync0012 err.code" + err.code + "err.message" + err.message);
        expect(801).assertEqual(err.code)
        done();
      }

      try {
        rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, ['test'], 
         (progressDetail: data_relationalStore.ProgressDetails) => {
           console.info(`progress: ${progressDetail}`);
           expect(typeof(progressDetail) === "object").assertTrue();
         }, (err) => {
           console.log(tag + "cloudSync success");
           done();
         });
     } catch (err) {
       console.log(tag + "testRdbStoreCloudSync0012 err.code" + err.code + "err.message" + err.message);
       expect(801).assertEqual(err.code)
       done();
     }
      console.log(tag + '************* testRdbStoreCloudSync0012 end *************');
                
    })

    /**
     * @tc.name   testRdbStoreCloudSync0013
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_1300
     * @tc.desc   cloudSync with tables [] callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreCloudSync0013 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      try {
         rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, [], 
          (progressDetail: data_relationalStore.ProgressDetails) => {
            console.info(`progress: ${progressDetail}`);
            expect(typeof(progressDetail) === "object").assertTrue();
          }, (err) => {
            console.log(tag + "cloudSync success");
            done();
          });
      } catch (err) {
        console.log(tag + "testRdbStoreCloudSync0013 err.code" + err.code + "err.message" + err.message);
        expect(401).assertEqual(err.code)
        done();
      }
      console.log(tag + '************* testRdbStoreCloudSync0013 end *************');
                
    })

    /**
     * @tc.name   testRdbStoreCloudSync0014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSyncAPITest_1400
     * @tc.desc   cloudSync with tables [] promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreCloudSync0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.log(tag + '************* testRdbStoreCloudSync0014 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        await rdbStore!.execute(CREATE_TABLE_TEST);
        try {
           await rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, [], 
            (progressDetail: data_relationalStore.ProgressDetails) => {
              console.info(`progress: ${progressDetail}`);
              expect(typeof(progressDetail) === "object").assertTrue();
            });
            done();
        } catch (err) {
          console.log(tag + "testRdbStoreCloudSync0014 err.code" + err.code + "err.message" + err.message);
          expect(401).assertEqual(err.code)
          done();
        }
        console.log(tag + '************* testRdbStoreCloudSync0014 end *************');
                  
    })

  })
}
