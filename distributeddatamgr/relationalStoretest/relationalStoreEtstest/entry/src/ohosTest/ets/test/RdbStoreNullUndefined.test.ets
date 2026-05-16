/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import relationalStore from '@ohos.data.relationalStore';
import { sendableRelationalStore } from '@kit.ArkData';
// import isPromiseLike from "@ohos/hypium/src/module/assert/isPromiseLike";

const TAG = '[RELATIONAL_STORE_TEST]';
let rdbStore: relationalStore.RdbStore;
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + "data9 text" + ")";

const DROP_TEST = "DROP TABLE IF EXISTS test";

let u8 = new Uint8Array([1, 2, 3]);

const asset1 : relationalStore.Asset = {
  name: "name1",
  uri: "uri1",
  createTime: "createTime1",
  modifyTime: "modifyTime1",
  size: "size1",
  path: "path1",
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}

const valueBucket2: relationalStore.ValuesBucket = {
  'data1': 'wangwude',
  'data2': 18,
  'data3': 25000.0,
  'data4': u8,
  'data5': asset1,
}
const valueBucket3: relationalStore.ValuesBucket = {
  'data1': 'wangwuda',
  'data2': 18,
  'data3': 25000.0,
  'data4': u8,
  'data5': asset1,
}
let valueBuckets = new Array(valueBucket2, valueBucket3);

let STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbQuery.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
export default function RdbStoreNullUndefinedTest() {
  describe('RdbStoreNullUndefinedTest', (): void => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      try{
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        console.error(TAG + 'contextDir' + context.databaseDir);
        expect(rdbStore != undefined).assertTrue();
        if (rdbStore != undefined){
          await rdbStore!.executeSql(CREATE_TABLE_TEST);
          let u8 = new Uint8Array([1, 2, 3])
          const valueBucket: relationalStore.ValuesBucket = {
            'data1': 'zhangsan',
            'data2': 18,
            'data3': 25000.0,
            'data4': u8,
            'data5': asset1,
          };
          await rdbStore!.insert('test', valueBucket);
        }
      }catch (error) {
        console.error('%{public}s', 'beforeEach failed');
        expect().assertFail();
      }
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await rdbStore!.executeSql(DROP_TEST);
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0001
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0001
     * @tc.desc       1.The first parameter is ""
     *                2.The first parameter is null
     *                3.The first parameter is undefined
     *                4.The second parameter is null
     *                5.The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0001 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert("", valueBucket2).then((rowId: number) => {
          console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        })
        expect().assertFail();
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0001 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).insert(null, valueBucket2).then((rowId: number) => {
          console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        })
        expect().assertFail();
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0001 failed2:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).insert(undefined, valueBucket2).then((rowId: number) => {
          console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        })
        expect().assertFail();
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0001 failed3:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).insert("test", null).then((rowId: number) => {
          console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        })
        expect().assertFail();
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0001 failed4:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).insert("test", undefined).then((rowId: number) => {
          console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        })
        expect().assertFail();
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0001 failed5:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }

      console.error("************* RdbStore_Null_Undefind_Test_0001 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0002
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0002
     * @tc.desc       1.The first parameter is ""
     *                2.The first parameter is null
     *                3.The first parameter is undefined
     *                4.The second parameter is null
     *                5.The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info("************* RdbStore_Null_Undefind_Test_0002 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).batchInsert("", valueBuckets).then((insertNum: number) => {
          console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        })
        expect().assertFail()
      }catch(err) {
        console.error(`RdbStore_Null_Undefind_Test_0002 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try {
        (rdbStore as relationalStore.RdbStore).batchInsert(null, valueBuckets).then((insertNum: number) => {
          console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        })
        expect().assertFail()
      }catch(err) {
        console.error(`RdbStore_Null_Undefind_Test_0002 failed2:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try {
        (rdbStore as relationalStore.RdbStore).batchInsert(undefined, valueBuckets).then((insertNum: number) => {
          console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        })
        expect().assertFail()
      }catch(err) {
        console.error(`RdbStore_Null_Undefind_Test_0002 failed3:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try {
        (rdbStore as relationalStore.RdbStore).batchInsert("test", null).then((insertNum: number) => {
          console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        })
        expect().assertFail()
      }catch(err) {
        console.error(`RdbStore_Null_Undefind_Test_0002 failed4:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try {
        (rdbStore as relationalStore.RdbStore).batchInsert("test", undefined).then((insertNum: number) => {
          console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        })
        expect().assertFail()
      }catch(err) {
        console.error(`RdbStore_Null_Undefind_Test_0002 failed5:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      console.error("************* RdbStore_Null_Undefind_Test_0002 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0003
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0003
     * @tc.desc       1.The first parameter is ""
     *                2.The first parameter is null
     *                3.The first parameter is undefined
     *                4.The second parameter is null
     *                5.The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info("************* RdbStore_Null_Undefind_Test_0003 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).batchInsertSync("", valueBuckets);
        expect().assertFail()
      }catch(err) {
        console.error(`RdbStore_Null_Undefind_Test_0003 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try {
        (rdbStore as relationalStore.RdbStore).batchInsertSync(null, valueBuckets);
        expect().assertFail()
      }catch(err) {
        console.error(`RdbStore_Null_Undefind_Test_0003 failed2:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try {
        (rdbStore as relationalStore.RdbStore).batchInsertSync(undefined, valueBuckets);
        expect().assertFail()
      }catch(err) {
        console.error(`RdbStore_Null_Undefind_Test_0003 failed3:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try {
        (rdbStore as relationalStore.RdbStore).batchInsertSync("test", null);
        expect().assertFail()
      }catch(err) {
        console.error(`RdbStore_Null_Undefind_Test_0003 failed4:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try {
        (rdbStore as relationalStore.RdbStore).batchInsertSync("test", undefined);
        expect().assertFail()
      }catch(err) {
        console.error(`RdbStore_Null_Undefind_Test_0003 failed5:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      console.error("************* RdbStore_Null_Undefind_Test_0003 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0004
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0004
     * @tc.desc       1.The first parameter is null
     *                2.The first parameter is undefined
     *                3.The second parameter is null
     *                4.The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0004 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "Lisa");
      try{
        (rdbStore as relationalStore.RdbStore).update(null, predicates).then(async (rows: number) => {
          console.info(`Updated row count: ${rows}`);
          expect().assertFail()
        })
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0004 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).update(undefined, predicates).then(async (rows: number) => {
          console.info(`Updated row count: ${rows}`);
          expect().assertFail()
        })
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0004 failed2:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }

      try{
        (rdbStore as relationalStore.RdbStore).update(valueBucket2, null).then(async (rows: number) => {
          console.info(`Updated row count: ${rows}`);
          expect().assertFail()
        })
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0004 failed3:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).update(valueBucket2, undefined).then(async (rows: number) => {
          console.info(`Updated row count: ${rows}`);
          expect().assertFail()
        })
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0004 failed4:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      console.error("************* RdbStore_Null_Undefind_Test_0004 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0005
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0005
     * @tc.desc       1.The first parameter is null
     *                2.The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0005 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).delete(null).then((rows: number) => {
          console.info(TAG + `Delete rows: ${rows}`);
        })
        expect().assertFail();
      }catch (err){
        console.error(TAG +`RdbStore_Null_Undefind_Test_0005 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).delete(undefined).then((rows: number) => {
          console.info(TAG + `Delete rows: ${rows}`);
        })
        expect().assertFail();
      }catch (err){
        console.error(TAG +`RdbStore_Null_Undefind_Test_0005 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      console.error("************* RdbStore_Null_Undefind_Test_0005 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0006
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0006
     * @tc.desc       1.The first parameter is null
     *                2.The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0006 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        rdbStore.deleteSync(null);
        expect().assertFail();
      }catch (err){
        console.error(TAG +`RdbStore_Null_Undefind_Test_0006 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        rdbStore.deleteSync(undefined);
        expect().assertFail();
      }catch (err){
        console.error(TAG +`RdbStore_Null_Undefind_Test_0006 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      console.error("************* RdbStore_Null_Undefind_Test_0006 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0007
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0007
     * @tc.desc       1.The first parameter is null
     *                2.The first parameter is undefined
     *                3.The second parameter is []
     *                4.The second parameter is null
     *                5.The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0007 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");

      try{
        rdbStore.query(null, ["data1", "data2", "data3", "data4", "data5"]);
        expect().assertFail()
      }catch (err){
        console.error(TAG +`RdbStore_Null_Undefind_Test_0007 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        rdbStore.query(undefined, ["data1", "data2", "data3", "data4", "data5"]);
        expect().assertFail()
      }catch (err){
        console.error(TAG +`RdbStore_Null_Undefind_Test_0007 failed2:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        let resultSet: relationalStore.ResultSet = await (rdbStore as relationalStore.RdbStore).query(predicates, [])
        console.info(TAG + `ResultSet column names: ${resultSet.getColumnName(1)}}`);
        expect(resultSet.getColumnName(1) == "data1").assertTrue()
        resultSet.close();
      }catch(err) {
        console.error(TAG +`RdbStore_Null_Undefind_Test_0007 failed3:${err.message} code:${err.code}`);
      }
      try {
        let resultSet  = await rdbStore.query(predicates, null);
        expect(resultSet != null).assertTrue();
      } catch (err) {
        console.error(TAG +`RdbStore_Null_Undefind_Test_0007 failed4:${err.message} code:${err.code}`);
        expect().assertFail()
      }
      try {
        let resultSet  = await rdbStore.query(predicates, undefined);
        expect(resultSet != null).assertTrue();
      } catch (err) {
        console.error(TAG +`RdbStore_Null_Undefind_Test_0007 failed5:${err.message} code:${err.code}`);
        expect().assertFail()
      }
      console.error("************* RdbStore_Null_Undefind_Test_0007 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0008
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0008
     * @tc.desc       1.The first parameter is null
     *                2.The first parameter is undefined
     *                3.The second parameter is []
     *                4.The second parameter is null
     *                5.The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0008 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        rdbStore.querySync(null, ["data1", "data2", "data3", "data4", "data5"]);
        expect().assertFail()
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0008 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        rdbStore.querySync(undefined, ["data1", "data2", "data3", "data4", "data5"]);
        expect().assertFail()
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0008 failed2:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try {
        let resultSet  = await rdbStore.querySync(predicates, []);
        expect(resultSet != null).assertTrue();
      } catch (err) {
        console.error(`RdbStore_Null_Undefind_Test_0008 failed4:${err.message} code:${err.code}`);
        expect().assertFail()
      }
      try {
        let resultSet  = await rdbStore.querySync(predicates, null);
        expect(resultSet != null).assertTrue();
      } catch (err) {
        console.error(`RdbStore_Null_Undefind_Test_0008 failed4:${err.message} code:${err.code}`);
        expect().assertFail()
      }
      try {
        let resultSet  = await rdbStore.querySync(predicates, undefined);
        expect(resultSet != null).assertTrue();
      } catch (err) {
        console.error(`RdbStore_Null_Undefind_Test_0008 failed5:${err.message} code:${err.code}`);
        expect().assertFail()
      }
      console.error("************* RdbStore_Null_Undefind_Test_0008 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0009
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0009
     * @tc.desc       1.The first parameter is null
     *                2.The first parameter is undefined
     *                3.The first parameter is ""
     *                4.The second parameter is null
     *                5.The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0009 start *************");
      try{
        rdbStore.querySql(null);
        expect().assertFail()
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0009 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        rdbStore.querySql(undefined);
        expect().assertFail()
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0009 failed2:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        rdbStore.querySql("");
        expect().assertFail()
      }catch (err){
        console.error(`RdbStore_Null_Undefind_Test_0009 failed3:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }

      try {
        let resultSet  = await rdbStore.querySql("SELECT * FROM test", null);
        expect(resultSet != null).assertTrue();
      } catch (err) {
        console.error(`RdbStore_Null_Undefind_Test_0009 failed4:${err.message} code:${err.code}`);
        expect().assertFail()
      }

      try {
        let resultSet  = await rdbStore.querySql("SELECT * FROM test", undefined);
        expect(resultSet != null).assertTrue();
      } catch (err) {
        console.error(`RdbStore_Null_Undefind_Test_0009 failed5:${err.message} code:${err.code}`);
        expect().assertFail()
      }

      console.error("************* RdbStore_Null_Undefind_Test_0009 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0010
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0010
     * @tc.desc       1.The first parameter is null
     *                2.The first parameter is undefined
     *                3.The first parameter is ""
     *                4.The second parameter is null
     *                5.The second parameter is undefined
     *                6.The second parameter is ""
     *                7.the thired parameter is []
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0010 start *************");
      let PRIKey = [1];
      try{
        await rdbStore.getModifyTime(null, "data1", PRIKey);
        expect().assertFail();
      }catch (err) {
        console.error(TAG + `RdbStore_Null_Undefind_Test_0010 failed1:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        await rdbStore.getModifyTime(undefined, "data1", PRIKey);
        expect().assertFail();
      }catch (err) {
        console.error(TAG + `RdbStore_Null_Undefind_Test_0010 failed2:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        await rdbStore.getModifyTime("", "data1", PRIKey);
        expect().assertFail();
      }catch (err) {
        console.error(TAG + `RdbStore_Null_Undefind_Test_0010 failed3:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        await rdbStore.getModifyTime("test", null, PRIKey);
        expect().assertFail();
      }catch (err) {
        console.error(TAG + `RdbStore_Null_Undefind_Test_0010 failed4:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        await rdbStore.getModifyTime("test", undefined, PRIKey);
        expect().assertFail();
      }catch (err) {
        console.error(TAG + `RdbStore_Null_Undefind_Test_0010 failed5:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        await rdbStore.getModifyTime("test", "", PRIKey);
        expect().assertFail();
      }catch (err) {
        console.error(TAG + `RdbStore_Null_Undefind_Test_0010 failed6:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      try{
        await rdbStore.getModifyTime("test", "data1", []);
        expect().assertFail();
      }catch (err) {
        console.error(TAG + `RdbStore_Null_Undefind_Test_0010 failed7:${err.message} code:${err.code}`);
        expect(err.code == 401).assertTrue();
      }
      console.error("************* RdbStore_Null_Undefind_Test_0010 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0011
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0011
     * @tc.desc       The first parameter is "".
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0011 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert("", valueBucket2, (error: BusinessError, rowId: number) => {
          console.info(TAG +`Insert is successful, rowId = ${rowId}`);
          done();
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG +`Insert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info("************* RdbStore_Null_Undefind_Test_0011 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0012
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0012
     * @tc.desc       The first parameter is null.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0012 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert(null, valueBucket2, (error: BusinessError, rowId: number) => {
          console.info(TAG +`Insert is successful, rowId = ${rowId}`);
          done();
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG +`RdbStore_Null_Undefind_Test_0012, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info("************* RdbStore_Null_Undefind_Test_0012 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0013
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0013
     * @tc.desc       The first parameter is undefined.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0013 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert(undefined, valueBucket2, (error: BusinessError, rowId: number) => {
          console.info(TAG +`Insert is successful, rowId = ${rowId}`);
          done();
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG +`Insert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info("************* RdbStore_Null_Undefind_Test_0013 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0014
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0014
     * @tc.desc       The second parameter is null.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0014 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert("test", null, (error: BusinessError, rowId: number) => {
          console.info(TAG +`Insert is successful, rowId = ${rowId}`);
          done();
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG +`Insert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info("************* RdbStore_Null_Undefind_Test_0014 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0015
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0015
     * @tc.desc       The second parameter is undefined.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0015 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert("test", undefined, (error: BusinessError, rowId: number) => {
          console.info(TAG +`Insert is successful, rowId = ${rowId}`);
          done();
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG +`Insert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info("************* RdbStore_Null_Undefind_Test_0015 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0016
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0016
     * @tc.desc       The first parameter is "".
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0016 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert("", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
          (err: BusinessError, rowId: number) => {
            console.info(TAG+ `Insert is successful, rowId = ${rowId}`);
            done();
          });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }

      console.info("************* RdbStore_Null_Undefind_Test_0016 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0017
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0017
     * @tc.desc       The first parameter is null.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0017 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert(null, valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
          (err: BusinessError, rowId: number) => {
            console.info(TAG+ `Insert is successful, rowId = ${rowId}`);
            done();
          });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info("************* RdbStore_Null_Undefind_Test_0017 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0018
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0018
     * @tc.desc       The first parameter is undefined.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0018 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert(undefined, valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
          (err: BusinessError, rowId: number) => {
            console.info(TAG+ `Insert is successful, rowId = ${rowId}`);
            done();
          });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }

      console.info("************* RdbStore_Null_Undefind_Test_0018 end *************");
    })


    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0019
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0019
     * @tc.desc       The second parameter is null.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0019 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert("test", null, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
          (err: BusinessError, rowId: number) => {
            console.info(TAG+ `Insert is successful, rowId = ${rowId}`);
            done();
          });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }

      console.info("************* RdbStore_Null_Undefind_Test_0019 end *************");
    })


    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0020
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0020
     * @tc.desc       The second parameter is undefined.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0020 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert("test", undefined, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
          (err: BusinessError, rowId: number) => {
            console.info(TAG+ `Insert is successful, rowId = ${rowId}`);
            done();
          });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info("************* RdbStore_Null_Undefind_Test_0020 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0021
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0021
     * @tc.desc       The third parameter is ON_CONFLICT_ABORT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0021 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert("test", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_ABORT,
          (err: BusinessError, rowId: number) => {
            console.info(TAG+ `Insert is successful, rowId = ${rowId}`);
            expect(rowId == 2).assertTrue();
            done();
          });
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info("************* RdbStore_Null_Undefind_Test_0021 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0022
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0022
     * @tc.desc       The third parameter is ON_CONFLICT_FAIL
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0022 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert("test", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_FAIL,
          (err: BusinessError, rowId: number) => {
            console.info(TAG+ `Insert is successful, rowId = ${rowId}`);
            expect(rowId == 2).assertTrue();
            done();
          });
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info("************* RdbStore_Null_Undefind_Test_0022 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0023
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0023
     * @tc.desc       1.The first parameter is ""
     *                2.The first parameter is null
     *                3.The first parameter is undefind
     *                4.The second parameter is null
     *                5.The second parameter is undefind
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0023 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).insert("", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((rowId: number) => {
          console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        })
        expect().assertFail()
      }catch(error){
        console.error(TAG + `Insert is failed1, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).insert(null, valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((rowId: number) => {
          console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        })
        expect().assertFail()
      }catch(error){
        console.error(TAG + `Insert is failed2, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).insert(undefined, valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((rowId: number) => {
          console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        })
        expect().assertFail()
      }catch(error){
        console.error(TAG + `Insert is failed3, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).insert("test", null, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((rowId: number) => {
          console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        })
        expect().assertFail()
      }catch(error){
        console.error(TAG + `Insert is failed3, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).insert("test", undefined, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((rowId: number) => {
          console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Insert is failed3, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      console.info("************* RdbStore_Null_Undefind_Test_0023 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0024
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0024
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0024 start *************");
      try{
        let rowId: number = (rdbStore as relationalStore.RdbStore).insertSync("test", null, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        return;
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0024 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0025
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0025
     * @tc.desc       The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0025 start *************");
      try{
        let rowId: number = (rdbStore as relationalStore.RdbStore).insertSync("test", undefined, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        return;
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0025 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0026
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0026
     * @tc.desc       The third parameter is ON_CONFLICT_ABORT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0026 start *************");
      try{
        let rowId: number = (rdbStore as relationalStore.RdbStore).insertSync("test", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        expect(rowId == 2).assertTrue();
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        return;
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0026 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0027
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0027
     * @tc.desc       The third parameter is ON_CONFLICT_FAIL
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0027 start *************");
      try{
        let rowId: number = (rdbStore as relationalStore.RdbStore).insertSync("test", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        expect(rowId == 2).assertTrue();
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        return;
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0027 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0028
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0028
     * @tc.desc       The third parameter is ON_CONFLICT_FAIL
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0028 start *************");
      try{
        let rowId: number = (rdbStore as relationalStore.RdbStore).insertSync("test", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        expect(rowId == 2).assertTrue();
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        return;
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0028 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0029
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0029
     * @tc.desc       1.The second parameter is ""
     *                2.The second parameter is null
     *                3.The second parameter is undefind
     *                4.The third parameter is ON_CONFLICT_ABORT
     *                5.The third parameter is ON_CONFLICT_FAIL
     *                6.The third parameter is ON_CONFLICT_IGNORE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0029 start *************");
      const sendableValuesBucket = sendableRelationalStore.toSendableValuesBucket(valueBucket2);
      try{
        let rowId: number = (rdbStore as relationalStore.RdbStore).insertSync("test", null, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Insert is failed1, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      try{
        let rowId: number = (rdbStore as relationalStore.RdbStore).insertSync("test", undefined, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Insert is failed2, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      try{
        let rowId: number = (rdbStore as relationalStore.RdbStore).insertSync("test", sendableValuesBucket, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        expect(rowId == 2).assertTrue();
      }catch(error){
        console.error(TAG + `Insert is failed3, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      try{
        let rowId: number = (rdbStore as relationalStore.RdbStore).insertSync("test", sendableValuesBucket, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(TAG + `Insert is successful, rowId = ${rowId}`);
        expect(rowId == 3).assertTrue();
      }catch(error){
        console.error(TAG + `Insert is failed4, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      try{
        let rowId: number = (rdbStore as relationalStore.RdbStore).insertSync("test", sendableValuesBucket, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(TAG + `Insert is successful5, rowId = ${rowId}`);
        expect(rowId == 4).assertTrue();
      }catch(error){
        console.error(TAG + `Insert is failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0029 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0030
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0030
     * @tc.desc       The first parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0030 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).batchInsert("", valueBuckets, (err, insertNum) => {
          console.info(TAG +`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
          done();
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0030 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0031
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0031
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0031 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).batchInsert(null, valueBuckets, (err, insertNum) => {
          console.info(TAG +`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
          done()
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0031 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0032
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0032
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0032 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).batchInsert(undefined, valueBuckets, (err, insertNum) => {
          console.info(TAG +`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
          done();
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0032 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0033
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0033
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0033 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).batchInsert("test", null, (err, insertNum) => {
          console.info(TAG +`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
          done();
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0033 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0034
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0034
     * @tc.desc       The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0034 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).batchInsert("test", undefined, (err, insertNum) => {
          console.info(TAG +`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
          done();
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0034 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0035
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0035
     * @tc.desc       1.The first parameter is ""
     *                2.The first parameter is null
     *                3.The first parameter is undefined
     *                4.The second parameter is []
     *                5.The second parameter is null
     *                6.The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0035 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("", valueBuckets, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((insertNum: number) => {
          console.info(TAG + `batchInsert is successful, insertNum = ${insertNum}`);
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed1, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution(null, valueBuckets, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((insertNum: number) => {
          console.info(TAG + `batchInsert is successful, insertNum = ${insertNum}`);
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed2, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution(undefined, valueBuckets, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((insertNum: number) => {
          console.info(TAG + `batchInsert is successful, insertNum = ${insertNum}`);
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed3, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", [], relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((insertNum: number) => {
          console.info(TAG + `batchInsert is successful, insertNum = ${insertNum}`);
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed4, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", null, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((insertNum: number) => {
          console.info(TAG + `batchInsert is successful, insertNum = ${insertNum}`);
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed5, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", undefined, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((insertNum: number) => {
          console.info(TAG + `batchInsert is successful, insertNum = ${insertNum}`);
        })
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed6, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0035 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0036
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0036
     * @tc.desc       1.The first parameter is ""
     *                2.The first parameter is null
     *                3.The first parameter is undefined
     *                4.The second parameter is []
     *                5.The second parameter is null
     *                6.The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0036 start *************");
      try{
        let insertNum: number = (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("", valueBuckets, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed1, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }

      try{
        let insertNum: number = (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync(null, valueBuckets, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed2, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        let insertNum: number = (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync(undefined, valueBuckets, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed3, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        let insertNum: number = (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", [], relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed4, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        let insertNum: number = (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", null, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed5, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        let insertNum: number = (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", undefined, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        expect().assertFail();
      }catch(error){
        console.error(TAG + `batchInsert is failed6, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0036 end *************");
    })


    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0037
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0037
     * @tc.desc       The third parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0037 start *************");
      try {
        const config: relationalStore.ReturningConfig = { columns: [] };
        let results = await rdbStore.batchInsertWithReturning("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `batchInsertWithReturningExample, name is ${row['data1']}, age is ${row['data1']}`);
        }
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG + `batchInsertWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 14800001).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0037 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0038
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0038
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0038 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).update(null, predicates, (error, rows) => {
          console.info(TAG + `Updated row count: ${rows}`);
          done();
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0038 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0039
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0039
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0039 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).update(undefined, predicates, (error, rows) => {
          console.info(TAG + `Updated row count: ${rows}`);
          done()
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0039 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0040
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0040
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0040 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).update(valueBucket2, null, (error, rows) => {
          console.info(TAG + `Updated row count: ${rows}`);
          done()
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0040 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0041
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0041
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0041 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).update(valueBucket2, undefined, (error, rows) => {
          console.info(TAG + `Updated row count: ${rows}`);
          done()
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0041 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0042
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0042
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0042 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).update(null, predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, (error, rows) => {
          console.info(TAG + `Updated row count: ${rows}`);
          done();
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0042 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0044
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0044
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0044 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).update(undefined, predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, (error, rows) => {
          console.info(TAG + `Updated row count: ${rows}`);
          done()
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0044 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0045
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0045
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0045 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).update(valueBucket2, null, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, (error, rows) => {
          console.info(TAG + `Updated row count: ${rows}`);
          done();
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0045 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0046
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0046
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0046 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).update(valueBucket2, undefined, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, (error, rows) => {
          console.info(TAG + `Updated row count: ${rows}`);
          done()
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0046 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0047
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0047
     * @tc.desc       1.The first parameter is null
     *                2.The first parameter is undefined
     *                3.The second parameter is null
     *                4.The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0047 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).update(null, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(async (rows: number) => {
          console.info(TAG + `Updated row count: ${rows}`);
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed1, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        (rdbStore as relationalStore.RdbStore).update(undefined, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(async (rows: number) => {
          console.info(TAG + `Updated row count: ${rows}`);
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed2, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        (rdbStore as relationalStore.RdbStore).update(valueBucket2, null, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(async (rows: number) => {
          console.info(TAG + `Updated row count: ${rows}`);
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed3, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      try{
        (rdbStore as relationalStore.RdbStore).update(valueBucket2, undefined, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(async (rows: number) => {
          console.info(TAG + `Updated row count: ${rows}`);
        });
        expect().assertFail();
      }catch(error){
        console.error(TAG + `Updated failed4, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401);
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0047 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0048
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0048
     * @tc.desc       The third parameter is ON_CONFLICT_REPLACE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0048 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows: number = (rdbStore as relationalStore.RdbStore).updateSync(valueBucket2, predicates, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(error){
        console.error(TAG + `Updated failed1, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0048 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0049
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0049
     * @tc.desc       The third parameter is ON_CONFLICT_ROLLBACK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0049 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows: number = (rdbStore as relationalStore.RdbStore).updateSync(valueBucket2, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.info(TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(error){
        console.error(TAG + `Updated failed1, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0049 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0050
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0050
     * @tc.desc       The third parameter is ON_CONFLICT_ABORT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0050 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows: number = (rdbStore as relationalStore.RdbStore).updateSync(valueBucket2, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(error){
        console.error(TAG + `Updated failed1, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0050 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0051
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0051
     * @tc.desc       The third parameter is ON_CONFLICT_FAIL
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0051 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows: number = (rdbStore as relationalStore.RdbStore).updateSync(valueBucket2, predicates, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(error){
        console.error(TAG + `Updated failed1, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0051 end *************");
    })
    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0052
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0052
     * @tc.desc       The third parameter is ON_CONFLICT_IGNORE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0051 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        let rows: number = (rdbStore as relationalStore.RdbStore).updateSync(valueBucket2, predicates, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(TAG + `Updated row count: ${rows}`);
        expect(rows == 1).assertTrue();
      }catch(error){
        console.error(TAG + `Updated failed1, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0052 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0053
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0053
     * @tc.desc       The third parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0053 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: [] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturning(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 14800001).assertTrue();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0053 end *************");
    })
    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0054
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0054
     * @tc.desc       The forth parameter is ON_CONFLICT_IGNORE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0054 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturning(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `updateWithReturningExample, data1 is ${row['data1']}, data2 is ${row['data2']}`);
        }
        expect(results.changed == 1).assertTrue();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0054 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0055
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0055
     * @tc.desc       The forth parameter is ON_CONFLICT_ROLLBACK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0055 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturning(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `updateWithReturningExample, data1 is ${row['data1']}, data2 is ${row['data2']}`);
        }
        expect(results.changed == 1).assertTrue();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0055 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0056
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0056
     * @tc.desc       The forth parameter is ON_CONFLICT_ABORT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0056 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturning(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `updateWithReturningExample, data1 is ${row['data1']}, data2 is ${row['data2']}`);
        }
        expect(results.changed == 1).assertTrue();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0056 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0057
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0057
     * @tc.desc       The forth parameter is ON_CONFLICT_FAIL
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0057 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturning(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `updateWithReturningExample, data1 is ${row['data1']}, data2 is ${row['data2']}`);
        }
        expect(results.changed == 1).assertTrue();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0057 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0058
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0058
     * @tc.desc       The forth parameter is ON_CONFLICT_IGNORE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0058 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturning(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `updateWithReturningExample, data1 is ${row['data1']}, data2 is ${row['data2']}`);
        }
        expect(results.changed == 1).assertTrue();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0058 end *************");
    })
    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0059
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0059
     * @tc.desc       The third parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0059 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: [""] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturningSync(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 14800021).assertTrue();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0059 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0060
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0060
     * @tc.desc       The forth parameter is ON_CONFLICT_IGNORE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0054 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturningSync(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `updateWithReturningExample, data1 is ${row['data1']}, data2 is ${row['data2']}`);
        }
        expect(results.changed == 1).assertTrue();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0060 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0061
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0061
     * @tc.desc       The forth parameter is ON_CONFLICT_ROLLBACK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0061 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturningSync(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `updateWithReturningExample, data1 is ${row['data1']}, data2 is ${row['data2']}`);
        }
        expect(results.changed == 1).assertTrue();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0061 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0062
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0062
     * @tc.desc       The forth parameter is ON_CONFLICT_ABORT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0062 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturningSync(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `updateWithReturningExample, data1 is ${row['data1']}, data2 is ${row['data2']}`);
        }
        expect(results.changed == 1).assertTrue();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0062 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0063
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0063
     * @tc.desc       The forth parameter is ON_CONFLICT_FAIL
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0063 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturningSync(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `updateWithReturningExample, data1 is ${row['data1']}, data2 is ${row['data2']}`);
        }
        expect(results.changed == 1).assertTrue();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0063 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0064
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0064
     * @tc.desc       The forth parameter is ON_CONFLICT_IGNORE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0064 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        valueBucket2['data1'] = "hello";
        valueBucket2['data2'] = 33;
        let results = await rdbStore.updateWithReturningSync(valueBucket2, predicates, config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(TAG + `updateWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `updateWithReturningExample, data1 is ${row['data1']}, data2 is ${row['data2']}`);
        }
        expect(results.changed == 1).assertTrue();
      } catch (error) {
        console.error(TAG + `updateWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0064 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0065
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0065
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0065 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).delete(null, (error, rows) => {
          console.info(TAG + `Delete rows: ${rows}`);
          done();
        });
      }catch (error) {
        console.error(TAG + `Delete failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue()
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0065 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0066
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0066
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0066 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).delete(undefined, (error, rows) => {
          console.info(TAG + `Delete rows: ${rows}`);
          done();
        });
      }catch (error) {
        console.error(TAG + `Delete failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue()
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0066 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0067
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0067
     * @tc.desc       The second parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0067 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: [''] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        let results = await rdbStore.deleteWithReturning(predicates, config);
        console.info(`deleteWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG + `deleteWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 14800021).assertTrue();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0067 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0068
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0068
     * @tc.desc       The second parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0068 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      const config: relationalStore.ReturningConfig = { columns: [''] };
      try {
        rdbStore.batchInsertWithReturningSync("test", [valueBucket2, valueBucket3], config);
        let results = await rdbStore.deleteWithReturningSync(predicates, config);
        console.info(`deleteWithReturningExample is successful, changed is ${results.changed}`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG + `deleteWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 14800021).assertTrue();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0068 end *************");
    })


    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0069
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0069
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0069 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(null, async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          done();
        });
        expect().assertFail();
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0069 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0070
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0070
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0070 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(undefined, async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          done();
        });
        expect().assertFail();
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0070 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0071
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0071
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0071 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(null, ["dat1", "dat2", "dat3", "dat4", "dat5"], async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        });
        expect().assertFail();
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }

      try{
        (rdbStore as relationalStore.RdbStore).query(undefined, ["dat1", "dat2", "dat3", "dat4", "dat5"], async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        });
        expect().assertFail();
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0071 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0072
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0072
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0072 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(undefined, ["dat1", "dat2", "dat3", "dat4", "dat5"], async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          done();
        });
        expect().assertFail();
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0072 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0073
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0073
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0073 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, null, async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 9).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0073 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0074
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0074
     * @tc.desc       The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0074 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, undefined, async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 9).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0074 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0075
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0075
     * @tc.desc       The second parameter is []
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0075 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, [], async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 9).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0075 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0076
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0076
     * @tc.desc       The first parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0076 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).querySql("", async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0076 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0077
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0077
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0077 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).querySql(null, async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0077 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0078
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0078
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0078 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).querySql(undefined, async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0078 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0079
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0079
     * @tc.desc       The first parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0079 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).querySql("",['zhangsan'], async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0079 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0080
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0080
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0080 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).querySql(null,['zhangsan'], async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0080 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0081
     * @tc.number     SUB_DistributedData_RelationalStore_RdbStore_Null_Undefind_Test_0081
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0081 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).querySql(undefined,['zhangsan'], async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0081 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0082
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0082
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0082 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).querySql("SELECT * FROM test WHERE data1 = ?", null, async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 9).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0082 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0083
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0083
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0083 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).querySql("SELECT * FROM test WHERE data1 = ?", undefined, async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 9).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0083 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0084
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0084
     * @tc.desc       The second parameter is []
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0084 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).querySql("SELECT * FROM test WHERE data1 = ?", [], async (err, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 9).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0084 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0085
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0085
     * @tc.desc       The first parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0085 start *************");
      let PRIKey = [1, 4, 2, 3];
      try{
        (rdbStore as relationalStore.RdbStore).getModifyTime("", "data1", PRIKey, (err, modifyTime: relationalStore.ModifyTime) => {
          let size = modifyTime.size;
          console.info(TAG + `ResultSet column size: ${size}}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0085 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0086
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0086
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0086 start *************");
      let PRIKey = [1, 4, 2, 3];
      try{
        (rdbStore as relationalStore.RdbStore).getModifyTime(null, "data1", PRIKey, (err, modifyTime: relationalStore.ModifyTime) => {
          let size = modifyTime.size;
          console.info(TAG + `ResultSet column size: ${size}}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0086 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0087
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0087
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0087 start *************");
      let PRIKey = [1, 4, 2, 3];
      try{
        (rdbStore as relationalStore.RdbStore).getModifyTime(undefined, "data1", PRIKey, (err, modifyTime: relationalStore.ModifyTime) => {
          let size = modifyTime.size;
          console.info(TAG + `ResultSet column size: ${size}}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0087 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0088
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0088
     * @tc.desc       The second parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0088 start *************");
      let PRIKey = [1, 4, 2, 3];
      try{
        (rdbStore as relationalStore.RdbStore).getModifyTime("test", "", PRIKey, (err, modifyTime: relationalStore.ModifyTime) => {
          let size = modifyTime.size;
          console.info(TAG + `ResultSet column size: ${size}}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0088 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0089
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0089
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0089 start *************");
      let PRIKey = [1, 4, 2, 3];
      try{
        (rdbStore as relationalStore.RdbStore).getModifyTime("test", null, PRIKey, (err, modifyTime: relationalStore.ModifyTime) => {
          let size = modifyTime.size;
          console.info(TAG + `ResultSet column size: ${size}}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0089 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0090
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0090
     * @tc.desc       The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0090 start *************");
      let PRIKey = [1, 4, 2, 3];
      try{
        (rdbStore as relationalStore.RdbStore).getModifyTime("test", undefined, PRIKey, (err, modifyTime: relationalStore.ModifyTime) => {
          let size = modifyTime.size;
          console.info(TAG + `ResultSet column size: ${size}}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0090 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0091
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0091
     * @tc.desc       The third parameter is []
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0091 start *************");
      let PRIKey = [];
      try{
        (rdbStore as relationalStore.RdbStore).getModifyTime("test", "data1", PRIKey, (err, modifyTime: relationalStore.ModifyTime) => {
          let size = modifyTime.size;
          console.info(TAG + `ResultSet column size: ${size}}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0091 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0092
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0092
     * @tc.desc       The third parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0092 start *************");
      let PRIKey = [];
      try{
        (rdbStore as relationalStore.RdbStore).getModifyTime("test", "data1", null, (err, modifyTime: relationalStore.ModifyTime) => {
          let size = modifyTime.size;
          console.info(TAG + `ResultSet column size: ${size}}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0092 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0093
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0093
     * @tc.desc       The third parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0093 start *************");
      let PRIKey = [];
      try{
        (rdbStore as relationalStore.RdbStore).getModifyTime("test", "data1", undefined, (err, modifyTime: relationalStore.ModifyTime) => {
          let size = modifyTime.size;
          console.info(TAG + `ResultSet column size: ${size}}`);
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0093 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0094
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0094
     * @tc.desc       The first parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0094 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData('', 1, (error) => {
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `clean dirty data failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0094 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0095
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0095
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0095 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData(null, 1, (error) => {
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `clean dirty data failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0095 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0096
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0096
     * @tc.desc       The first parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0096 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData(undefined, 1, (error) => {
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
          done()
        });
      }catch (error) {
        console.error(TAG + `clean dirty data failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0096 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0097
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0097
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0097 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData("test", null, (error) => {
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `clean dirty data failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0097 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0098
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0098
     * @tc.desc       The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0096 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData("test", undefined, (error) => {
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `clean dirty data failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0098 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0099
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0099
     * @tc.desc       The first parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0099 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData('', (error) => {
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(`clean dirty data failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0099 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0100
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0100
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0100 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData(null, (error) => {
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(`clean dirty data failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0100 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0101
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0101
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0101 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData(undefined, (error) => {
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(`clean dirty data failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0101 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0102
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0102
     * @tc.desc       1.The first parameter is ""
     *                2.The first parameter null
     *                3.The first parameter defined
     *                4.The second parameter null
     *                5.The second parameter undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0102 start *************");
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData('', 3).then(() => {
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
        });
      }catch (error) {
        console.error(`clean dirty data failed1, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData(null, 3).then(() => {
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
        });
      }catch (error) {
        console.error(`clean dirty data failed2, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData(undefined, 3).then(() => {
          console.info(TAG + 'clean dirty data succeeded');
          expect().assertFail();
        });
      }catch (error) {
        console.error(`clean dirty data failed3, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData("test", null)
        console.info(TAG + 'clean dirty data succeeded');
        expect().assertFail();
      }catch (error) {
        console.error(TAG + `clean dirty data failed4, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      try{
        (rdbStore as relationalStore.RdbStore).cleanDirtyData("test", undefined)
        console.info(TAG + 'clean dirty data succeeded');
        expect().assertFail();
      }catch (error) {
        console.error(TAG + `clean dirty data failed5, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0102 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0103
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0103
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0103 start *************");
      const SQL_DELETE_TABLE = "DELETE FROM test WHERE data1 = 'zhangsan'";
      try{
        (rdbStore as relationalStore.RdbStore).executeSql("", (error) => {
          console.info(TAG + 'Delete table done.');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `ExecuteSql failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0103 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0104
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0104
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0104 start *************");
      const SQL_DELETE_TABLE = "DELETE FROM test WHERE data1 = 'zhangsan'";
      try{
        (rdbStore as relationalStore.RdbStore).executeSql(null, (error) => {
          console.info(TAG + 'Delete table done.');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `ExecuteSql failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0104 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0105
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0105
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0105 start *************");
      const SQL_DELETE_TABLE = "DELETE FROM test WHERE data1 = 'zhangsan'";
      try{
        (rdbStore as relationalStore.RdbStore).executeSql(undefined, (error) => {
          console.info(TAG + 'Delete table done.');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `ExecuteSql failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0105 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0106
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0106
     * @tc.desc       The first parameter is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0106 start *************");
      const SQL_DELETE_TABLE = "DELETE FROM test WHERE name = ?";
      try{
        (rdbStore as relationalStore.RdbStore).executeSql("", ['zhangsan'], (error) => {
          console.info(TAG + 'Delete table done.');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `ExecuteSql failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0106 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0107
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0107
     * @tc.desc       The first parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0107 start *************");
      const SQL_DELETE_TABLE = "DELETE FROM test WHERE name = ?";
      try{
        (rdbStore as relationalStore.RdbStore).executeSql(null, ['zhangsan'], (error) => {
          console.info(TAG + 'Delete table done.');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `ExecuteSql failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0107 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0108
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0108
     * @tc.desc       The first parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0108 start *************");
      const SQL_DELETE_TABLE = "DELETE FROM test WHERE name = ?";
      try{
        (rdbStore as relationalStore.RdbStore).executeSql(undefined, ['zhangsan'], (error) => {
          console.info(TAG + 'Delete table done.');
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error(TAG + `ExecuteSql failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0108 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0109
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0109
     * @tc.desc       The second parameter is null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0109 start *************");
      const SQL_DELETE_TABLE = "DELETE FROM test WHERE name = ?";
      try{
        (rdbStore as relationalStore.RdbStore).executeSql(SQL_DELETE_TABLE, undefined, (error) => {
          if (error) {
            console.error(TAG + `ExecuteSql failed, code is ${error.code},message is ${error.message}`);
            expect(error.code == 14800021).assertTrue();
            done()
          }else{
            console.info(TAG + 'Delete table done.');
            expect().assertFail();
            done()
          }
        });
      }catch (error) {
        console.error(TAG + `ExecuteSql failed, code is ${error.code},message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0109 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0110
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0110
     * @tc.desc       The second parameter is undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0110 start *************");
      const SQL_DELETE_TABLE = "DELETE FROM test WHERE name = ?";
      try{
        (rdbStore as relationalStore.RdbStore).executeSql(SQL_DELETE_TABLE, undefined, (error) => {
          if (error) {
            console.error(TAG + `ExecuteSql failed, code is ${error.code},message is ${error.message}`);
            expect(error.code == 14800021).assertTrue();
            done()
          }else{
            console.info(TAG + 'Delete table done.');
            expect().assertFail();
            done()
          }
        });
      }catch (error) {
        console.error(TAG + `ExecuteSql failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0110 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0111
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0111
     * @tc.desc       1.The third parameter is ON_CONFLICT_NONE
     *                2.The third parameter is ON_CONFLICT_ROLLBACK
     *                3.The third parameter is ON_CONFLICT_ABORT
     *                4.The third parameter is ON_CONFLICT_FAIL
     *                5.The third parameter is ON_CONFLICT_IGNORE
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0111 start *************");
      try {
        const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
        let results = await rdbStore.batchInsertWithReturning("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.info(TAG + `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `batchInsertWithReturningExample, name is ${row['data1']}, age is ${row['data2']}`);
        }
        expect(results.changed == 2).assertTrue();
      } catch (error) {
        console.error(TAG + `batchInsertWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail()
      }
      try {
        const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
        let results = await rdbStore.batchInsertWithReturning("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.info(TAG + `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `batchInsertWithReturningExample, name is ${row['data1']}, age is ${row['data2']}`);
        }
        expect(results.changed == 2).assertTrue();
      } catch (error) {
        console.error(TAG + `batchInsertWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail()
      }
      try {
        const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
        let results = await rdbStore.batchInsertWithReturning("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.info(TAG + `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `batchInsertWithReturningExample, name is ${row['data1']}, age is ${row['data2']}`);
        }
        expect(results.changed == 2).assertTrue();
      } catch (error) {
        console.error(TAG + `batchInsertWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail()
      }
      try {
        const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
        let results = await rdbStore.batchInsertWithReturning("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.info(TAG + `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `batchInsertWithReturningExample, name is ${row['data1']}, age is ${row['data2']}`);
        }
        expect(results.changed == 2).assertTrue();
      } catch (error) {
        console.error(TAG + `batchInsertWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail()
      }
      try {
        const config: relationalStore.ReturningConfig = { columns: ['data1', 'data2'] };
        let results = await rdbStore.batchInsertWithReturning("test", valueBuckets, config, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.info(TAG + `batchInsertWithReturningExample is successful, changed is ${results.changed}`);
        while(results.resultSet.goToNextRow()) {
          const row = results.resultSet.getRow();
          console.info(TAG + `batchInsertWithReturningExample, name is ${row['data1']}, age is ${row['data2']}`);
        }
        expect(results.changed == 2).assertTrue();
      } catch (error) {
        console.error(TAG + `batchInsertWithReturningExample failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail()
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0111 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0112
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0112
     * @tc.desc       The Return to parameter is columnCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0112 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 9).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0112 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0113
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0113
     * @tc.desc       The Return to parameter is columnNames
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0113 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnNames[1] == "data1").assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0113 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0114
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0114
     * @tc.desc       The Return to parameter is columnCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0114 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 9).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0114 end *************");
    })
    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0115
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0115
     * @tc.desc       The Return to parameter is columnCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0115 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnNames[1] == "data1").assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0115 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0116
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0116
     * @tc.desc       The Return to parameter is rowCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0116 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, async (error, resultSet) => {
          console.info(TAG + `ResultSet column rowCount: ${resultSet.rowCount}`);
          expect(resultSet.rowCount == 1).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0116 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0117
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0117
     * @tc.desc       The Return to parameter is rowIndex
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0117 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, async (error, resultSet) => {
          console.info(TAG + `ResultSet column rowIndex: ${resultSet.rowIndex}`);
          expect(resultSet.rowIndex == -1).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0117 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0118
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0118
     * @tc.desc       The Return to parameter is isAtFirstRow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0118 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, async (error, resultSet) => {
          console.info(TAG + `ResultSet column isAtFirstRow: ${resultSet.isAtFirstRow}`);
          expect(resultSet.isAtFirstRow == false).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0118 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0119
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0119
     * @tc.desc       The Return to parameter is isAtLastRow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0119 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, async (error, resultSet) => {
          console.info(TAG + `ResultSet column isAtLastRow: ${resultSet.isAtLastRow}`);
          expect(resultSet.isAtLastRow == false).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0119 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0120
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0120
     * @tc.desc       The Return to parameter is isEnded
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0120 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, async (error, resultSet) => {
          console.info(TAG + `ResultSet column isEnded: ${resultSet.isEnded}`);
          expect(resultSet.isEnded == false).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0120 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0121
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0121
     * @tc.desc       The Return to parameter is isStarted
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0121 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, async (error, resultSet) => {
          console.info(TAG + `ResultSet column isStarted: ${resultSet.isStarted}`);
          expect(resultSet.isStarted == false).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0121 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0122
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0122
     * @tc.desc       The Return to parameter is isClosed
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0122 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, async (error, resultSet) => {
          console.info(TAG + `ResultSet column isClosed: ${resultSet.isClosed}`);
          expect(resultSet.isClosed == false).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0122 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0123
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0123
     * @tc.desc       The Return to parameter is columnNames
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0123 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, ["data1", "data2", "data3", "data4", "data5"], async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          console.info(TAG + `ResultSet column names1: ${resultSet.columnNames[1]}`);
          expect(resultSet.columnNames[1] == "data2").assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0123 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0124
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0124
     * @tc.desc       The Return to parameter is columnCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0124 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        (rdbStore as relationalStore.RdbStore).query(predicates, ["data1", "data2", "data3", "data4", "data5"], async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 5).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0124 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0125
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0125
     * @tc.desc       The Return to parameter is columnCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0125 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = rdbStore.querySync(predicates, ["data1", "data2", "data3", "data4", "data5"]);
        console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount == 5).assertTrue();
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        return;
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0125 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0126
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0126
     * @tc.desc       The Return to parameter is columnCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0126 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = rdbStore.querySync(predicates, ["data1", "data2", "data3", "data4", "data5"]);
        console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount == 5).assertTrue();
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        return;
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0126 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0127
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0127
     * @tc.desc       The Return to parameter is columnNames
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0127 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = rdbStore.querySync(predicates, ["data1", "data2", "data3", "data4", "data5"]);
        console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(resultSet.columnNames[1] == "data2").assertTrue();
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        return;
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0127 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0128
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0128
     * @tc.desc       The Return to parameter is columnNames
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0128 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        rdbStore.querySql("SELECT * FROM test", async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnNames[1] == "data1").assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0128 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0129
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0129
     * @tc.desc       The Return to parameter is columnCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0129 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        rdbStore.querySql("SELECT * FROM test", async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 9).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0129 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0130
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0130
     * @tc.desc       The Return to parameter is columnCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0130 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        rdbStore.querySql("SELECT * FROM test WHERE data1 = ?", ["zhangsan"], async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 9).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0130 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0131
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0131
     * @tc.desc       The Return to parameter is columnNames
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0131 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        rdbStore.querySql("SELECT * FROM test WHERE data1 = ?", ["zhangsan"], async (error, resultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnNames[1] == "data1").assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0131 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0132
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0132
     * @tc.desc       The Return to parameter is columnNames
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0132 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        rdbStore.querySql("SELECT * FROM test WHERE data1 = 'zhangsan'").then(async (resultSet: relationalStore.ResultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnNames[1] == "data1").assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0132 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0133
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0133
     * @tc.desc       The Return to parameter is columnCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0133 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      try{
        rdbStore.querySql("SELECT * FROM test WHERE data1 = 'zhangsan'").then(async (resultSet: relationalStore.ResultSet) => {
          console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount == 9).assertTrue();
          done();
        });
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0133 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0134
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0134
     * @tc.desc       The Return to parameter is columnCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0134 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = rdbStore.querySqlSync("SELECT * FROM test WHERE data1 = 'zhangsan'")
        console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(resultSet.columnCount == 9).assertTrue();
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        return;
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0134 end *************");
    })

    /**
     * @tc.name       RdbStore_Null_Undefind_Test_0135
     * @tc.number     SUB_DistributedData_RdbStore_Null_Undefind_Test_0135
     * @tc.desc       The Return to parameter is columnNames
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbStore_Null_Undefind_Test_0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* RdbStore_Null_Undefind_Test_0135 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      let resultSet: relationalStore.ResultSet | undefined;
      try{
        resultSet = rdbStore.querySqlSync("SELECT * FROM test WHERE data1 = 'zhangsan'")
        console.info(TAG + `ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(resultSet.columnNames[1] == "data1").assertTrue();
      }catch (error) {
        console.error(TAG + `Query failed, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        return;
      }
      console.info(TAG +"************* RdbStore_Null_Undefind_Test_0135 end *************");
    })

  })
}