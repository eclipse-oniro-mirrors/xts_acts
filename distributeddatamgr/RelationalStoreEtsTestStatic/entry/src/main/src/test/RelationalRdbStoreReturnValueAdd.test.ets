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


let rdbStore:relationalStore.RdbStore | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let context:common.UIAbilityContext| undefined;
const TAG = "[RelationalResultSetReturnValueIsNullTest]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 Long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name text," + "age long, " + "data3 asset," + "data4 assets)";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbQueryResultSet.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
const valueBucket1: relationalStore.ValuesBucket = {
  "data1": "zhangsan",
  "data2": 3 as long,
  "data3": 10.5
};
const valueBucket2: relationalStore.ValuesBucket = {
  "data1": "zhangsan",
  "data2": 15 as long,
  "data3": 17.5
};

const asset1 : relationalStore.Asset = {
  name: "name1",
  uri: "uri1",
  createTime: "createTime1",
  modifyTime: "modifyTime1",
  size: "size1",
  path: "path1",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
const assets1 = [asset1];
export default function RelationalRdbStoreReturnValueAddTest() {

  describe("RelationalRdbStoreReturnValueAddTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(10000)
      context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      try {
        rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
        hilog.info(domain, tag, '%{public}s', 'contextDir' + context!.databaseDir);
        expect(rdbStore != undefined).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'beforeEach failed');
        expect().assertFail();
      }
    })
    beforeEach(async (): Promise<void> => {
      if (rdbStore != undefined) {
        await rdbStore!.execute(CREATE_TABLE_TEST);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "data1": "zhangsan",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset1,
          "data6": assets1,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n,
        };
        await rdbStore!.insert('test', valueBucket);
        hilog.info(domain, tag, '%{public}s', 'beforeAll successful');
      }
      hilog.info(domain, tag, '%{public}s', 'beforeEach');
    })
    afterEach(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterEach');
      await rdbStore!.execute(DROP_TABLE_TEST);
    })
    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterAll');
      // await rdbStore!.execute(DROP_TABLE_TEST);
      try {
        hilog.info(domain, tag, '%{public}s', 'afterAll successful');
        rdbStore!.close();
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'afterAll failed');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0001
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0001
     * @tc.desc   the test of insert
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void)  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0001 start *************');
      const valueBucket1: relationalStore.ValuesBucket = {
        "data1": "wangwu",
        "data2": 3 as long,
        "data3": 10.5
      };
      try{
        rdbStore!.insert("", valueBucket1, (err, rowId) => {
          console.info(domain, tag, `Insert is successful, rowId = ${rowId}`);
          done();
        });
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0001 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
        done();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0001 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0002
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0002
     * @tc.desc   the test of insert
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0002 start *************');
      const valueBucket1: relationalStore.ValuesBucket = {
        "data1": "wangwu",
        "data2": 3 as long,
        "data3": 10.5
      };
      try{
        let rowId = await rdbStore!.insert("", valueBucket1);
        console.info(domain, tag, TAG +`Insert is successful, rowId = ${rowId}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0002 failed message:${err.message} code:${err.code}`);
        expect(err.code).assertEqual(14800000);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0002 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0003
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0003
     * @tc.desc   the test of insert
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0003 start *************');
      const valueBucket1: relationalStore.ValuesBucket = {
        "data1": "wangwu",
        "data2": 3 as long,
        "data3": 10.5
      };
      try{
        let rowId = await rdbStore!.insert("", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(domain, tag, TAG +`Insert is successful, rowId = ${rowId}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0003 failed message:${err.message} code:${err.code}`);
        expect(err.code).assertEqual(14800000);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0003 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0004
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0004
     * @tc.desc   the test of insert
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0004 start *************');
      const valueBucket1: relationalStore.ValuesBucket = {
        "data1": "wangwu",
        "data2": 3 as long,
        "data3": 10.5
      };
      try{
        let rowId = rdbStore!.insertSync("", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(domain, tag, TAG +`Insert is successful, rowId = ${rowId}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0004 failed message:${err.message} code:${err.code}`);
        expect(err.code).assertEqual(14800000);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0004 end *************');
    })


    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0005
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0005
     * @tc.desc   the test of batchInsert
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0005 start *************');
      let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket1, valueBucket2);
      try{
        let insertNum = await rdbStore!.batchInsert("", valueBuckets);
        console.info(domain, tag, TAG +`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect(insertNum).assertEqual(-1);
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0005 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0005 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0006
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0006
     * @tc.desc   the test of batchInsertSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0006 start *************');
      let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket1, valueBucket2);
      try{
        let insertNum = rdbStore!.batchInsertSync("", valueBuckets);
        console.info(domain, tag, TAG +`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect(insertNum).assertEqual(-1);
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0006 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0006 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0007
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0007
     * @tc.desc   the test of batchInsertWithConflictResolution
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0007 start *************');
      let valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1, valueBucket2];
      try{
        let insertNum = await rdbStore!.batchInsertWithConflictResolution("", valueBuckets, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(domain, tag, `batchInsert is successful, insertNum = ${insertNum}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0007 failed message:${err.message} code:${err.code}`);
        expect(err.code).assertEqual(14800021);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0007 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0008
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0008
     * @tc.desc   the test of batchInsertWithConflictResolutionSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0008 start *************');
      let valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1, valueBucket2];
      try{
        let insertNum = rdbStore!.batchInsertWithConflictResolutionSync("", valueBuckets, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(domain, tag, `batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0008 failed message:${err.message} code:${err.code}`);
        expect(err.code).assertEqual(14800021);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0008 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0009
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0009
     * @tc.desc   the test of insertSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0009 start *************');
      const valueBucket1: relationalStore.ValuesBucket = {
        "data1": "wangwu",
        "data2": 3 as long,
        "data3": 10.5
      };
      try{
        let rowId = rdbStore!.insertSync("", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(domain, tag, TAG +`Insert is successful, rowId = ${rowId}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0009 failed message:${err.message} code:${err.code}`);
        expect(err.code).assertEqual(14800000);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0009 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0010
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0010
     * @tc.desc   the test of insertSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0010 start *************');
      const valueBucket1: relationalStore.ValuesBucket = {
        "data1": "wangwu",
        "data2": 3 as long,
        "data3": 10.5
      };
      try{
        let rowId = rdbStore!.insertSync("", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(domain, tag, TAG +`Insert is successful, rowId = ${rowId}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0010 failed message:${err.message} code:${err.code}`);
        expect(err.code).assertEqual(14800000);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0010 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0011
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0011
     * @tc.desc   the test of insertSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0011 start *************');
      const valueBucket1: relationalStore.ValuesBucket = {
        "data1": "wangwu",
        "data2": 3 as long,
        "data3": 10.5
      };
      try{
        let rowId = rdbStore!.insertSync("", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(domain, tag, TAG +`Insert is successful, rowId = ${rowId}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0011 failed message:${err.message} code:${err.code}`);
        expect(err.code).assertEqual(14800000);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0011 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0012
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0012
     * @tc.desc   the test of batchInsertWithConflictResolution
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0012 start *************');
      let valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1, valueBucket2];
      try{
        let insertNum = await rdbStore!.batchInsertWithConflictResolution("test", valueBuckets, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(domain, tag, `batchInsert is successful, insertNum = ${insertNum}`);
        expect(insertNum).assertEqual(2);
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0012 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0012 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0013
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0013
     * @tc.desc   the test of batchInsertWithConflictResolutionSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0013 start *************');
      let valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1, valueBucket2];
      try{
        let insertNum = rdbStore!.batchInsertWithConflictResolutionSync("test", valueBuckets, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(domain, tag, `batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect(insertNum).assertEqual(2);
      }catch(err) {
        console.error(domain, tag, `RelationalRdbStoreReturnValueAddTest_0013 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0013 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0014
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0014
     * @tc.desc   the test of querySql
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void)  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0014 start *************');
      try{
        rdbStore!.querySql("", (err, resultSet) => {
          if (!resultSet) {
            console.error('Query succeeded but resultSet is null');
            expect().assertFail();
            done();
          }
          console.info(domain, tag, TAG + `ResultSet column names: ${resultSet!.columnNames}, column count: ${resultSet!.columnCount}`);
          expect(resultSet!.columnCount).assertEqual(0);
          done();
        });
      }catch(err) {
        console.error(domain, tag, TAG + `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
        done()
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0014 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0015
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0015
     * @tc.desc   the test of update
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0015 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows = await rdbStore!.update(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(domain, tag, TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, `Updated failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0015 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0016
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0016
     * @tc.desc   the test of update
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0016 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows = await rdbStore!.update(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(domain, tag, TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, `Updated failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0016 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0017
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0017
     * @tc.desc   the test of update
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0017 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows = await rdbStore!.update(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(domain, tag, TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, `Updated failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0017 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0018
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0018
     * @tc.desc   the test of updateSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0018 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows = rdbStore!.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(domain, tag, TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, `Updated failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0018 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0019
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0019
     * @tc.desc   the test of updateSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0019 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows = rdbStore!.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.info(domain, tag, TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, `Updated failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0019 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0020
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0020
     * @tc.desc   the test of updateSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0020 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows = rdbStore!.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(domain, tag, TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, `Updated failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0020 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0021
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0021
     * @tc.desc   the test of updateSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0021 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows = rdbStore!.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(domain, tag, TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, `Updated failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0021 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0022
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0022
     * @tc.desc   the test of updateSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0022 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows = rdbStore!.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(domain, tag, TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, `Updated failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0022 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0023
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0023
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0023 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "zhangsan";
        let results = await rdbStore!.updateWithReturning(valueBucket1, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(2);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0023 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0024
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0024
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0024 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: [] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "zhangsan";
        let results = await rdbStore!.updateWithReturning(valueBucket1, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0024 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0025
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0025
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0025 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        const config1: relationalStore.ReturningConfig = { columns: [] };
        let results = await rdbStore!.updateWithReturning(valueBucket1, predicates, config1, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0025 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0026
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0026
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0026 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        let results = await rdbStore!.updateWithReturning(valueBucket1, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0026 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0027
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0027
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0027 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        let results = await rdbStore!.updateWithReturning(valueBucket1, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0027 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0028
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0028
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0028 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        let results = await rdbStore!.updateWithReturning(valueBucket1, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0028 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0029
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0029
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0029 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        let results = await rdbStore!.updateWithReturning(valueBucket1, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0029 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0030
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0030
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0030 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        let results = await rdbStore!.updateWithReturning(valueBucket1, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0030 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0031
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0031
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0031 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        let results = rdbStore!.updateWithReturningSync(valueBucket1, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0031 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0032
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0032
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0032 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        const config1: relationalStore.ReturningConfig = { columns: [] };
        let results = rdbStore!.updateWithReturningSync(valueBucket1, predicates, config1, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertFail();
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0032 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0033
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0033
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0033 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        const config1: relationalStore.ReturningConfig = { columns: ['data1'] };
        let results = rdbStore!.updateWithReturningSync(valueBucket1, predicates, config1, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0033 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0034
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0034
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0033 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        const config1: relationalStore.ReturningConfig = { columns: ['data1'] };
        let results = rdbStore!.updateWithReturningSync(valueBucket1, predicates, config1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0033 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0035
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0035
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0035 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        const config1: relationalStore.ReturningConfig = { columns: ['data1'] };
        let results = rdbStore!.updateWithReturningSync(valueBucket1, predicates, config1, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0035 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0036
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0036
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0036 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        const config1: relationalStore.ReturningConfig = { columns: ['data1'] };
        let results = rdbStore!.updateWithReturningSync(valueBucket1, predicates, config1, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0036 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0037
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0037
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0037 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        const config1: relationalStore.ReturningConfig = { columns: ['data1'] };
        let results = rdbStore!.updateWithReturningSync(valueBucket1, predicates, config1, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0037 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0038
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0038
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0038 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        const config1: relationalStore.ReturningConfig = { columns: ['data1'] };
        let results = rdbStore!.updateWithReturningSync(valueBucket1, predicates, config1, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(domain, tag, `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0038 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0039
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0039
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0039 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        const config1: relationalStore.ReturningConfig = { columns: ['data1'] };
        let results = await rdbStore!.deleteWithReturning(predicates, config1);
        console.info(domain, tag, TAG + `deleteWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0039 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0040
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0040
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0040 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        const config1: relationalStore.ReturningConfig = { columns: [] };
        let results = rdbStore!.deleteWithReturningSync(predicates, config1, );
        console.info(domain, tag, TAG + `deleteWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertFail();
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0040 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0041
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0041
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0041 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        const config1: relationalStore.ReturningConfig = { columns: [""] };
        let results = rdbStore!.deleteWithReturningSync(predicates, config1, );
        console.info(domain, tag, TAG + `deleteWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertFail();
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800021);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0041 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0042
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0042
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0042 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        const config1: relationalStore.ReturningConfig = { columns: ['data1'] };
        let results = rdbStore!.deleteWithReturningSync(predicates, config1);
        console.info(domain, tag, TAG + `deleteWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0042 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0043
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0043
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0043 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        const config1: relationalStore.ReturningConfig = { columns: [] };
        let results = await rdbStore!.deleteWithReturning(predicates, config1, );
        console.info(domain, tag, TAG + `deleteWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertFail();
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0043 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0044
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0044
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0044 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        const config1: relationalStore.ReturningConfig = { columns: [""] };
        let results = await rdbStore!.deleteWithReturning(predicates, config1, );
        console.info(domain, tag, TAG + `deleteWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertFail();
      }catch(err) {
        console.error(domain, tag, `updateWithReturningExample failed. code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800021);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0044 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0045
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0045
     * @tc.desc   the test of query
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0045 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        resultSet = await rdbStore!.query(predicates, []);
        console.info(domain, tag, `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount).assertEqual(9);
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0045 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0046
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0046
     * @tc.desc  the test of querySync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0046 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        resultSet = rdbStore!.querySync(predicates, []);
        console.info(domain, tag, `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount).assertEqual(9);
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0046 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0047
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0047
     * @tc.desc   the test of querySql
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0047 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = await rdbStore!.querySql("", ["zhangsan"]);
        console.info(domain, tag, `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount).assertEqual(0);
        resultSet.close();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0047 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0048
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0048
     * @tc.desc   the test of querySql
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0048 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = await rdbStore!.querySql("SELECT * FROM test WHERE data1 = ?", []);
        console.info(domain, tag, `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount).assertEqual(9);
        resultSet.close();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0048 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0049
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0049
     * @tc.desc   the test of querySqlSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0049 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = rdbStore!.querySqlSync("", ["zhangsan"]);
        console.info(domain, tag, `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount).assertEqual(0);
        resultSet.close();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0049 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0050
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0050
     * @tc.desc   the test of querySqlSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0050 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = rdbStore!.querySqlSync("SELECT * FROM test WHERE data1 = ?", []);
        console.info(domain, tag, `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount).assertEqual(9);
        resultSet.close();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0050 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0051
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0051
     * @tc.desc   the test of batchInsertWithReturning
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0051 start *************');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      const valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1];
      try{
        let results = await rdbStore!.batchInsertWithReturning("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(domain, tag, `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0051 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0052
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0052
     * @tc.desc   the test of batchInsertWithReturning
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0052 start *************');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      const valueBuckets: relationalStore.ValuesBucket[] = [];
      try{
        let results = await rdbStore!.batchInsertWithReturning("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.info(domain, tag, `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0052 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0053
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0053
     * @tc.desc   the test of batchInsertWithReturning
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0053 start *************');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      const valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1];
      try{
        let results = await rdbStore!.batchInsertWithReturning("", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(domain, tag, `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0053 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0054
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0054
     * @tc.desc   the test of batchInsertWithReturning
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0054 start *************');
      const config: relationalStore.ReturningConfig = { columns: [''] };
      const valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1];
      try{
        let results = await rdbStore!.batchInsertWithReturning("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(domain, tag, `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800021);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0054 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0055
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0055
     * @tc.desc   the test of batchInsertWithReturning
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0055 start *************');
      const config: relationalStore.ReturningConfig = { columns: [] };
      const valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1];
      try{
        let results = await rdbStore!.batchInsertWithReturning("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(domain, tag, `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0055 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0056
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0056
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0056 start *************');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      const valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1];
      try{
        let results = rdbStore!.batchInsertWithReturningSync("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(domain, tag, `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0056 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0057
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0057
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0057 start *************');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      const valueBuckets: relationalStore.ValuesBucket[] = [];
      try{
        let results = rdbStore!.batchInsertWithReturningSync("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.info(domain, tag, `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0057 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0058
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0058
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0058 start *************');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      const valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1];
      try{
        let results = rdbStore!.batchInsertWithReturningSync("", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(domain, tag, `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0058 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0059
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0059
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0059 start *************');
      const config: relationalStore.ReturningConfig = { columns: [''] };
      const valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1];
      try{
        let results = rdbStore!.batchInsertWithReturningSync("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(domain, tag, `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800021);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0059 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0060
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0060
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0060 start *************');
      const config: relationalStore.ReturningConfig = { columns: [] };
      const valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1];
      try{
        let results = rdbStore!.batchInsertWithReturningSync("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(domain, tag, `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(14800001);
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0060 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0061
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0061
     * @tc.desc   the test of batchInsertWithReturning
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0061 start *************');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      const valueBuckets: relationalStore.ValuesBucket[] = [valueBucket1];
      try{
        let results = await rdbStore!.batchInsertWithReturning("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(domain, tag, `batchInsertWithReturningExample is successful, changed is ${results.changed}  resultSet ：${results.resultSet}`);
        expect(results.changed).assertEqual(1);
      }catch(err) {
        console.error(domain, tag, `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0061 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0062
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0062
     * @tc.desc   the test of batchInsertWithReturning
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0062 start *************');
      let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket1, valueBucket2);
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try{
        let results = await rdbStore!.batchInsertWithReturning("test", valueBuckets, config);
        console.info(domain, tag, TAG + `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed == 2).assertTrue();
        console.info(domain, tag, TAG + `${results.resultSet}`);
        expect(results.resultSet).assertInstanceOf("Object");
      }catch(err) {
        console.error(domain, tag, TAG + `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0062 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0063
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0063
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0063 start *************');
      let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket1, valueBucket2);
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try{
        let results = rdbStore!.batchInsertWithReturningSync("test", valueBuckets, config);
        console.info(domain, tag, TAG + `batchInsertWithReturningSync is successful, changed is ${results.changed}`);
        expect(results.changed == 2).assertTrue();
        console.info(domain, tag, TAG + `${results.resultSet}`);
        expect(results.resultSet).assertInstanceOf("Object");
      }catch(err) {
        console.error(domain, tag, TAG + `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0063 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0064
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0064
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0064 start *************');
      const valueBucket1: relationalStore.ValuesBucket = { 'data1': 'lisi' };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        let results = await rdbStore!.updateWithReturning(valueBucket1, predicates, config);
        console.info(domain, tag, TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed == 1).assertTrue();
        console.info(domain, tag, TAG + `${results.resultSet}`);
        expect(results.resultSet).assertInstanceOf("Object");
      }catch(err) {
        console.error(domain, tag, TAG + `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0064 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0065
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0065
     * @tc.desc   the test of updateWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0065 start *************');
      const valueBucket1: relationalStore.ValuesBucket = { 'data1': 'lisi' };
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'zhangsan');
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        valueBucket1['data1'] = "rouse";
        let results = rdbStore!.updateWithReturningSync(valueBucket1, predicates, config);
        console.info(domain, tag, TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed == 1).assertTrue();
        console.info(domain, tag, TAG + `${results.resultSet}`);
        expect(results.resultSet).assertInstanceOf("Object");
      }catch(err) {
        console.error(domain, tag, TAG + `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0065 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0066
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0066
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0066 start *************');
      const valueBucket1: relationalStore.ValuesBucket = { 'data1': 'lisi' };
      let predicates = new relationalStore.RdbPredicates("test");
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        let results = await rdbStore!.deleteWithReturning(predicates, config);
        console.info(domain, tag, TAG + `deleteWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed == 2).assertTrue();
        console.info(domain, tag, TAG + `${results.resultSet}`);
        expect(results.resultSet).assertInstanceOf("Object");
      }catch(err) {
        console.error(domain, tag, TAG + `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0066 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0067
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0067
     * @tc.desc   the test of batchInsertWithReturningSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag  + '************* RelationalRdbStoreReturnValueAddTest_0067 start *************');
      const valueBucket1: relationalStore.ValuesBucket = { 'data1': 'lisi' };
      let predicates = new relationalStore.RdbPredicates("test");
      const config: relationalStore.ReturningConfig = { columns: ['data1'] };
      try{
        rdbStore!.batchInsertWithReturningSync("test", [valueBucket1], config);
        let results = rdbStore!.deleteWithReturningSync(predicates, config);
        console.info(domain, tag, TAG + `deleteWithReturningExample is successful, changed is ${results.changed}`);
        expect(results.changed == 2).assertTrue();
        console.info(domain, tag, TAG + `${results.resultSet}`);
        expect(results.resultSet).assertInstanceOf("Object");
      }catch(err) {
        console.error(domain, tag, TAG + `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + '************* RelationalRdbStoreReturnValueAddTest_0067 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0068
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0068
     * @tc.desc   the test of query
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0068 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = await rdbStore!.query(predicates, ["data1", "data2", "data3", "data4", "data5", "data6", "data7", "data8"]);
        console.info(domain, tag + TAG +`ResultSet column names: ${resultSet.columnNames}`);
        expect(resultSet.columnNames.length > 0).assertTrue();
        console.info(domain, tag + TAG +`ResultSet column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount == 8).assertTrue();
        console.info(domain, tag + TAG +`ResultSet rowIndex:${resultSet.rowIndex}`);
        expect(resultSet.rowIndex == -1).assertTrue();
        console.info(domain, tag + TAG +`ResultSet isAtFirstRow: ${resultSet.isAtFirstRow}`);
        expect(resultSet.isAtFirstRow).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isAtLastRow: ${resultSet.isAtLastRow}`);
        expect(resultSet.isAtLastRow).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isEnded:${resultSet.isEnded}`);
        expect(resultSet.isEnded).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isStarted: ${resultSet.isStarted}`);
        expect(resultSet.isStarted).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isClosed: ${resultSet.isClosed}`);
        expect(resultSet.isClosed).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet rowCount:${resultSet.rowCount}`);
        expect(resultSet.rowCount == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, TAG + `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0068 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0069
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0069
     * @tc.desc   the test of querySync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0069 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = rdbStore!.querySync(predicates, ["data1", "data2", "data3", "data4", "data5", "data6", "data7", "data8"]);
        console.info(domain, tag + TAG +`ResultSet column names: ${resultSet.columnNames}`);
        expect(resultSet.columnNames.length > 0).assertTrue();
        console.info(domain, tag + TAG +`ResultSet column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount == 8).assertTrue();
        console.info(domain, tag + TAG +`ResultSet rowIndex:${resultSet.rowIndex}`);
        expect(resultSet.rowIndex == -1).assertTrue();
        console.info(domain, tag + TAG +`ResultSet isAtFirstRow: ${resultSet.isAtFirstRow}`);
        expect(resultSet.isAtFirstRow).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isAtLastRow: ${resultSet.isAtLastRow}`);
        expect(resultSet.isAtLastRow).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isEnded:${resultSet.isEnded}`);
        expect(resultSet.isEnded).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isStarted: ${resultSet.isStarted}`);
        expect(resultSet.isStarted).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isClosed: ${resultSet.isClosed}`);
        expect(resultSet.isClosed).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet rowCount:${resultSet.rowCount}`);
        expect(resultSet.rowCount == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, TAG + `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0069 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0070
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0070
     * @tc.desc   the test of querySql
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0070 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = await rdbStore!.querySql("SELECT * FROM test");
        console.info(domain, tag + TAG +`ResultSet column names: ${resultSet.columnNames}`);
        expect(resultSet.columnNames.length > 0).assertTrue();
        console.info(domain, tag + TAG +`ResultSet column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount == 9).assertTrue();
        console.info(domain, tag + TAG +`ResultSet rowIndex:${resultSet.rowIndex}`);
        expect(resultSet.rowIndex == -1).assertTrue();
        console.info(domain, tag + TAG +`ResultSet isAtFirstRow: ${resultSet.isAtFirstRow}`);
        expect(resultSet.isAtFirstRow).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isAtLastRow: ${resultSet.isAtLastRow}`);
        expect(resultSet.isAtLastRow).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isEnded:${resultSet.isEnded}`);
        expect(resultSet.isEnded).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isStarted: ${resultSet.isStarted}`);
        expect(resultSet.isStarted).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isClosed: ${resultSet.isClosed}`);
        expect(resultSet.isClosed).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet rowCount:${resultSet.rowCount}`);
        expect(resultSet.rowCount == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, TAG + `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0070 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0071
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0071
     * @tc.desc   the test of query
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void)  => {
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0071 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      if (rdbStore != undefined) {
        rdbStore!.query(predicates, (err, resultSet) => {
          if (!resultSet) {
            console.error('Query succeeded but resultSet is null');
            expect().assertFail();
            done();
          }
          try {
            console.info(domain, tag + TAG +`ResultSet column names: ${resultSet!.columnNames}`);
            console.info(`ResultSet column names: ${resultSet!.columnNames}, column count: ${resultSet!.columnCount}`);
            expect(resultSet!.columnNames.length > 0).assertTrue();
            console.info(domain, tag + TAG +`ResultSet column count: ${resultSet!.columnCount}`);
            expect(resultSet!.columnCount == 9).assertTrue();
            console.info(domain, tag + TAG +`ResultSet rowIndex:${resultSet!.rowIndex}`);
            expect(resultSet!.rowIndex == -1).assertTrue();
            console.info(domain, tag + TAG +`ResultSet isAtFirstRow: ${resultSet!.isAtFirstRow}`);
            expect(resultSet!.isAtFirstRow).assertEqual(false);
            console.info(domain, tag + TAG +`ResultSet isAtLastRow: ${resultSet!.isAtLastRow}`);
            expect(resultSet!.isAtLastRow).assertEqual(false);
            console.info(domain, tag + TAG +`ResultSet isEnded:${resultSet!.isEnded}`);
            expect(resultSet!.isEnded).assertEqual(false);
            console.info(domain, tag + TAG +`ResultSet isStarted: ${resultSet!.isStarted}`);
            expect(resultSet!.isStarted).assertEqual(false);
            console.info(domain, tag + TAG +`ResultSet isClosed: ${resultSet!.isClosed}`);
            expect(resultSet!.isClosed).assertEqual(false);
            console.info(domain, tag + TAG +`ResultSet rowCount:${resultSet!.rowCount}`);
            expect(resultSet!.rowCount == 1).assertTrue();
            resultSet!.close();
            done();
          } catch (err) {
            console.error(`Query failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      }
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0071 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0072
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0072
     * @tc.desc   the test of querySql
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void)  => {
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0072 start *************');
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      rdbStore!.querySql("SELECT * FROM test", (err, resultSet) => {
        if (!resultSet) {
          console.error('Query succeeded but resultSet is null');
          expect().assertFail();
          done();
        }
        try {
          console.info(domain, tag + TAG +`ResultSet column names: ${resultSet!.columnNames}`);
          expect(resultSet!.columnNames.length > 0).assertTrue();
          console.info(domain, tag + TAG +`ResultSet column count: ${resultSet!.columnCount}`);
          expect(resultSet!.columnCount == 9).assertTrue();
          console.info(domain, tag + TAG +`ResultSet rowIndex:${resultSet!.rowIndex}`);
          expect(resultSet!.rowIndex == -1).assertTrue();
          console.info(domain, tag + TAG +`ResultSet isAtFirstRow: ${resultSet!.isAtFirstRow}`);
          expect(resultSet!.isAtFirstRow).assertEqual(false);
          console.info(domain, tag + TAG +`ResultSet isAtLastRow: ${resultSet!.isAtLastRow}`);
          expect(resultSet!.isAtLastRow).assertEqual(false);
          console.info(domain, tag + TAG +`ResultSet isEnded:${resultSet!.isEnded}`);
          expect(resultSet!.isEnded).assertEqual(false);
          console.info(domain, tag + TAG +`ResultSet isStarted: ${resultSet!.isStarted}`);
          expect(resultSet!.isStarted).assertEqual(false);
          console.info(domain, tag + TAG +`ResultSet isClosed: ${resultSet!.isClosed}`);
          expect(resultSet!.isClosed).assertEqual(false);
          console.info(domain, tag + TAG +`ResultSet rowCount:${resultSet!.rowCount}`);
          expect(resultSet!.rowCount == 1).assertTrue();
          resultSet!.close();
          done();
        } catch (err) {
          console.error(`Query failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        }
      });
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0072 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0073
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0073
     * @tc.desc   the test of querySqlSync
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0073 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = rdbStore!.querySqlSync("SELECT * FROM test");
        console.info(domain, tag + TAG +`ResultSet column names: ${resultSet.columnNames}`);
        expect(resultSet.columnNames.length > 0).assertTrue();
        console.info(domain, tag + TAG +`ResultSet column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount == 9).assertTrue();
        console.info(domain, tag + TAG +`ResultSet rowIndex:${resultSet.rowIndex}`);
        expect(resultSet.rowIndex == -1).assertTrue();
        console.info(domain, tag + TAG +`ResultSet isAtFirstRow: ${resultSet.isAtFirstRow}`);
        expect(resultSet.isAtFirstRow).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isAtLastRow: ${resultSet.isAtLastRow}`);
        expect(resultSet.isAtLastRow).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isEnded:${resultSet.isEnded}`);
        expect(resultSet.isEnded).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isStarted: ${resultSet.isStarted}`);
        expect(resultSet.isStarted).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet isClosed: ${resultSet.isClosed}`);
        expect(resultSet.isClosed).assertEqual(false);
        console.info(domain, tag + TAG +`ResultSet rowCount:${resultSet.rowCount}`);
        expect(resultSet.rowCount == 1).assertTrue();
      }catch(err) {
        console.error(domain, tag, TAG + `Query failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      console.info(domain, tag + TAG + '************* RelationalRdbStoreReturnValueAddTest_0073 end *************');
    })

    /**
     * @tc.name   RelationalRdbStoreReturnValueAddTest_0074
     * @tc.number SUB_DistributedData_RelationalRdbStoreReturnValueAddTest_0074
     * @tc.desc   the test of onDataChange
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStoreReturnValueAddTest_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.log(domain, tag + TAG + "************* RelationalRdbStoreReturnValueAddTest_0074 start *************");
      let status1 = 0;
      let storeObserver1 = (devices: Array<relationalStore.ChangeInfo>) => {
        console.info(domain, tag + TAG +"type:" + devices[0].type);
        expect(devices[0].type == 0).assertTrue();
        console.info(domain, tag + TAG +"table:" + devices[0].table);
        expect(devices[0].table).assertEqual("test");
        console.info(domain, tag + TAG +"inserted:" + JSON.stringify(devices[0].inserted));
        expect((devices[0].inserted).length == 1).assertTrue();
        console.info(domain, tag + TAG +"updated:" + JSON.stringify(devices[0].updated));
        expect((devices[0].updated).length == 0).assertTrue();
        console.info(domain, tag + TAG + "deleted:" + JSON.stringify(devices[0].deleted));
        expect((devices[0].deleted).length == 0).assertTrue();
        status1 = 1;
      };
      let rdbStore2: relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      expect(rdbStore2 != undefined).assertTrue();
      try {
        rdbStore?.onDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver1);
        const valueBucket: relationalStore.ValuesBucket = {
          'data1': 'zhangsan',
          'data2': 18 as long,
          'data3': 25000 as long,
        };
        rdbStore?.insertSync("test", valueBucket);
        await Utils.msSleep(5000)
        rdbStore?.offDataChange(relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver1);
      } catch (err) {
        console.error(domain, tag, TAG + `failed, code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      console.log(domain, tag + TAG + "************* RelationalRdbStoreReturnValueAddTest_0074 end *************");
    })
  })
}

