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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import collections from '@arkts.collections';
import sendableRelationalStore from '@ohos.data.sendableRelationalStore';


const TAG = "[ttt]"
const bucket1000: relationalStore.ValuesBucket = {};
for(let i = 0; i < 1001; i++) {
  bucket1000["test" + i] = i;
}
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbTest.db",
  securityLevel: relationalStore.SecurityLevel.S3
};
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS test  (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL, age INTEGER, salary REAL, blobType BLOB)";

let rdbStore: relationalStore.RdbStore | undefined | null ;


export default function relationalStoreBatchInsertTest() {
  describe('relationalStoreBatchInsertTest', () => {

    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach')
      try {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG)
        console.info(TAG + 'Get RdbStore successfully.');
        await (rdbStore as relationalStore.RdbStore).executeSql(CREATE_TABLE_TEST);
      } catch (err) {
        console.error(TAG + `Get RdbStore failed, code is ${err.code},message is ${err.message}`);
      }
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach')
      rdbStore = undefined;
      await relationalStore.deleteRdbStore(context, "RdbTest.db");
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll')
    })



    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0100
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0100
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRdbStoreBatchInsertWithConflictResolution0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0100 start *************");
      let u8 = new Uint8Array([1, 2, 3])
      try {
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
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution001 batch num1 " + num)
        expect(2).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution001 result count " + resultSet.rowCount)
        expect(2).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail()
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0100 end *************");
    })



    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0200
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0200
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRdbStoreBatchInsertWithConflictResolution0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0200 start *************");
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
          relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0200 batch num1 " + num);
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0200 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail();
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0200 end *************");
    })



    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0300
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0300
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0300 start *************");
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
          relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0300 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0300 result count " + resultSet.rowCount)
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail()
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0300 end *************");
    })




    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0400
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0400
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0400 start *************");
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
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0400 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0400 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail()
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0400 end *************");
    })



    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0500
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0500
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0500 start *************");
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
          relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0500 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0500 result count " + resultSet.rowCount)
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail()
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0500 end *************");
    })



    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0600
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0600
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0600 start *************");
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
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0600 batch num1 " + num)
        expect(3).assertEqual(num);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from test")
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution0600 result count " + resultSet.rowCount)
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
        expect(null).assertFail()
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0600 end *************");
    })



    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0700
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0700
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0700 start *************");
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
        };
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray, undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + "testRdbStoreBatchInsertWithConflictResolution0700 with 3 args: " + e.code);
        expect(String(e.code)).assertEqual(String(401));
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0700 end *************");
    })



    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0800
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0800
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0800 start *************");
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
        };
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution(null, valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + "testRdbStoreBatchInsertWithConflictResolution0800 with 1 args: " + e.code);
        expect(String(e.code)).assertEqual(String(401));
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0800 end *************");
    })



    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution0900
     * @tc.number testRdbStoreBatchInsertWithConflictResolution0900
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "********* testRdbStoreBatchInsertWithConflictResolution0900 start **********");
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
        };
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", undefined,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + "testRdbStoreBatchInsertWithConflictResolution0900 with 2 args: " + e.code);
        expect(String(e.code)).assertEqual(String(401));
        done();
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution0900 end *************");
    })



    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution1000
     * @tc.number testRdbStoreBatchInsertWithConflictResolution1000
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "******* testRdbStoreBatchInsertWithConflictResolution1000 start *******");
      let u8 = new Uint8Array([1, 2, 3]);
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        let rows = 32768 / 4 + 1;
        for (let i = 0; i < rows; i++) {
          valueBucketArray.push(valueBucket);
        }
        let num = await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution1000 failed num " + num);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + " code: " + e.code);
        expect(14800000).assertEqual(e.code);
        done();
        console.log(TAG + "testRdbStoreBatchInsertWithConflictResolution1000 success");
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution1000 end *************");
    })





    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolution1100
     * @tc.number testRdbStoreBatchInsertWithConflictResolution1100
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolution1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolution1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution1100 start *************");
      let transaction = await (rdbStore as relationalStore.RdbStore).createTransaction({
        transactionType: relationalStore.TransactionType.IMMEDIATE
      });
      try {
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
        };
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        await transaction.rollback();
        expect(null).assertFail();
        done();
      } catch (e) {
        console.log(TAG + e + " code: " + e.code);
        expect(14800024).assertEqual(e.code);
        done();
        try {
          await transaction.rollback();
        } catch (e) {
          console.log(TAG + e + " rollback code: " + e.code);
          expect(null).assertFail();
          done();
        }
      }
      done();
      console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolution1100 end *************");
    })



    /**
     * @tc.name   testRdbGetInsertSqlInfo0100
     * @tc.number testRdbGetInsertSqlInfo0100
     * @tc.desc   testRdbGetInsertSqlInfo0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetInsertSqlInfo0100 start *************");
      const bucket: relationalStore.ValuesBucket = {
        name: "Logitech",
        age: "18",
        sex: "man",
        desc: "asserter"
      };
      const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
        "USER",
        bucket,
        relationalStore.ConflictResolution.ON_CONFLICT_NONE
      );
      expect(info.sql).assertEqual("INSERT INTO USER(age,desc,name,sex) VALUES (?,?,?,?)");
      expect(info.args[0]).assertContain("18");
      expect(info.args[1]).assertContain("asserter");
      expect(info.args[2]).assertContain("Logitech");
      expect(info.args[3]).assertContain("man");
      done();
      console.log(TAG + "************* testRdbGetInsertSqlInfo0100 end *************");
    });



    /**
     * @tc.name   testRdbGetInsertSqlInfoTabkleNameTooLength0100
     * @tc.number testRdbGetInsertSqlInfoTabkleNameTooLength0100
     * @tc.desc   testRdbGetInsertSqlInfoTabkleNameTooLength0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoTabkleNameTooLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoTabkleNameTooLength0100 start *************");
      const bucket: relationalStore.ValuesBucket = {
        name: "Logitech",
        age: "18",
        sex: "man",
        desc: "asserter"
      };
      let tableName: string = "x".repeat(257);
      try {
        relationalStore.getInsertSqlInfo(
          tableName,
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoTabkleNameTooLength0100 end *************");
    });



    /**
     * @tc.name   testRdbGetInsertSqlInfoBucketTooLength0100
     * @tc.number testRdbGetInsertSqlInfoBucketTooLength0100
     * @tc.desc   testRdbGetInsertSqlInfoBucketTooLength0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoBucketTooLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoBucketTooLength0100 start *************");
      try {
        relationalStore.getInsertSqlInfo(
          "user",
          bucket1000,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoBucketTooLength0100 end *************");
    });



    /**
     * @tc.name   testRdbGetInsertSqlInfoBucketColumTooLength0100
     * @tc.number testRdbGetInsertSqlInfoBucketColumTooLength0100
     * @tc.desc   testRdbGetInsertSqlInfoBucketColumTooLength0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoBucketColumTooLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoBucketColumTooLength0100 start *************");
      let tableName: string = "a".repeat(257);
      const bucket: relationalStore.ValuesBucket = {
        name: tableName,
        age: "18",
        sex: "man",
        desc: "asserter"
      };
      bucket[tableName] = "tableName"
      try {
        relationalStore.getInsertSqlInfo(
          "user",
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoBucketColumTooLength0100 end *************");
    });



    /**
     * @tc.name   testRdbGetInsertSqlInfoTableNameIsEmpty0100
     * @tc.number testRdbGetInsertSqlInfoTableNameIsEmpty0100
     * @tc.desc   testRdbGetInsertSqlInfoTableNameIsEmpty0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoTableNameIsEmpty0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoTableNameIsEmpty0100 start *************");
      const bucket: relationalStore.ValuesBucket = {
        name: "tableName",
        age: "18",
        sex: "man",
        desc: "asserter"
      };
      try {
        relationalStore.getInsertSqlInfo(
          "",
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoTableNameIsEmpty0100 end *************");
    });



    /**
     * @tc.name   testRdbGetInsertSqlInfoConflictResolutionIsEmpty0100
     * @tc.number testRdbGetInsertSqlInfoConflictResolutionIsEmpty0100
     * @tc.desc   testRdbGetInsertSqlInfoConflictResolutionIsEmpty0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoConflictResolutionIsEmpty0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoConflictResolutionIsEmpty0100 start *************");
      const bucket: relationalStore.ValuesBucket = {
        name: "tableName",
        age: "18",
        sex: "man",
        desc: "asserter"
      };
      try {
        const info:relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
          "tableName",
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect(info.sql).assertEqual("INSERT INTO tableName(age,desc,name,sex) VALUES (?,?,?,?)");
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoConflictResolutionIsEmpty0100 end *************");
    });



    /**
     * @tc.name   testRdbGetInsertSqlInfoBucketIsNull0100
     * @tc.number testRdbGetInsertSqlInfoBucketIsNull0100
     * @tc.desc   testRdbGetInsertSqlInfoBucketIsNull0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoBucketIsNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoBucketIsNull0100 start *************");
      const bucket: relationalStore.ValuesBucket = {};
      try {
        relationalStore.getInsertSqlInfo(
          "USER",
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoBucketIsNull0100 end *************");
    });



    /**
     * @tc.name   testRdbGetInsertSqlInfoBucketIsAssets0100
     * @tc.number testRdbGetInsertSqlInfoBucketIsAssets0100
     * @tc.desc   testRdbGetInsertSqlInfoBucketIsAssets0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoBucketIsAssets0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoBucketIsAssets0100 start *************");
      const values: relationalStore.Assets = [
        {
          name: "a",
          uri: "b",
          path: "c",
          createTime: "d",
          modifyTime: "e",
          size: "f",
          status: relationalStore.AssetStatus.ASSET_NORMAL
        }
      ];
      const bucket: relationalStore.ValuesBucket = {
        value: values
      };
      try {
        relationalStore.getInsertSqlInfo(
          "ASSETS",
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE
        );
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoBucketIsAssets0100 end *************");
    });



    /**
     * @tc.name   testRdbGetUpdateSqlInfo0100
     * @tc.number testRdbGetUpdateSqlInfo0100
     * @tc.desc   testRdbGetUpdateSqlInfo0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfo0100 start *************");
      const bucket: relationalStore.ValuesBucket = {
        name: "Logitech",
        age: "18",
        sex: "man",
        desc: "asserter"
      };
      const predicates = new relationalStore.RdbPredicates("users");
      const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
        predicates,
        bucket,
        relationalStore.ConflictResolution.ON_CONFLICT_NONE
      );
      expect(info.sql).assertEqual("UPDATE users SET age=?,desc=?,name=?,sex=?");
      expect(info.args[0]).assertContain("18");
      expect(info.args[1]).assertContain("asserter");
      expect(info.args[2]).assertContain("Logitech");
      expect(info.args[3]).assertContain("man");
      done();
      console.log(TAG + "************* testRdbGetUpdateSqlInfo0100 end *************");
    });



    /**
     * @tc.name   testRdbGetUpdateSqlInfoBucketIsNull0100
     * @tc.number testRdbGetUpdateSqlInfoBucketIsNull0100
     * @tc.desc   testRdbGetUpdateSqlInfoBucketIsNull0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfoBucketIsNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfoBucketIsNull0100 start *************");
      const predicates = new relationalStore.RdbPredicates("users");
      const bucket: relationalStore.ValuesBucket = {};
      try {
        relationalStore.getUpdateSqlInfo(
          predicates,
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetUpdateSqlInfoBucketIsNull0100 end *************");
    });



    /**
     * @tc.name   testRdbGetUpdateSqlInfoBucketTooLength0100
     * @tc.number testRdbGetUpdateSqlInfoBucketTooLength0100
     * @tc.desc   testRdbGetUpdateSqlInfoBucketTooLength0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfoBucketTooLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfoBucketTooLength0100 start *************");
      const predicates = new relationalStore.RdbPredicates("users");
      try {
        relationalStore.getUpdateSqlInfo(
          predicates,
          bucket1000,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getUpdateSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetUpdateSqlInfoBucketTooLength0100 end *************");
    });



    /**
     * @tc.name   testRdbGetUpdateSqlInfoBucketCloumTooLength0100
     * @tc.number testRdbGetUpdateSqlInfoBucketCloumTooLength0100
     * @tc.desc   testRdbGetUpdateSqlInfoBucketCloumTooLength0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfoBucketCloumTooLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfoBucketCloumTooLength0100 start *************");
      const predicates = new relationalStore.RdbPredicates("users");
      let tableName: string = "a".repeat(257);
      const bucket: relationalStore.ValuesBucket = {
        name: "tableName",
        age: "18",
        sex: "man",
        desc: "asserter"
      };
      bucket[tableName] = "tableName";
      try {
        relationalStore.getUpdateSqlInfo(
          predicates,
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetUpdateSqlInfoBucketCloumTooLength0100 end *************");
    });



    /**
     * @tc.name   testRdbGetUpdateSqlInfoTableTooLength0100
     * @tc.number testRdbGetUpdateSqlInfoTableTooLength0100
     * @tc.desc   testRdbGetUpdateSqlInfoTableTooLength0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfoTableTooLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfoTableTooLength0100 start *************");
      let tableName: string = "a".repeat(257);
      for(let i = 0; i < 256; i++) {
        tableName = tableName + "a";
      }
      const predicates = new relationalStore.RdbPredicates(tableName);
      const bucket: relationalStore.ValuesBucket = {
        name: "tableName",
        age: "18",
        sex: "man",
        desc: "asserter"
      };
      try {
        relationalStore.getUpdateSqlInfo(
          predicates,
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetUpdateSqlInfoTableTooLength0100 end *************");
    });



    /**
     * @tc.name   testRdbGetUpdateSqlInfoWhereClauseTooLength0100
     * @tc.number testRdbGetUpdateSqlInfoWhereClauseTooLength0100
     * @tc.desc   testRdbGetUpdateSqlInfoWhereClauseTooLength0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfoWhereClauseTooLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfoWhereClauseTooLength0100 start *************");
      let tableName: string = "";
      for(let i = 0; i < 256; i++) {
        tableName = tableName + "a";
      }
      const predicates = new relationalStore.RdbPredicates("tableName");
      predicates.equalTo(tableName, "user");
      const bucket: relationalStore.ValuesBucket = {
        name: "tableName",
        age: "18",
        sex: "man",
        desc: "asserter"
      };
      try {
        relationalStore.getUpdateSqlInfo(
          predicates,
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetUpdateSqlInfoWhereClauseTooLength0100 end *************");
    });



    /**
     * @tc.name   testRdbGetUpdateSqlInfoConflictResolutionIsEmpty0100
     * @tc.number testRdbGetUpdateSqlInfoConflictResolutionIsEmpty0100
     * @tc.desc   testRdbGetUpdateSqlInfoConflictResolutionIsEmpty0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfoConflictResolutionIsEmpty0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfoConflictResolutionIsEmpty0100 start *************");
      const predicates = new relationalStore.RdbPredicates("tableName");
      predicates.equalTo("tableName", "user");
      const bucket: relationalStore.ValuesBucket = {
        name: "tableName",
        age: "18",
        sex: "man",
        desc: "asserter"
      };
      try {
        const info:relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
          predicates,
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect(info.sql).assertEqual("UPDATE tableName SET age=?,desc=?,name=?,sex=? WHERE tableName = ? ");
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbGetUpdateSqlInfoConflictResolutionIsEmpty0100 end *************");
    });



    /**
     * @tc.name   testRdbGetDeleteSqlInfo0100
     * @tc.number testRdbGetDeleteSqlInfo0100
     * @tc.desc   testRdbGetDeleteSqlInfo0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetDeleteSqlInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetDeleteSqlInfo0100 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates("users");
        const info: relationalStore.SqlInfo = relationalStore.getDeleteSqlInfo(predicates);
        expect(info.sql).assertEqual("DELETE FROM users");
        done();
    }catch (e) {
      console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
      expect().assertFail();
      done();
    }
      
      console.log(TAG + "************* testRdbGetDeleteSqlInfo0100 end *************");
    });



    /**
     * @tc.name   testRdbGetDeleteSqlInfoTableNameTooLength0100
     * @tc.number testRdbGetDeleteSqlInfoTableNameTooLength0100
     * @tc.desc   testRdbGetDeleteSqlInfoTableNameTooLength0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetDeleteSqlInfoTableNameTooLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetDeleteSqlInfoTableNameTooLength0100 start *************");
      try {
        let tableName: string = "a".repeat(257);
        const predicates = new relationalStore.RdbPredicates(tableName);
        relationalStore.getDeleteSqlInfo(predicates);
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetDeleteSqlInfoTableNameTooLength0100 end *************");
    });



    /**
     * @tc.name   testRdbGetDeleteSqlInfoTableNameTooLength0200
     * @tc.number testRdbGetDeleteSqlInfoTableNameTooLength0200
     * @tc.desc   testRdbGetDeleteSqlInfoTableNameTooLength0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetDeleteSqlInfoTableNameTooLength0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetDeleteSqlInfoTableNameTooLength0200 start *************");
      try {
        let tableName: string = "";
        for(let i = 0; i < 256; i++) {
          tableName = tableName + "a";
        }
        const predicates = new relationalStore.RdbPredicates("tableName");
        predicates.equalTo(tableName, "a");
        relationalStore.getDeleteSqlInfo(predicates);
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getDeleteSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetDeleteSqlInfoTableNameTooLength0200 end *************");
    });



    /**
     * @tc.name   testRdbGetQuerySqlInfo0100
     * @tc.number testRdbGetQuerySqlInfo0100
     * @tc.desc   testRdbGetQuerySqlInfo0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetQuerySqlInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetQuerySqlInfo0100 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates("users");
        const info: relationalStore.SqlInfo = relationalStore.getQuerySqlInfo(predicates);
        expect(info.sql).assertEqual("SELECT * FROM users");
        done();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbGetQuerySqlInfo0100 end *************");
    });



    /**
     * @tc.name   testRdbGetQuerySqlInfoColumnsIsNullList0100
     * @tc.number testRdbGetQuerySqlInfoColumnsIsNullList0100
     * @tc.desc   testRdbGetQuerySqlInfoColumnsIsNullList0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetQuerySqlInfoColumnsIsNullList0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetQuerySqlInfoColumnsIsNullList0100 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates("users");
        const info: relationalStore.SqlInfo = relationalStore.getQuerySqlInfo(predicates, []);
        expect(info.sql).assertEqual("SELECT * FROM users");
        done();
      } catch (e) {
        console.error( TAG + 'getQuerySqlInfo' + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbGetQuerySqlInfoColumnsIsNullList0100 end *************");
    });



    /**
     * @tc.name   testRdbGetQuerySqlInfoByColumns0100
     * @tc.number testRdbGetQuerySqlInfoByColumns0100
     * @tc.desc   testRdbGetQuerySqlInfoByColumns0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetQuerySqlInfoByColumns0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetQuerySqlInfoByColumns0100 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates("users");
        const info: relationalStore.SqlInfo = relationalStore.getQuerySqlInfo(predicates, ["name", "age"]);
        expect(info.sql).assertEqual("SELECT name, age  FROM users");
        done();
      } catch (e) {
        console.error( TAG + 'getQuerySqlInfo' + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbGetQuerySqlInfoByColumns0100 end *************");
    });



    /**
     * @tc.name   testRdbGetQuerySqlInfoTableNameTooLength0100
     * @tc.number testRdbGetQuerySqlInfoTableNameTooLength0100
     * @tc.desc   testRdbGetQuerySqlInfoTableNameTooLength0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetQuerySqlInfoTableNameTooLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetQuerySqlInfoTableNameTooLength0100 start *************");
      try {
        let tableName: string = "a".repeat(257);
        const predicates = new relationalStore.RdbPredicates(tableName);
        relationalStore.getQuerySqlInfo(predicates);
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getDeleteSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetQuerySqlInfoTableNameTooLength0100 end *************");
    });



    /**
     * @tc.name   testRdbGetQuerySqlInfoWhereClauseTooLength0100
     * @tc.number testRdbGetQuerySqlInfoWhereClauseTooLength0100
     * @tc.desc   testRdbGetQuerySqlInfoWhereClauseTooLength0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetQuerySqlInfoWhereClauseTooLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetQuerySqlInfoWhereClauseTooLength0100 start *************");
      try {
        let tableName: string = "";
        for(let i = 0; i < 256; i++) {
          tableName = tableName + "a";
        }
        const predicates = new relationalStore.RdbPredicates("tableName");
        predicates.equalTo(tableName, "a");
        relationalStore.getQuerySqlInfo(predicates);
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getDeleteSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetQuerySqlInfoWhereClauseTooLength0100 end *************");
    });



    /**
     * @tc.name   testRdbGetQuerySqlInfoTableNameTooLength0200
     * @tc.number testRdbGetQuerySqlInfoTableNameTooLength0200
     * @tc.desc   testRdbGetQuerySqlInfoTableNameTooLength0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetQuerySqlInfoTableNameTooLength0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetQuerySqlInfoTableNameTooLength0200 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates("tableName");
        predicates.equalTo("tableName", "a");
        const info:relationalStore.SqlInfo = relationalStore.getQuerySqlInfo(predicates, ["3", "4"]);
        expect(info.args[0]).assertEqual('a');
        done();
      } catch (e) {
        console.error( TAG + 'getDeleteSqlInfo' + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbGetQuerySqlInfoTableNameTooLength0200 end *************");
    });



    /**
     * @tc.name   testRdbGetQuerySqlInfoColumnsTooLength0100
     * @tc.number testRdbGetQuerySqlInfoColumnsTooLength0100
     * @tc.desc   testRdbGetQuerySqlInfoColumnsTooLength0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetQuerySqlInfoColumnsTooLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbGetQuerySqlInfoColumnsTooLength0100 start *************");
      try {
        const colums:string[] = new Array(1003);
        for(let i = 0; i < colums.length; i++) {
          colums[i] = "a";
        }
        const predicates = new relationalStore.RdbPredicates("tableName");
        predicates.equalTo("tableName", "a");
        relationalStore.getQuerySqlInfo(predicates, colums);
        expect().assertFail();
        done();
      } catch (e) {
        console.error( TAG + 'getDeleteSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRdbGetQuerySqlInfoColumnsTooLength0100 end *************");
    });



    /**
     * @tc.name   testRdbToSendableValues0100
     * @tc.number testRdbToSendableValues0100
     * @tc.desc   testRdbToSendableValues0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbToSendableValues0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbToSendableValues0100 start *************");
      try {
        const array: relationalStore.ValueType[] = [];
        array.push(1);
        array.push(2);
        array.push("aaaaaaa");
        const values = sendableRelationalStore.toSendableValues(array);
        expect(values.length).assertEqual(3);
        expect(values[0]).assertEqual(1);
        expect(values[1]).assertEqual(2);
        expect(values[2]).assertEqual("aaaaaaa");
        done();
      } catch (e) {
        console.error( TAG + 'toSendableValues' + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbToSendableValues0100 end *************");
    });



    /**
     * @tc.name   testRdbToSendableValues0300
     * @tc.number testRdbToSendableValues0300
     * @tc.desc   testRdbToSendableValues0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbToSendableValues0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbToSendableValues0300 start *************");
      try {
        const array = new collections.Array<sendableRelationalStore.ValueType>();
        array.push("a");
        array.push("b");
        array.push(1);
        array.push(2);
        const values = sendableRelationalStore.fromSendableValues(array);
        expect(values.length).assertEqual(4);
        expect(values[0]).assertEqual("a");
        expect(values[1]).assertEqual("b");
        expect(values[2]).assertEqual(1);
        expect(values[3]).assertEqual(2);
        done();
      } catch (e) {
        console.error( TAG + 'toSendableValues' + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRdbToSendableValues0300 end *************");
    });

  })
}