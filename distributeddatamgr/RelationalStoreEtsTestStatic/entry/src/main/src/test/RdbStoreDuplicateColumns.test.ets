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


let rdbStore:relationalStore.RdbStore;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let context:common.UIAbilityContext;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name text," + "age long, " + "data1 real," + "data2 blob)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name text," + "age long, " + "data3 asset," + "data4 assets)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbQueryResultSet.db",
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

function checkAssetEqual(assetEq1 : relationalStore.Asset, assetEq2 : relationalStore.Asset) : boolean
{
  hilog.info(domain, tag, '%{public}s', `queryGetRowsData_001 begin1: ${assetEq1.name},${assetEq2.name}`);
  hilog.info(domain, tag, '%{public}s', `queryGetRowsData_001 begin2: ${assetEq1.uri},${assetEq2.uri}`);
  hilog.info(domain, tag, '%{public}s', `queryGetRowsData_001 begin3: ${assetEq1.createTime},${assetEq2.createTime}`);
  hilog.info(domain, tag, '%{public}s', `queryGetRowsData_001 begin4: ${assetEq1.modifyTime},${assetEq2.modifyTime}`);
  hilog.info(domain, tag, '%{public}s', `queryGetRowsData_001 begin5: ${assetEq1.size},${assetEq2.size}`);
  hilog.info(domain, tag, '%{public}s', `queryGetRowsData_001 begin6: ${assetEq1.path},${assetEq2.path}`);
  hilog.info(domain, tag, '%{public}s', `queryGetRowsData_001 begin7: ${assetEq1.status},${assetEq2.status}`);
  return assetEq1.name == assetEq2.name && assetEq1.uri == assetEq2.uri &&
    assetEq1.createTime == assetEq2.createTime && assetEq1.modifyTime == assetEq2.modifyTime &&
    assetEq1.size == assetEq2.size && assetEq1.path == assetEq2.path;
}

function checkAssetsEqual(assetsEq1 : relationalStore.Assets, assetsEq2 : relationalStore.Assets) : boolean
{
  if (assetsEq1.length == assetsEq2.length) {
    hilog.info(domain, tag, '%{public}s', 'queryGetRowsData_001 checkAssetsEqual begin');
    for (let i = 0; i < assetsEq1.length; ++i) {
      hilog.info(domain, tag, '%{public}s', `queryGetRowsData_001 checkAssetsEqual begin: ${i}`);
      if (!checkAssetEqual(assetsEq1[i], assetsEq2[i])) {
        return false;
      }
    }
    hilog.info(domain, tag, '%{public}s', 'queryGetRowsData_001 checkAssetsEqual true start');
    return true;
  }
  return false;
}

export default function RdbStoreDuplicateColumnsTest() {

  describe("RdbStoreDuplicateColumnsTest", (): void => {
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
          await rdbStore.execute(CREATE_TABLE_TEST1);
          let u8 = new Uint8Array([1, 2, 3])
          const valueBucket: relationalStore.ValuesBucket = {
            'name': 'zhangsan',
            'age': 18 as long,
            'data1': 25000.0,
            'data2': u8,
          };
          const valueBucket1: relationalStore.ValuesBucket = {
            'name': 'lisi',
            'age': 20 as long,
            'data1': 20000.0,
            'data2': u8,
          };
          const assets2 = [asset1, asset2];
          const valueBucket2: relationalStore.ValuesBucket = {
            'name': 'liming',
            'age': 22 as long,
            'data3': asset1,
            'data4': assets2,
          };
          const valueBucket3: relationalStore.ValuesBucket = {
            'name': 'lifei',
            'age': 24 as long,
            'data3': asset1,
            'data4': assets2,
          };
          await rdbStore!.insert('test', valueBucket);
          await rdbStore!.insert('test', valueBucket1);
          await rdbStore!.insert('test1', valueBucket2);
          await rdbStore!.insert('test1', valueBucket3);
          hilog.info(domain, tag, '%{public}s', 'beforeAll successful');
        }
      } catch (error) {
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
        hilog.info(domain, tag, '%{public}s', 'afterAll successful');
        rdbStore.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'afterAll failed');
        expect().assertFail();
      }
    })

    /**
     * @tc.name        queryCurrentRowData_001
     * @tc.number      SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0001
     * @tc.desc        multi-table querySql with getCurrentRowData test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('queryCurrentRowData_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_001 start *************");
      let resultSet : relationalStore.ResultSet;
      try {
        if (rdbStore != undefined) {
          resultSet = await rdbStore.querySql("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
          if (resultSet.goToFirstRow()) {
            const assets2 = [asset1, asset2];
            let u8 = new Uint8Array([1, 2, 3])
            let rowData = resultSet.getCurrentRowData();
            hilog.error(domain, tag, '%{public}s',`queryCurrentRowData_001 failed：:${rowData.length}` );
            for (let i = 0; i < 10; ++i) {
              hilog.error(domain, tag, '%{public}s',`queryCurrentRowData_001 failed：${i}:${rowData[i]}` );
            }
            expect(rowData[0] == 1).assertTrue();
            expect(rowData[1] == "zhangsan").assertTrue();
            expect(rowData[2] == 18).assertTrue();
            expect(rowData[3] == 25000.0).assertTrue();
            let rowU8 = rowData[4] as Uint8Array;
            for(let i = 0; i < u8.length; ++i) {
              expect(rowU8[i] == u8[i]).assertTrue();
            }
            expect(rowData[5] == 1).assertTrue();
            expect(rowData[6] == "liming").assertTrue();
            expect(rowData[7] == 22).assertTrue();
            expect(checkAssetEqual(rowData[8] as relationalStore.Asset, asset1)).assertTrue();
            expect(checkAssetsEqual(rowData[9] as relationalStore.Assets, assets2)).assertTrue();
          }
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryCurrentRowData_001 failed message:${e.message} code:${e.code}`);
        expect().assertFail();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_001 end *************");
    })

    /**
     * @tc.name        queryGetRowsData_001
     * @tc.number      SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0002
     * @tc.desc        multi-table querySql with getRowsData test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('queryGetRowsData_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_001 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        let u8 = new Uint8Array([1, 2, 3])
        const assets2 = [asset1, asset2];
        let rowsData = await resultSet.getRowsData(1, 0);
        expect(rowsData[0][0] == 1).assertTrue();
        expect(rowsData[0][1] == "zhangsan").assertTrue();
        expect(rowsData[0][2] == 18).assertTrue();
        expect(rowsData[0][3] == 25000.0).assertTrue();
        let rowU8 = rowsData[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(rowU8[i] == u8[i]).assertTrue();
        }
        expect(rowsData[0][5] == 1).assertTrue();
        expect(rowsData[0][6] == "liming").assertTrue();
        expect(rowsData[0][7] == 22).assertTrue();
        expect(checkAssetEqual(rowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowsData[0][9] as relationalStore.Assets, assets2)).assertTrue();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_001 failed message:${e.message} code:${e.code}`);
        expect().assertFail();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',`************* queryGetRowsData_001 end *************`);
    })

    /**
     * @tc.name   queryGetColumnNames_001
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0003
     * @tc.desc   multi-table querySql with queryGetColumnNames test
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetColumnNames_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetColumnNames_001 start *************");
      let resultSet : relationalStore.ResultSet;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        let columnNames = resultSet.getColumnNames();
        console.log(`columnNames is ${columnNames}`)
        expect(columnNames[0] == "id").assertTrue();
        expect(columnNames[1] == "name").assertTrue();
        expect(columnNames[2] == "age").assertTrue();
        expect(columnNames[3] == "data1").assertTrue();
        expect(columnNames[4] == "data2").assertTrue();
        expect(columnNames[5] == "id").assertTrue();
        expect(columnNames[6] == "name").assertTrue();
        expect(columnNames[7] == "age").assertTrue();
        expect(columnNames[8] == "data3").assertTrue();
        expect(columnNames[9] == "data4").assertTrue();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetColumnNames_001 failed message:${e.message} code:${e.code}`);
        expect().assertFail();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetColumnNames_001 end *************");
    })

    /**
     * @tc.name   queryCurrentRowData_003
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0004
     * @tc.desc   getCurrentRowData test with resultSet already close.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_003 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      resultSet = await rdbStore.querySql("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
      resultSet!.close();
      try {
        const rowData = resultSet.getCurrentRowData();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryCurrentRowData_003 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800014).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_003 end *************");
    })

    /**
     * @tc.name   queryCurrentRowData_004
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0005
     * @tc.desc   getCurrentRowData test with resultSet querySql no such table.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_004 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test2");
        resultSet.getCurrentRowData();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryCurrentRowData_004 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800021).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_004 end *************");
    })


    /**
     * @tc.name   queryCurrentRowData_005
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0006
     * @tc.desc   getCurrentRowData test with resultSet querySql input create table sql.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_005 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql(CREATE_TABLE_TEST);
        resultSet.getCurrentRowData();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryCurrentRowData_005 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800019).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_005 end *************");
    })

    /**
     * @tc.name   queryCurrentRowData_006
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0007
     * @tc.desc   getCurrentRowData test with resultSet querySql input sql size less then 3.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_006 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("se");
        resultSet.getCurrentRowData();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryCurrentRowData_006 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_006 end *************");
    })

    /**
     * @tc.name   queryCurrentRowData_007
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0008
     * @tc.desc   getCurrentRowData test with resultSet is empty.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryCurrentRowData_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_007 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test where id = 2");
        resultSet.getCurrentRowData();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryCurrentRowData_007 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800012).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryCurrentRowData_007 end *************");
    })

    /**
     * @tc.name   queryGetRowsData_003
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0009
     * @tc.desc   getRowsData test with resultSet already close.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_003 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        resultSet.close();
        await resultSet.getRowsData(1);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_003 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800014).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_003 end *************");
    })

    /**
     * @tc.name   queryGetRowsData_004
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0010
     * @tc.desc   getRowsData test with resultSet querySql no such table.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_004 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test2");
        await resultSet.getRowsData(1);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_004 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800021).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_004 end *************");
    })

    /**
     * @tc.name   queryGetRowsData_005
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0011
     * @tc.desc   getRowsData test with resultSet querySql input create table sql.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_005 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql(CREATE_TABLE_TEST);
        await resultSet.getRowsData(1);
        expect().assertFail();
      } catch(e:BusinessError) {
        console.error(`queryGetRowsData_005 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800019).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_005 end *************");
    })

    /**
     * @tc.name   queryGetRowsData_006
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0012
     * @tc.desc   getRowsData test with resultSet querySql input sql size less then 3.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_006 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("se");
        await resultSet.getRowsData(1);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_006 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_006 end *************");
    })

    /**
     * @tc.name   queryGetRowsData_007
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0013
     * @tc.desc   getRowsData test with resultSet is empty.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_007 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test where id = 3");
        await resultSet.getRowsData(1,1);
        expect().assertFail();
      } catch(e:BusinessError) {
        console.error(`queryGetRowsData_007 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800012).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_007 end *************");
    })

    /**
     * @tc.name   queryGetRowsData_008
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0014
     * @tc.desc   getRowsData test with input maxCount out of resultSet rows.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_008 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_008 query 111 IS `);
        resultSet = await rdbStore.querySql("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_008 query 222 IS `);
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_008 111 IS `);
        let rowsDataAll = await resultSet.getRowsData(4);
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_008 222 IS:${rowsDataAll} `);
        expect(rowsDataAll[0][0] == 1).assertTrue();
        expect(rowsDataAll[0][1] == "zhangsan").assertTrue();
        expect(rowsDataAll[0][2] == 18).assertTrue();
        expect(rowsDataAll[0][3] == 25000.0).assertTrue();
        let rowU8 = rowsDataAll[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(rowU8[i] == u8[i]).assertTrue();
        }
        expect(rowsDataAll[0][5] == 1).assertTrue();
        expect(rowsDataAll[0][6] == "liming").assertTrue();
        expect(rowsDataAll[0][7] == 22).assertTrue();
        expect(checkAssetEqual(rowsDataAll[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowsDataAll[0][9] as relationalStore.Assets, assets2)).assertTrue();
        expect(rowsDataAll[1][0] == 2).assertTrue();
        expect(rowsDataAll[1][1] == "lisi").assertTrue();
        expect(rowsDataAll[1][2] == 20).assertTrue();
        expect(rowsDataAll[1][3] == 20000.0).assertTrue();
        rowU8 = rowsDataAll[1][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(rowU8[i] == u8[i]).assertTrue();
        }
        expect(rowsDataAll[1][5] == 2).assertTrue();
        expect(rowsDataAll[1][6] == "lifei").assertTrue();
        expect(rowsDataAll[1][7] == 24).assertTrue();
        expect(checkAssetEqual(rowsDataAll[1][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowsDataAll[1][9] as  relationalStore.Assets, assets2)).assertTrue();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_008 failed message:${e.message} code:${e.code}`);
        expect().assertFail();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_008 end *************");
    })

    /**
     * @tc.name   queryGetRowsData_009
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0015
     * @tc.desc   getRowsData test with input maxCount is -1.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_009 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test where id = 1");
        await resultSet.getRowsData(-1);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_009 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_009 end *************");
    })

    /**
     * @tc.name   queryGetRowsData_011
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0016
     * @tc.desc   getRowsData test with input maxCount and position are -1.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_011 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test where id = 1");
        await resultSet.getRowsData(-1, -1);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_011 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_011 end *************");
    })

    /**
     * @tc.name   queryGetRowsData_012
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0017
     * @tc.desc   getRowsData test with input maxCount -1 and position is 0.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_012 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test where id = 1");
        await resultSet.getRowsData(-1, 0);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_012 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_012 end *************");
    })

    /**
     * @tc.name   queryGetRowsData_013
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0018
     * @tc.desc   getRowsData test with input 1 resultSet position.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_013 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];
        let rowsData = await resultSet.getRowsData(1,1);
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_013 success ${rowsData}`);
        expect(rowsData.length == 1).assertTrue();
        expect(rowsData[0][0] == 2).assertTrue();
        expect(rowsData[0][1] == "lisi").assertTrue();
        expect(rowsData[0][2] == 20).assertTrue();
        expect(rowsData[0][3] == 20000.0).assertTrue();
        let rowU8 = rowsData[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(rowU8[i] == u8[i]).assertTrue();
        }
        expect(rowsData[0][5] == 2).assertTrue();
        expect(rowsData[0][6] == "lifei").assertTrue();
        expect(rowsData[0][7] == 24).assertTrue();
        expect(checkAssetEqual(rowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(rowsData[0][9] as  relationalStore.Assets, assets2)).assertTrue();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_013 failed message:${e.message} code:${e.code}`);
        expect().assertFail();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_013 end *************");
    })

    /**
     * @tc.name   queryGetRowsData_014
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0019
     * @tc.desc   getRowsData test with input maxCount 0.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetRowsData_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_014 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test where id = 1");
        await resultSet.getRowsData(0);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetRowsData_014 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetRowsData_014 end *************");
    })

    /**
     * @tc.name   queryGetColumnNames_002
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0020
     * @tc.desc   getColumnNames test with resultSet already close.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetColumnNames_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetColumnNames_002 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        resultSet.close();
        resultSet.getColumnNames();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetColumnNames_002 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800014).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetColumnNames_002 end *************");
    })

    /**
     * @tc.name   queryGetColumnNames_003
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0021
     * @tc.desc   getColumnNames test with resultSet querySql no such table.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetColumnNames_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetColumnNames_003 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("SELECT * FROM test2");
        resultSet.getColumnNames();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetColumnNames_003 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800021).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetColumnNames_003 end *************");
    })

    /**
     * @tc.name   queryGetColumnNames_005
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0022
     * @tc.desc   getColumnNames test with resultSet querySql input sql size less then 3.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('queryGetColumnNames_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* queryGetColumnNames_005 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore.querySql("se");
        resultSet.getColumnNames();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`queryGetColumnNames_005 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      if (resultSet != undefined) {
        resultSet.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* queryGetColumnNames_005 end *************");
    })

    /**
     * @tc.name   lite_queryCurrentRowData_001
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0023
     * @tc.desc   multi-table querySqlWithoutRowCount with getCurrentRowData and getRow comparison test
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_001 start *************");
      let liteResultSet : relationalStore.LiteResultSet;
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];
        liteResultSet.goToNextRow();
        let liteRowData = liteResultSet.getCurrentRowData();
        expect(liteRowData[0] == 1).assertTrue();
        expect(liteRowData[1] == "zhangsan").assertTrue();
        expect(liteRowData[2] == 18).assertTrue();
        expect(liteRowData[3] == 25000.0).assertTrue();
        let rowU8 = liteRowData[4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(rowU8[i] == u8[i]).assertTrue();
        }
        expect(liteRowData[5] == 1).assertTrue();
        expect(liteRowData[6] == "liming").assertTrue();
        expect(liteRowData[7] == 22).assertTrue();
        expect(checkAssetEqual(liteRowData[8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteRowData[9] as  relationalStore.Assets, assets2)).assertTrue();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryCurrentRowData_001 failed message:${e.message} code:${e.code}`);
        expect().assertFail();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_001 end *************");
    })

    /**
     * @tc.name   lite_queryCurrentRowData_003
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0024
     * @tc.desc   liteResultSet.getCurrentRowData test with liteResultSet already close.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_003 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        liteResultSet.close();
        liteResultSet.getCurrentRowData();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryCurrentRowData_003 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800014).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_003 end *************");
    })

    /**
     * @tc.name   lite_queryCurrentRowData_004
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0025
     * @tc.desc   liteResultSet.getCurrentRowData test with querySqlWithoutRowCount no such table.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_004 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test2");
        liteResultSet.getCurrentRowData();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryCurrentRowData_004 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800021).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_004 end *************");
    })

    /**
     * @tc.name   lite_queryCurrentRowData_005
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0026
     * @tc.desc   liteResultSet.getCurrentRowData test with querySqlWithoutRowCount input create table sql.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_005 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount(CREATE_TABLE_TEST);
        liteResultSet.getCurrentRowData();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryCurrentRowData_005 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800019).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_005 end *************");
    })

    /**
     * @tc.name   lite_queryCurrentRowData_006
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0027
     * @tc.desc   liteResultSet.getCurrentRowData test with querySqlWithoutRowCount input sql size less then 3.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_006 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("se");
        liteResultSet.getCurrentRowData();
        expect().assertFail();

      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryCurrentRowData_006 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_006 end *************");
    })

    /**
     * @tc.name   lite_queryCurrentRowData_007
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0028
     * @tc.desc   getCurrentRowData test with liteResultSet is empty.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryCurrentRowData_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_007 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test where id = 2");
        liteResultSet.getCurrentRowData();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryCurrentRowData_007 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800012).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryCurrentRowData_007 end *************");
    })

    /**
     * @tc.name   lite_queryGetRowsData_001
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0029
     * @tc.desc   multi-table querySqlWithoutRowCount with getRowsData and getRows comparison test
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_001 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await
        rdbStore.querySqlWithoutRowCount("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];
        let liteRowsData = await liteResultSet.getRowsData(1, 0);
        expect(liteRowsData[0][0] == 1).assertTrue();
        expect(liteRowsData[0][1] == "zhangsan").assertTrue();
        expect(liteRowsData[0][2] == 18).assertTrue();
        expect(liteRowsData[0][3] == 25000.0).assertTrue();
        let rowU8 = liteRowsData[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(rowU8[i] == u8[i]).assertTrue();
        }
        expect(liteRowsData[0][5] == 1).assertTrue();
        expect(liteRowsData[0][6] == "liming").assertTrue();
        expect(liteRowsData[0][7] == 22).assertTrue();
        expect(checkAssetEqual(liteRowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteRowsData[0][9] as  relationalStore.Assets, assets2)).assertTrue();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetRowsData_001 failed message:${e.message} code:${e.code}`);
        liteResultSet.close();
        expect().assertFail();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_001 end *************");
    })

    /**
     * @tc.name   lite_queryGetRowsData_003
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0030
     * @tc.desc   liteResultSet.getRowsData test with liteResultSet already close.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_003 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        liteResultSet.close();
        await liteResultSet.getRowsData(1);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetRowsData_003 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800014).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_003 end *************");
    })

    /**
     * @tc.name   lite_queryGetRowsData_004
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0031
     * @tc.desc   liteResultSet.getRowsData test with querySqlWithoutRowCount no such table.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_004 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test2");
        await liteResultSet.getRowsData(1);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetRowsData_004 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800021).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_004 end *************");
    })

    /**
     * @tc.name   lite_queryGetRowsData_005
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0032
     * @tc.desc   liteResultSet.getRowsData test with querySqlWithoutRowCount input create table sql.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_005 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount(CREATE_TABLE_TEST);
        await liteResultSet.getRowsData(1);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetRowsData_005 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800019).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_005 end *************");
    })

    /**
     * @tc.name   lite_queryGetRowsData_006
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0033
     * @tc.desc   liteResultSet.getRowsData test with querySqlWithoutRowCount input sql size less then 3.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_006 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("se");
        await liteResultSet.getRowsData(1);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetRowsData_006 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_006 end *************");
    })


    /**
     * @tc.name   lite_queryGetRowsData_007
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0034
     * @tc.desc   liteResultSet.getRowsData test with resultSet is empty.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_007 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test where id = 3");
        await liteResultSet.getRowsData(1,1);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetRowsData_007 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800012).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_006 end *************");
    })

    /**
     * @tc.name   lite_queryGetRowsData_008
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0035
     * @tc.desc   getRowsData test with input maxCount out of liteResultSet rows.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_008 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet =
          await rdbStore.querySqlWithoutRowCount("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];
        let liteRowsDataAll = await liteResultSet.getRowsData(4);
        expect(liteRowsDataAll.length == 2).assertTrue();
        expect(liteRowsDataAll[0][0] == 1).assertTrue();
        expect(liteRowsDataAll[0][1] == "zhangsan").assertTrue();
        expect(liteRowsDataAll[0][2] == 18).assertTrue();
        expect(liteRowsDataAll[0][3] == 25000.0).assertTrue();
        let rowU8 = liteRowsDataAll[0][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(rowU8[i] == u8[i]).assertTrue();
        }
        expect(liteRowsDataAll[0][5] == 1).assertTrue();
        expect(liteRowsDataAll[0][6] == "liming").assertTrue();
        expect(liteRowsDataAll[0][7] == 22).assertTrue();
        expect(checkAssetEqual(liteRowsDataAll[0][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteRowsDataAll[0][9] as  relationalStore.Assets, assets2)).assertTrue();
        expect(liteRowsDataAll[1][0] == 2).assertTrue();
        expect(liteRowsDataAll[1][1] == "lisi").assertTrue();
        expect(liteRowsDataAll[1][2] == 20).assertTrue();
        expect(liteRowsDataAll[1][3] == 20000.0).assertTrue();
        rowU8 = liteRowsDataAll[1][4] as Uint8Array;
        for(let i = 0; i < u8.length; ++i) {
          expect(rowU8[i] == u8[i]).assertTrue();
        }
        expect(liteRowsDataAll[1][5] == 2).assertTrue();
        expect(liteRowsDataAll[1][6] == "lifei").assertTrue();
        expect(liteRowsDataAll[1][7] == 24).assertTrue();
        expect(checkAssetEqual(liteRowsDataAll[1][8] as relationalStore.Asset, asset1)).assertTrue();
        expect(checkAssetsEqual(liteRowsDataAll[1][9] as  relationalStore.Assets, assets2)).assertTrue();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetRowsData_008 failed message:${e.message} code:${e.code}`);
        liteResultSet.close();
        expect().assertFail();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_008 end *************");
    })

    /**
     * @tc.name   lite_queryGetRowsData_009
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0036
     * @tc.desc   getRowsData test with input maxCount is -1.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_009 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test where id = 1");
        await liteResultSet.getRowsData(-1);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetRowsData_009 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_009 end *************");
    })

    /**
     * @tc.name   lite_queryGetRowsData_011
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0037
     * @tc.desc   getRowsData test with input maxCount and position are -1.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_011 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test where id = 1");
        if (liteResultSet) {
          await liteResultSet.getRowsData(-1, -1);
          expect().assertFail();
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetRowsData_011 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_011 end *************");
    })

    /**
     * @tc.name   lite_queryGetRowsData_012
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0038
     * @tc.desc   getRowsData test with input maxCount -1 and position is 0.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_012 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test where id = 1");
        if (liteResultSet) {
          await liteResultSet.getRowsData(-1, 0);
          expect().assertFail();
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetRowsData_012 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_012 end *************");
    })

    /**
     * @tc.name   lite_queryGetRowsData_013
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0039
     * @tc.desc   getRowsData test with input 1 liteResultSet position.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetRowsData_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_013 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet =
          await rdbStore.querySqlWithoutRowCount("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        let u8 = new Uint8Array([1, 2, 3]);
        const assets2 = [asset1, asset2];
        if (liteResultSet) {
          let rowsData = await liteResultSet.getRowsData(1,1);
          expect(rowsData.length == 1).assertTrue();
          expect(rowsData[0][0] == 2).assertTrue();
          expect(rowsData[0][1] == "lisi").assertTrue();
          expect(rowsData[0][2] == 20).assertTrue();
          expect(rowsData[0][3] == 20000.0).assertTrue();
          let rowU8 = rowsData[0][4] as Uint8Array;
          for(let i = 0; i < u8.length; ++i) {
            expect(rowU8[i] == u8[i]).assertTrue();
          }
          expect(rowsData[0][5] == 2).assertTrue();
          expect(rowsData[0][6] == "lifei").assertTrue();
          expect(rowsData[0][7] == 24).assertTrue();
          expect(checkAssetEqual(rowsData[0][8] as relationalStore.Asset, asset1)).assertTrue();
          expect(checkAssetsEqual(rowsData[0][9] as  relationalStore.Assets, assets2)).assertTrue();
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetRowsData_013 failed message:${e.message} code:${e.code}`);
        liteResultSet.close();
        expect().assertFail();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetRowsData_013 end *************");
    })

    /**
     * @tc.name   lite_queryGetColumnNames_001
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0040
     * @tc.desc   multi-table querySqlWithoutRowCount with getColumnNames test
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetColumnNames_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetColumnNames_001 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        let columnNames = liteResultSet.getColumnNames();
        console.log(`columnNames is ${columnNames}`)
        expect(columnNames[0] == "id").assertTrue();
        expect(columnNames[1] == "name").assertTrue();
        expect(columnNames[2] == "age").assertTrue();
        expect(columnNames[3] == "data1").assertTrue();
        expect(columnNames[4] == "data2").assertTrue();
        expect(columnNames[5] == "id").assertTrue();
        expect(columnNames[6] == "name").assertTrue();
        expect(columnNames[7] == "age").assertTrue();
        expect(columnNames[8] == "data3").assertTrue();
        expect(columnNames[9] == "data4").assertTrue();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetColumnNames_001 failed message:${e.message} code:${e.code}`);
        expect().assertFail();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetColumnNames_001 end *************");
    })

    /**
     * @tc.name   lite_queryGetColumnNames_002
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0041
     * @tc.desc   liteResultSet.getColumnNames test with liteResultSet already close.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetColumnNames_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetColumnNames_002 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test INNER JOIN test1 ON test.id = test1.id");
        liteResultSet.close();
        liteResultSet.getColumnNames();
        hilog.error(domain, tag, '%{public}s',`lite_queryGetColumnNames_002 success`);
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetColumnNames_002 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800014).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetColumnNames_002 end *************");
    })

    /**
     * @tc.name   lite_queryGetColumnNames_003
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0042
     * @tc.desc   liteResultSet.getColumnNames test with querySqlWithoutRowCount no such table.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetColumnNames_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetColumnNames_003 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("SELECT * FROM test2");
        liteResultSet.getColumnNames();
        expect().assertFail();
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetColumnNames_003 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800021).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetColumnNames_003 end *************");
    })

    /**
     * @tc.name   lite_queryGetColumnNames_004
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0043
     * @tc.desc   liteResultSet.getColumnNames test with querySqlWithoutRowCount input create table sql.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     *
     */
    it('lite_queryGetColumnNames_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetColumnNames_004 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount(CREATE_TABLE_TEST);
        if (liteResultSet) {
          liteResultSet.getColumnNames();
          expect().assertFail();
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetColumnNames_004 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800019).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetColumnNames_004 end *************");
    })

    /**
     * @tc.name   lite_queryGetColumnNames_005
     * @tc.number SUB_DistributedData_RelationalStore_rdbDuplicateColumnsTest_0044
     * @tc.desc   liteResultSet.getColumnNames test with querySqlWithoutRowCount input sql size less then 3.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('lite_queryGetColumnNames_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetColumnNames_005 start *************");
      let liteResultSet : relationalStore.LiteResultSet
      try {
        liteResultSet = await rdbStore.querySqlWithoutRowCount("se");
        if (liteResultSet) {
          liteResultSet.getColumnNames();
          expect().assertFail();
        }
      } catch(e:BusinessError) {
        hilog.error(domain, tag, '%{public}s',`lite_queryGetColumnNames_005 failed message:${e.message} code:${e.code}`);
        expect(e.code === 14800001).assertTrue();
      }
      liteResultSet.close();
      hilog.error(domain, tag, '%{public}s',"************* lite_queryGetColumnNames_005 end *************");
    })
  })
}