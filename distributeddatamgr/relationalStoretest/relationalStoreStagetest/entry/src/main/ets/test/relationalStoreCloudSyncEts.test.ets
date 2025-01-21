/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import ability_featureAbility from '@ohos.ability.featureAbility';

const TAG = "[RELATIONAL_STORE_JSKITS_TEST]";
const STORE_NAME = "cloud_sync_rdb.db";
let rdbStore = undefined;


export default function relationalStoreCloudSyncEtsTest(context) {
  describe('relationalStoreCloudSyncEtsTest', function () {
    beforeAll(async function (done) {
      console.info(TAG + 'beforeAll')
      const config = {
        "name": STORE_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      try {
        console.log(TAG + "create rdb store before");
        try{
          rdbStore = await relationalStore.getRdbStore(context, config);
          console.log(TAG + "create rdb store success");
        }catch(err){
          console.log(TAG + "create rdb store failed" + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        }

        let sql_text = "CREATE TABLE IF NOT EXISTS cloud_text (" +
        "data TEXT, " +
        "recycled BOOLEAN, " +
        "recycledTime INTEGER, " +
        "num TEXT PRIMARY KEY)";
        let sql_int = "CREATE TABLE IF NOT EXISTS cloud_int (" +
        "data TEXT, " +
        "recycled BOOLEAN, " +
        "recycledTime INTEGER, " +
        "num INTEGER PRIMARY KEY)";
        let sql_integer = "CREATE TABLE IF NOT EXISTS cloud_integer (" +
        "data TEXT, " +
        "recycled BOOLEAN, " +
        "recycledTime INTEGER, " +
        "num INTEGER PRIMARY KEY)";
        try {
          await rdbStore.executeSql(sql_text, null);
          await rdbStore.executeSql(sql_int, null);
          await rdbStore.executeSql(sql_integer, null);
          console.log(TAG + "create table cloud_text cloud_int cloud_integer success");
        } catch (err) {
          console.log(TAG + "create table cloud_text cloud_int cloud_integer failed" + `, error code is ${err.code}, message is ${err.message}`)
          expect(null).assertFail();
        }

        let tableArray = ["cloud_text", "cloud_integer"];
        const setConfig = {
          autoSync: false,
        }
        let promise = rdbStore.setDistributedTables(
          tableArray, relationalStore.DistributedType.DISTRIBUTED_CLOUD, setConfig);
        await promise.then(() => {
          console.log(TAG + "set disTable success");
        }).catch((err) => {
          console.log(TAG + "set disTable fail" + `, error code is ${err.code}, message is ${err.message}`);
        })
        let vBucketArray1 = new Array();
        for (let i = 0; i < 5; i++) {
          let valueBucket = {
            "data": "cloud_sync_insert",
            "recycled": true,
            "recycledTime": 12345,
            "num": "test_key" + i.toString(),
          }
          vBucketArray1.push(valueBucket);
        }
        await rdbStore.batchInsert("cloud_text", vBucketArray1);
        let vBucketArray2 = new Array();
        for (let i = 0; i < 5; i++) {
          let valueBucket = {
            "data": "cloud_sync_insert",
            "recycled": true,
            "recycledTime": 12345,
            "num": i,
          }
          vBucketArray2.push(valueBucket);
        }
        await rdbStore.batchInsert("cloud_integer", vBucketArray2);
        console.log(TAG + "create rdb store success");
      } catch (err) {
        console.log(TAG + "create rdb store failed" + `, error code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      done();
    })

    beforeEach(async function () {
      console.info(TAG + 'beforeEach');
    })

    afterEach(async function () {
      console.info(TAG + 'afterEach');
    })

    afterAll(async function () {
      console.info(TAG + 'afterAll');
      rdbStore = null;
      await rdbStore.deleteRdbStore(context, STORE_NAME);
    })

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name test PRIKeyType string
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsApiTest_0200
     * @tc.desc test PRIKeyType string
     */
    it('testRdbStorePRIKeyType0010', 0, async function (done) {
      console.log(TAG + "************* testRdbStorePRIKeyType0010 start *************");
      try {
        let priKey1 : relationalStore.PRIKeyType = "test_key1";
        let priKey2 : relationalStore.PRIKeyType = "test_key2";
        rdbStore.getModifyTime("cloud_text", "num", [priKey1, priKey2], function (err, data) {
          console.log(TAG + 'modifyTime:' + JSON.stringify(data) );
          expect(err == undefined).assertTrue();
          let size = Object.keys(data).length ;
          console.log(TAG + 'size=' + size);
          expect( size == 2 ).assertTrue();
          done();
        });
      } catch (err) {
        console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
        expect(null).assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStorePRIKeyType0010 end *************");
    })

    
    /**
     * @tc.name test PRIKeyType number
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsApiTest_0100
     * @tc.desc test PRIKeyType number
     */
    it('testRdbStorePRIKeyType0020', 0, async function (done) {
      console.log(TAG + "************* testRdbStorePRIKeyType0020 start *************");
      try {
        let priKey1 : relationalStore.PRIKeyType = 2;
        let priKey2 : relationalStore.PRIKeyType = 4;
        await rdbStore.getModifyTime("cloud_integer", "num", [priKey1, priKey2]).then((data) => {
          console.log(TAG + `modifyTime:` + JSON.stringify(data));
          let size = Object.keys(data).length ;
          console.log(TAG + 'size=' + size);
          expect( size == 2 ).assertTrue();
          done();
        });
      } catch (err) {
        console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
        expect(null).assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStorePRIKeyType0020 end *************");
    })

    /**
     * @tc.name test UTCTime type
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsApiTest_0300
     * @tc.desc test UTCTime type
     */
    it('testRdbStoreUTCTime0010', 0, async function (done) {
      console.log(TAG + "************* testRdbStoreUTCTime0010 start *************");
      try {
        let time = new Date();
        let timeUTC : relationalStore.UTCTime = time;
        expect( timeUTC == time ).assertTrue();
        done();
      } catch (err) {
        console.log(TAG + `testRdbStoreUTCTime0010 fail, err code is ${err.code}, message is ${err.message}.`);
        expect(null).assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreUTCTime0010 end *************");
    })

    /**
     * @tc.name test ModifyTime type
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsApiTest_0500
     * @tc.desc test ModifyTime type
     */
    it('testRdbStoreModifyTime0010', 0, async function (done) {
      console.log(TAG + "************* testRdbStoreModifyTime0010 start *************");
      try {
        let priKey1 : relationalStore.PRIKeyType = "test_key1";
        let timeUTC : relationalStore.UTCTime = new Date();
        let testMap = new Map();
        testMap.set(priKey1, timeUTC);
        let modifyTime : relationalStore.ModifyTime = testMap;
        console.log(TAG + ' modifyTime.size=' + modifyTime.size);
        expect( modifyTime.size == 1 ).assertTrue();
        done();
      } catch (err) {
        console.log(TAG + `testRdbStoreModifyTime0010 fail, err code is ${err.code}, message is ${err.message}.`);
        expect(null).assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreModifyTime0010 end *************");
    })
    /**
     * @tc.name test Progress type
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsApiTest_0800
     * @tc.desc test Progress type
     */
    it('testRdbStoreProgress0010', 0, async function (done) {
      console.log(TAG + "************* testRdbStoreProgress0010 start *************");
      try {
        expect(relationalStore.Progress.SYNC_BEGIN == 0).assertTrue();
        expect(relationalStore.Progress.SYNC_IN_PROGRESS == 1).assertTrue();
        expect(relationalStore.Progress.SYNC_FINISH == 2).assertTrue();
        done();
      } catch (err) {
        console.log(TAG + `testRdbStoreProgress0010 fail, err code is ${err.code}, message is ${err.message}.`);
        expect(null).assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreProgress0010 end *************");
    })
    /**
     * @tc.name test Statistic
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsApiTest_0900
     * @tc.desc test Statistic
     */
    it('testRdbStoreStatistic0010', 0, async function (done) {
      console.log(TAG + "************* testRdbStoreStatistic0010 start *************");
      try {
        let statistic1 : relationalStore.Statistic = {"total":10, "successful":6, "failed":3, "remained":1};
        expect(statistic1.total == 10 ).assertTrue();
        expect(statistic1.successful == 6 ).assertTrue();
        expect(statistic1.failed == 3 ).assertTrue();
        expect(statistic1.remained == 1 ).assertTrue();
        done();
      } catch (err) {
        console.log(TAG + `testRdbStoreStatistic0010 fail, err code is ${err.code}, message is ${err.message}.`);
        expect(null).assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreStatistic0010 end *************");
    })

    /**
     * @tc.name test TableDetails
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsApiTest_1000
     * @tc.desc test TableDetails
     */
    it('testRdbStoreTableDetails0010', 0, async function (done) {
      console.log(TAG + "************* testRdbStoreTableDetails0010 start *************");
      try {
        let statistic1 : relationalStore.Statistic = {"total":10, "successful":6, "failed":3, "remained":1};
        let statistic2 : relationalStore.Statistic = {"total":100, "successful":60, "failed":30, "remained":10};
        let tableDetail : relationalStore.TableDetails = {"upload": statistic1, "download": statistic2};

        expect(tableDetail.upload == statistic1 ).assertTrue();
        expect(tableDetail.download == statistic2 ).assertTrue();
        done();
      } catch (err) {
        console.log(TAG + `testRdbStoreTableDetails0010 fail, err code is ${err.code}, message is ${err.message}.`);
        expect(null).assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreTableDetails0010 end *************");
    })

    /**
     * @tc.name test ProgressCode
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsApiTest_0600
     * @tc.desc test ProgressCode
     */
    it('testRdbStoreProgressCode0010', 0, async function (done) {
      console.log(TAG + "************* testRdbStoreProgressCode0010 start *************");
      try {
        console.log(TAG + "SUCCESS=" + relationalStore.ProgressCode.SUCCESS);
        expect(relationalStore.ProgressCode.SUCCESS == 0).assertTrue();
        expect(relationalStore.ProgressCode.UNKNOWN_ERROR == 1).assertTrue();
        expect(relationalStore.ProgressCode.NETWORK_ERROR == 2).assertTrue();
        expect(relationalStore.ProgressCode.CLOUD_DISABLED == 3).assertTrue();
        expect(relationalStore.ProgressCode.LOCKED_BY_OTHERS == 4).assertTrue();
        expect(relationalStore.ProgressCode.RECORD_LIMIT_EXCEEDED == 5).assertTrue();
        expect(relationalStore.ProgressCode.NO_SPACE_FOR_ASSET == 6).assertTrue();
        expect(relationalStore.ProgressCode.BLOCKED_BY_NETWORK_STRATEGY == 7).assertTrue();
        done();
      } catch (err) {
        console.log(TAG + `testRdbStoreProgressCode0010 fail, err code is ${err.code}, message is ${err.message}.`);
        expect(null).assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreProgressCode0010 end *************");
    })

    /**
     * @tc.name test ProgressDetails
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsApiTest_0700
     * @tc.desc test ProgressDetails
     */
    it('testRdbStoreProgressDetails0010', 0, async function (done) {
      console.log(TAG + "************* testRdbStoreProgressDetails0010 start *************");
      try {
        let statistic1 : relationalStore.Statistic = {"total":10, "successful":6, "failed":3, "remained":1};
        let statistic2 : relationalStore.Statistic = {"total":100, "successful":60, "failed":30, "remained":10};
        let tableDetail : relationalStore.TableDetails = {"upload": statistic1, "download": statistic2};
        let tableName = "cloud_text";
        let progressDetail : relationalStore.ProgressDetails = {"schedule":2,"code":0,"details":{ [tableName]:tableDetail}};
        expect(progressDetail.schedule == 2).assertTrue();
        expect(progressDetail.code == 0).assertTrue();
        expect(progressDetail.details[tableName] == tableDetail).assertTrue();
        done();
      } catch (err) {
        console.log(TAG + `testRdbStoreProgressDetails0010 fail, err code is ${err.code}, message is ${err.message}.`);
        expect(null).assertFail();
        done();
      }
      console.log(TAG + "************* testRdbStoreProgressDetails0010 end *************");
    })


    console.log(TAG + "*************Unit Test End*************");
  })}
