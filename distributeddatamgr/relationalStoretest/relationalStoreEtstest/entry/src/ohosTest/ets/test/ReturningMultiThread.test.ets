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
import { BusinessError } from '@kit.BasicServicesKit';
const TAG = "[RDB_STORE_WITH_RETURNING_TEST]";
let rdbStore: relationalStore.RdbStore | undefined = undefined;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "data ASSET, " + "data1 ASSETS," + "blobType BLOB," +
  "test_id INTEGER," + "FOREIGN KEY (test_id) REFERENCES test1(test_id)" + ");"

const dbName = "returningMulti.db";
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
}

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
async function initData()
{
  let valueBuckets = new Array<relationalStore.ValuesBucket>();
  for (let i = 0; i < 200; ++i) {
    const valueBucket: relationalStore.ValuesBucket = {
      'name': 'zhangsan' + i,
    };
    valueBuckets.push(valueBucket);
  }
  await rdbStore?.batchInsert("test", valueBuckets);
}

function getRowCount(resultSet:relationalStore.LiteResultSet|undefined):number {
  let count = 0;
  while(resultSet?.goToNextRow()) {
    count++;
  }
  return count;
}

export default function ReturningMultiThread() {
  describe('ReturningMultiThread', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      expect(rdbStore != undefined).assertTrue();
      await rdbStore?.executeSql(CREATE_TABLE_TEST);
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context, dbName);
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_20000
     * @tc.name  rdbBatchInsertWithReturningMultiThread001
     * @tc.desc  batchInsertWithReturning Multi threaded testing
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('rdbBatchInsertWithReturningMultiThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* rdbBatchInsertWithReturningMultiThread001 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let count:number = 200;
      for (let i = 0; i < 200; ++i) {
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
        };
        rdbStore?.batchInsertWithReturning("test", [valueBucket], config)
          .then((result:relationalStore.Result)=>{
            expect(result.changed).assertEqual(1);
            expect(getRowCount(result.resultSet)).assertEqual(1);
            count--;
            if (count == 0) {
              done();
            }
          }).catch((e:BusinessError)=>{
          console.error(TAG + " rdbBatchInsertWithReturningMultiThread001 failed: " + e);
          done();
          expect(true).assertFail();
        });
      }
      console.log(TAG + "************* rdbBatchInsertWithReturningMultiThread001 end *************");
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_20100
     * @tc.name  transBatchInsertWithReturningMultiThread001
     * @tc.desc  trans batchInsertWithReturning Multi threaded testing
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transBatchInsertWithReturningMultiThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transBatchInsertWithReturningMultiThread001 start *************");
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let count:number = 200;
      let trans = await rdbStore?.createTransaction();
      for (let i = 0; i < 200; ++i) {
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'zhangsan' + i,
        };
        trans?.batchInsertWithReturning("test", [valueBucket], config)
          .then((result:relationalStore.Result)=>{
            expect(result.changed).assertEqual(1);
            expect(getRowCount(result?.resultSet)).assertEqual(1);
            count--;
            if (count == 0) {
              trans?.commit();
              done();
            }
          }).catch((e:BusinessError)=>{
            console.error(TAG + " transBatchInsertWithReturningMultiThread001 failed: " + e);
            done();
            expect(true).assertFail();
        });
      }
      console.log(TAG + "************* transBatchInsertWithReturningMultiThread001 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_20200
     * @tc.name  rdbStoreDeleteWithReturningMultiThread001
     * @tc.desc  rdb deleteWithReturning Multi threaded testing
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('rdbStoreDeleteWithReturningMultiThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* rdbStoreDeleteWithReturningMultiThread001 start *************");
      await initData();
      let count:number = 200;
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      for (let i = 0; i < 200; ++i) {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", 'zhangsan' + i);
        rdbStore?.deleteWithReturning(predicates, config)
          .then((result:relationalStore.Result)=>{
            expect(result.changed).assertEqual(1);
            expect(getRowCount(result?.resultSet)).assertEqual(1);
            count--;
            if (count == 0) {
              done();
            }
          }).catch((e:BusinessError)=>{
          console.error(TAG + " rdbStoreDeleteWithReturningMultiThread001 failed: " + e);
          done();
          expect(true).assertFail();
        });
      }
      console.log(TAG + "************* rdbStoreDeleteWithReturningMultiThread001 end *************");
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_20300
     * @tc.name  transStoreDeleteWithReturningMultiThread001
     * @tc.desc  trans deleteWithReturning Multi threaded testing
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transStoreDeleteWithReturningMultiThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transStoreDeleteWithReturningMultiThread001 start *************");
      await initData();
      let count:number = 200;
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      let trans = await rdbStore?.createTransaction();
      for (let i = 0; i < 200; ++i) {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", 'zhangsan' + i);
        trans?.deleteWithReturning(predicates, config)
          .then((result:relationalStore.Result)=>{
            expect(result.changed).assertEqual(1);
            expect(getRowCount(result?.resultSet)).assertEqual(1);
            count--;
            if (count == 0) {
              done();
            }
          }).catch((e:BusinessError)=>{
          console.error(TAG + " transStoreDeleteWithReturningMultiThread001 failed: " + e);
          done();
          expect(true).assertFail();
        });
      }
      await trans?.commit();
      console.log(TAG + "************* transStoreDeleteWithReturningMultiThread001 end *************");
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_20400
     * @tc.name  rdbStoreUpdateWithReturningMultiThread001
     * @tc.desc  rdb UpdateWithReturning Multi threaded testing
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('rdbStoreUpdateWithReturningMultiThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* rdbStoreUpdateWithReturningMultiThread001 start *************");
      await initData();
      let count:number = 200;
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
      };
      for (let i = 0; i < 200; ++i) {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", 'zhangsan' + i);
        rdbStore?.updateWithReturning(valueBucket, predicates, config)
          .then((result:relationalStore.Result)=>{
            expect(result.changed).assertEqual(1);
            result.resultSet.goToNextRow();
            expect(result.resultSet.getRow().name).assertEqual("lisi");
            expect(result.resultSet.goToNextRow()).assertFalse();
            count--;
            if (count == 0) {
              done();
            }
          }).catch((e:BusinessError)=>{
          console.error(TAG + " rdbStoreUpdateWithReturningMultiThread001 failed: " + e);
          done();
          expect(true).assertFail();
        });
      }
      console.log(TAG + "************* rdbStoreUpdateWithReturningMultiThread001 end *************");
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_returningJsAPITest_20500
     * @tc.name  transStoreUpdateWithReturningMultiThread001
     * @tc.desc  trans UpdateWithReturning Multi threaded testing
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 2
     */
    it('transStoreUpdateWithReturningMultiThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* transStoreUpdateWithReturningMultiThread001 start *************");
      await initData();
      let count:number = 200;
      const config: relationalStore.ReturningConfig = {
        columns: ['name', 'age'],
      }
      const valueBucket: relationalStore.ValuesBucket = {
        'name': 'lisi',
      };
      let trans = await rdbStore?.createTransaction();
      for (let i = 0; i < 200; ++i) {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", 'zhangsan' + i);
        trans?.updateWithReturning(valueBucket, predicates, config)
          .then((result:relationalStore.Result)=>{
            expect(result.changed).assertEqual(1);
            result.resultSet.goToNextRow();
            expect(result.resultSet.getRow().name).assertEqual("lisi");
            expect(result.resultSet.goToNextRow()).assertFalse();
            count--;
            if (count == 0) {
              done();
            }
          }).catch((e:BusinessError)=>{
          console.error(TAG + " transStoreUpdateWithReturningMultiThread001 failed: " + e);
          done();
          expect(true).assertFail();
        });
      }
      await trans?.commit();
      console.log(TAG + "************* transStoreUpdateWithReturningMultiThread001 end *************");
    })
  })
}