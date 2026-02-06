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
import data_Rdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { ValuesBucket } from '@kit.ArkData';

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const RDB_DB_ICUNAME = "VectorStoreTest.db";

const TAG = "[RelationalStore_Ets_TEST >>>>>> ]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test(id INTEGER PRIMARY KEY,repr floatvector(8));";

const STORE_CONFIG: data_Rdb.StoreConfig = {
  name: RDB_DB_ICUNAME,
  securityLevel: data_Rdb.SecurityLevel.S1,
  tokenizer: data_Rdb.Tokenizer.ICU_TOKENIZER,
  vector: true,
}

let rdbStore:data_Rdb.RdbStore;


export default function VectorStoreTest() {
  describe('VectorStoreTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');

    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      await data_Rdb.deleteRdbStore(context, RDB_DB_ICUNAME);
    });
    console.info(TAG + "*************Unit Test Begin*************");
    /**
     * @tc.name VectorStoreTest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0100
     * @tc.desc VectorEtsAPITest isVectorSupported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('VectorStoreTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let TAGTEST = TAG + " testRdbStoreIcuInsert0100 ";
      const res = data_Rdb.isVectorSupported();
      console.info(TAGTEST + "res=" + res);
      if (res == false) {
        console.info(TAGTEST + "false res =" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore. rdbStore=" + rdbStore);
          expect().assertFail();
          done()
        } catch(err){
          console.info(TAGTEST + "fail getRdbStore, code=" + err.code + err.message);
          expect(801).assertEqual(err.code);
          done()
        }

      } else {
        console.info(TAGTEST + "true res111111=" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore111111. rdbStore=" + rdbStore);
          expect(rdbStore != null).assertTrue();
          await rdbStore.execute(CREATE_TABLE_TEST, 0 ,undefined);
          console.info(TAGTEST + "success create table1111.");
          await rdbStore.execute("INSERT INTO test VALUES(0,'[5,8,9,7,1,3,1,3]');",0,undefined);
          const CREATE_IVFFLAT_INDEX = "CREATE INDEX test_idx ON test USING GSIVFFLAT(repr L2);"
          await rdbStore.execute(CREATE_IVFFLAT_INDEX,0,undefined);
          let resultSet: data_Rdb.ResultSet;
          const QUERY_VECTOR_TEST = "select id,repr <-> '[20,26,32,48,19,10,20,45]' " +
            "from test ORDER BY repr <-> '[20,26,32,48,19,10,20,45]';";
          let txId1 :number = 0;
          (rdbStore as data_Rdb.RdbStore).beginTrans().then(async(txId) => {
            txId1 = txId;
            (rdbStore as data_Rdb.RdbStore).execute("INSERT INTO test VALUES(1,'[21,28,34,58,21,15,14,51]');", txId1, undefined)
              .then(async() => {
                (rdbStore as data_Rdb.RdbStore).commit(txId1);
                resultSet = await rdbStore.querySql(QUERY_VECTOR_TEST);
                console.log(TAGTEST + "resultSet.rowCount:" +resultSet.rowCount)
                expect(resultSet.rowCount).assertEqual(2)
                done();
              }).catch((err: BusinessError) => {
              (rdbStore as data_Rdb.RdbStore as data_Rdb.RdbStore).rollback(txId1)
              console.log(TAGTEST+`execute sql failed, code is ${err.code},message is ${err.message}`);
              expect().assertFail();
              done();
            });
          });
        } catch(err){
          console.info(TAGTEST + "fail getRdbStore111, code=" + err.code + err.message);
          expect().assertFail();
          done();
        }
      }
      console.info(TAGTEST + " ************* End*************");
    });
    /**
     * @tc.name VectorStoreTest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0200
     * @tc.desc VectorEtsAPITest isVectorSupported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('VectorStoreTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let TAGTEST = TAG + " VectorStoreTest0200 ";
      const res = data_Rdb.isVectorSupported();
      console.info(TAGTEST + "res=" + res);
      if (res == false) {
        console.info(TAGTEST + "false res =" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore. rdbStore=" + rdbStore);
          expect().assertFail();
          done()
        } catch(err){
          console.info(TAGTEST + "fail getRdbStore, code=" + err.code + err.message);
          expect(err.code == 801).assertTrue();
          done()
        }

      } else {
        console.info(TAGTEST + "true res111111=" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore111111. rdbStore=" + rdbStore);
          expect(rdbStore != null).assertTrue();
          let observer1 = async (sqlExecutionInfo : data_Rdb.SqlExecutionInfo) => {
            console.log(TAG + "observer1")
            done()
          };
          try{
            rdbStore?.on('perfStat',observer1);
            expect().assertFail()
            done()
          }catch(err){
            console.info(TAGTEST + "fail" + err.code + err.message);
            expect(err.code == 801).assertTrue();
            done()
          }
          console.log(TAG + "************* VectorStoreTest0200 end *************");
        } catch(err){
          console.info(TAGTEST + "fail getRdbStore111, code=" + err.code + err.message);
          expect().assertFail();
          done();
        }
      }
      console.info(TAGTEST + " ************* End*************");
    });
    /**
     * @tc.name VectorStoreTest0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0300
     * @tc.desc VectorEtsAPITest isVectorSupported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('VectorStoreTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let TAGTEST = TAG + " VectorStoreTest0300 ";
      const res = data_Rdb.isVectorSupported();
      console.info(TAGTEST + "res=" + res);
      if (res == false) {
        console.info(TAGTEST + "false res =" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore. rdbStore=" + rdbStore);
          expect().assertFail();
          done()
        } catch(err){
          console.info(TAGTEST + "fail getRdbStore, code=" + err.code + err.message);
          expect(err.code == 801).assertTrue();
          done()
        }

      } else {
        console.info(TAGTEST + "true res111111=" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore111111. rdbStore=" + rdbStore);
          expect(rdbStore != null).assertTrue();
          let observer1 = async (sqlExecutionInfo : data_Rdb.SqlExecutionInfo) => {
            console.log(TAG + "observer1")
            done()
          };
          try{
            rdbStore?.off('perfStat',observer1);
            expect().assertFail()
            done()
          }catch(err){
            console.info(TAGTEST + "fail" + err.code + err.message);
            expect(err.code == 801).assertTrue();
            done()
          }
          console.log(TAG + "************* VectorStoreTest0300 end *************");
        } catch(err){
          console.info(TAGTEST + "fail getRdbStore111, code=" + err.code + err.message);
          expect().assertFail();
          done();
        }
      }
      console.info(TAGTEST + " ************* End*************");
    });
    /**
     * @tc.name VectorStoreTest0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0400
     * @tc.desc VectorEtsAPITest isVectorSupported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('VectorStoreTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let TAGTEST = TAG + " VectorStoreTest0400 ";
      const res = data_Rdb.isVectorSupported();
      console.info(TAGTEST + "res=" + res);
      if (res == false) {
        console.info(TAGTEST + "false res =" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore. rdbStore=" + rdbStore);
          expect().assertFail();
          done()
        } catch(err){
          console.info(TAGTEST + "fail getRdbStore, code=" + err.code + err.message);
          expect(err.code == 801).assertTrue();
          done()
        }

      } else {
        console.info(TAGTEST + "true res111111=" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore111111. rdbStore=" + rdbStore);
          expect(rdbStore != null).assertTrue();
          try {
            let exceptionMessage: data_Rdb.ExceptionMessage;
            rdbStore.on('sqliteErrorOccurred', exceptionMessage => {
              console.log(TAG + `error log is ${exceptionMessage.code}`)
              expect().assertFail();
              done();
            });
          } catch (err) {
            console.log(TAG + `error is failed code:${err.code},message:${err.message}`);
            expect(err.code == 801).assertTrue();
            done();
          }
          console.log(TAG + "************* VectorStoreTest0400 end *************");
        } catch(err){
          console.info(TAGTEST + "fail getRdbStore111, code=" + err.code + err.message);
          expect().assertFail();
          done();
        }
      }
      console.info(TAGTEST + " ************* End*************");
    });
    /**
     * @tc.name VectorStoreTest0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0500
     * @tc.desc VectorEtsAPITest isVectorSupported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('VectorStoreTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let TAGTEST = TAG + " VectorStoreTest0500 ";
      const res = data_Rdb.isVectorSupported();
      console.info(TAGTEST + "res=" + res);
      if (res == false) {
        console.info(TAGTEST + "false res =" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore. rdbStore=" + rdbStore);
          expect().assertFail();
          done()
        } catch(err){
          console.info(TAGTEST + "fail getRdbStore, code=" + err.code + err.message);
          expect(err.code == 801).assertTrue();
          done()
        }

      } else {
        console.info(TAGTEST + "true res111111=" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore111111. rdbStore=" + rdbStore);
          expect(rdbStore != null).assertTrue();
          try {
            let exceptionMessage: data_Rdb.ExceptionMessage;
            rdbStore.off('sqliteErrorOccurred', exceptionMessage => {
              console.log(TAG + `error log is ${exceptionMessage.code}`)
              expect().assertFail();
              done();
            });
          } catch (err) {
            expect(err.code == 801).assertTrue();
            console.log(TAG + `error is failed code:${err.code},message:${err.message}`);
            done();
          }
          console.log(TAG + "************* VectorStoreTest0500 end *************");
        } catch(err){
          console.info(TAGTEST + "fail getRdbStore111, code=" + err.code + err.message);
          expect().assertFail();
          done();
        }
      }
      console.info(TAGTEST + " ************* End*************");
    });
    console.info(TAG + " *************Unit Test End*************");
  })
}
