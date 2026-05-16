/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import relationalStore from '@ohos.data.relationalStore';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { abilityAccessCtrl, common, PermissionRequestResult } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import { BusinessError, Device, deviceInfo } from '@kit.BasicServicesKit';
let context  =  abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext()
const TAG = "[RELATIONAL_STORE_SETDISTRIBUTEDTABLE_JSKITS_TEST]"
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let currentDeviceIsWatch = false;

let getPermission = async () => {
  console.info('getPermission isstart');
  let context:common.UIAbilityContext | undefined = AppStorage.get("context") as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.DISTRIBUTED_DATASYNC'], (err:BusinessError, data:PermissionRequestResult) => {
    console.info('requestPermissionsFormUser success data is' + JSON.stringify(data));
    console.info('requestPermissionsFormUser failed err is' + JSON.stringify(err));
  })
}

let sleep = (ms:number) => {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

let drivenFn = async () => {
  try {
    let driver: Driver = Driver.create();
    console.info('come in driveFn');
     console.info('driver is  ${JSON.stringify(driver)}');
     await sleep(1000);
     let button = await driver.findComponent(ON.text('始终允许'));
     if (button) {
      console.info('button is  ${JSON.stringify(button)}');
      await sleep(1000);
      await button.click();
      await sleep(1000);
     } else {
      let button1 = await driver.findComponent(ON.text('允许'));
      console.info('button is  ${JSON.stringify(button1)}');
      await sleep(1000);
      await button1.click();
      await sleep(1000);
     }
  } catch (err) {
     console.info('err is  ${JSON.stringify(err)}');
     return
  }
}

const DISTRIBUTED_CONFIG_COLLABORATION:relationalStore.DistributedConfig = {
  autoSync: false,
  asyncDownloadAsset: false,
  enableCloud: false,
  tableType: relationalStore.DistributedTableType.DEVICE_COLLABORATION
}

const DISTRIBUTED_CONFIG_SINGLE:relationalStore.DistributedConfig = {
  autoSync: false,
  asyncDownloadAsset: false,
  enableCloud: false,
  tableType: relationalStore.DistributedTableType.SINGLE_VERSION
}

const DISTRIBUTED_CONFIG_INVALID:relationalStore.DistributedConfig = {
  autoSync: false,
  asyncDownloadAsset: false,
  enableCloud: false,
  tableType: 100
}

const DISTRIBUTED_CONFIG_UNDEFINED:relationalStore.DistributedConfig = {
  autoSync: false,
  asyncDownloadAsset: false,
  enableCloud: false,
  tableType: undefined
}

const DISTRIBUTED_CONFIG_NOTABLETYPE:relationalStore.DistributedConfig = {
  autoSync: false
}

const STORE_CONFIG:relationalStore.StoreConfig = {
  name: "RdbTest.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

const STORE_CONFIGNoschema:relationalStore.StoreConfig = {
  name: "RdbTestNoschema.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

const STORE_CONFIG1:relationalStore.StoreConfig = {
  name: "RdbTest1.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

const STORE_CONFIG2:relationalStore.StoreConfig = {
  name: "RdbTest2.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

const STORE_CONFIG3:relationalStore.StoreConfig = {
  name: "RdbTest3.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

const STORE_CONFIG4:relationalStore.StoreConfig = {
  name: "RdbTest4.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

const STORE_CONFIG5:relationalStore.StoreConfig = {
  name: "RdbTest5.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

const STORE_CONFIG6:relationalStore.StoreConfig = {
  name: "RdbTest6.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

let rdbStore: relationalStore.RdbStore | undefined;
let rdbStoreNoschema: relationalStore.RdbStore | undefined;
let rdbStore1: relationalStore.RdbStore | undefined;
let rdbStore2: relationalStore.RdbStore | undefined;
let rdbStore3: relationalStore.RdbStore | undefined;
let rdbStore4: relationalStore.RdbStore | undefined;
let rdbStore5: relationalStore.RdbStore | undefined;
let rdbStore6: relationalStore.RdbStore | undefined;

export default function RdbSetDistributedTable() {
  describe('setDistributedTableTest', () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      let deviceTypeInfo = deviceInfo.deviceType;
      currentDeviceIsWatch = deviceTypeInfo === "wearable" ? true : false;
    })

    beforeEach(async () => {
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      rdbStoreNoschema = await relationalStore.getRdbStore(context, STORE_CONFIGNoschema);
      rdbStore1 = await relationalStore.getRdbStore(context, STORE_CONFIG1);
      rdbStore2 = await relationalStore.getRdbStore(context, STORE_CONFIG2);
      rdbStore3 = await relationalStore.getRdbStore(context, STORE_CONFIG3);
      rdbStore4 = await relationalStore.getRdbStore(context, STORE_CONFIG4);
      rdbStore5 = await relationalStore.getRdbStore(context, STORE_CONFIG5);
      rdbStore6 = await relationalStore.getRdbStore(context, STORE_CONFIG6);
    })

    afterEach(async () => {
      console.info(TAG + "afterEach");
      rdbStore = undefined;
      await relationalStore.deleteRdbStore(context, "RdbTest.db");
      rdbStore1 = undefined;
      await relationalStore.deleteRdbStore(context, "RdbTest1.db");
      rdbStore2 = undefined;
      await relationalStore.deleteRdbStore(context, "RdbTest2.db");
      rdbStore3 = undefined;
      await relationalStore.deleteRdbStore(context, "RdbTest3.db");
      rdbStore4 = undefined;
      await relationalStore.deleteRdbStore(context, "RdbTest4.db");
      rdbStore5 = undefined;
      await relationalStore.deleteRdbStore(context, "RdbTest5.db");
      rdbStore6 = undefined;
      await relationalStore.deleteRdbStore(context, "RdbTest6.db");
      rdbStoreNoschema = undefined;
      await relationalStore.deleteRdbStore(context, "RdbTestNoschema.db");
    })

    afterAll(async () => {
      console.info(TAG + "afteAll");
    })

    console.log(TAG + "********************Unit Test Begin******************");

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_0100
     * @tc.name   setDistributedTableTest0001
     * @tc.desc   has schema set DEVICE_COLLABORATION success, after set SINGLE_VERSION fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0001 start *************");
      if(rdbStore == undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_COLLABORATION);
          console.info('setDistributedTables EMPLOYEE DEVICE_COLLABORATION successfully');
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE DEVICE_COLLABORATION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(null).assertFail();
        }
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        }
      }
      console.log(TAG + "************* setDistributedTableTest0001 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_0200
     * @tc.name   setDistributedTableTest0002
     * @tc.desc   has schema set SINGLE_VERSION success, after set DEVICE_COLLABORATION fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0002 start *************");
      if(rdbStore == undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(null).assertFail();
        }
        if(currentDeviceIsWatch) {
          console.info("currentDevice is not support")
        } else { 
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_COLLABORATION);
          console.info('setDistributedTables EMPLOYEE DEVICE_COLLABORATION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE DEVICE_COLLABORATION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        }
      }
      }
      console.log(TAG + "************* setDistributedTableTest0002 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_0300
     * @tc.name   setDistributedTableTest0003
     * @tc.desc   no schema set SINGLE_VERSION fail, after set DEVICE_COLLABORATION success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0003 start *************");
      if(rdbStoreNoschema == undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStoreNoschema.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStoreNoschema.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        }
        try {
          await rdbStoreNoschema.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_COLLABORATION);
          console.info('setDistributedTables EMPLOYEE DEVICE_COLLABORATION successfully');
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE DEVICE_COLLABORATION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(null).assertFail();
        }
      }
      console.log(TAG + "************* setDistributedTableTest0003 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_0400
     * @tc.name   setDistributedTableTest0004
     * @tc.desc   rdbStore had schema set SINGLE_VERSION success, rdbStoreNoschema noschema set SINGLE_VERSION fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0004 start *************");
      if(rdbStoreNoschema == undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStoreNoschema.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStoreNoschema.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        }
      }
      if(rdbStore == undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(null).assertFail();
        }
      }

      console.log(TAG + "************* setDistributedTableTest0004 end *************");  
    })

     /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_0500
     * @tc.name   setDistributedTableTest0005
     * @tc.desc   rdbStore1 has schema set SINGLE_VERSION fail due to bundlename is fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0005 start *************");
      if(rdbStore1== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore1.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore1.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
      }
      console.log(TAG + "************* setDistributedTableTest0005 end *************");  
    })

     /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_0600
     * @tc.name   setDistributedTableTest0006
     * @tc.desc   rdbStore1 has schema set SINGLE_VERSION fail due to bundlename is fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('setDistributedTableTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0006 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_INVALID);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("401");
        } 
      }
      console.log(TAG + "************* setDistributedTableTest0006 end *************");  
    })



    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_0700
     * @tc.name   setDistributedTableTest0007
     * @tc.desc   has schema set table type is default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0007 start *************");
      if(rdbStore1== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore1.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore1.setDistributedTables(["EMPLOYEE"]);
          console.info('setDistributedTables EMPLOYEE  successfully');
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE  failed, code is ${err.code}, messegeis ${err.message}`);
          expect(null).assertFail();
        } 
      }
      console.log(TAG + "************* setDistributedTableTest0007 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_0800
     * @tc.name   setDistributedTableTest0008
     * @tc.desc   had schme set table type fial due to sync filed is not intable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0008 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        if(currentDeviceIsWatch) {
          console.info("currentDevice is not support")
        } else { 
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
       }
      }
      console.log(TAG + "************* setDistributedTableTest0008 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_0900
     * @tc.name   setDistributedTableTest0009
     * @tc.desc   had schema set table sigle type fail due to sync spcialfield is not unique
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0009 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER UNIQUE ON CONFLICT REPLACE, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        if(currentDeviceIsWatch) {
          console.info("currentDevice is not support")
        } else { 
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        }
      }
      } 
      console.log(TAG + "************* setDistributedTableTest0009 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_1000
     * @tc.name   setDistributedTableTest0010
     * @tc.desc   has schema set table sigle type success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0010 start *************");
      if(rdbStore2== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore2.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL PRIMARY KEY, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore2.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(null).assertFail();
        }
      } 
      console.log(TAG + "************* setDistributedTableTest0010 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_1100
     * @tc.name   setDistributedTableTest0011
     * @tc.desc   has schema set table single type fail sync primarykey but table has other unique filed not null not sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0011 start *************");
      if(rdbStore2== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore2.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL PRIMARY KEY, AGE INTEGER UNIQUE NOT NULL, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        if(currentDeviceIsWatch) {
          console.info("currentDevice is not support")
        } else { 
        try {
          await rdbStore2.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
      }
      }
      console.log(TAG + "************* setDistributedTableTest0011 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_1200
     * @tc.name   setDistributedTableTest0012
     * @tc.desc   has schema set table single type sync primarykey but table has other unique field not sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0012 start *************");
      if(rdbStore2== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore2.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL PRIMARY KEY, AGE INTEGER UNIQUE, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        if(currentDeviceIsWatch) {
          console.info("currentDevice is not support")
        } else { 
        try {
          await rdbStore2.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
      }
      }
      console.log(TAG + "************* setDistributedTableTest0012 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_1300
     * @tc.name   setDistributedTableTest0013
     * @tc.desc   has schema set table single type sync primarykey but primarykey is not sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0013 start *************");
      if(rdbStore3== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore3.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL PRIMARY KEY, AGE INTEGER UNIQUE, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        if(currentDeviceIsWatch) {
          console.info("currentDevice is not support")
        } else { 
        try {
          await rdbStore3.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
      }
      }
      console.log(TAG + "************* setDistributedTableTest0013 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_1400
     * @tc.name   setDistributedTableTest0014
     * @tc.desc   has schema set table single type fail table is no primarykey table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0014 start *************");
      if(rdbStore3== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore3.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL, AGE INTEGER UNIQUE, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        if(currentDeviceIsWatch) {
          console.info("currentDevice is not support")
        } else { 
        try {
          await rdbStore3.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
      }
      }
      console.log(TAG + "************* setDistributedTableTest0014 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_1500
     * @tc.name   setDistributedTableTest0015
     * @tc.desc   has schema set single type fail table is has primarykey table and spcialfield is primarykey, but table has not null field no default value is not sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0015 start *************");
      if(rdbStore3== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore3.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL, AGE INTEGER PRIMARY KEY, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        if(currentDeviceIsWatch) {
          console.info("currentDevice is not support")
        } else { 
        try {
          await rdbStore3.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
      }
      }
      console.log(TAG + "************* setDistributedTableTest0015 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_1600
     * @tc.name   setDistributedTableTest0016
     * @tc.desc   has schema set single type fail table is has primarykey table and primarykey is autoincrement&sync, but spcialfield is not unqie 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0016 start *************");
      if(rdbStore4== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore4.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore4.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        }
      } 
      console.log(TAG + "************* setDistributedTableTest0016 end *************");  
    })

      /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_1700
     * @tc.name   setDistributedTableTest0017
     * @tc.desc   has schema set single type fail table is has primarykey table and primarykey is autoincrement&sync, but has two spcialfields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0017 start *************");
      if(rdbStore5== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore5.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER UNIQUE, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore5.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        }
      } 
      console.log(TAG + "************* setDistributedTableTest0017 end *************");  
    })

      /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_1800
     * @tc.name   setDistributedTableTest0018
     * @tc.desc   has schema set table single type fail due to deviceSyncFields is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0018 start *************");
      if(rdbStore6== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore6.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        if(currentDeviceIsWatch) {
          console.info("currentDevice is not support")
        } else { 
        try {
          await rdbStore6.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
      }
      }
      console.log(TAG + "************* setDistributedTableTest0018 end *************");  
    })

      /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_1900
     * @tc.name   setDistributedTableTest0019
     * @tc.desc   has schema set table single type success table is has primarykey table and spcialfield is primarykey, table has not null filed default value is not sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0019 start *************");
      if(rdbStore3== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore3.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL DEFAULT "zhangsan", AGE INTEGER PRIMARY KEY, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore3.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
      }
      console.log(TAG + "************* setDistributedTableTest0019 end *************");  
    })

      /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_2000
     * @tc.name   setDistributedTableTest0020
     * @tc.desc   has schema set table single type success hads two unique filed and sync all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0020 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER UNIQUE ON CONFLICT REPLACE, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
      }
      console.log(TAG + "************* setDistributedTableTest0020 end *************");  
    })

      /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_2100
     * @tc.name   setDistributedTableTest0021
     * @tc.desc   has schema set table single type fail table is has primarykey table and primarykey is autoincrement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTableTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setDistributedTableTest0021 start *************");
      if(rdbStore4== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore4.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER UNIQUE, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore4.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setDistributedTables EMPLOYEE SINGLE_VERSION successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE SINGLE_VERSION failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
      }
      console.log(TAG + "************* setDistributedTableTest0021 end *************");  
    })

      /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_2200
     * @tc.name   setCloudDistributedTableTest0001
     * @tc.desc   setCloudDistributedTable config no tabletype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setCloudDistributedTableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setCloudDistributedTableTest0001 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setCloudDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_NOTABLETYPE);
          console.info('setCloudDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        } 
      }
      console.log(TAG + "************* setCloudDistributedTableTest0001 end *************");  
    })

     /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_2300
     * @tc.name   setCloudDistributedTableTest0002
     * @tc.desc   setCloudDistributedTable fail due to type is COLLABORATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('setCloudDistributedTableTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setCloudDistributedTableTest0002 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setCloudDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_COLLABORATION);
          console.info('setCloudDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("801");
        } 
      }
      console.log(TAG + "************* setCloudDistributedTableTest0002 end *************");  
    })

      /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_2400
     * @tc.name   setCloudDistributedTableTest0003
     * @tc.desc   setCloudDistributedTable success type is SINGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setCloudDistributedTableTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setCloudDistributedTableTest0003 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setCloudDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_SINGLE);
          console.info('setCloudDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(null).assertFail();
        }
      }  
      console.log(TAG + "************* setCloudDistributedTableTest0003 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_2500
     * @tc.name   setCloudDistributedTableTest0004
     * @tc.desc   setCloudDistributedTable fail due to type is invaid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setCloudDistributedTableTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setCloudDistributedTableTest0004 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setCloudDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_INVALID);
          console.info('setCloudDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("401");
        } 
      }
      console.log(TAG + "************* setCloudDistributedTableTest0004 end *************");  
    })


      /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_2600
     * @tc.name   setCloudDistributedTableTest0005
     * @tc.desc   setCloudDistributedTable success type is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setCloudDistributedTableTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setCloudDistributedTableTest0005 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setCloudDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_UNDEFINED);
          console.info('setCloudDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(null).assertFail();
        } 
      }
      console.log(TAG + "************* setCloudDistributedTableTest0005 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_2700
     * @tc.name   setMulteDistributedTest0001
     * @tc.desc   setCloudDistributedTable first and setDeviceDIsrtibutedTable fail due to table type device and cloud is exclusive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setMulteDistributedTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setMulteDistributedTest0001 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setCloudDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_UNDEFINED);
          console.info('setCloudDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        if(currentDeviceIsWatch) {
          console.info("currentDevice is not support")
        } else { 
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_COLLABORATION);
          console.info('setDistributedTables EMPLOYEE successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        }  
      }
      }
      console.log(TAG + "************* setMulteDistributedTest0001 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_2800
     * @tc.name   setMulteDistributedTest0002
     * @tc.desc   setDeviceDIsrtibutedTable first and setCloudDistributedTable fail due to table type device and cloud is exclusive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setMulteDistributedTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setMulteDistributedTest0002 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
          try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        console.info(`setDistributedTables EMPLOYEE begin`);
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_COLLABORATION);
          console.info('setDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(null).assertFail();
        }
        console.info(`setCloudDistributedTables EMPLOYEE begin`);
        if(currentDeviceIsWatch) {
          console.info("currentDevice is not support")
        } else { 
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_UNDEFINED);
          console.info('setCloudDistributedTables EMPLOYEE successfully');
          expect(null).assertFail();
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual(14800000);
        }  
      }
      }     
      console.log(TAG + "************* setMulteDistributedTest0002 end *************");     
    })

     /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_2900
     * @tc.name   setCloudDistributedTableTest0006
     * @tc.desc   setCloudDistributedTable param is err type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setCloudDistributedTableTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setCloudDistributedTableTest0006 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        try {
          rdbStore.setDistributedTables([], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_COLLABORATION, (err) => {
            if(err){
              expect(err.code).assertEqual("801");
            }else{
              expect().assertFail();
            }
          });
          console.info('setCloudDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("801");
        } 

        try {
          rdbStore.setDistributedTables(null, relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_SINGLE, (err)=>{
            if(err){
              expect(err.code).assertEqual("401");
            }else{
              expect().assertFail();
            }
          });
          console.info('setCloudDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("401");
        } 

        try {
         rdbStore.setDistributedTables(undefined, relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_SINGLE, (err)=>{
          if(err){
            expect(err.code).assertEqual("401");
          }else{
            expect().assertFail();
          }
         });
          console.info('setCloudDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("401");
        } 
      }
      console.log(TAG + "************* setCloudDistributedTableTest0006 end *************");  
    })

     /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_3000
     * @tc.name   setCloudDistributedTableTest0007
     * @tc.desc   setCloudDistributedTable param is err type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setCloudDistributedTableTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setCloudDistributedTableTest0007 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, null);
          console.info('setCloudDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("401");
        } 

        try {
          await rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, undefined);
          console.info('setCloudDistributedTables EMPLOYEE successfully');
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("401");
        } 
      }
      console.log(TAG + "************* setCloudDistributedTableTest0007 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_3100
     * @tc.name   setCloudDistributedTableTest0008
     * @tc.desc   setCloudDistributedTable param is err type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setCloudDistributedTableTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setCloudDistributedTableTest0008 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        try {
          await rdbStore.close();
          rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_SINGLE, (err) =>{
            console.info('setCloudDistributedTables EMPLOYEE successfully');
            expect().assertFail();
          });

        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("14800014");
        } 

        try {
          await rdbStore.close();
          rdbStore.setDistributedTables(["EMPLOYEE"], (err) =>{
            console.info('setCloudDistributedTables EMPLOYEE successfully');
            expect().assertFail();
          });

        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("14800014");
        } 
      }
      console.log(TAG + "************* setCloudDistributedTableTest0008 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_3200
     * @tc.name   setObtainDistributedTableName0001
     * @tc.desc   obtainDistributedTableName 14800014 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setObtainDistributedTableName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setObtainDistributedTableName0001 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        try {
          await rdbStore.close();
          await rdbStore.obtainDistributedTableName("1234569797", "EMPLOYEE")
          console.info(TAG + "obtainDistributedTableName table success");
          expect().assertFail();
        } catch (err) {
          console.info(TAG + "obtainDistributedTableName table failed");
          expect(err.code).assertEqual("14800014");
        }
      }
      console.log(TAG + "************* setObtainDistributedTableName0001 end *************");  
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_3300
     * @tc.name   setObtainDistributedTableName0002
     * @tc.desc    obtainDistributedTableName 14800014 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setObtainDistributedTableName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* setObtainDistributedTableName0002 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        try {
          await rdbStore.close();
          rdbStore.obtainDistributedTableName("1234569797", "EMPLOYEE", (err) => {
            console.info(TAG + "obtainDistributedTableName table success");
            expect().assertFail();
          })
          
        } catch (err) {
          console.info(TAG + "obtainDistributedTableName table failed");
          expect(err.code).assertEqual("14800014");
        }
      }
      console.log(TAG + "************* setObtainDistributedTableName0002 end *************");  
    })

     /**
     * @tc.number SUB_DistributedData_RelationalStore_CrossDevice_SDK_ThirdPartyApp_3500
     * @tc.name   setCloudDistributedTableTest0010
     * @tc.desc   setCloudDistributedTable param is err type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('setCloudDistributedTableTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* setCloudDistributedTableTest0010 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        try {
          rdbStore.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, null, (err) => {
            if(err){
              expect().assertFail();
            }else{
              console.info('setCloudDistributedTables EMPLOYEE successfully');
              try {
                rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, undefined, (err) =>{
                  if(err){
                    console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
                    expect().assertFail();
                  }else{
                    console.info('setCloudDistributedTables EMPLOYEE successfully');
                    done();
                  }
                });
              } catch (err) {
                console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
                expect(err.code).assertEqual("401");
              } 
            }
          });
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("401");
        }
   
      }
      console.log(TAG + "************* setCloudDistributedTableTest0010 end *************");  
    })
  })
}