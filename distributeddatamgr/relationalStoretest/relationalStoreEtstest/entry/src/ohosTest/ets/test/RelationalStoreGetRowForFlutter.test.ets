
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
import relationalStore from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { ValuesBucket } from "@ohos.data.ValuesBucket";


const TAG = "[STAGE_RELATIONAL_STORE_JSKITS_TEST]";
let rdbStore:relationalStore.RdbStore | undefined = undefined;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, salary REAL, blobType BLOB, data1 asset)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();


export default function rdbstoregetRowForFlutterTest() {
  describe('rdbstoregetRowForFlutterTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore?.executeSql(CREATE_TABLE_TEST);
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context, "rdbStore.db");
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })


    /**
     * @tc.name testRdbStoreGetRowForFlutter0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_0100
     * @tc.desc integer greater than Number.MAX_SAFE_INTEGER test
     */
    it('testRdbStoreGetRowForFlutter0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0001 start *************");
      let valueNum = Number.MAX_SAFE_INTEGER.toString() + 0;
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const valueBucket: ValuesBucket = {
        'age': valueNum,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = resultSet.getRowForFlutter();
        console.log(TAG +"typeof (valueNum)"+typeof (valueNum))
        console.log(TAG +"typeof (res.age)"+typeof (res.age))
        expect(valueNum).assertEqual(res.age);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0001 end *************");
    })

    /**
     * @tc.name testRdbStoreGetRowForFlutter0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_0200
     * @tc.desc integer is Number.MAX_SAFE_INTEGER test
     */
    it('testRdbStoreGetRowForFlutter0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0002 start *************");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const valueBucket1: ValuesBucket = {
        'age': Number.MAX_SAFE_INTEGER,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket1);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = resultSet.getRowForFlutter();
        expect(Number.MAX_SAFE_INTEGER).assertEqual(res.age);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0002 end *************");
    })

    /**
     * @tc.name testRdbStoreGetrowForFlutter0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_0300
     * @tc.desc integer less than Number.MAX_SAFE_INTEGER test
     */
    it('testRdbStoreGetrowForFlutter0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0003 start *************");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const valueBucket1: ValuesBucket = {
        'age': 500,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket1);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = resultSet.getRowForFlutter();
        expect(500).assertEqual(res.age);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0003 end *************");
    })

    /**
     * @tc.name testRdbStoreGetRowForFlutter0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_0400
     * @tc.desc integer greater than Number.MIN_SAFE_INTEGER test
     */
    it('testRdbStoreGetRowForFlutter0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0004 start *************");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const valueBucket1: ValuesBucket = {
        'age': -500,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket1);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = resultSet.getRowForFlutter();
        expect(-500).assertEqual(res.age);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0004 end *************");
    })

    /**
     * @tc.name testRdbStoreGetRowForFlutter0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_0500
     * @tc.desc integer is Number.MIN_SAFE_INTEGER test
     */
    it('testRdbStoreGetRowForFlutter0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0005 start *************");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const valueBucket1: ValuesBucket = {
        'age': Number.MIN_SAFE_INTEGER,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket1);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = resultSet.getRowForFlutter();
        expect(Number.MIN_SAFE_INTEGER).assertEqual(res.age);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0005 end *************");
    })

    /**
     * @tc.name testRdbStoreGetRowForFlutter0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_0600
     * @tc.desc integer less than Number.MIN_SAFE_INTEGER test
     */
    it('testRdbStoreGetRowForFlutter0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0006 start *************");
      let valueNum = Number.MIN_SAFE_INTEGER.toString() + 0;
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const valueBucket1: ValuesBucket = {
        'age': valueNum,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket1);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = resultSet.getRowForFlutter();
        expect(valueNum).assertEqual(res.age);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0006 end *************");
    })

    /**
     * @tc.name testRdbStoreGetRowForFlutter0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_0700
     * @tc.desc other types test
     */
    it('testRdbStoreGetRowForFlutter0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0007 start *************");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const asset1: relationalStore.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
      }
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'test',
        'age': 18,
        'salary': 100.5,
        'blobType': true,
        'data1': asset1,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket1);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = resultSet.getRowForFlutter();
        expect('test').assertEqual(res.name);
        expect(18).assertEqual(res.age);
        expect(100.5).assertEqual(res.salary);
        const assets2 = res["data1"] as relationalStore.Asset;
        expect(asset1.name).assertEqual(assets2.name);
        expect(asset1.uri).assertEqual(assets2.uri);
        expect(asset1.createTime).assertEqual(assets2.createTime);
        expect(asset1.modifyTime).assertEqual(assets2.modifyTime);
        expect(asset1.size).assertEqual(assets2.size);
        expect(asset1.path).assertEqual(assets2.path);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0007 end *************");
    })
    /**
     * @tc.name testRdbStoreGetRowForFlutter0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_0800
     * @tc.desc other types test
     */
    it('testRdbStoreGetRowForFlutter0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0008 start *************");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const asset1: relationalStore.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
      }
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'test',
        'age': 18,
        'salary': 100.5,
        'blobType': true,
        'data1': asset1,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket1);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        expect(true).assertEqual(resultSet.goToFirstRow());
        resultSet.close();
        resultSet.getRowForFlutter();
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect(err.code == 14800014).assertTrue();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0008 end *************");
    })
    /**
     * @tc.name testRdbStoreGetRowForFlutter0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_0900
     * @tc.desc integer number is Number.MAX_SAFE_INTEGER test
     */
    it('testRdbStoreGetRowForFlutter0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0009 start *************");
      let valueNum = Number.MAX_SAFE_INTEGER.toString();
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const valueBucket: ValuesBucket = {
        'age': valueNum,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = resultSet.getRowForFlutter();
        console.log(TAG +"typeof (valueNum)"+typeof (valueNum))
        let value1 = typeof (res.age);
        console.log(TAG +"typeof (res.age)"+value1)
        expect(value1).assertEqual("number")
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0009 end *************");
    })

    /**
     * @tc.name testRdbStoreGetRowForFlutter0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_1000
     * @tc.desc integer number is Number.MAX_SAFE_INTEGER test
     */
    it('testRdbStoreGetRowForFlutter0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0010 start *************");
      let valueNum = Number.MIN_SAFE_INTEGER.toString();
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const valueBucket: ValuesBucket = {
        'age': valueNum,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = resultSet.getRowForFlutter();
        console.log(TAG +"typeof (valueNum)"+typeof (valueNum))
        let value1 = typeof (res.age);
        console.log(TAG +"typeof (res.age)"+value1)
        expect(value1).assertEqual("number")
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetRowForFlutter0010 end *************");
    })
  })
}