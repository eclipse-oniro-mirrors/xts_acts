/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import dataSharePredicates from '@ohos.data.dataSharePredicates';

let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let context: common.UIAbilityContext | undefined;
let domain: int = 0x0000;
let tag: string = 'testtag';
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG :data_relationalStore.StoreConfig = {
  name: "test.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
const CREATE_TABLE_TESTTRANS = "CREATE TABLE IF NOT EXISTS testTrans (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT" + ")";

const DROP_TABLE_TESTTRANS = "DROP TABLE IF EXISTS testTrans";

const TABLE_NAME = "testTrans"

let STORE_CONFIG1 :data_relationalStore.StoreConfig = {
  name: "test1.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  encrypt:false,
}
const CREATE_TABLE_TESTERRCODE = "CREATE TABLE IF NOT EXISTS testerrcode (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 TEXT NOT NULL," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TESTERRCODE = "DROP TABLE IF EXISTS testerrcode";

let STORE_CONFIG2 :data_relationalStore.StoreConfig = {
  name: "test2.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let rdbStore : data_relationalStore.RdbStore | undefined;
let rdbStore1 : data_relationalStore.RdbStore
let rdbStore2 : data_relationalStore.RdbStore
let vbs :Array<data_relationalStore.ValuesBucket> = [];
const valueBucket0 :data_relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long,//
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket1 :data_relationalStore.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
const valueBucket2 :data_relationalStore.ValuesBucket = {
  "data1": "hello world",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}

const valueBucket4 :data_relationalStore.ValuesBucket = {
  "data1": "333",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}
vbs.push(valueBucket0)
vbs.push(valueBucket1)
vbs.push(valueBucket2)

const valueBucket3 :data_relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 100 as long,//
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}

let options:data_relationalStore.TransactionOptions = {
  transactionType:data_relationalStore.TransactionType.DEFERRED
}

const STORE_CONFIG3:data_relationalStore.StoreConfig  = {
  name: "rdbstore3.db",
  encrypt: true,
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

export default function RdbStoreResultNullEtsTest() {
  describe('RdbStoreResultNullEtsTest', ():void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000)
      context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
    })
    beforeEach(async (): Promise<void> => {
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(DROP_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_TEST);
    })

    afterAll(async ():Promise<void>  => {
      await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    })

    afterEach(async():Promise<void>  => {
      await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    })

    /**
     * @tc.name       testRdbStoreWithReturning001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_0100
     * @tc.desc       normal test add maxReturningCount
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testRdbStoreWithReturning001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testrdbStoreWithReturning001 start *************');
      const config: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
        maxReturningCount: 1000
      }
      try {
        let results = await rdbStore!.batchInsertWithReturning("test", [valueBucket0], config, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(tag + "batchInsertWithReturning" + results.changed);
        expect(results.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `batchInsertWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      const valueBucket: data_relationalStore.ValuesBucket = {
        'data1': 'lisi',
        "data2": 10 as long,
        "data3": 1.0,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo('data1', 'hello');
      const config1: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results1 = await rdbStore!.updateWithReturning(valueBucket, predicates, config1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(tag + "updateWithReturning" + results1.changed);
        expect(results1.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `updateWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      let predicates1 = new data_relationalStore.RdbPredicates("test");
      predicates1.equalTo('data2', 10 as long);
      const config2: data_relationalStore.ReturningConfig = {
        columns: ['data1', 'data2'],
      }
      try {
        let results2 = await rdbStore!.deleteWithReturning(predicates1, config2);
        console.log(tag + "deleteWithReturning" + results2.changed);
        expect(results2.changed).assertEqual(1);
      } catch (e) {
        console.error(tag + `deleteWithReturning failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* testrdbStoreWithReturning001 end *************');
    })

    /**
     * @tc.name        testisAtFirstRow0001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_0200
     * @tc.desc        isAtFirstRow test
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testisAtFirstRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testisAtFirstRow0001 start *************');
      let resultSet = await rdbStore!.querySql("SELECT * FROM test");
      console.log(tag + "isAtFirstRow is " + resultSet.isAtFirstRow + ",isAtLastRow is " + resultSet.isAtLastRow + ",isEnded is " + resultSet.isEnded + ",isStarted is " + resultSet.isStarted + ",isClosed is " + resultSet.isClosed);
      expect(resultSet.isAtFirstRow).assertFalse();
      expect(resultSet.isAtLastRow).assertTrue();
      expect(resultSet.isEnded).assertTrue();
      expect(resultSet.isStarted).assertFalse();
      expect(resultSet.isClosed).assertFalse();
      resultSet!.close();
      done();
      hilog.info(domain, tag, '%{public}s', '************* testisAtFirstRow0001 end *************');
    })

    /**
     * @tc.name        testGetColumnIndex0001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_0300
     * @tc.desc        getColumnIndex is ""
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGetColumnIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0001 start *************');
      try {
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        console.log(tag + "getColumnIndex is " + resultSet.getColumnIndex("") );
        let count = resultSet.getColumnIndex("");
        expect(count).assertEqual(-1);
        resultSet!.close();
      } catch (e) {
        console.error(tag + `getColumnIndex failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0001 end *************');
    })

    /**
     * @tc.name        testGetgetColumnType0001
     * @tc.number      SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_0400
     * @tc.desc        getColumnType is ""
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('testGetgetColumnType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetgetColumnType0001 start *************');
      try {
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        let count = resultSet.getColumnType("");
        expect(count!==undefined).assertTrue();
        resultSet!.close();
      } catch (e) {
        console.error(tag + `getColumnIndex failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
      done();
      hilog.info(domain, tag, '%{public}s', '************* testGetgetColumnType0001 end *************');
    })

    /**
     * @tc.name   testGetgetColumnType0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_0500
     * @tc.desc   uerySharingResource test all 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetgetColumnType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testGetgetColumnType0002 start *************");
      try {
        const asset:data_relationalStore.Asset = {
          name: "name4",
          uri: "uri4",
          createTime: "createTime4",
          modifyTime: "modifyTime4",
          size: "size4",
          path: "path4",
        };
        const assets = [asset];
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
        console.log(tag + "row is " + row);
      } catch (err) {
        console.error(tag +  "testGetgetColumnType0002 insert failed " + err);
        expect(true).assertFail();
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        resultSet!.goToFirstRow();
        let type = data_relationalStore.ColumnType.NULL;
        type = await resultSet!.getColumnType(resultSet.getColumnIndex("id"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data1"));
        expect(type).assertEqual(data_relationalStore.ColumnType.TEXT);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data2"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data3"));
        expect(type).assertEqual(data_relationalStore.ColumnType.REAL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data4"));
        expect(type).assertEqual(data_relationalStore.ColumnType.BLOB);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data5"));
        expect(type).assertEqual(data_relationalStore.ColumnType.ASSET);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data6"));
        expect(type).assertEqual(data_relationalStore.ColumnType.ASSETS);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data7"));
        expect(type).assertEqual(data_relationalStore.ColumnType.FLOAT_VECTOR);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data8"));
        expect(type).assertEqual(data_relationalStore.ColumnType.UNLIMITED_INT);
        resultSet!.close();
        done();
      } catch (err) {
        console.error(tag +  "testGetgetColumnType0002  failed " + err.code + err.message);
        expect().assertFail();
        done();
      }
      console.log(tag + "************* testGetgetColumnType0002 end *************");
    });

    /**
     * @tc.name   testRdbGetColumnTypeSync401
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_0600
     * @tc.desc   getColumnTypeSync errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnTypeSync401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbGetColumnTypeSync401 start *************");
        try {
          const valueBucket: data_relationalStore.ValuesBucket = {
            "data1": null,
            "data2": null,
            "data3": null,
            "data4": null,
            "data5": null,
            "data6": null,
            "data7": null,
            "data8": null
          };
          let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.log(tag + "row is " + row);
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSync401 insert failed " + err);
          expect().assertFail();
        }
        try {
          let resultSet = await rdbStore!.querySql("SELECT * FROM employee");
          resultSet!.goToFirstRow();
          let type = data_relationalStore.ColumnType.NULL;
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("id"));
          expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data1"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data2"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data3"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data4"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data5"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data6"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data7"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data8"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          resultSet?.close();
          done();
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSync401  failed " + err.code + err.message);
          expect(401).assertEqual(err.code);
          done();
        }
        done();
        console.log(tag + "************* testRdbGetColumnTypeSync401 end *************");
      });

    /**
     * @tc.name   testRdbGetColumnTypeSyncString001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_0700
     * @tc.desc   getColumnTypeSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnTypeSyncString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbGetColumnTypeSyncString001 start *************");
        try {
          const valueBucket: data_relationalStore.ValuesBucket = {
            "data1": 10 as long,
            "data2": null,
            "data3": null,
            "data4": null,
            "data5": null,
            "data6": null,
            "data7": null,
            "data8": null
          };
          let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.log(tag + "row is " + row);
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSyncString001 insert failed " + err);
          expect().assertFail();
        }
        try {
          let resultSet = await rdbStore!.querySql("SELECT * FROM test");
          resultSet!.goToFirstRow();
          let type = data_relationalStore.ColumnType.NULL;
          type = resultSet!.getColumnTypeSync("data1ee");
          expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
          resultSet?.close();
          done();
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSyncString001  failed " + err.code + err.message);
          expect(401).assertEqual(err.code);
          done();
        }
        done();
        console.log(tag + "************* testRdbGetColumnTypeSyncString001 end *************");
      });

    /**
     * @tc.name   testRdbGetColumnTypeSyncString002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_0800
     * @tc.desc   getColumnTypeSync is String
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnTypeSyncString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbGetColumnTypeSyncString002 start *************");
        try {
          const valueBucket: data_relationalStore.ValuesBucket = {
            "data1":  "hello world"
          };
          let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.log(tag + "row is " + row);
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSyncString002 insert failed " + err);
          expect().assertFail();
        }
        try {
          let resultSet = await rdbStore!.querySql("SELECT * FROM test");
          resultSet!.goToFirstRow();
          let type = data_relationalStore.ColumnType.NULL;
          type = resultSet!.getColumnTypeSync("data1");
          console.log(tag + "type is " + type);
          console.log(tag + "type2 is " + data_relationalStore.ColumnType.TEXT);
          expect(type).assertEqual(data_relationalStore.ColumnType.TEXT);
          resultSet?.close();
          done();
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSyncString002  failed " + err.code + err.message);
          expect().assertFail();
          done();
        }
        done();
        console.log(tag + "************* testRdbGetColumnTypeSyncString002 end *************");
      });

    /**
     * @tc.name   testRdbGetColumnTypeSyncString003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_0900
     * @tc.desc   getColumnTypeSync is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnTypeSyncString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbGetColumnTypeSyncString003 start *************");
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet!.goToFirstRow();
        try {
          let type = data_relationalStore.ColumnType.NULL;
          type = resultSet!.getColumnTypeSync("");
          expect(true).assertFail();
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSyncString003  failed " + err.code + err.message);
          expect(401).assertEqual(err.code);
        }finally{
          resultSet?.close();
          done();
        }
        done();
        console.log(tag + "************* testRdbGetColumnTypeSyncString003 end *************");
      });

    /**
     * @tc.name   testRdbinsert000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_1000
     * @tc.desc   insert 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbinsert000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbinsert000 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
              console.info(tag +`Insert is successful, rowId = ${rowId}`);
              expect(rowId).assertEqual(1);
              }
            });
        }
        done();
        console.log(tag + "************* testRdbinsert000 end *************");
      });

    /**
     * @tc.name   testRdbinsert001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_1100
     * @tc.desc   insert  ConflictResolution.ON_CONFLICT_REPLACE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbinsert001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbinsert001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);

                let predicates = new data_relationalStore.RdbPredicates("test");
                predicates.equalTo("data1", "hello world");

                rdbStore!.query(predicates, ["data1"], (err, resultSet) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee: ${resultSet}`);
                    expect(resultSet!==undefined).assertTrue();
                    const valueBucket1: data_relationalStore.ValuesBucket = {
                    "data1": "hello world111"
                    };
                    rdbStore!.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, (err, rows) => {
                      if (err) {
                        console.error(tag +`Updated failed, code is ${err.code}, message is ${err.message}`);
                        expect(true).assertFail();
                      }
                      console.info(tag +`Updated row count: ${rows}`);
                      expect(rows).assertEqual(1);
                    });
                  }
                })

              }
            });

        }
        done()
        console.log(tag + "************* testRdbinsert001 end *************");
      });


    /**
     * @tc.name   testRdbinsert002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_1200
     * @tc.desc   insert  ConflictResolution.ON_CONFLICT_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbinsert002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbinsert002 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);
                let predicates = new data_relationalStore.RdbPredicates("test");
                predicates.equalTo("data1", "hello world");

                rdbStore!.query(predicates, ["data1"], (err, resultSet) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee: ${resultSet}`);
                    expect(resultSet!==undefined).assertTrue();
                    const valueBucket1: data_relationalStore.ValuesBucket = {
                    "data1": "hello world111"
                    };
                    rdbStore!.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE, (err, rows) => {
                      if (err) {
                        console.error(tag +`Updated failed, code is ${err.code}, message is ${err.message}`);
                        expect(true).assertFail();
                      }
                      console.info(tag +`Updated row count: ${rows}`);
                      expect(rows).assertEqual(1);
                    });
                  }
                })
              }
            });
        }
        done();
        console.log(tag + "************* testRdbinsert002 end *************");
      });

    /**
     * @tc.name   testRdbinsert003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_1300
     * @tc.desc   insert  ConflictResolution.ON_CONFLICT_ROLLBACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbinsert003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbinsert003 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);
                let predicates = new data_relationalStore.RdbPredicates("test");
                predicates.equalTo("data1", "hello world");

                rdbStore!.query(predicates, ["data1"], (err, resultSet) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee: ${resultSet}`);
                    expect(resultSet!==undefined).assertTrue();
                    const valueBucket1: data_relationalStore.ValuesBucket = {
                    "data1": "hello world111"
                    };
                    rdbStore!.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK, (err, rows) => {
                      if (err) {
                        console.error(tag +`Updated failed, code is ${err.code}, message is ${err.message}`);
                        expect(true).assertFail();
                      }
                      console.info(tag +`Updated row count: ${rows}`);
                      expect(rows).assertEqual(1);
                    });
                  }
                })
              }
            });
        }
        done();
        console.log(tag + "************* testRdbinsert003 end *************");
      });

    /**
     * @tc.name   testRdbinsert004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_1400
     * @tc.desc   insert  ConflictResolution.ON_CONFLICT_ABORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbinsert004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbinsert004 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_ABORT,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);
                let predicates = new data_relationalStore.RdbPredicates("test");
                predicates.equalTo("data1", "hello world");

                rdbStore!.query(predicates, ["data1"], (err, resultSet) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee: ${resultSet}`);
                    expect(resultSet!==undefined).assertTrue();
                    const valueBucket1: data_relationalStore.ValuesBucket = {
                    "data1": "hello world111"
                    };
                    rdbStore!.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_ABORT, (err, rows) => {
                      if (err) {
                        console.error(tag +`Updated failed, code is ${err.code}, message is ${err.message}`);
                        expect(true).assertFail();
                      }
                      console.info(tag +`Updated row count: ${rows}`);
                      expect(rows).assertEqual(1);
                    });
                  }
                })
              }
            });
        }
        done();
        console.log(tag + "************* testRdbinsert004 end *************");
      });

    /**
     * @tc.name   testRdbinsert005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_1500
     * @tc.desc   insert  ConflictResolution.ON_CONFLICT_FAIL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbinsert005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbinsert005 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_FAIL,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);
                let predicates = new data_relationalStore.RdbPredicates("test");
                predicates.equalTo("data1", "hello world");

                rdbStore!.query(predicates, ["data1"], (err, resultSet) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee: ${resultSet}`);
                    expect(resultSet!==undefined).assertTrue();
                    const valueBucket1: data_relationalStore.ValuesBucket = {
                    "data1": "hello world111"
                    };
                    rdbStore!.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_FAIL, (err, rows) => {
                      if (err) {
                        console.error(tag +`Updated failed, code is ${err.code}, message is ${err.message}`);
                        expect(true).assertFail();
                      }
                      console.info(tag +`Updated row count: ${rows}`);
                      expect(rows).assertEqual(1);
                    });
                  }
                })
              }
            });
        }
        done();
        console.log(tag + "************* testRdbinsert005 end *************");
      });

    /**
     * @tc.name   testRdbinsert006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_1600
     * @tc.desc   insert  ConflictResolution.ON_CONFLICT_IGNORE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbinsert006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbinsert006 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_IGNORE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);
                let predicates = new data_relationalStore.RdbPredicates("test");
                predicates.equalTo("data1", "hello world");

                rdbStore!.query(predicates, ["data1"], (err, resultSet) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee: ${resultSet}`);
                    expect(resultSet!==undefined).assertTrue();
                    const valueBucket1: data_relationalStore.ValuesBucket = {
                    "data1": "hello world111"
                    };
                    rdbStore!.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_IGNORE, (err, rows) => {
                      if (err) {
                        console.error(tag +`Updated failed, code is ${err.code}, message is ${err.message}`);
                        expect(true).assertFail();
                      }
                      console.info(tag +`Updated row count: ${rows}`);
                      expect(rows).assertEqual(1);
                    });
                  }
                })
              }
            });
        }
        done();
        console.log(tag + "************* testRdbinsert006 end *************");
      });

    /**
     * @tc.name   testRdbinsert007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_1700
     * @tc.desc   insert  first param is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbinsert007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbinsert007 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_IGNORE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(14800000).assertEqual(err.code);
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(true).assertFail();
              }
            });
        }
        done();
        console.log(tag + "************* testRdbinsert007 end *************");
      });

    /**
     * @tc.name   testRdbbatchinsert001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_1800
     * @tc.desc   batchInsert normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbbatchinsert001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbbatchinsert001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let valueBuckets = new Array<data_relationalStore.ValuesBucket>(valueBucket1, valueBucket1, valueBucket1);
        if (rdbStore!= undefined) {
          rdbStore!.batchInsert("test", valueBuckets, (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(3);
              }
            });
        }
        done();
        console.log(tag + "************* testRdbbatchinsert001 end *************");
      });


    /**
     * @tc.name   testRdbbatchinsert002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_1900
     * @tc.desc   batchInsert table is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbbatchinsert002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbbatchinsert002 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let valueBuckets = new Array<data_relationalStore.ValuesBucket>(valueBucket1, valueBucket1, valueBucket1);
        if (rdbStore!= undefined) {
          rdbStore!.batchInsert("", valueBuckets, (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(-1);
              }
            });
        }
        done();
        console.log(tag + "************* testRdbbatchinsert002 end *************");
      });
 
     /**
     * @tc.name   testRdbbatchinsert003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_2000
     * @tc.desc   batchInsert table not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbbatchinsert003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbbatchinsert003 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let valueBuckets = new Array<data_relationalStore.ValuesBucket>(valueBucket1, valueBucket1, valueBucket1);
        if (rdbStore!= undefined) {
          rdbStore!.batchInsert("test1", valueBuckets, (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(-1);
              }
            });
        }
        done();
        console.log(tag + "************* testRdbbatchinsert003 end *************");
      });
 
     /**
     * @tc.name   testRdbbatchinsert004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_2100
     * @tc.desc   batchInsert sec param is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbbatchinsert004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbbatchinsert004 start *************");
        if (rdbStore!= undefined) {
          rdbStore!.batchInsert("test", [], (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(0);
              }
            });
        }
        done();
        console.log(tag + "************* testRdbbatchinsert004 end *************");
      });

    /**
     * @tc.name   testRdbdelete001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_2200
     * @tc.desc   delete normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbdelete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbdelete001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);

                let predicates = new data_relationalStore.RdbPredicates("test");
                predicates.equalTo("data1", "hello world");

                rdbStore!.delete(predicates, (err, rows) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`delete succsee: ${rows}`);
                    expect(rows).assertEqual(1);
                  }
                })
              }
            });
        }
        done()
        console.log(tag + "************* testRdbdelete001 end *************");
      });

    /**
     * @tc.name   testRdbquery001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_2300
     * @tc.desc   query sec param is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbquery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbquery001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);

                let predicates = new data_relationalStore.RdbPredicates("test");
                predicates.equalTo("data1", "hello world");

                rdbStore!.query(predicates, [], (err, resultSet) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee: ${resultSet}`);
                    expect(resultSet!==undefined).assertTrue();
                  }
                })
              }
            });
        }
        done()
        console.log(tag + "************* testRdbquery001 end *************");
      });

    /**
     * @tc.name   testRdbquerySql001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_2400
     * @tc.desc   querySq normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbquerySql001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbquerySql001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);

                let predicates = new data_relationalStore.RdbPredicates("test");
                predicates.equalTo("data1", "hello world");

                rdbStore!.querySql("SELECT * FROM test where data1 = ?", ['hello world'], (err, resultSet) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee: ${resultSet}`);
                    expect(resultSet!==undefined).assertTrue();
                  }
                })
              }
            });
        }
        done()
        console.log(tag + "************* testRdbquerySql001 end *************");
      });

    /**
     * @tc.name   testRdbquerySql002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_2500
     * @tc.desc   querySq first param is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbquerySql002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbquerySql002 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);

                let predicates = new data_relationalStore.RdbPredicates("test");
                predicates.equalTo("data1", "hello world");

                rdbStore!.querySql("", ['hello world'], (err, resultSet) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee: ${resultSet}`);
                    expect(resultSet!==undefined).assertTrue();
                  }
                })
              }
            });
        }
        done()
        console.log(tag + "************* testRdbquerySql002 end *************");
      });

    /**
     * @tc.name   testRdbquerySql003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_2600
     * @tc.desc   querySq esc param is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbquerySql003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbquerySql003 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);
                rdbStore!.querySql("SELECT * FROM test where data1 = ?", [], (err, resultSet) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee: ${resultSet}`);
                    expect(resultSet!==undefined).assertTrue();
                  }
                })
              }
            });
        }
        done()
        console.log(tag + "************* testRdbquerySql003 end *************");
      });

    /**
     * @tc.name   testRdbquerySql004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_2700
     * @tc.desc   querySq esc param is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbquerySql004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbquerySql004 start *************");
        const asset:data_relationalStore.Asset = {
          name: "name4",
          uri: "uri4",
          createTime: "createTime4",
          modifyTime: "modifyTime4",
          size: "size4",
          path: "path4",
        };
        const assets = [asset];
        const data4 = new Uint8Array([1, 2, 3]);
        const data7 = new Float32Array([1.5, 2.5]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": data4,
          "data5": asset,
          "data6": assets,
          "data7": data7,
          "data8": 100n
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
        console.log(tag + "row is " + row);
        if (rdbStore!= undefined) {
          rdbStore!.querySql(`SELECT * FROM test where data2 = ? and data3 = ? and data4 =? and  data5 = ? and data6 = ? and data7 =? and data8 =?`, [3 as long , 10.5, data4, asset,assets,data7,100n], (err, resultSet) => {
            if (err) {
              console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
              expect(true).assertFail();
            }else{
              console.info(tag +`query succsee: ${resultSet}`);
              expect(resultSet!==undefined).assertTrue();
            }
          })
        }
        done()
        console.log(tag + "************* testRdbquerySql004 end *************");
      });

    /**
     * @tc.name   testqueryWithoutRowCountSync001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_2800
     * @tc.desc   queryWithoutRowCountSync sec param is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testqueryWithoutRowCountSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testqueryWithoutRowCountSync001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);

        if (rdbStore!= undefined) {
          let resultSet: data_relationalStore.LiteResultSet | undefined;
          let predicates = new data_relationalStore.RdbPredicates("test");
          predicates.equalTo("data1", "hello world");
          resultSet = rdbStore!.queryWithoutRowCountSync(predicates, []);
          expect(resultSet!==undefined).assertTrue();
          resultSet!.close()
        }
        done()
        console.log(tag + "************* testqueryWithoutRowCountSync001 end *************");
      });

    /**
     * @tc.name   testquerySqlWithoutRowCount001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_2900
     * @tc.desc   querySqlWithoutRowCount first sec param is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testquerySqlWithoutRowCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testquerySqlWithoutRowCount001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = await rdbStore!.querySqlWithoutRowCount("", []);
            expect(true).assertFail();
          }
      } catch (e) {
        console.error(tag + `testquerySqlWithoutRowCount001 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800001).assertEqual(e.code);
      }
        done()
        console.log(tag + "************* testquerySqlWithoutRowCount001 end *************");
      });

    /**
     * @tc.name   testquerySqlWithoutRowCountSync001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_3000
     * @tc.desc   querySqlWithoutRowCountSync first sec param is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testquerySqlWithoutRowCountSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testquerySqlWithoutRowCountSync001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = rdbStore!.querySqlWithoutRowCountSync("", []);
            expect(true).assertFail();
          }
      } catch (e) {
        console.error(tag + `testquerySqlWithoutRowCountSync001 failed. code is ${e.code}, message is ${e.message}`);
        expect(14800001).assertEqual(e.code);
      }
        done()
        console.log(tag + "************* testquerySqlWithoutRowCountSync001 end *************");
      });

    /**
     * @tc.name   testquerySqlWithoutRowCountSync002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_3100
     * @tc.desc   querySqlWithoutRowCountSync sec param is not kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testquerySqlWithoutRowCountSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testquerySqlWithoutRowCountSync002 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = rdbStore!.querySqlWithoutRowCountSync("SELECT * FROM test where data1 = ?", ['hello world']);
            expect(resultSet!==undefined).assertTrue();
            resultSet!.close()
          }
      } catch (e) {
        console.error(tag + `testquerySqlWithoutRowCountSync002 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
        done()
        console.log(tag + "************* testquerySqlWithoutRowCountSync002 end *************");
      });

    /**
     * @tc.name   testRdbexecuteSql001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_3200
     * @tc.desc   executeSql normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbexecuteSql001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbexecuteSql001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);

                rdbStore!.executeSql("SELECT * FROM test where data1 = ?", ['hello world'], (err) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee`);
                  }
                })
              }
            });
        }
        done()
        console.log(tag + "************* testRdbexecuteSql001 end *************");
      });

    /**
     * @tc.name   testRdbexecuteSql002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_3300
     * @tc.desc   executeSql first param is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbexecuteSql002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbexecuteSql002 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);

                let predicates = new data_relationalStore.RdbPredicates("test");
                predicates.equalTo("data1", "hello world");

                rdbStore!.executeSql("", ['hello world'], (err) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(14800000).assertEqual(err.code);
                  }else{
                    console.info(tag +`query succsee`);
                    expect(true).assertFail();
                  }
                })
              }
            });
        }
        done()
        console.log(tag + "************* testRdbexecuteSql002 end *************");
      });

    /**
     * @tc.name   testRdbexecuteSql003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_3400
     * @tc.desc   executeSql sec param is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbexecuteSql003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbexecuteSql003 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);
                rdbStore!.executeSql("SELECT * FROM test where data1 = ?", [], (err) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(14800000).assertEqual(err.code);
                  }else{
                    console.info(tag +`query succsee`);
                    expect(true).assertFail();
                  }
                })
              }
            });
        }
        done()
        console.log(tag + "************* testRdbexecuteSql003 end *************");
      });

    /**
     * @tc.name   testRdbexecuteSql004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_3500
     * @tc.desc   executeSql all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbexecuteSql004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbexecuteSql004 start *************");
        const asset:data_relationalStore.Asset = {
          name: "name4",
          uri: "uri4",
          createTime: "createTime4",
          modifyTime: "modifyTime4",
          size: "size4",
          path: "path4",
        };
        const assets = [asset];
        const data4 = new Uint8Array([1, 2, 3]);
        const data7 = new Float32Array([1.5, 2.5]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": data4,
          "data5": asset,
          "data6": assets,
          "data7": data7,
          "data8": 100n
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
        console.log(tag + "row is " + row);
        if (rdbStore!= undefined) {
          rdbStore!.executeSql(`SELECT * FROM test where data2 = ? and data3 = ? and data4 =? and  data5 = ? and data6 = ? and data7 =? and data8 =?`, [3 as long , 10.5, data4, asset,assets,data7,100n], (err) => {
            if (err) {
              console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
              expect(true).assertFail();
            }else{
              console.info(tag +`query succsee`);
            }
          })
        }
        done()
        console.log(tag + "************* testRdbexecuteSql004 end *************");
      });

    /**
     * @tc.name   testRdbexecuteSql005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_3600
     * @tc.desc   executeSql sec param is not kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbexecuteSql005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbexecuteSql005 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          try {
            let rowId = await rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            console.info(tag +`Insert is successful, rowId = ${rowId}`);
            expect(rowId).assertEqual(1);
            await rdbStore!.close();
            console.info(tag +`close succsee`);
            rdbStore!.executeSql("SELECT * FROM test where data1 = ?", ['hello world'], (err) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(14800014).assertEqual(err.code);
                  }else{
                    console.info(tag +`query succsee`);
                    expect(true).assertFail();
                  }
                })
          } catch (err) {
            console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
            expect(true).assertFail();
          }
        }
        done()
        console.log(tag + "************* testRdbexecuteSql005 end *************");
      });

    /**
     * @tc.name   testRdbexecuteSql006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_3700
     * @tc.desc   executeSql
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbexecuteSql006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbexecuteSql006 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);
                rdbStore!.executeSql("update test set data1 = ? where data1 = ?", [3 as long, 'hello world'], (err) => {
                  if (err) {
                    console.error(tag +`executeSql failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`executeSql succsee`);
                  }
                })
              }
            });
        }
        done()
        console.log(tag + "************* testRdbexecuteSql006 end *************");
      });

    /**
     * @tc.name   testbeginTransaction001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_3800
     * @tc.desc   beginTransaction normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbeginTransaction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testbeginTransaction001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        if (rdbStore!= undefined) {
          rdbStore!.beginTransaction();
          console.info(tag +`beginTransaction successful`);
          rdbStore!.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                rdbStore!.rollBack();
                expect(true).assertFail();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(rowId).assertEqual(1);
                rdbStore!.commit();
                console.info(tag +`commit successful`);
                rdbStore!.querySql("SELECT * FROM test where data1 = ?", ['hello world'], (err, resultSet) => {
                  if (err) {
                    console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
                    expect(true).assertFail();
                  }else{
                    console.info(tag +`query succsee`);
                    expect(resultSet!==undefined).assertTrue();
                  }
                })
              }
            });
        }
        done()
        console.log(tag + "************* testbeginTransaction001 end *************");
      });

    /**
     * @tc.name   testbeginTrans001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_3900
     * @tc.desc   beginTrans normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbeginTrans001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testbeginTrans001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let rowId = await rdbStore!.insert("test", valueBucket1);
        console.info(tag +`Insert is successful, rowId = ${rowId}`);

        if (rdbStore!= undefined) {
          let txId :long;
          try{
            txId = await rdbStore!.beginTrans();
            console.info(tag +`beginTrans successful`);
            await rdbStore!.execute("DELETE FROM TEST WHERE data1 = ? ", txId, ["hello world"]);
            await rdbStore!.commit(txId);
            console.info(tag +`commit successful`);
            await rdbStore!.rollback(txId);
            console.info(tag +`rollback successful`);
          }catch (e) {
            console.error(tag + `beginTrans failed. code is ${e.code}, message is ${e.message}`);
            expect(801).assertEqual(e.code);
          }
        }
        done()
        console.log(tag + "************* testbeginTrans001 end *************");
      });

    /**
     * @tc.name   testTransqueryWithoutRowCount001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_4000
     * @tc.desc   testTransqueryWithoutRowCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransqueryWithoutRowCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransqueryWithoutRowCount001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");

        if (rdbStore!= undefined) {
          let resultSet: data_relationalStore.LiteResultSet | undefined;
          const transaction = await rdbStore!.createTransaction();
          resultSet = await transaction!.queryWithoutRowCount(predicates, ["data1"]);
          expect(resultSet!==undefined).assertTrue();
          await transaction.commit();
          resultSet!.close()
        }
        done()
        console.log(tag + "************* testTransqueryWithoutRowCount001 end *************");
      });

    /**
     * @tc.name   testTransqueryWithoutRowCount002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_4100
     * @tc.desc   testTransqueryWithoutRowCount sec param is none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransqueryWithoutRowCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransqueryWithoutRowCount002 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");

        if (rdbStore!= undefined) {
          let resultSet: data_relationalStore.LiteResultSet | undefined;
          const transaction = await rdbStore!.createTransaction();
          resultSet = await transaction!.queryWithoutRowCount(predicates);
          expect(resultSet!==undefined).assertTrue();
          await transaction.commit();
          resultSet!.close()
        }
        done()
        console.log(tag + "************* testTransqueryWithoutRowCount002 end *************");
      });

    /**
     * @tc.name   testTransqueryWithoutRowCount003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_4200
     * @tc.desc   testTransqueryWithoutRowCount sec param is []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransqueryWithoutRowCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransqueryWithoutRowCount003 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");

        if (rdbStore!= undefined) {
          let resultSet: data_relationalStore.LiteResultSet | undefined;
          const transaction = await rdbStore!.createTransaction();
          resultSet = await transaction!.queryWithoutRowCount(predicates,[]);
          expect(resultSet!==undefined).assertTrue();
          await transaction.commit();
          resultSet!.close()
        }
        done()
        console.log(tag + "************* testTransqueryWithoutRowCount003 end *************");
      });

    /**
     * @tc.name   testTransqueryWithoutRowCount004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_4300
     * @tc.desc   testTransqueryWithoutRowCount sec param is [""]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransqueryWithoutRowCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransqueryWithoutRowCount004 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");

        if (rdbStore!= undefined) {
          let resultSet: data_relationalStore.LiteResultSet | undefined;
          const transaction = await rdbStore!.createTransaction();
          resultSet = await transaction!.queryWithoutRowCount(predicates,[""]);
          expect(resultSet!==undefined).assertTrue();
          await transaction.commit();
          resultSet!.close()
        }
        done()
        console.log(tag + "************* testTransqueryWithoutRowCount004 end *************");
      });

    /**
     * @tc.name   testTransqueryWithoutRowCount005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_4400
     * @tc.desc   testTransqueryWithoutRowCount rdbStore!.close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransqueryWithoutRowCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransqueryWithoutRowCount005 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");
        let resultSet: data_relationalStore.LiteResultSet | undefined;
        const transaction = await rdbStore!.createTransaction();
        await rdbStore!.close();
        try{
          if (rdbStore!= undefined) {
            resultSet = await transaction!.queryWithoutRowCount(predicates,[""]);
            console.log(tag + "row is " + resultSet);
            expect(resultSet!==undefined).assertTrue();
            resultSet!.close()
          }
        }catch (e) {
          console.error(tag + `queryWithoutRowCount failed. code is ${e.code}, message is ${e.message}`);
          expect(14800014).assertEqual(e.code);
      }
        done()
        console.log(tag + "************* testTransqueryWithoutRowCount005 end *************");
      });

    /**
     * @tc.name   testTransqueryWithoutRowCountSync001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_4500
     * @tc.desc   testTransqueryWithoutRowCountSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransqueryWithoutRowCountSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransqueryWithoutRowCountSync001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");

        if (rdbStore!= undefined) {
          let resultSet: data_relationalStore.LiteResultSet | undefined;
          const transaction = await rdbStore!.createTransaction();
          resultSet = transaction!.queryWithoutRowCountSync(predicates, ["data1"]);
          expect(resultSet!==undefined).assertTrue();
          await transaction.commit();
          resultSet!.close()
        }
        done()
        console.log(tag + "************* testTransqueryWithoutRowCountSync001 end *************");
      });

    /**
     * @tc.name   testTransqueryWithoutRowCountSync002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_4600
     * @tc.desc   testTransqueryWithoutRowCountSync sec param is none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransqueryWithoutRowCountSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransqueryWithoutRowCountSync002 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");

        if (rdbStore!= undefined) {
          let resultSet: data_relationalStore.LiteResultSet | undefined;
          const transaction = await rdbStore!.createTransaction();
          resultSet = transaction!.queryWithoutRowCountSync(predicates);
          expect(resultSet!==undefined).assertTrue();
          await transaction.commit();
          resultSet!.close()
        }
        done()
        console.log(tag + "************* testTransqueryWithoutRowCountSync002 end *************");
      });

    /**
     * @tc.name   testTransqueryWithoutRowCountSync003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_4700
     * @tc.desc   testTransqueryWithoutRowCountSync sec param is []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransqueryWithoutRowCountSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransqueryWithoutRowCountSync003 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");

        if (rdbStore!= undefined) {
          let resultSet: data_relationalStore.LiteResultSet | undefined;
          const transaction = await rdbStore!.createTransaction();
          resultSet = transaction!.queryWithoutRowCountSync(predicates,[]);
          expect(resultSet!==undefined).assertTrue();
          await transaction.commit();
          resultSet!.close()
        }
        done()
        console.log(tag + "************* testTransqueryWithoutRowCountSync003 end *************");
      });

    /**
     * @tc.name   testTransqueryWithoutRowCountSync004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_4800
     * @tc.desc   testTransqueryWithoutRowCountSync sec param is [""]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransqueryWithoutRowCountSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTratestTransqueryWithoutRowCountSync004nsqueryWithoutRowCount004 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");

        if (rdbStore!= undefined) {
          let resultSet: data_relationalStore.LiteResultSet | undefined;
          const transaction = await rdbStore!.createTransaction();
          resultSet = transaction!.queryWithoutRowCountSync(predicates,[""]);
          expect(resultSet!==undefined).assertTrue();
          await transaction.commit();
          resultSet!.close()
        }
        done()
        console.log(tag + "************* testTransqueryWithoutRowCountSync004 end *************");
      });

    /**
     * @tc.name   testTransqueryWithoutRowCountSync005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_4900
     * @tc.desc   testTransqueryWithoutRowCountSync rdbStore!.close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransqueryWithoutRowCountSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransqueryWithoutRowCountSync005 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");
        let resultSet: data_relationalStore.LiteResultSet | undefined;
        const transaction = await rdbStore!.createTransaction();
        await rdbStore!.close();
        try{
          if (rdbStore!= undefined) {
            resultSet = transaction!.queryWithoutRowCountSync(predicates,[""]);
            console.log(tag + "row is " + resultSet);
            expect(resultSet!==undefined).assertTrue();
            resultSet!.close()
          }
        }catch (e) {
          console.error(tag + `queryWithoutRowCount failed. code is ${e.code}, message is ${e.message}`);
          expect(14800014).assertEqual(e.code);
      }
        done()
        console.log(tag + "************* testTransqueryWithoutRowCountSync005 end *************");
      });

    /**
     * @tc.name   testTransquerySqlWithoutRowCountSync001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5000
     * @tc.desc   querySqlWithoutRowCountSync sec param is not kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransquerySqlWithoutRowCountSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransquerySqlWithoutRowCountSync001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        const transaction = await rdbStore!.createTransaction();
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = transaction!.querySqlWithoutRowCountSync("SELECT * FROM test where data1 = ?", ['hello world']);
            expect(resultSet!==undefined).assertTrue();
            await transaction.commit();
            resultSet!.close()
          }
      } catch (e) {
        console.error(tag + `testTransquerySqlWithoutRowCountSync001 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
        done()
        console.log(tag + "************* testTransquerySqlWithoutRowCountSync001 end *************");
      });

    /**
     * @tc.name   testTransquerySqlWithoutRowCountSync002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5100
     * @tc.desc   querySqlWithoutRowCountSync sec param is none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransquerySqlWithoutRowCountSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransquerySqlWithoutRowCountSync002 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        const transaction = await rdbStore!.createTransaction();
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = transaction!.querySqlWithoutRowCountSync("SELECT * FROM test where data1 = ?");
            expect(resultSet!==undefined).assertTrue();
            await transaction.commit();
            resultSet!.close()
          }
      } catch (e) {
        console.error(tag + `testTransquerySqlWithoutRowCountSync002 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
        done()
        console.log(tag + "************* testTransquerySqlWithoutRowCountSync002 end *************");
      });

    /**
     * @tc.name   testTransquerySqlWithoutRowCountSync003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5200
     * @tc.desc   querySqlWithoutRowCountSync ALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransquerySqlWithoutRowCountSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransquerySqlWithoutRowCountSync003 start *************");
        const asset:data_relationalStore.Asset = {
          name: "name4",
          uri: "uri4",
          createTime: "createTime4",
          modifyTime: "modifyTime4",
          size: "size4",
          path: "path4",
        };
        const assets = [asset];
        const data4 = new Uint8Array([1, 2, 3]);
        const data7 = new Float32Array([1.5, 2.5]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": data4,
          "data5": asset,
          "data6": assets,
          "data7": data7,
          "data8": 100n
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
        console.log(tag + "row is " + row);
        const transaction = await rdbStore!.createTransaction();
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = transaction!.querySqlWithoutRowCountSync(`SELECT * FROM test where data2 = ? and data3 = ? and data4 =? and  data5 = ? and data6 = ? and data7 =? and data8 =?`, [3 as long , 10.5, data4, asset,assets,data7,100n]);
            expect(resultSet!==undefined).assertTrue();
            await transaction.commit();
            resultSet!.close()
          }
      } catch (e) {
        console.error(tag + `testTransquerySqlWithoutRowCountSync003 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
        done()
        console.log(tag + "************* testTransquerySqlWithoutRowCountSync003 end *************");
      });

    /**
     * @tc.name   testTransquerySqlWithoutRowCountSync004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5300
     * @tc.desc   querySqlWithoutRowCountSync sec param is none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransquerySqlWithoutRowCountSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransquerySqlWithoutRowCountSync004 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        const transaction = await rdbStore!.createTransaction();
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = transaction!.querySqlWithoutRowCountSync("SELECT * FROM test where data1 = ?",[]);
            expect(resultSet!==undefined).assertTrue();
            await transaction.commit();
            resultSet!.close()
          }
      } catch (e) {
        console.error(tag + `testTransquerySqlWithoutRowCountSync004 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
        done()
        console.log(tag + "************* testTransquerySqlWithoutRowCountSync004 end *************");
      });

    /**
     * @tc.name   testTransquerySqlWithoutRowCountSync005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5400
     * @tc.desc   querySqlWithoutRowCountSync sec param is none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransquerySqlWithoutRowCountSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransquerySqlWithoutRowCountSync005 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        const transaction = await rdbStore!.createTransaction();
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = transaction!.querySqlWithoutRowCountSync("",[]);
            expect(true).assertFail();
          }
        } catch (e) {
          console.error(tag + `testTransquerySqlWithoutRowCountSync005 failed. code is ${e.code}, message is ${e.message}`);
          expect(14800001).assertEqual(e.code);
          await transaction.rollback();
        }
        done()
        console.log(tag + "************* testTransquerySqlWithoutRowCountSync004 end *************");
      });

    /**
     * @tc.name   testTransquerySqlWithoutRowCount001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5500
     * @tc.desc   querySqlWithoutRowCount sec param is not kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransquerySqlWithoutRowCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransquerySqlWithoutRowCount001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        const transaction = await rdbStore!.createTransaction();
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = await transaction!.querySqlWithoutRowCount("SELECT * FROM test where data1 = ?", ['hello world']);
            expect(resultSet!==undefined).assertTrue();
            await transaction.commit();
            resultSet!.close()
          }
      } catch (e) {
        console.error(tag + `testTransquerySqlWithoutRowCount001 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
        done()
        console.log(tag + "************* testTransquerySqlWithoutRowCount001 end *************");
      });

    /**
     * @tc.name   testTransquerySqlWithoutRowCount002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5600
     * @tc.desc   querySqlWithoutRowCount sec param is none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransquerySqlWithoutRowCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransquerySqlWithoutRowCount002 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        const transaction = await rdbStore!.createTransaction();
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = await transaction!.querySqlWithoutRowCount("SELECT * FROM test where data1 = ?");
            expect(resultSet!==undefined).assertTrue();
            await transaction.commit();
            resultSet!.close()
          }
      } catch (e) {
        console.error(tag + `testTransquerySqlWithoutRowCount002 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
        done()
        console.log(tag + "************* testTransquerySqlWithoutRowCount002 end *************");
      });

    /**
     * @tc.name   testTransquerySqlWithoutRowCount003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5700
     * @tc.desc   querySqlWithoutRowCount ALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransquerySqlWithoutRowCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransquerySqlWithoutRowCount003 start *************");
        const asset:data_relationalStore.Asset = {
          name: "name4",
          uri: "uri4",
          createTime: "createTime4",
          modifyTime: "modifyTime4",
          size: "size4",
          path: "path4",
        };
        const assets = [asset];
        const data4 = new Uint8Array([1, 2, 3]);
        const data7 = new Float32Array([1.5, 2.5]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": data4,
          "data5": asset,
          "data6": assets,
          "data7": data7,
          "data8": 100n
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
        console.log(tag + "row is " + row);
        const transaction = await rdbStore!.createTransaction();
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = await transaction!.querySqlWithoutRowCount(`SELECT * FROM test where data2 = ? and data3 = ? and data4 =? and  data5 = ? and data6 = ? and data7 =? and data8 =?`, [3 as long , 10.5, data4, asset,assets,data7,100n]);
            expect(resultSet!==undefined).assertTrue();
            await transaction.commit();
            resultSet!.close()
          }
      } catch (e) {
        console.error(tag + `testTransquerySqlWithoutRowCount003 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
        done()
        console.log(tag + "************* testTransquerySqlWithoutRowCount003 end *************");
      });

    /**
     * @tc.name   testTransquerySqlWithoutRowCount004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5800
     * @tc.desc   querySqlWithoutRowCountSync sec param is none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransquerySqlWithoutRowCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransquerySqlWithoutRowCount004 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        const transaction = await rdbStore!.createTransaction();
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = await transaction!.querySqlWithoutRowCount("SELECT * FROM test where data1 = ?",[]);
            expect(resultSet!==undefined).assertTrue();
            await transaction.commit();
            resultSet!.close()
          }
      } catch (e) {
        console.error(tag + `testTransquerySqlWithoutRowCount004 failed. code is ${e.code}, message is ${e.message}`);
        expect(true).assertFail();
      }
        done()
        console.log(tag + "************* testTransquerySqlWithoutRowCount004 end *************");
      });

    /**
     * @tc.name   testTransquerySqlWithoutRowCount005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5900
     * @tc.desc   querySqlWithoutRowCount sec param is none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransquerySqlWithoutRowCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testTransquerySqlWithoutRowCount005 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        const transaction = await rdbStore!.createTransaction();
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = await transaction!.querySqlWithoutRowCount("",[]);
            expect(true).assertFail();
          }
        } catch (e) {
          console.error(tag + `testTransquerySqlWithoutRowCount005 failed. code is ${e.code}, message is ${e.message}`);
          expect(14800001).assertEqual(e.code);
          await transaction.rollback();
        }
        done()
        console.log(tag + "************* testTransquerySqlWithoutRowCount005 end *************");
      });

    /**
     * @tc.name   testsqueryWithoutRowCount001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_6000
     * @tc.desc   testTransqueryWithoutRowCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testsqueryWithoutRowCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testsqueryWithoutRowCount001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");

        if (rdbStore!= undefined) {
          let resultSet: data_relationalStore.LiteResultSet | undefined;
          resultSet = await rdbStore!.queryWithoutRowCount(predicates, ["data1"]);
          expect(resultSet!==undefined).assertTrue();
          resultSet!.close()
        }
        done()
        console.log(tag + "************* testsqueryWithoutRowCount001 end *************");
      });

    /**
     * @tc.name   testquerySqlWithoutRowCountreturn001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_6100
     * @tc.desc   querySqlWithoutRowCount sec param is not kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testquerySqlWithoutRowCountreturn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testquerySqlWithoutRowCountreturn001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = await rdbStore!.querySqlWithoutRowCount("SELECT * FROM test where data1 = ?", ['hello world']);
            expect(resultSet!==undefined).assertTrue();
            resultSet!.close()
          }
        } catch (e) {
          console.error(tag + `testquerySqlWithoutRowCountreturn001 failed. code is ${e.code}, message is ${e.message}`);
          expect(true).assertFail();
        }
        done()
        console.log(tag + "************* testquerySqlWithoutRowCountreturn001 end *************");
      });

          /**
     * @tc.name   testRdbGetColumnTypeSync14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_6200
     * @tc.desc   getColumnTypeSync errcode is 14800033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnTypeSync14800033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
      console.log(tag + "************* testRdbGetColumnTypeSync14800033 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
          "data2": null,
          "data3": null,
          "data4": null,
          "data5": null,
          "data6": null,
          "data7": null,
          "data8": null
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
        console.log(tag + "row is " + row);
      } catch (err) {
        console.error(tag + "testRdbGetColumnTypeSync14800033 insert failed " + err);
        expect().assertFail();
      }
      try {
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        resultSet!.goToFirstRow();
        let type = data_relationalStore.ColumnType.NULL;
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("id"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data1"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data2"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data3"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data4"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data5"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data6"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data7"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data8"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        resultSet?.close();
        done();
      } catch (err) {
        console.error(tag + "testRdbGetColumnTypeSync14800033  failed " + err.code + err.message);
        expect(14800033).assertEqual(err.code);
        done();
      }
      done();
      console.log(tag + "************* testRdbGetColumnTypeSync14800033 end *************");
    });

    /**
     * @tc.name   testRdbGetColumnTypeSync14800027
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_6300
     * @tc.desc   getColumnTypeSync errcode is 14800027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnTypeSync14800027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbGetColumnTypeSync14800027 start *************");
        try {
          const valueBucket: data_relationalStore.ValuesBucket = {
            "data1": null,
            "data2": null,
            "data3": null,
            "data4": null,
            "data5": null,
            "data6": null,
            "data7": null,
            "data8": null
          };
          let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.log(tag + "row is " + row);
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSync14800027 insert failed " + err);
          expect().assertFail();
        }
        try {
          let resultSet = await rdbStore!.querySql("SELECT * FROM test");
          resultSet!.goToFirstRow();
          let type = data_relationalStore.ColumnType.NULL;
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("id"));
          expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data1"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data2"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data3"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data4"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data5"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data6"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data7"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data8"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          resultSet?.close();
          done();
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSync14800027  failed " + err.code + err.message);
          expect(14800027).assertEqual(err.code);
          done();
        }
        done();
        console.log(tag + "************* testRdbGetColumnTypeSync14800027 end *************");
      });

    /**
     * @tc.name   RelationalRdbStorequery_callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_6400
     * @tc.desc   the test of query
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStorequery_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag + '************* RelationalRdbStorequery_callback start *************');
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      let resultSet: data_relationalStore.ResultSet | undefined;
      rdbStore!.query(predicates, ["data1", "data2", "data3", "data4", "data5", "data6", "data7", "data8"], (err, resultSet) => {
        if (err) {
          console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
          expect(true).assertFail();
        }else{
          console.info(tag +`query succsee: ${resultSet}`);
          expect(resultSet!==undefined).assertTrue();
          console.info(domain, tag  +`ResultSet column names: ${resultSet!.columnNames}`);
          expect(resultSet!.columnNames.length > 0).assertTrue();
          console.info(domain, tag  +`ResultSet column count: ${resultSet!.columnCount}`);
          expect(resultSet!.columnCount == 8).assertTrue();
          console.info(domain, tag  +`ResultSet rowIndex:${resultSet!.rowIndex}`);
          expect(resultSet!.rowIndex == -1).assertTrue();
          console.info(domain, tag  +`ResultSet isAtFirstRow: ${resultSet!.isAtFirstRow}`);
          expect(resultSet!.isAtFirstRow).assertEqual(false);
          console.info(domain, tag  +`ResultSet isAtLastRow: ${resultSet!.isAtLastRow}`);
          expect(resultSet!.isAtLastRow).assertEqual(true);
          console.info(domain, tag  +`ResultSet isEnded:${resultSet!.isEnded}`);
          expect(resultSet!.isEnded).assertEqual(true);
          console.info(domain, tag  +`ResultSet isStarted: ${resultSet!.isStarted}`);
          expect(resultSet!.isStarted).assertEqual(false);
          console.info(domain, tag  +`ResultSet isClosed: ${resultSet!.isClosed}`);
          expect(resultSet!.isClosed).assertEqual(false);
          console.info(domain, tag  +`ResultSet rowCount:${resultSet!.rowCount}`);
          expect(resultSet!.rowCount == 0).assertTrue();
        }
      })
      console.info(domain, tag  + '************* RelationalRdbStorequery_callback end *************');
    })

    /**
     * @tc.name   RelationalRdbStorequerysql_callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_6500
     * @tc.desc   the test of query
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStorequerysql_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag + '************* RelationalRdbStorequerysql_callback start *************');
      let resultSet: data_relationalStore.ResultSet | undefined;
      rdbStore!.querySql("SELECT * FROM test where data1 = ?", ['hello'], (err, resultSet) => {
        if (err) {
          console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
          expect(true).assertFail();
        }else{
          console.info(tag +`query succsee: ${resultSet}`);
          expect(resultSet!==undefined).assertTrue();
          console.info(domain, tag  +`ResultSet column names: ${resultSet!.columnNames}`);
          expect(resultSet!.columnNames.length > 0).assertTrue();
          console.info(domain, tag  +`ResultSet column count: ${resultSet!.columnCount}`);
          expect(resultSet!.columnCount == 9).assertTrue();
          console.info(domain, tag  +`ResultSet rowIndex:${resultSet!.rowIndex}`);
          expect(resultSet!.rowIndex == -1).assertTrue();
          console.info(domain, tag  +`ResultSet isAtFirstRow: ${resultSet!.isAtFirstRow}`);
          expect(resultSet!.isAtFirstRow).assertEqual(false);
          console.info(domain, tag  +`ResultSet isAtLastRow: ${resultSet!.isAtLastRow}`);
          expect(resultSet!.isAtLastRow).assertEqual(true);
          console.info(domain, tag  +`ResultSet isEnded:${resultSet!.isEnded}`);
          expect(resultSet!.isEnded).assertEqual(true);
          console.info(domain, tag  +`ResultSet isStarted: ${resultSet!.isStarted}`);
          expect(resultSet!.isStarted).assertEqual(false);
          console.info(domain, tag  +`ResultSet isClosed: ${resultSet!.isClosed}`);
          expect(resultSet!.isClosed).assertEqual(false);
          console.info(domain, tag  +`ResultSet rowCount:${resultSet!.rowCount}`);
          expect(resultSet!.rowCount == 0).assertTrue();
        }
      })
      console.info(domain, tag  + '************* RelationalRdbStorequerysql_callback end *************');
    })

    /**
     * @tc.name   testbeginTransaction14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_6600
     * @tc.desc   beginTrans normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbeginTransaction14800033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testbeginTransaction14800033 start *************");
        if (rdbStore!= undefined) {
          let txId :long;
          try{
            rdbStore!.beginTransaction();
            console.info(tag +`beginTransaction successful`);
          }catch (e) {
            console.error(tag + `beginTrans failed. code is ${e.code}, message is ${e.message}`);
            expect(14800033).assertEqual(e.code);
          }
        }
        done()
        console.log(tag + "************* testbeginTransaction14800033 end *************");
      });
  })
}
