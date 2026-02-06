/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
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
import data_Rdb from '@ohos.data.relationalStore';
import { BusinessError } from '@ohos.base'
import common from '@ohos.app.ability.common';




const TAG = "[DifferenceCustomDirMultiple_TEST]";
let context: common.UIAbilityContext;
let rdbStore1: data_Rdb.RdbStore;
let rdbStore2: data_Rdb.RdbStore;
let store: data_Rdb.RdbStore
const CREATE_TABLE_TEST = 'CREATE TABLE IF NOT EXISTS test (' + 'id INTEGER PRIMARY KEY AUTOINCREMENT, ' + 'name text,' + 'age long, ' + 'salary double,' + 'blobType blob)';

const STORE_CONFIG1: data_Rdb.StoreConfig = {
  name: "rdbstore.db",
  securityLevel: data_Rdb.SecurityLevel.S1,
  customDir: "rdbstore.db"
};

const STORE_CONFIG2: data_Rdb.StoreConfig = {
  name: "rdbstoretest.db",
  securityLevel: data_Rdb.SecurityLevel.S1,
  customDir: "rdbstore.db"
};

const STORE_CONFIG3: data_Rdb.StoreConfig = {
  name: "rdbstore.db",
  securityLevel: data_Rdb.SecurityLevel.S1,
  customDir: "rdbstore.db/test"
};

const STORE_CONFIG4: data_Rdb.StoreConfig = {
  name: "rdbstoretest.db",
  securityLevel: data_Rdb.SecurityLevel.S1,
  customDir: "rdbstore.db/test"
};

const STORE_CONFIG5: data_Rdb.StoreConfig = {
  name: "rdbstore.db",
  securityLevel: data_Rdb.SecurityLevel.S1,
  customDir: "rdbstore.db"
};


export default function relationalStoreDifferenceCustomDirMultipleTest() {
  describe('relationalStoreDifferenceCustomDirMultipleTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    })

    beforeEach(() => {
      console.info(TAG + 'beforeEach');
    })

    afterEach(async () => {
      console.info(TAG + 'afterAll');
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name DifferenceCustomDirMultiple0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DifferenceCustomDirMultipleJsAPITest_0100
     * @tc.desc RelationalStore store getRdbStore test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('DifferenceCustomDirMultiple0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG + "************* testRdbStore0001 start *************");
        await data_Rdb.getRdbStore(context, STORE_CONFIG1).then(async (rdbStore: data_Rdb.RdbStore) => {
          rdbStore1 = rdbStore;
          console.info(TAG +`Get RdbStore successfully.`)
          await rdbStore1.executeSql(CREATE_TABLE_TEST, null)
          let u8 = new Uint8Array([1, 2, 3])

          const valueBucket: data_Rdb. ValuesBucket = {
            "name": "zhangsan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          }
          await rdbStore1.insert("test", valueBucket).then(() => {
            console.info(TAG +`insert successfully.`)
          }).catch((err: BusinessError) => {
            console.info("insert error " + err);
            expect().assertFail();
            done();
          })
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
          console.error(TAG +`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
        })

          await data_Rdb.getRdbStore(context, STORE_CONFIG5).then(async (rdbStore: data_Rdb.RdbStore) => {
            rdbStore2 = rdbStore;
            console.info(TAG +`Get RdbStore successfully.`)
            let predicates = new data_Rdb.RdbPredicates("test")
            predicates.equalTo("name", "zhangsan")
            await rdbStore2.query(predicates).then(async (resultSet) => {
              console.info(TAG + "resultSet query done");
              expect(true).assertEqual(resultSet.goToFirstRow())
              const id = resultSet.getLong(resultSet.getColumnIndex("id"))
              const name = resultSet.getString(resultSet.getColumnIndex("name"))
              const age = resultSet.getLong(resultSet.getColumnIndex("age"))
              const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
              const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
              console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
              expect(1).assertEqual(id);
              expect("zhangsan").assertEqual(name)
              expect(18).assertEqual(age)
              expect(100.5).assertEqual(salary)
              expect(false).assertEqual(resultSet.goToNextRow())
              console.info(TAG + "************* querySuccess end *************");
              resultSet.close();
              
            }).catch((err: BusinessError) => {
              console.info("query error " + err);
              expect().assertFail();
              done();
            })
          }).catch((err: BusinessError) => {
            expect(null).assertFail();
            console.error(TAG +`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          })
      await data_Rdb.deleteRdbStore(context,STORE_CONFIG1);
      done();
      console.info(TAG + "************* testRdbStore0001 end   *************");
    })

    /**
     * @tc.name DifferenceCustomDirMultiple0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DifferenceCustomDirMultipleJsAPITest_0200
     * @tc.desc RelationalStore store getRdbStore test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('DifferenceCustomDirMultiple0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG + "************* testRdbStore0002 start *************");
      await data_Rdb.getRdbStore(context, STORE_CONFIG1).then(async (rdbStore) => {
        rdbStore1 = rdbStore;
        console.info(TAG +`Get RdbStore successfully.`)
      }).catch((err: BusinessError) => {
        expect(null).assertFail();
        console.error(TAG +`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
      })
      await data_Rdb.getRdbStore(context, STORE_CONFIG2).then(async (rdbStore) => {
        rdbStore2 = rdbStore;
        console.info(TAG +`Get RdbStore successfully.`)
      }).catch((err: BusinessError) => {
        expect(null).assertFail();
        console.error(TAG +`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
      })
      await data_Rdb.deleteRdbStore(context,STORE_CONFIG1);
      await data_Rdb.deleteRdbStore(context,STORE_CONFIG2);
      done();
      console.info(TAG + "************* testRdbStore0002 end   *************");
    })

    /**
     * @tc.name DifferenceCustomDirMultiple0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DifferenceCustomDirMultipleJsAPITest_0300
     * @tc.desc RelationalStore store getRdbStore test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('DifferenceCustomDirMultiple0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG + "************* testRdbStore0003 start *************");
      await data_Rdb.getRdbStore(context, STORE_CONFIG1).then(async (rdbStore) => {
        rdbStore1 = rdbStore;
        console.info(TAG +`Get RdbStore successfully.`)
      }).catch((err: BusinessError) => {
        expect(null).assertFail();
        console.error(TAG +`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
      })
      await data_Rdb.getRdbStore(context, STORE_CONFIG3).then(async (rdbStore) => {
        rdbStore2 = rdbStore;
        console.info(TAG +`Get RdbStore successfully.`)
      }).catch((err: BusinessError) => {
        expect(null).assertFail();
        console.error(TAG +`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
      })
      await data_Rdb.deleteRdbStore(context,STORE_CONFIG1);
      await data_Rdb.deleteRdbStore(context,STORE_CONFIG3);
      done();
      console.info(TAG + "************* testRdbStore0003 end   *************");
    })

    /**
     * @tc.name DifferenceCustomDirMultiple0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DifferenceCustomDirMultipleJsAPITest_0400
     * @tc.desc RelationalStore store getRdbStore test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('DifferenceCustomDirMultiple0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG + "************* testRdbStore0004 start *************");
      await data_Rdb.getRdbStore(context, STORE_CONFIG1).then(async (rdbStore) => {
        rdbStore1 = rdbStore;
        console.info(TAG +`Get RdbStore successfully.`)
      }).catch((err: BusinessError) => {
        expect(null).assertFail();
        console.error(TAG +`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
      })
      await data_Rdb.getRdbStore(context, STORE_CONFIG4).then(async (rdbStore) => {
        rdbStore2 = rdbStore;
        console.info(TAG +`Get RdbStore successfully.`)
      }).catch((err: BusinessError) => {
        expect(null).assertFail();
        console.error(TAG +`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
      })
      await data_Rdb.deleteRdbStore(context,STORE_CONFIG1);
      await data_Rdb.deleteRdbStore(context,STORE_CONFIG4);
      done();
      console.info(TAG + "************* testRdbStore0004 end   *************");
    })


    console.info(TAG + "*************Unit Test End*************");
  })}
