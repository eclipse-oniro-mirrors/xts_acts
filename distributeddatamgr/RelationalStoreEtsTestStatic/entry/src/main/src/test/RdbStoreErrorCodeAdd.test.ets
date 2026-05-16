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

const TAG = "[RELATIONAL_STORE_TEST]";
let rdbStore:relationalStore.RdbStore;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let context:common.UIAbilityContext;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const CREATE_ASSERT_TABLE_TEST = "CREATE TABLE IF NOT EXISTS asset_table (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 asset," + "data2 assets)";

const DROP_TEST = "DROP TABLE IF EXISTS test";

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
let STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbQuery.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
export default function RdbStoreErrorCodeAddTest() {
  describe('RdbStoreErrorCodeAddTest', (): void => {
    beforeAll(async (): Promise<void>  => {
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.helloworld");
      await Utils.msSleep(10000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll');
    });
    beforeEach(async (): Promise<void>  => {
      context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore!.executeSql(DROP_TEST);
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket: relationalStore.ValuesBucket = {
        'data1': 'zhangsan',
        'data2': 18 as Long,
        'data3': 25000.0,
        'data4': u8,
        'data5': asset1,
      };
      await rdbStore!.insert('test', valueBucket);
    })
    afterEach(async (): Promise<void>  => {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })
    afterAll(async () : Promise<void> => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name        LiteResultSetErrCode14800001Test003
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800001Test_0003
     * @tc.desc        getRow normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800001Test003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800001Test003 start *************");
        let predicates = new relationalStore.RdbPredicates('');
        predicates.equalTo("data1","lisi");
        let resultSet = await rdbStore!.queryWithoutRowCount(predicates);
        try {
          resultSet.getRow();
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800001Test003 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800001).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800001Test003 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800001Test006
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800001Test_0006
     * @tc.desc        isColumnNull normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800001Test006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800001Test006 start *************");
        let predicates = new relationalStore.RdbPredicates('');
        predicates.equalTo("data1","lisi");
        let resultSet = await rdbStore!.queryWithoutRowCount(predicates);
        try {
          resultSet.isColumnNull(1);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800001Test006 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800001).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800001Test006 end *************");
      })

    /**
     * @tc.name        RdbStoreSetErrCode14800001Test008
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800014Test_0008
     * @tc.desc        querySqlWithoutRowCountSync normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RdbStoreSetErrCode14800001Test008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* RdbStoreSetErrCode14800001Test008 start *************");
        try {
          rdbStore!.querySqlWithoutRowCountSync("");
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "RdbStoreSetErrCode14800001Test008 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800001).assertTrue();
          done()
        }
        console.log(TAG + "************* RdbStoreSetErrCode14800001Test008 end *************");
      })

    /**
     * @tc.name        RdbStoreSetErrCode14800001Test009
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800001Test_0009
     * @tc.desc        querySqlWithoutRowCountSync normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RdbStoreSetErrCode14800001Test009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* RdbStoreSetErrCode14800001Test009 start *************");
        const rdbTrans = await rdbStore!.createTransaction();
        try {
          rdbTrans.querySqlWithoutRowCountSync("");
          expect().assertFail();
          rdbTrans.rollback();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "RdbStoreSetErrCode14800001Test009 code %{public}d", err.code);
          rdbTrans.rollback();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800001).assertTrue();
          done()
        }
        console.log(TAG + "************* RdbStoreSetErrCode14800001Test009 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800012Test001
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800012Test_0100
     * @tc.desc        getBlob normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800012Test001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800012Test001 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        try {
          resultSet.getBlob(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800012Test001 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800012).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800012Test001 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800012Test002
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800012Test_0200
     * @tc.desc        getString normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800012Test002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800012Test002 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        try {
          resultSet.getString(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800012Test002 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800012).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800012Test002 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800012Test003
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800012Test_0300
     * @tc.desc        getLong normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800012Test003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800012Test003 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        try {
          resultSet.getLong(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800012Test003 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800012).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800012Test003 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800012Test004
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800012Test_0400
     * @tc.desc        getValue normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800012Test004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800012Test004 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        try {
          resultSet.getValue(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800012Test004 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800012).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800012Test004 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800012Test005
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800012Test_0500
     * @tc.desc        getDouble normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800012Test005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800012Test005 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        try {
          resultSet.getDouble(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800012Test005 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800012).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800012Test005 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800012Test006
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800012Test_0600
     * @tc.desc        getRow normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800012Test006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800012Test006 start *************");
        await rdbStore!.executeSql("delete from test");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        try {
          resultSet.getRow();
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800012Test006 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800012).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800012Test006 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800012Test008
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800012Test_0800
     * @tc.desc        isColumnNull normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800012Test008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800012Test008 start *************");
        await rdbStore!.executeSql("delete from test");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        try {
          resultSet.isColumnNull(5);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800012Test008 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800012).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800012Test008 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800012Test010
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800012Test_1000
     * @tc.desc        getAssets normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800012Test010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800012Test010 start *************");
        await rdbStore!.executeSql("delete from test");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        try {
          resultSet.getAssets(5);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800012Test010 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800012).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800012Test010 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800012Test0011
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800012Test_1100
     * @tc.desc        getAsset normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800012Test0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800012Test0011 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        try {
          resultSet.getAsset(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800012Test0011 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800012).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800012Test0011 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800013Test001
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800013Test_0100
     * @tc.desc        getColumnName normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800013Test001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800013Test001 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getColumnName(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800013Test001 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800013).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800013Test001 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800013Test002
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800013Test_0200
     * @tc.desc        getBlob normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800013Test002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800013Test002 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getBlob(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800013Test002 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800013).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800013Test002 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800013Test003
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800013Test_0300
     * @tc.desc        getString normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800013Test003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800013Test003 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getString(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800013Test003 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800013).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800013Test003 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800013Test004
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800013Test_0400
     * @tc.desc        getLong normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800013Test004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800013Test004 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getLong(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800013Test004 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800013).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800013Test004 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800013Test005
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800013Test_0500
     * @tc.desc        getDouble normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800013Test005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800013Test005 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getDouble(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800013Test005 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800013).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800013Test005 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800013Test006
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800013Test_0600
     * @tc.desc        getAsset normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800013Test006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800013Test006 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getAsset(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800013Test006 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800013).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800013Test006 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800013Test007
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800013Test_0700
     * @tc.desc        getAssets normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800013Test007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800013Test007 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getAssets(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800013Test007 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800013).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800013Test007 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800013Test008
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800013Test_0800
     * @tc.desc        getColumnName normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800013Test008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800013Test008 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getValue(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800013Test008 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800013).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800013Test008 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800013Test009
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800013Test_0900
     * @tc.desc        isColumnNull normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800013Test009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800013Test009 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.isColumnNull(9);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800013Test009 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800013).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800013Test009 end *************");
      })

    /**
     * @tc.name        RdbStoreSetErrCode14800014Test001
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800014Test_0100
     * @tc.desc        queryWithoutRowCount normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RdbStoreSetErrCode14800014Test001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* RdbStoreSetErrCode14800014Test001 start *************");
        let predicates = new relationalStore.RdbPredicates('test');
        predicates.equalTo("data1","zhangsan");
        await rdbStore!.close();
        setTimeout(() => {}, 1000)
        try {
          await rdbStore!.queryWithoutRowCount(predicates);
          expect().assertFail();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "RdbStoreSetErrCode14800014Test001 code %{public}d", err.code);
          expect(err.code === 14800014).assertTrue();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done()
        }
        console.log(TAG + "************* RdbStoreSetErrCode14800014Test001 end *************");
      })

    /**
     * @tc.name        RdbStoreSetErrCode14800014Test002
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800014Test_0200
     * @tc.desc        queryWithoutRowCountSync normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RdbStoreSetErrCode14800014Test002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* RdbStoreSetErrCode14800014Test002 start *************");
        let predicates = new relationalStore.RdbPredicates('test');
        predicates.equalTo("data1","zhangsan");
        await rdbStore!.close();
        try {
          rdbStore!.queryWithoutRowCountSync(predicates);
          expect().assertFail();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "RdbStoreSetErrCode14800014Test002 code %{public}d", err.code);
          expect(err.code === 14800014).assertTrue();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        }
        console.log(TAG + "************* RdbStoreSetErrCode14800014Test002 end *************");
      })

    /**
     * @tc.name        RdbStoreSetErrCode14800014Test003
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800014Test_0300
     * @tc.desc        querySqlWithoutRowCount normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RdbStoreSetErrCode14800014Test003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* RdbStoreSetErrCode14800014Test003 start *************");
        await rdbStore!.close();
        try {
          await rdbStore!.querySqlWithoutRowCount("SELECT * FROM test");
          expect().assertFail();

          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "RdbStoreSetErrCode14800014Test003 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* RdbStoreSetErrCode14800014Test003 end *************");
      })

    /**
     * @tc.name        RdbStoreSetErrCode14800014Test004
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800014Test_0400
     * @tc.desc        querySqlWithoutRowCountSync normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('RdbStoreSetErrCode14800014Test004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* RdbStoreSetErrCode14800014Test004 start *************");
        await rdbStore!.close();
        try {
          rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
          expect().assertFail();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "RdbStoreSetErrCode14800014Test004 code %{public}d", err.code);
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* RdbStoreSetErrCode14800014Test004 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test001
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_0100
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test001 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet!.close();
        try {
          resultSet!.getColumnIndex("data1");
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test001 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test001 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test002
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_0200
     * @tc.desc        getColumnName normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test002 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet!.close();
        try {
          resultSet!.getColumnName(0);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test002 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test002 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test005
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_0500
     * @tc.desc        getColumnNames normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test005 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.close();
        try {
          const names = resultSet.getColumnNames();
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test005 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test005 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test006
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_0600
     * @tc.desc        getCurrentRowData normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test006 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const rowData = resultSet.getCurrentRowData();
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test006 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test006 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test007
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_0700
     * @tc.desc        getCurrentRowData normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test007 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.close();
        try {
          resultSet.goToNextRow();
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test007 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test007 end *************");
      })


    /**
     * @tc.name        LiteResultSetErrCode14800014Test008
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_0800
     * @tc.desc        getBlob normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test008 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const name = resultSet.getBlob(resultSet.getColumnIndex("zhangsan"));
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test008 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test008 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test009
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_0900
     * @tc.desc        getString normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test009 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const name = resultSet.getString(resultSet.getColumnIndex("data1"));
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test009 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test009 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test010
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_1000
     * @tc.desc        getLong normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test010 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const age = resultSet.getLong(resultSet.getColumnIndex("data2"));
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test010 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test010 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test011
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_1100
     * @tc.desc        getDouble normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test011 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const salary = resultSet.getDouble(resultSet.getColumnIndex("data4"));
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test011 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test011 end *************");
      })


    /**
     * @tc.name        LiteResultSetErrCode14800014Test012
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_1200
     * @tc.desc        getValue normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test012 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const name = resultSet.getValue(resultSet.getColumnIndex("data1"));
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test012 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test012 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test013
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_1300
     * @tc.desc        getRow normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test013 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const rowData = resultSet.getRow();
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test013 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test013 end *************");
      })


    /**
     * @tc.name        LiteResultSetErrCode14800014Test014
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_1400
     * @tc.desc        getRows normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test014 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          await resultSet.getRows(1);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test014 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test014 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test015
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_1500
     * @tc.desc        getRowsData normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test015 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          let rowsData = await resultSet.getRowsData(3);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test015 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test015 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test016
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_1600
     * @tc.desc        isColumnNull normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test016 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const name = resultSet.isColumnNull(resultSet.getColumnIndex("data1"));
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test016 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test016 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test017
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_1700
     * @tc.desc        getAsset normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test017 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const doc = resultSet.getAsset(resultSet.getColumnIndex("zhangsan"));
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test017 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done()
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test017 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800014Test018
     * @tc.number      SUB_DistributedData_RelationalStore_LiteResultSetErrCode14800014Test_1800
     * @tc.desc        getAssets normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800014Test018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800014Test018 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        resultSet.close();
        try {
          const doc = resultSet.getAssets(resultSet.getColumnIndex("zhangsan"));
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800014Test018 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800014).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800014Test018 end *************");
      })
    /**
     * @tc.name        LiteResultSetErrCode14800019Test001
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800019Test_0100
     * @tc.desc        goToNextRow normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800019Test001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800019Test001 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("DELETE  FROM test");
        try {
          resultSet.goToNextRow();
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800019Test001 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800019).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800019Test001 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800019Test002
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800019Test_0200
     * @tc.desc        getRow normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800019Test002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800019Test002 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("DELETE  FROM test");
        try {
          resultSet.getRow();
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800019Test002 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800019).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800019Test002 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800019Test004
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800019Test_0400
     * @tc.desc        isColumnNull normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800019Test004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800019Test004 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("DELETE  FROM test");
        try {
          resultSet.isColumnNull(2);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800019Test004 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800019).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800019Test004 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800019Test005
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800019Test_0500
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800019Test005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800019Test005 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("DELETE  FROM test");
        try {
          resultSet.getColumnIndex("data1");
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800019Test005 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800019).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800019Test005 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800019Test006
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800019Test_0600
     * @tc.desc        getColumnName normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800019Test006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800019Test006 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("DELETE  FROM test");
        try {
          resultSet.getColumnName(1);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800019Test006 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800019).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800019Test006 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800021Test002
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800021Test_0100
     * @tc.desc        getRow normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800021Test002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800021Test002 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test1");
        try {
          resultSet.getRow();
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800021Test0021111 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800021).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800021Test002 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800021Test003
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800021Test_0300
     * @tc.desc        isColumnNull normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800021Test003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800021Test003 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test1");

        try {
          resultSet.isColumnNull(6);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800021Test003 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800021).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800021Test003 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800021Test004
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800021Test_0400
     * @tc.desc        getColumnIndex normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800021Test004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800021Test004 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test1");
        try {
          resultSet.getColumnIndex("data1");
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800021Test004 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800021).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800021Test004 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800021Test005
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800021Test_0500
     * @tc.desc        getRow normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800021Test005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800021Test005 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test1");
        try {
          resultSet.getColumnName(1);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800021Test005 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800021).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800021Test005 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800021Test006
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800021Test_0600
     * @tc.desc        goToNextRow normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800021Test006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800021Test006 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test1");
        try {
          resultSet.goToNextRow();
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800021Test006 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800021).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800021Test006 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800041Test001
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800041Test_0100
     * @tc.desc        getAssets normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800041Test001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800041Test001 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getAssets(2);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800041Test001 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800041).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800041Test001 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800041Test002
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800041Test_0200
     * @tc.desc        getAsset normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800041Test002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800041Test002 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getAsset(2);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800021Test0041111 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800041).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800041Test002 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800041Test003
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800041Test_0300
     * @tc.desc        getDouble normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800041Test003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800041Test003 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getDouble(5);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800041Test003 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800041).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800041Test003 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800041Test004
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800041Test_0400
     * @tc.desc        getLong normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800041Test004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800041Test004 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getLong(5);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800041Test004 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800041).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800041Test004 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800041Test005
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800041Test_0500
     * @tc.desc        getString normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800041Test005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800041Test005 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getString(5);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800041Test005 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800041).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800041Test005 end *************");
      })

    /**
     * @tc.name        LiteResultSetErrCode14800041Test006
     * @tc.number      SUB_DistributedData_RelationalStore_RdbStoreSetErrCode14800041Test_0600
     * @tc.desc        getBlob normal test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('LiteResultSetErrCode14800041Test006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG +
          "************* LiteResultSetErrCode14800041Test006 start *************");
        let resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test");
        resultSet.goToNextRow();
        try {
          resultSet.getBlob(5);
          expect().assertFail();
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch(err: BusinessError) {
          hilog.info(domain, tag, "LiteResultSetErrCode14800041Test006 code %{public}d", err.code);
          await rdbStore!.close();
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          expect(err.code === 14800041).assertTrue();
          done();
        }
        console.log(TAG + "************* LiteResultSetErrCode14800041Test006 end *************");
      })
  })
}