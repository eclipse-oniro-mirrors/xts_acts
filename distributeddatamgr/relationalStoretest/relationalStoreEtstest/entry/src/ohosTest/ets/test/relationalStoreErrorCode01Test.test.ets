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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size,TestType } from '@ohos/hypium'
import relationalStore from '@ohos.data.relationalStore';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';

let context: common.UIAbilityContext;
let TAG = "[ttt]";
let rdbStore:relationalStore.RdbStore;

export default function relationalStoreErrorCode01Test() {
  describe('relationalStoreErrorCode01Test', ()=> {
    beforeAll(async ()=> {
      console.info(TAG + "*************Unit Test Begin*************");
      console.info(TAG + 'beforeAll');
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    })

    beforeEach(async ()=> {
      console.info(TAG + 'beforeEach');
    })

    afterEach(async ()=> {
      console.info(TAG + 'afterEach');
    })

    afterAll(async ()=> {
      console.info(TAG + 'afterAll');
      console.info(TAG + "*************Unit Test end*************");
    })

    /**
     * @tc.name   relationalStoreTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
      let STORE_CONFIG : relationalStore.StoreConfig= {
        name: "rdbStore1.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      try{
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      }catch (e) {
        console.error(TAG + `deleteRdbStore failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("14801001");
      }
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })

    /**
     * @tc.name   relationalStoreTest002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest002 start *************");
      let STORE_CONFIG : relationalStore.StoreConfig= {
        name: "rdbStore2.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      try{
        relationalStore.deleteRdbStore(context, STORE_CONFIG, (err: BusinessError) => {
          console.log(TAG + `deleteRdbStore success`)
          done();
        })
      }catch (e) {
        console.error(TAG + `deleteRdbStore failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("14801001");
        done();
      }
      console.info(TAG + "************* relationalStoreTest002 end *************");
    })

    /**
     * @tc.name   relationalStoreTest003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>{
      console.info(TAG + "************* relationalStoreTest003 start *************");
      let STORE_CONFIG : relationalStore.StoreConfig= {
        name: "rdbStore1.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      try{
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      }catch (e) {
        console.error(TAG + `getRdbStore failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("14801001");
      }
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })

    /**
     * @tc.name   relationalStoreTest004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest004 start *************");
      let STORE_CONFIG : relationalStore.StoreConfig= {
        name: "rdbStore2.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      }
      try{
        relationalStore.getRdbStore(context, STORE_CONFIG, (err: BusinessError) => {
          console.log(TAG + `getRdbStore success`)
          done();
        })
      }catch (e) {
        console.error(TAG + `getRdbStore failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("14801001");
        done();
      }
      console.info(TAG + "************* relationalStoreTest004 end *************");
    })
    console.log(TAG + "*************Unit Test End*************");
  })
}