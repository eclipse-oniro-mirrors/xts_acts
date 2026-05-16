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
let context:common.UIAbilityContext | undefined;
const TAG = "[RelationalResultSetReturnValueIsNullTest]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 Long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name text," + "age long, " + "data3 asset," + "data4 assets)";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbQueryresultSet!.db",
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
const assets1 = [asset1];
export default function RelationalResultSetReturnValueAddTest() {

  describe("RelationalResultSetReturnValueAddTest", (): void => {
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
        if (rdbStore != undefined) {
          await rdbStore!.execute(CREATE_TABLE_TEST);
          let u8 = new Uint8Array([1, 2, 3]);
          const valueBucket: relationalStore.ValuesBucket = {
            "data1": "hello world",
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
        rdbStore!.close();
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'afterAll failed');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0001
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0001
     * @tc.desc   the test of getColumnNames.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalResultSetReturnValueAddTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* RelationalResultSetReturnValueAddTest_0001 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore!.queryWithoutRowCount(predicates);
        let name = resultSet!.getColumnNames();
        expect(name.length >0).assertTrue();
      } catch(err) {
        hilog.error(domain, tag, '%{public}s',`RelationalResultSetReturnValueAddTest_0001 failed message:${err.message} code:${err.code}`);
        expect().assertFalse();
      }
      if (resultSet != undefined) {
        resultSet!.close();
      }
      hilog.error(domain, tag, '%{public}s',"************* RelationalResultSetReturnValueAddTest_0001 end *************");
    })

    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0002
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0002
     * @tc.desc   getColumnIndex test first Parameter is "".
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalResultSetReturnValueAddTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',"************* RelationalResultSetReturnValueAddTest_0002 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore!.queryWithoutRowCount(predicates);
        let index = resultSet!.getColumnIndex("");
        expect().assertFail();
      } catch(err) {
        hilog.error(domain, tag, '%{public}s',`RelationalResultSetReturnValueAddTest_0002 failed message:${err.message} code:${err.code}`);
        expect(err.code).assertEqual(14800001);
      }
      if (resultSet != undefined) {
        resultSet!.close();
      }
      hilog.info(domain, tag, '%{public}s',"************* RelationalResultSetReturnValueAddTest_0002 end *************");
    })

    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0003
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0003
     * @tc.desc   The getColumnType traverse and overwrite
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalResultSetReturnValueAddTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      hilog.error(domain, tag, '%{public}s',"************* RelationalResultSetReturnValueAddTest_0003 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore!.queryWithoutRowCount(predicates);
        resultSet!.goToNextRow();
        let type = await resultSet!.getColumnType(resultSet!.getColumnIndex("id"))
        expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data1"));
        expect(type).assertEqual(relationalStore.ColumnType.TEXT);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data2"));
        expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data3"));
        expect(type).assertEqual(relationalStore.ColumnType.REAL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data4"));
        expect(type).assertEqual(relationalStore.ColumnType.BLOB);

        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data5"));
        expect(type).assertEqual(relationalStore.ColumnType.ASSET);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data6"));
        expect(type).assertEqual(relationalStore.ColumnType.ASSETS);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data7"));
        expect(type).assertEqual(relationalStore.ColumnType.FLOAT_VECTOR);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data8"));
        expect(type).assertEqual(relationalStore.ColumnType.UNLIMITED_INT);
        if (resultSet) {
          resultSet?.close();
        }
      } catch(err) {
        console.error(domain, tag, '%{public}s',`RelationalResultSetReturnValueAddTest_0003 failed:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      hilog.error(domain, tag, '%{public}s',"************* RelationalResultSetReturnValueAddTest_0003 end *************");
    })

    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0004
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0004
     * @tc.desc   The getColumnTypeSync traverse and overwrite
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalResultSetReturnValueAddTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.error(domain, tag, '%{public}s',"************* RelationalResultSetReturnValueAddTest_0004 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore!.queryWithoutRowCount(predicates);
        resultSet!.goToNextRow();
        let type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("id"))
        expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data1"));
        expect(type).assertEqual(relationalStore.ColumnType.TEXT);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data2"));
        expect(type).assertEqual(relationalStore.ColumnType.INTEGER);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data3"));
        expect(type).assertEqual(relationalStore.ColumnType.REAL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data4"));
        expect(type).assertEqual(relationalStore.ColumnType.BLOB);

        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data5"));
        expect(type).assertEqual(relationalStore.ColumnType.ASSET);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data6"));
        expect(type).assertEqual(relationalStore.ColumnType.ASSETS);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data7"));
        expect(type).assertEqual(relationalStore.ColumnType.FLOAT_VECTOR);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data8"));
        expect(type).assertEqual(relationalStore.ColumnType.UNLIMITED_INT);
        if (resultSet) {
          resultSet!.close();
        }
      } catch(err) {
        console.error(domain, tag, '%{public}s',`RelationalResultSetReturnValueAddTest_0004 failed:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      hilog.error(domain, tag, '%{public}s',"************* RelationalResultSetReturnValueAddTest_0004 end *************");
    })
    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0005
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0005
     * @tc.desc   isColumnNull normal test return value false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalResultSetReturnValueAddTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* RelationalResultSetReturnValueAddTest_0005 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore!.queryWithoutRowCount(predicates);
        resultSet!.goToNextRow();
        let data = resultSet?.isColumnNull(resultSet!.getColumnIndex("data6"));
        console.info(domain, tag, `RelationalResultSetReturnValueAddTest_0005 failed message:${data}`);
        expect(data).assertEqual(false);
      }catch (err){
        console.error(domain, tag, `RelationalResultSetReturnValueAddTest_0005 failed message:${err.message} code:${err.code}`);
        resultSet?.close();
        expect().assertFalse();
      }
      console.log(domain, tag, '%{public}s',"************* RelationalResultSetReturnValueAddTest_0005 end *************");
    })

    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0006
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0006
     * @tc.desc   isColumnNull normal test return value true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalResultSetReturnValueAddTest_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.error(domain, tag, '%{public}s',"************* RelationalResultSetReturnValueAddTest_0006 start *************");
      let resultSet : relationalStore.LiteResultSet | undefined;
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      let predicates = new relationalStore.RdbPredicates('test1');
      const valueBucket1: relationalStore.ValuesBucket = {
        "name": null,
      };
      await rdbStore!.insert('test1', valueBucket1);
      try {
        resultSet = await rdbStore!.queryWithoutRowCount(predicates);
        resultSet!.goToNextRow();
        let data = resultSet?.isColumnNull(resultSet!.getColumnIndex("name"));
        console.info(domain, tag, `RelationalResultSetReturnValueAddTest_0006 failed message:${data}`);
        expect(data).assertEqual(true);
      }catch (err){
        console.error(domain, tag, `RelationalResultSetReturnValueAddTest_0006 failed message:${err.message} code:${err.code}`);
        resultSet?.close();
        expect().assertFalse();
      }
      console.log(domain, tag, '%{public}s',"************* RelationalResultSetReturnValueAddTest_0006 end *************");
    })

    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0007
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0007
     * @tc.desc   goToNextRow normal test return value true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationalResultSetReturnValueAddTest_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(domain, tag, TAG + '************* RelationalResultSetReturnValueAddTest_0007 start *************');
      let predicates = new relationalStore.RdbPredicates('test');
      let resultSet = await rdbStore!.query(predicates);
      try{
        let data = resultSet!.goToNextRow()
        expect(data).assertEqual(true);
      }catch (err){
        console.error(domain, tag, `RelationalResultSetReturnValueAddTest_0007 failed message:${err.message} code:${err.code}`);
        resultSet?.close();
        expect().assertFalse();
      }
      console.info(domain, tag, TAG + '************* RelationalResultSetReturnValueAddTest_0007 end *************');

    })

    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0008
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0008
     * @tc.desc   goToNextRow normal test return value false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationalResultSetReturnValueAddTest_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(domain, tag, TAG + '************* RelationalResultSetReturnValueAddTest_0008 start *************');
      let predicates = new relationalStore.RdbPredicates('test');
      let resultSet = await rdbStore!.query(predicates);
      resultSet!.goToNextRow()
      try{
        let data = resultSet!.goToNextRow()
        expect(data).assertEqual(false);
        resultSet?.close();
      }catch (err){
        console.error(domain, tag, `RelationalResultSetReturnValueAddTest_0008 failed message:${err.message} code:${err.code}`);
        expect().assertFalse();
      }
      console.info(domain, tag, TAG + '************* RelationalResultSetReturnValueAddTest_0008 end *************');
    })

    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0009
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0009
     * @tc.desc   getRowsData normal test return value is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationalResultSetReturnValueAddTest_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.log(TAG + '************* RelationalResultSetReturnValueAddTest_0009 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore!.querySql("SELECT * FROM test");
        let asRowsData = await resultSet!.getRowsData(5);
        expect(asRowsData.length > 0).assertTrue();
      } catch(err) {
        console.error(domain, tag, `RelationalResultSetReturnValueAddTest_0009 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.info(domain, tag, TAG + '************* RelationalResultSetReturnValueAddTest_0009 end *************');
    })

    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0010
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0010
     * @tc.desc   getRows normal test return value is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationalResultSetReturnValueAddTest_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.log(TAG + '************* RelationalResultSetReturnValueAddTest_0010 start *************');
      let resultSet: relationalStore.LiteResultSet | undefined;
      resultSet = await rdbStore!.querySqlWithoutRowCount('select * from test');
      try {
        let rows: Array<relationalStore.ValuesBucket>;
        rows = await resultSet!.getRows(1);
        console.info(domain, tag, TAG + "rows.length is:" + rows.length);
        expect(rows.length > 0).assertTrue();
      } catch(err) {
        console.error(domain, tag, TAG + `RelationalResultSetReturnValueAddTest_0010 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.info(domain, tag, TAG + '************* RelationalResultSetReturnValueAddTest_0010 end *************');
    })

    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0011
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0011
     * @tc.desc   goToNextRow normal test return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationalResultSetReturnValueAddTest_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.log(TAG + '************* RelationalResultSetReturnValueAddTest_0011 start *************');
      let resultSet: relationalStore.LiteResultSet | undefined;
      resultSet = await rdbStore!.querySqlWithoutRowCount('select * from test');
      try {
        resultSet!.goToNextRow();
        const doc = resultSet!.getAsset(resultSet!.getColumnIndex("data5"));
        console.info(domain, tag, TAG + "doc.name:" + doc.name);
        expect(doc.name).assertEqual("name1");
        console.info(domain, tag, TAG + "doc.uri:" + doc.uri);
        expect(doc.uri).assertEqual("uri1");
        console.info(domain, tag, TAG + "doc.path:" + doc.path);
        expect(doc.path).assertEqual("path1");
        console.info(domain, tag, TAG + "doc.createTime:" + doc.createTime);
        expect(doc.createTime).assertEqual("createTime1");
        console.info(domain, tag, TAG + "doc.modifyTime:" + doc.modifyTime);
        expect(doc.modifyTime).assertEqual("modifyTime1");
        console.info(domain, tag, TAG + "doc.size:" + doc.size);
        expect(doc.size).assertEqual("size1");
        console.info(domain, tag, TAG + "doc.status:" + doc.status);
        expect(doc.status).assertEqual(2);
      } catch(err) {
        console.error(domain, tag, TAG + `RelationalResultSetReturnValueAddTest_0011 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.info(domain, tag, TAG + '************* RelationalResultSetReturnValueAddTest_0011 end *************');
    })

    /**
     * @tc.name   RelationalResultSetReturnValueAddTest_0012
     * @tc.number SUB_DistributedData_RelationalResultSetReturnValueAddTest_0012
     * @tc.desc   getRows normal test return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationalResultSetReturnValueAddTest_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.log(TAG + '************* RelationalResultSetReturnValueAddTest_0012 start *************');
      let resultSet: relationalStore.ResultSet | undefined;
      resultSet = await rdbStore!.querySql("SELECT * FROM test");
      try {
        let rows: Array<relationalStore.ValuesBucket>;
        rows = await resultSet!.getRows(1);
        console.info(domain, tag, TAG + "rows.length is:" + rows.length);
        expect(rows.length > 0).assertTrue();
      } catch(err) {
        console.error(domain, tag, TAG + `RelationalResultSetReturnValueAddTest_0012 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
      resultSet?.close();
      console.info(domain, tag, TAG + '************* RelationalResultSetReturnValueAddTest_0012 end *************');
    })

  })
}
