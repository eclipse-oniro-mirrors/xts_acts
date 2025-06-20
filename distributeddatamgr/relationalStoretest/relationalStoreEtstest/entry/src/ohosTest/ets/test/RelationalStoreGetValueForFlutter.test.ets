
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


export default function rdbstoregetValueForFlutterTest() {
  describe('rdbstoregetValueForFlutterTest', () => {
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
     * @tc.name testRdbStoreGetValueForFlutter0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_1100
     * @tc.desc integer greater than Number.MAX_SAFE_INTEGER test
     */
    it('testRdbStoreGetValueForFlutter0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0001 start *************");
      let valueNum = Number.MAX_SAFE_INTEGER.toString() + 0;
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
        expect(valueNum).assertEqual(resultSet.getValueForFlutter(resultSet.getColumnIndex('age')));
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0001 end *************");
    })

    /**
     * @tc.name testRdbStoreGetValueForFlutter0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_1200
     * @tc.desc integer is Number.MAX_SAFE_INTEGER test
     */
    it('testRdbStoreGetValueForFlutter0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0002 start *************");
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
        expect(Number.MAX_SAFE_INTEGER).assertEqual(resultSet.getValueForFlutter(resultSet.getColumnIndex('age')));
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0002 end *************");
    })

    /**
     * @tc.name testRdbStoreGetValueForFlutter0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_1300
     * @tc.desc integer less than Number.MAX_SAFE_INTEGER test
     */
    it('testRdbStoreGetValueForFlutter0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0003 start *************");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const valueBucket1: ValuesBucket = {
        'age': 100,
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
        expect(100).assertEqual(resultSet.getValueForFlutter(resultSet.getColumnIndex('age')));
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0003 end *************");
    })

    /**
     * @tc.name testRdbStoreGetValueForFlutter0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_1400
     * @tc.desc integer greater than Number.MIN_SAFE_INTEGER test
     */
    it('testRdbStoreGetValueForFlutter0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0004 start *************");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      const valueBucket1: ValuesBucket = {
        'age': -100,
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
        expect(-100).assertEqual(resultSet.getValueForFlutter(resultSet.getColumnIndex('age')));
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0004 end *************");
    })

    /**
     * @tc.name testRdbStoreGetValueForFlutter0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_1500
     * @tc.desc integer is Number.MIN_SAFE_INTEGER test
     */
    it('testRdbStoreGetValueForFlutter0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0005 start *************");
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
        expect(Number.MIN_SAFE_INTEGER).assertEqual(resultSet.getValueForFlutter(resultSet.getColumnIndex('age')));
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0005 end *************");
    })

    /**
     * @tc.name testRdbStoreGetValueForFlutter0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_1600
     * @tc.desc integer less than Number.MIN_SAFE_INTEGER test
     */
    it('testRdbStoreGetValueForFlutter0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0006 start *************");
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
        expect(valueNum).assertEqual(resultSet.getValueForFlutter(resultSet.getColumnIndex('age')));
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0006 end *************");
    })

    /**
     * @tc.name testRdbStoreGetValueForFlutter0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_1700
     * @tc.desc other types test
     */
    it('testRdbStoreGetValueForFlutter0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0007 start *************");
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
        'salary': 100,
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
        expect('test').assertEqual(resultSet.getValueForFlutter(resultSet.getColumnIndex('name')));
        expect(18).assertEqual(resultSet.getValueForFlutter(resultSet.getColumnIndex('age')));
        expect(1).assertEqual(resultSet.getValueForFlutter(resultSet.getColumnIndex('blobType')));
        const assets2 = resultSet.getValueForFlutter(resultSet.getColumnIndex('data1')) as relationalStore.Asset;
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
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0007 end *************");
    })

    /**
     * @tc.name testRdbStoreGetValueForFlutter0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_1800
     * @tc.desc other types test
     */
    it('testRdbStoreGetValueForFlutter0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0008 start *************");
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
        'salary': 100,
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
        resultSet.goToFirstRow();
        resultSet.getValueForFlutter(null);
        resultSet.close();
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0008 end *************");
    })
    /**
     * @tc.name testRdbStoreGetValueForFlutter0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_1900
     * @tc.desc other types test
     */
    it('testRdbStoreGetValueForFlutter0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0009 start *************");
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
        'salary': 100,
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
        resultSet.goToFirstRow();
        resultSet.getValueForFlutter(undefined);
        resultSet.close();
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `query failed, code:${err.code}, message:${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0009 end *************");
    })
    /**
     * @tc.name testRdbStoreGetValueForFlutter0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2000
     * @tc.desc other types test
     */
    it('testRdbStoreGetValueForFlutter0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0010 start *************");
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
        'salary': 100,
        'blobType': true,
        'data1': asset1,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket1);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `### insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        resultSet.goToFirstRow();
        resultSet.close()
        resultSet.getValueForFlutter(1);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `### query failed, code:${err.code}, message:${err.message}`);
        expect(err.code == 14800014).assertTrue();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0010 end *************");
    })
    /**
     * @tc.name testRdbStoreGetValueForFlutter0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2100
     * @tc.desc other types test
     */
    it('testRdbStoreGetValueForFlutter0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0011 start *************");
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
        'salary': 100,
        'blobType': true,
        'data1': asset1,
      }
      try {
        let rowId = await rdbStore.insert("test", valueBucket1);
        expect(1).assertEqual(rowId);
      } catch (err) {
        console.error(TAG + `### insert failed, code:${err.code}, message:${err.message}`);
      }
      try {
        let resultSet = await rdbStore.querySql('SELECT * FROM test');
        resultSet.goToFirstRow();
        resultSet.getValueForFlutter(-1);
        resultSet.close()
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `### query failed, code:${err.code}, message:${err.message}`);
        expect(err.code == 14800013).assertTrue();
        done();
      }
      console.log(TAG + "************* testRdbStoreGetValueForFlutter0011 end *************");
    })
  })
}