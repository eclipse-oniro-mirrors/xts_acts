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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from "../../../hypium";
import data_Rdb from '@ohos.data.relationalStore';
import common from "@ohos.app.ability.common";
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { abilityAccessCtrl,  PermissionRequestResult } from '@kit.AbilityKit';

const ERRCODE = 801;
let context: common.UIAbilityContext | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let sqlStatement = "CREATE TABLE IF NOT EXISTS employee (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT," +
  "name TEXT NOT NULL," + "age INTEGER)"
sqlStatement = "CREATE TABLE IF NOT EXISTS product (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT," +
  "name TEXT NOT NULL," + "price REAL," +
  "vendor INTEGER," + "describe TEXT)"
const TAG = "testTag"
const STORE_NAME = "distributed_rdb.db"
let rdbStore: data_Rdb.RdbStore | undefined;
let config: data_Rdb.StoreConfig = {
  name: STORE_NAME,
  securityLevel: data_Rdb.SecurityLevel.S1
}
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();

let getPermission = async () => {
  console.info('getPermission isstart');
  abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.actsetdistrubutedtable");
  await Utils.msSleep(5000)
  context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context!, ['ohos.permission.DISTRIBUTED_DATASYNC'], (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
    console.info('requestPermissionsFormUser success data is' + JSON.stringify(data));
    console.info('requestPermissionsFormUser failed err is' + JSON.stringify(err));
  })
}

async function executeSql1(rdbStore: data_Rdb.RdbStore) {
  let sqlStatement = "CREATE TABLE IF NOT EXISTS employee (" +
    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
    "name TEXT NOT NULL," +
    "age INTEGER)"
  try {
    await rdbStore.executeSql(sqlStatement)
    console.info(TAG + "create table employee success")
  } catch (err) {
    console.info(TAG + "create table employee failed")
    expect(null).assertFail()
  }
}

async function executeSql2(rdbStore: data_Rdb.RdbStore) {
  let sqlStatement = "CREATE TABLE IF NOT EXISTS product (" +
    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
    "name TEXT NOT NULL," +
    "price REAL," +
    "vendor INTEGER," +
    "describe TEXT)"
  try {
    await rdbStore!.executeSql(sqlStatement)
    console.info(TAG + "create table product success")
  } catch (err) {
    console.info(TAG + "create table product failed")
    expect(null).assertFail()
  }
}

async function executeSql3(rdbStore: data_Rdb.RdbStore) {
  let sqlStatement = "CREATE TABLE IF NOT EXISTS test (" +
    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
    "name TEXT NOT NULL," +
    "price REAL," +
    "vendor INTEGER," +
    "describe TEXT)"
  try {
    await rdbStore!.executeSql(sqlStatement)
    console.info(TAG + "create table product success")
  } catch (err) {
    console.info(TAG + "create table product failed")
    expect(null).assertFail()
  }
}

export default function relationalStorePermissionTest() {
  describe('relationalStorePermissionTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      await getPermission();
      await Utils.msSleep(1000);
      await Utils.clickRequestPermission('始终允许');
      await Utils.msSleep(1000);

    })

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
      rdbStore = await data_Rdb.getRdbStore(context!, config);
      console.info(TAG + "create RelationalStore store success");
      await executeSql1(rdbStore!);
      await executeSql2(rdbStore!);
      await executeSql3(rdbStore!);
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach')
      await data_Rdb.deleteRdbStore(context!, config);
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll')
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   relationalStorePermissionTest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PermissionTestEtsAPITest_0100
     * @tc.desc   set distributed table using one table prmose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStorePermissionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* relationalStorePermissionTest0100 start *************");
        let num = 1;
        try {
          await rdbStore!.setDistributedTables(["employee"])
          console.info(TAG + "relationalStorePermissionTest0100 distributed table success");
          expect(num).assertEqual(1);
          done();
        } catch (err) {
          console.info(TAG + "relationalStorePermissionTest0100 failed" + `, error code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(ERRCODE);
          done()
        }
        console.info(TAG + "************* relationalStorePermissionTest0100 end *************");
      })

    /**
     * @tc.name   relationalStorePermissionTest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PermissionTestEtsAPITest_0200
     * @tc.desc   set distributed table using one table callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStorePermissionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* relationalStorePermissionTest0200 start *************");
        let num = 1;
        try {
           rdbStore!.setDistributedTables(['employee'], (err: BusinessError | null) => {
            if (err) {
              console.error(TAG + `relationalStorePermissionTest0200-1 failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(14800000);
              done();
            }
            console.info(TAG + `relationalStorePermissionTest0200 successfully.`);
            expect(num).assertEqual(1);
            done();
          })
         
        } catch (err) {
          console.info(TAG + "relationalStorePermissionTest0200-2 failed" + `, error code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(ERRCODE);
        }
        done()
        console.info(TAG + "************* relationalStorePermissionTest0200 end *************");
      })

    /**
     * @tc.name   relationalStorePermissionTest0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0300
     * @tc.desc   set distributed table using DistributedType callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStorePermissionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + '************* relationalStorePermissionTest0300 start *************');
        let num = 1;
        try {
          rdbStore!.setDistributedTables(['employee'], data_Rdb.DistributedType.DISTRIBUTED_DEVICE,
            (err: BusinessError | null) => {
              if (err) {
                console.error(TAG + `relationalStorePermissionTest0300-1 failed, code is ${err.code},message is ${err.message}`);
                expect(err.code).assertEqual(401);
                done();
              }
              console.info(TAG + `relationalStorePermissionTest0300 successfully.`);
              expect(num).assertEqual(1);
              done();
            })
        } catch (err) {
          console.error(TAG + `relationalStorePermissionTest0300-2 failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        console.log(TAG + '************* relationalStorePermissionTest0300 end *************');
      })

    /**
     * @tc.name   relationalStorePermissionTest0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0400
     * @tc.desc   set distributed table using DistributedType, config callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStorePermissionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void): Promise<void> => {
      console.log(TAG + '************* relationalStorePermissionTest0400 start *************');
      let distributedConfig : data_Rdb.DistributedConfig = {
        autoSync: true
      }
      let num = 1;
      try {
        rdbStore!.setDistributedTables(['employee'], data_Rdb.DistributedType.DISTRIBUTED_DEVICE, distributedConfig,
          (err: BusinessError | null) => {
            if (err) {
              console.error(TAG + "relationalStorePermissionTest0400-2 failed" + err.code);
              expect(err.code).assertEqual(401);
              done();
            }else{
              
              console.info(TAG + "relationalStorePermissionTest0400 distributedConfig success");
              expect(num).assertEqual(1);
              done();
            }
          })
      } catch (err) {
        console.error(TAG + "relationalStorePermissionTest0400-2 failed" + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
      console.log(TAG + '************* relationalStorePermissionTest0400 end *************');
    })

   /**
     * @tc.name   relationalStorePermissionTest0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0500
     * @tc.desc   set distributed table using DistributedType, config callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStorePermissionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void): Promise<void> => {
      console.log(TAG + '************* relationalStorePermissionTest0500 start *************');
      let distributedConfig : data_Rdb.DistributedConfig = {
        autoSync: true
      }
      let num = 1 ;
      try {
        await rdbStore!.setDistributedTables(['employee'], data_Rdb.DistributedType.DISTRIBUTED_DEVICE, distributedConfig)
        .then(() => {
          console.info(TAG + "relationalStorePermissionTest0500 distributedConfig success");
          expect(num).assertEqual(1);
          done();
        }).catch ( (err) => {
          console.info(TAG + "relationalStorePermissionTest0500-1 failed" + err!.code);
          expect(err!.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.info(TAG + "relationalStorePermissionTest0500-2 failed" + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   relationalStorePermissionTest0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0600
     * @tc.desc   set distributed table using DistributedType, config callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStorePermissionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void): Promise<void> => {
      console.log(TAG + '************* relationalStorePermissionTest0600 start *************');
      try {
        rdbStore!.obtainDistributedTableName("123456788", "employee", (err: BusinessError<void> | null) => {
          if (err) {
            console.error(TAG + "relationalStorePermissionTest0600-2 failed" + err.code);
            expect(err.code).assertEqual(14800000);
            done();
          }else{       
            console.info(TAG + "relationalStorePermissionTest0600 distributedConfig success");
            expect().assertFail();
            done();
          }
        })
        
      } catch (err) {
        console.info(TAG + "relationalStorePermissionTest0600 failed" + err.code);
        expect(err.code).assertEqual(14800000);
        done();
      }
    })

    /**
     * @tc.name   relationalStorePermissionTest0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0700
     * @tc.desc   set distributed table using DistributedType, config callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStorePermissionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void): Promise<void> => {
      console.log(TAG + '************* relationalStorePermissionTest0700 start *************');
      try {
        await rdbStore!.obtainDistributedTableName("12345678", "employee")
        console.info(TAG + "relationalStorePermissionTest0700 table success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(TAG + "relationalStorePermissionTest0700 failed" + err.code);
        expect(err.code).assertEqual(14800000);
        done();
      }
    })

     /**
     * @tc.name   relationalStorePermissionTest0800
     * @tc.number  SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_0800
     * @tc.desc   unlockCloudContainer RdbPredicates, relationalStore.RdbPredicates and promise method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('relationalStorePermissionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
     async (done: () => void): Promise<void> => {
       console.log(TAG + "************* relationalStorePermissionTest0800 start *************");
       let predicates = new data_Rdb.RdbPredicates("cloud_text");
       try {
         await rdbStore!.cloudSync(data_Rdb.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates, (progressDetail: data_Rdb.ProgressDetails) => {
          console.info("relationalStorePermissionTest0800 cloudSync succeeded");
             expect(progressDetail!.code).assertEqual(3);
             done();
           });
         console.info("relationalStorePermissionTest0800 cloudSync succeeded");
         expect().assertFail();
       } catch (err) {
         console.log(TAG + `relationalStorePermissionTest0800 fail, errcode: ` + err.code);
         expect(202).assertEqual(err.code);
         done();
       }
       console.log(TAG + "************* relationalStorePermissionTest0800 end *************");
    
     })

   /**
    * @tc.name   relationalStorePermissionTest0900
    * @tc.number testRdbCloudSync0002
    * @tc.desc   unlockCloudContainer RdbPredicates, relationalStore.RdbPredicates and promise method
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('relationalStorePermissionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
     async (done: () => void): Promise<void> => {
       console.log(TAG + "************* relationalStorePermissionTest0900 start *************");
       let predicates = new data_Rdb.RdbPredicates("cloud_text");
       rdbStore!.cloudSync(data_Rdb.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates, (progressDetail: data_Rdb.ProgressDetails) => {
        expect(progressDetail!.code).assertEqual(3);
        done();
       }, (err: BusinessError<void> | null) => {
         if (err) {
           console.log(TAG + `rdbStore.cloudSync fail, errcode: ` + err.code);
           expect(202).assertEqual(err.code);
         } else {
           console.info("relationalStorePermissionTest0900 cloudSync succeeded");
           expect().assertFail();
         }
       });
       await Utils.msSleep(1000);
       console.log(TAG + "************* relationalStorePermissionTest0900 end *************");
       done();
     })


   /**
     * @tc.name   relationalStorePermissionTest1000
     * @tc.number  SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1000
     * @tc.desc   sync  promise method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
   it('relationalStorePermissionTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void): Promise<void> => {
      console.log(TAG + "************* relationalStorePermissionTest1000 start *************");
      let predicates = new data_Rdb.RdbPredicates("cloud_text");
      try {
        let res = await rdbStore!.sync(data_Rdb.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates);
        console.info("relationalStorePermissionTest1000 sync succeeded");
        expect(typeof(res) === "object").assertTrue();
        done();
      } catch (err) {
        console.log(TAG + `relationalStorePermissionTest1000 sync fail, errcode: ` + err.code);
        expect(401).assertEqual(err.code);
        done();
      }

      try {
        let res = await rdbStore!.sync(data_Rdb.SyncMode.SYNC_MODE_TIME_FIRST, predicates);
        console.info("relationalStorePermissionTest1000 sync succeeded");
        expect(typeof(res) === "object").assertTrue();
        done();
      } catch (err) {
        console.log(TAG + `relationalStorePermissionTest1000 sync fail, errcode: ` + err.code);
        expect(401).assertEqual(err.code);
        done();
      }

      try {
        let res = await rdbStore!.sync(data_Rdb.SyncMode.SYNC_MODE_NATIVE_FIRST, predicates);
        console.info("relationalStorePermissionTest1000 sync succeeded");
        expect(typeof(res) === "object").assertTrue();
        done();
      } catch (err) {
        console.log(TAG + `relationalStorePermissionTest1000 sync fail, errcode: ` + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
      console.log(TAG + "************* relationalStorePermissionTest1000 end *************");
   
    })

     /**
     * @tc.name   relationalStorePermissionTest1100
     * @tc.number  SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1100
     * @tc.desc   sync  promise method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
   it('relationalStorePermissionTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void): Promise<void> => {
      console.log(TAG + "************* relationalStorePermissionTest1100 start *************");
      let predicates = new data_Rdb.RdbPredicates("cloud_text");
      try {
        rdbStore!.sync(data_Rdb.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates, (err: BusinessError<void> | null) => {
          if(err){
            expect(401).assertEqual(err.code);
            done();
          }else{
            console.info("relationalStorePermissionTest1100 sync succeeded");
            expect(null).assertFail();
            done();
          }
        });
      } catch (err) {
        console.log(TAG + `relationalStorePermissionTest1100 sync fail, errcode: ` + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
      console.log(TAG + "************* relationalStorePermissionTest1100 end *************");
   
    })

     /**
     * @tc.name   relationalStorePermissionTest1200
     * @tc.number  SUB_DistributedData_RelationalStore_SDK_SetDistributeJsAPITest_1200
     * @tc.desc   offDataChange   method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
   it('relationalStorePermissionTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void): Promise<void> => {
      console.log(TAG + "************* relationalStorePermissionTest1200 start *************");
      await  rdbStore!.close();
      try {
        rdbStore!.offDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD,  (devices: Array<string>) => {
          expect(devices).assertEqual(null);
          done();
        });
      } catch (err) {
        console.log(TAG + `relationalStorePermissionTest1200 offDataChange fail, errcode: ` + err.code);
        expect(14800014).assertEqual(err.code);
        done();
      }

      try {
        rdbStore!.offDataChange(data_Rdb.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS,  (devices: Array<data_Rdb.ChangeInfo>) => {
          expect(devices).assertEqual(null);
          done();
        });
      } catch (err) {
        console.log(TAG + `relationalStorePermissionTest1200 offDataChange fail, errcode: ` + err.code);
        expect(14800014).assertEqual(err.code);
        done();
      }
      console.log(TAG + "************* relationalStorePermissionTest1200 end *************");
   
    })
    console.info(TAG + "*************Unit Test End*************");
  })
}
