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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
const TAG = "[RELATIONAL_STORE_ASYNCDOWNLOADASSET_TEST]";
const STORE_NAME = "cloud_rdb.db"
var rdbStore = undefined;
let context: common.UIAbilityContext;
const valueBucket = {
  'name': 'zhangsan',
  'age': 18,
}
let predicates = new relationalStore.RdbPredicates('employee')

export default function relationalStoreAsyncDownloadAssetTest() {
  describe('relationalStoreAsyncDownloadAssetTest', () => {
    beforeAll(async (done: Function) => {
      console.info(TAG + 'beforeAll')
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      const config = {
        "name": STORE_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      try {
          rdbStore = await relationalStore.getRdbStore(context, config);
          console.log(TAG + "create rdb store success")
          let sqlStatement = "CREATE TABLE IF NOT EXISTS employee (" +
              "id INTEGER PRIMARY KEY AUTOINCREMENT," +
              "name TEXT NOT NULL," +
              "age INTEGER)"
          await rdbStore.executeSql(sqlStatement, null)
          console.log(TAG + "create table employee success")

          sqlStatement = "CREATE TABLE IF NOT EXISTS product (" +
              "id INTEGER PRIMARY KEY AUTOINCREMENT," +
              "name TEXT NOT NULL," +
              "price REAL," +
              "vendor INTEGER," +
              "describe TEXT)"
          await rdbStore.executeSql(sqlStatement, null)
          console.log(TAG + "create table product success")

          sqlStatement = "CREATE TABLE IF NOT EXISTS local (" +
              "id INTEGER PRIMARY KEY AUTOINCREMENT," +
              "name TEXT NOT NULL," +
              "price REAL," +
              "vendor INTEGER," +
              "describe TEXT)"
          await rdbStore.executeSql(sqlStatement, null)
          console.log(TAG + "create table local success")
      } catch (err) {
          console.log(TAG + "create rdb store failed" + `, error code is ${err.code}, message is ${err.message}`)
          expect(null).assertFail()
      }
      done();
    })

    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
    })

    afterEach(async () => {
      console.info(TAG + 'afterEach');
      predicates.equalTo('name', 'zhangsan');
      let resultSet = await rdbStore.query(predicates)
      if(resultSet.rowCount == 1){
        rdbStore.delete(predicates).then(async (ret) => {
          console.info(TAG + 'afterEach Delete done: ' + ret)
        }).catch((err) => {
            console.info(TAG + 'afterEach Delete fail: ' + err.code)
        })
      }
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll');
      rdbStore = null
      await relationalStore.deleteRdbStore(context, STORE_NAME);
    })

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name test DistributedConfig.asyncDownloadAsset
     * @tc.number SUB_DistributedData_RelationalStore_SDK_AsyncDownloadAsset_0100
     * @tc.desc set distributed table cloud with 'asyncDownloadAsset' is true
     */
     it('testRdbAsyncDownloadAsset001', 0, async function (done) {
      console.log(TAG + "************* testRdbAsyncDownloadAsset001 start *************");
      try {
          let config = {
              autoSync: false,
              asyncDownloadAsset: true
          }
          await rdbStore.setDistributedTables(['employee'],
              relationalStore.DistributedType.DISTRIBUTED_CLOUD, config).then(() => {
              console.log(TAG + "set employee to be distributed cloud table success");
          }).catch((err) => {
              console.log(TAG + `testRdbAsyncDownloadAsset001 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
              expect().assertFail();
              done()
          });
          await rdbStore.insert('employee', valueBucket);
          predicates.equalTo('name', 'zhangsan')
          let resultSet = await rdbStore.query(predicates)
          expect(1).assertEqual(resultSet.rowCount)
          console.log(TAG + "************* testRdbAsyncDownloadAsset001 end *************");
          done();
      } catch (err) {
          console.log(TAG + `testRdbAsyncDownloadAsset001 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
          expect().assertFail();
          done()
      }
    })

    /**
     * @tc.name test DistributedConfig.asyncDownloadAsset is false
     * @tc.number SUB_DistributedData_RelationalStore_SDK_AsyncDownloadAsset_0200
     * @tc.desc set distributed table cloud with 'asyncDownloadAsset' is false
     */
     it('testRdbAsyncDownloadAsset002', 0, async function (done) {
      console.log(TAG + "************* testRdbAsyncDownloadAsset002 start *************");
      try {
          let config = {
              autoSync: false,
              asyncDownloadAsset: false
          }
          await rdbStore.setDistributedTables(['employee'],
              relationalStore.DistributedType.DISTRIBUTED_CLOUD, config).then(()=>{
              console.log(TAG + "set employee to be distributed cloud table success");
          }).catch((err)=>{
              console.log(TAG + `testRdbAsyncDownloadAsset002 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
              expect().assertFail();
              done()
          });
          await rdbStore.insert('employee', valueBucket);
          predicates.equalTo('name', 'zhangsan')
          let resultSet = await rdbStore.query(predicates)
          expect(1).assertEqual(resultSet.rowCount)
          console.log(TAG + "************* testRdbAsyncDownloadAsset002 end *************");
          done();
      } catch (err) {
          console.log(TAG + `testRdbAsyncDownloadAsset002 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
          expect().assertFail();
          done()
      }
  })

  /**
   * @tc.name set distributeded table cloud with promise
   * @tc.number SUB_DistributedData_RelationalStore_SDK_AsyncDownloadAsset_0300
   * @tc.desc set distributed table cloud with 'asyncDownloadAsset' is 20
  */
  it('testRdbAsyncDownloadAsset003', 0, async function (done) {
    console.log(TAG + "************* testRdbAsyncDownloadAsset003 start *************");
    try {
        let config = {
            autoSync: false,
            asyncDownloadAsset: 20
        }
        await rdbStore.setDistributedTables(['employee'],
            relationalStore.DistributedType.DISTRIBUTED_CLOUD, config).then(() => {
            console.log(TAG + "set employee to be distributed cloud table success");
            expect().assertFail();
            console.log(TAG + "************* testRdbAsyncDownloadAsset003 end *************");
            done();
        }).catch((err) => {
            console.log(TAG + `testRdbAsyncDownloadAsset003 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
            expect().assertFail();
            done()
        });
      } catch (err) {
        console.log(TAG + `testRdbAsyncDownloadAsset003 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
        expect(err.code).assertEqual("401");
        done()
      }
    })

  /**
   * @tc.name set distributeded table cloud with promise
   * @tc.number SUB_DistributedData_RelationalStore_SDK_AsyncDownloadAsset_0400
   * @tc.desc set distributed table cloud with 'asyncDownloadAsset' is 0
  */
   it('testRdbAsyncDownloadAsset004', 0, async function (done) {
    console.log(TAG + "************* testRdbAsyncDownloadAsset004 start *************");
    try {
        let config = {
            autoSync: false,
            asyncDownloadAsset: 0
        }
        await rdbStore.setDistributedTables(['employee'],
            relationalStore.DistributedType.DISTRIBUTED_CLOUD, config).then(() => {
            console.log(TAG + "set employee to be distributed cloud table success");
            expect().assertFail();
            console.log(TAG + "************* testRdbAsyncDownloadAsset004 end *************");
            done();
        }).catch((err) => {
            console.log(TAG + `testRdbAsyncDownloadAsset004 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
            expect().assertFail();
            done()
        });
      } catch (err) {
        console.log(TAG + `testRdbAsyncDownloadAsset004 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
        expect(err.code).assertEqual("401");
        done()
      }
    })

  /**
   * @tc.name set distributeded table cloud with promise
   * @tc.number SUB_DistributedData_RelationalStore_SDK_AsyncDownloadAsset_0500
   * @tc.desc set distributed table cloud with 'asyncDownloadAsset' is 1
  */
   it('testRdbAsyncDownloadAsset005', 0, async function (done) {
    console.log(TAG + "************* testRdbAsyncDownloadAsset005 start *************");
    try {
        let config = {
            autoSync: false,
            asyncDownloadAsset: 1
        }
        await rdbStore.setDistributedTables(['employee'],
            relationalStore.DistributedType.DISTRIBUTED_CLOUD, config).then(() => {
            console.log(TAG + "set employee to be distributed cloud table success");
            expect().assertFail();
            console.log(TAG + "************* testRdbAsyncDownloadAsset005 end *************");
            done();
        }).catch((err) => {
            console.log(TAG + `testRdbAsyncDownloadAsset005 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
            expect().assertFail();
            done()
        });
      } catch (err) {
        console.log(TAG + `testRdbAsyncDownloadAsset005 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
        expect(err.code == 401).assertTrue();
        done()
      }
    })

  /**
   * @tc.name set distributeded table cloud with promise
   * @tc.number SUB_DistributedData_RelationalStore_SDK_AsyncDownloadAsset_0600
   * @tc.desc set distributed table cloud with 'asyncDownloadAsset' is -1
  */
   it('testRdbAsyncDownloadAsset006', 0, async function (done) {
    console.log(TAG + "************* testRdbAsyncDownloadAsset006 start *************");
    try {
        let config = {
            autoSync: false,
            asyncDownloadAsset: -1
        }
        await rdbStore.setDistributedTables(['employee'],
            relationalStore.DistributedType.DISTRIBUTED_CLOUD, config).then(() => {
            console.log(TAG + "testRdbAsyncDownloadAsset006 set employee to be distributed cloud table success");
            expect().assertFail();
            console.log(TAG + "************* testRdbAsyncDownloadAsset006 end *************");
            done();
        }).catch((err) => {
            console.log(TAG + `testRdbAsyncDownloadAsset006 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
            expect().assertFail();
            done()
        });
      } catch (err) {
        console.log(TAG + `testRdbAsyncDownloadAsset006 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
        expect(err.code == 401).assertTrue();
        done()
      }
    })


  /**
   * @tc.name set distributeded table cloud with promise
   * @tc.number SUB_DistributedData_RelationalStore_SDK_AsyncDownloadAsset_0700
   * @tc.desc set distributed table cloud with 'autoSync' is true 'asyncDownloadAsset' is true
  */
   it('testRdbAsyncDownloadAsset007', 0, async function (done) {
    console.log(TAG + "************* testRdbAsyncDownloadAsset007 start *************");
    try {
        let config = {
            autoSync: true,
            asyncDownloadAsset: true,
        }
        await rdbStore.setDistributedTables(['employee'],
            relationalStore.DistributedType.DISTRIBUTED_CLOUD, config).then(() => {
            console.log(TAG + "testRdbAsyncDownloadAsset007 set employee to be distributed cloud table success");
        }).catch((err) => {
            console.log(TAG + `testRdbAsyncDownloadAsset007 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
            expect().assertFail();
            done()
        });
        await rdbStore.insert('employee', valueBucket);
        predicates.equalTo('name', 'zhangsan')
        let resultSet = await rdbStore.query(predicates)
        expect(1).assertEqual(resultSet.rowCount)
        console.log(TAG + "************* testRdbAsyncDownloadAsset007 end *************");
        done();
      } catch (err) {
        console.log(TAG + `testRdbAsyncDownloadAsset007 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name set distributeded table cloud with promise
     * @tc.number SUB_DistributedData_RelationalStore_SDK_AsyncDownloadAsset_0800
     * @tc.desc set distributed table cloud with 'autoSync' is true 'asyncDownloadAsset' is false
    */
    it('testRdbAsyncDownloadAsset008', 0, async function (done) {
      console.log(TAG + "************* testRdbAsyncDownloadAsset008 start *************");
      try {
          let config = {
              autoSync: true,
              asyncDownloadAsset: false,
          }
          await rdbStore.setDistributedTables(['employee'],
              relationalStore.DistributedType.DISTRIBUTED_CLOUD, config).then(() => {
              console.log(TAG + "testRdbAsyncDownloadAsset008 set employee to be distributed cloud table success");
          }).catch((err) => {
              console.log(TAG + `testRdbAsyncDownloadAsset008 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
              expect().assertFail();
              done()
          });
          await rdbStore.insert('employee', valueBucket);
          predicates.equalTo('name', 'zhangsan')
          let resultSet = await rdbStore.query(predicates)
          expect(1).assertEqual(resultSet.rowCount)
          console.log(TAG + "************* testRdbAsyncDownloadAsset008 end *************");
          done();
        } catch (err) {
          console.log(TAG + `testRdbAsyncDownloadAsset008 set employee to be distributed table failed, errcode:${JSON.stringify(err)}.`);
          expect().assertFail();
          done()
        }
      })

    console.log(TAG + "*************RELATIONAL_STORE_ASYNCDOWNLOADASSET_TEST Test End*************");
  })}
