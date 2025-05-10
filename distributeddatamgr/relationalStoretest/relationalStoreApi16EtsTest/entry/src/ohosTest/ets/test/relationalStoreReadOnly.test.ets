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
import data_relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let rdbStore: data_relationalStore.RdbStore | undefined | null ;

const TAG = "[RELATIONAL_STORE_JS_READ_ONLY_TEST]";

let STORE_CONFIG:data_relationalStore.StoreConfig = {
  name: "store.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let STORE_CONFIG1:data_relationalStore.StoreConfig = {
  name: "test.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  isReadOnly: true,
}

let STORE_CONFIG2:data_relationalStore.StoreConfig = {
  name: "readOnly.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  isReadOnly: true,
}

const valueBucket:data_relationalStore.ValuesBucket = {
  'name': 'zhangsan',
  'age': 18,
  'salary': 25000,
  'blobType': new Uint8Array([1, 2, 3]),
};

export default function rdbStoreReadOnlyEtsTest() {
  describe('rdbStoreReadOnlyEtsTest', () => {
    beforeAll(async () => {
      console.log(TAG + 'beforeAll');
      try {
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        const CREATE_TABLE_SQL = "CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "name TEXT, age INTEGER, salary REAL, blobType BLOB)";
        await rdbStore.executeSql(CREATE_TABLE_SQL);
        await rdbStore.insert('test', valueBucket);
        await rdbStore.insert('test', valueBucket);
        await rdbStore.backup(STORE_CONFIG2.name);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch (err) {
        console.error(TAG, `init database failed, errCode:${err.code}, message:${err.message}`);
        expect().assertFail();
      }
    });
    beforeEach(async () => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG2);
      console.info(TAG + 'beforeEach');
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1);
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG2);
    });


    /**
     * @tc.name readOnlyEtsTest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyEtsAPI16Test_0100
     * @tc.desc RelationalStore batch insert with conflict resolution by store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('readOnlyEtsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* readOnlyEtsTest0100 start *************");
      const row: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      };
      let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
      for (let i = 0; i < 2; i++) {
        valueBucketArray.push(row);
      }
      try {
        (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolutionSync('test', valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `readOnlyEtsTest0100 ON_CONFLICT_NONE failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code == 801).assertTrue();
        done();
      }
      done();
      console.info(TAG + "************* readOnlyEtsTest0100 end *************");
    })


    /**
     * @tc.name readOnlyEtsTest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyEtsAPI16Test_0200
     * @tc.desc RelationalStore batch insert with conflict resolution by store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('readOnlyEtsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* readOnlyEtsTest0200 start *************");
      const row: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      };
      let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
      for (let i = 0; i < 2; i++) {
        valueBucketArray.push(row);
      }
      try {
        (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolutionSync('test', valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `readOnlyEtsTest0200 ON_CONFLICT_ROLLBACK failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code == 801).assertTrue();
        done();
      }
      done();
      console.info(TAG + "************* readOnlyEtsTest0200 end *************");
    })


    /**
     * @tc.name readOnlyEtsTest0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyEtsAPI16Test_0300
     * @tc.desc RelationalStore batch insert with conflict resolution by store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('readOnlyEtsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* readOnlyEtsTest0300 start *************");
      const row: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      };
      let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
      for (let i = 0; i < 2; i++) {
        valueBucketArray.push(row);
      }
      try {
        (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolutionSync('test', valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `readOnlyEtsTest0300 ON_CONFLICT_ABORT failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code == 801).assertTrue();
        done();
      }
      done();
      console.info(TAG + "************* readOnlyEtsTest0300 end *************");
    })


    /**
     * @tc.name readOnlyEtsTest0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyEtsAPI16Test_0400
     * @tc.desc RelationalStore batch insert with conflict resolution by store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('readOnlyEtsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* readOnlyEtsTest0400 start *************");
      const row: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      };
      let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
      for (let i = 0; i < 2; i++) {
        valueBucketArray.push(row);
      }
      try {
        (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolutionSync('test', valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `readOnlyEtsTest0400 ON_CONFLICT_FAIL failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code == 801).assertTrue();
        done();
      }
      done();
      console.info(TAG + "************* readOnlyEtsTest0400 end *************");
    })


    /**
     * @tc.name readOnlyEtsTest0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyEtsAPI16Test_0500
     * @tc.desc RelationalStore batch insert with conflict resolution by store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('readOnlyEtsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* readOnlyEtsTest0500 start *************");
      const row: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      };
      let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
      for (let i = 0; i < 2; i++) {
        valueBucketArray.push(row);
      }
      try {
        (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolutionSync('test', valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `readOnlyEtsTest0500 ON_CONFLICT_IGNORE failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code == 801).assertTrue();
        done();
      }
      done();
      console.info(TAG + "************* readOnlyEtsTest0500 end *************");
    })


    /**
     * @tc.name readOnlyEtsTest0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyEtsAPI16Test_0600
     * @tc.desc RelationalStore batch insert with conflict resolution by store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('readOnlyEtsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* readOnlyEtsTest0600 start *************");
      const row: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      };
      let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array();
      for (let i = 0; i < 2; i++) {
        valueBucketArray.push(row);
      }
      try {
        (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolutionSync('test', valueBucketArray,
          data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `readOnlyEtsTest0600 ON_CONFLICT_REPLACE failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code == 801).assertTrue();
        done();
      }
      done();
      console.info(TAG + "************* readOnlyEtsTest0600 end *************");
    })

  })
}