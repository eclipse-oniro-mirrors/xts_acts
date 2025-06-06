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
import { relationalStore } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'


const TAG = "[ttt]"
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbTest.db",
  securityLevel: relationalStore.SecurityLevel.S1
};

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS test  (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL, age INTEGER, salary REAL, blobType BLOB)";

let rdbStore: relationalStore.RdbStore | undefined | null ;

export default function relationalStoreBatchInsertErrcodeTest() {
  describe('relationalStoreBatchInsertErrcodeTest', () => {

    beforeAll(async () => {
      console.info(TAG + 'beforeAll')

    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + 'Get RdbStore successfully.');
      (rdbStore as relationalStore.RdbStore).executeSql(CREATE_TABLE_TEST);
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach')
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "RdbTest.db");
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll')
    })


    /**
     * @tc.name rdbstore.batchInsertWithConflictResolution errcode is 14800014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5600
     * @tc.desc rdbstore.batchInsertWithConflictResolution errcode is 14800014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0100 start *************");
      let u8 = new Uint8Array([1, 2, 3])
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as relationalStore.RdbStore).close();
        try{
          await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect(null).assertFail()
          done();
       } catch (err) {
          console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
          expect(err.code == 14800014).assertTrue()
          done();
       }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0100 end *************");
    })

    /**
     * @tc.name rdbstore.batchInsertWithConflictResolution errcode is 14800021
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5700
     * @tc.desc rdbstore.batchInsertWithConflictResolution errcode is 14800021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0200 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket:relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
      for (let i = 0; i < 2; i++) {
        valueBucketArray.push(valueBucket);
      }
      try{
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test1", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect(null).assertFail()
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(err.code == 14800021).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0200 end *************");
    })


    /**
     * @tc.name rdbstore.batchInsertWithConflictResolution errcode is 14800030
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5800
     * @tc.desc rdbstore.batchInsertWithConflictResolution errcode is 14800030
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0300 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionErrcode0300 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionErrcode0300 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(err.code == 14800030).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0300 end *************");
    })

    /**
     * @tc.name rdbstore.batchInsertWithConflictResolution errcode is 14800027
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5900
     * @tc.desc rdbstore.batchInsertWithConflictResolution errcode is 14800027
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0400 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionErrcode0400 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionErrcode0400 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(err.code == 14800027).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0400 end *************");
    })

    /**
     * @tc.name rdbstore.batchInsertWithConflictResolution errcode is 14800032
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_6000
     * @tc.desc rdbstore.batchInsertWithConflictResolution errcode is 14800032
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0500 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "age": 18,
          "salary": 100.5,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionErrcode0500 batch failed")
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(err.code == 14800032).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0500 end *************");
    })

    /**
     * @tc.name rdbstore.batchInsertWithConflictResolution errcode is 14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_6100
     * @tc.desc rdbstore.batchInsertWithConflictResolution errcode is 14800033
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0600 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "id":"sdf",
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "batchInsertWithConflictResolution failed");
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(err.code == 14800033).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0600 end *************");
    })

    /**
     * @tc.name rdbstore.batchInsertWithConflictResolution errcode is 14800047
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_6200
     * @tc.desc rdbstore.batchInsertWithConflictResolution errcode is 14800047
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0700 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionErrcode0700 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionErrcode0700 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(err.code == 14800047).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0700 end *************");
    })

    /**
     * @tc.name rdbstore.batchInsertWithConflictResolutionSync errcode is 14800014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_6300
     * @tc.desc rdbstore.batchInsertWithConflictResolutionSync errcode is 14800014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0100 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket:relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
      for (let i = 0; i < 2; i++) {
        valueBucketArray.push(valueBucket);
      }
      await (rdbStore as relationalStore.RdbStore).close();
      try{
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect(null).assertFail()
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolutionSync failed" + err.code);
        expect(err.code == 14800014).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0100 end *************");
    })

    /**
     * @tc.name rdbstore.batchInsertWithConflictResolutionSync errcode is 14800021
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_6400
     * @tc.desc rdbstore.batchInsertWithConflictResolutionSync errcode is 14800021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0200 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket:relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
      for (let i = 0; i < 2; i++) {
        valueBucketArray.push(valueBucket);
      }
      try{
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test1", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect(null).assertFail()
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolutionSync failed" + err.code);
        expect(err.code == 14800021).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0200 end *************");
    })


    /**
     * @tc.name rdbstore.batchInsertWithConflictResolutionSync errcode is 14800030
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_6500
     * @tc.desc rdbstore.batchInsertWithConflictResolutionSync errcode is 14800030
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0300 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0300 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0300 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolutionSync failed" + err.code);
        expect(err.code == 14800030).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0300 end *************");
    })

    /**
     * @tc.name rdbstore.batchInsertWithConflictResolutionSync errcode is 14800030
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_6600
     * @tc.desc rdbstore.batchInsertWithConflictResolutionSync errcode is 14800030
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0400 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0400 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0400 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolutionSync failed" + err.code);
        expect(err.code == 14800027).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0400 end *************");
    })

    /**
     * @tc.name rdbstore.batchInsertWithConflictResolutionSync errcode is 14800032
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_6700
     * @tc.desc rdbstore.batchInsertWithConflictResolutionSync errcode is 14800032
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStorebatchInsertWithConflictResolutionSyncErrcode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStorebatchInsertWithConflictResolutionSyncErrcode0500 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "age": 18,
          "salary": 100.5,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbStorebatchInsertWithConflictResolutionSyncErrcode0500 batch failed")
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolutionSync failed" + err.code);
        expect(err.code == 14800032).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0500 end *************");
    })

    /**
     * @tc.name rdbstore.batchInsertWithConflictResolutionSync errcode is 14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_6800
     * @tc.desc rdbstore.batchInsertWithConflictResolutionSync errcode is 14800033
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStorebatchInsertWithConflictResolutionSyncErrcode0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStorebatchInsertWithConflictResolutionSyncErrcode0600 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "id":"sdf",
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbStorebatchInsertWithConflictResolutionSync failed");
        done();
      } catch (err) {
        console.log(TAG + err +"testRdbStorebatchInsertWithConflictResolutionSync failed" + err.code);
        expect(err.code == 14800033).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStorebatchInsertWithConflictResolutionSyncErrcode0600 end *************");
    })

    /**
     * @tc.name rdbstore.batchInsertWithConflictResolutionSync errcode is 14800047
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_6900
     * @tc.desc rdbstore.batchInsertWithConflictResolutionSync errcode is 14800047
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbStorebatchInsertWithConflictResolutionSyncErrcode0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStorebatchInsertWithConflictResolutionSyncErrcode0700 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 3; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
        console.log(TAG + "testRdbStorebatchInsertWithConflictResolutionSyncErrcode0700 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStorebatchInsertWithConflictResolutionSyncErrcode0700 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"testRdbStorebatchInsertWithConflictResolutionSync failed" + err.code);
        expect(err.code == 14800047).assertTrue()
        done();
      }
      console.log(TAG + "************* testRdbStorebatchInsertWithConflictResolutionSyncErrcode0700 end *************");
    })
  })
}