/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size,TestType } from '@ohos/hypium'
import relationalStore from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';


const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER)";

const STORE_CONFIG : relationalStore.StoreConfig= {
  name: "rdbStore.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

let rdbStore:relationalStore.RdbStore;

export default function relationalStoreErrorCode13Test() {
  describe('relationalStoreErrorCode13Test', ()=> {
    beforeAll(async ()=> {
      console.info(TAG + "*************Unit Test Begin*************");
      console.info(TAG + 'beforeAll');
    })

    beforeEach(async ()=> {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE, null);
    })

    afterEach(async ()=> {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context,"rdbStore.db");
    })

    afterAll(async ()=> {
      console.info(TAG + 'afterAll');

      console.info(TAG + "*************Unit Test end*************");
    })


    /**
     * @tc.name   errcode003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_0300
     * @tc.desc   errcode is 14800013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode003 start *************");
      let resultSet:relationalStore.ResultSet;
      try{
        let predicates = new relationalStore.RdbPredicates("employee");;
        resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount);
        resultSet.getColumnName(5);
        resultSet.getValue(-1);
        expect(null).assertFail();
        resultSet.close();
        done()
      }catch(err){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code==14800013).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode003 end *************");
    })
    /**
     * @tc.name   errcode035
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_3500
     * @tc.desc   beginTrans errcode is 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* errcode035 start *************");
      let rdbStore1:relationalStore.RdbStore;
      const STORE_CONFIG1 : relationalStore.StoreConfig= {
        name: "rdbStore.db",
        securityLevel: relationalStore.SecurityLevel.S1,
        vector:true,
      }
      const res = relationalStore.isVectorSupported();
      console.info(TAG + "res=" + res);
      if (res == false) {
        console.info(TAG + "false res =" + res);
        try {
          rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG1);
          console.info(TAG + "success getRdbStore. rdbStore=" + rdbStore1);
          expect().assertFail();
          await relationalStore.deleteRdbStore(context,STORE_CONFIG1)
          console.info(TAG + "delete RdbStore success." );
          done()
        } catch(err){
          console.info(TAG + "fail getRdbStore, code=" + err.code + err.message);
          expect(801).assertEqual(err.code);
          await relationalStore.deleteRdbStore(context,STORE_CONFIG1)
          console.info(TAG + "delete RdbStore success." );
          done()
        }
      }else {
        try {
          rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG1);
          console.info(TAG + "success getRdbStore1111. rdbStore=" + rdbStore1);
          await (rdbStore1 as relationalStore.RdbStore).beginTrans();
          expect(rdbStore1 != null).assertTrue();
          await relationalStore.deleteRdbStore(context,STORE_CONFIG1)
          console.info(TAG + "delete RdbStore success." );
          done()
        } catch (err) {
          console.log(TAG + "err.code" + err.code + "err.message" + err.message)
          expect(err.code == 14800047).assertTrue();
          await relationalStore.deleteRdbStore(context,STORE_CONFIG1)
          console.info(TAG + "delete RdbStore success." );
          done()
        }

      }
      console.info(TAG + "************* errcode035 end *************");
    })
  })
}