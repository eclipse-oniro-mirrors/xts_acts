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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import relationalStore from "@ohos.data.relationalStore";
import { ValuesBucket } from '@ohos.data.ValuesBucket';
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[RdbStoreExecuteSqlErrorTest]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG2: relationalStore.StoreConfig  = {
    name: "readOnly.db",
    securityLevel: relationalStore.SecurityLevel.S1,
    isReadOnly: true,
  }

const DATABASE_BACKUP_NAME = "Backup.db"
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "ExcuteSqlTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};
let rdbStore: relationalStore.RdbStore | undefined

let cryptoParam1: relationalStore.CryptoParam = {
    encryptionKey: new Uint8Array([10, 20, 30]),
    encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_CBC,
    hmacAlgo: relationalStore.HmacAlgo.SHA512,
    kdfAlgo: relationalStore.KdfAlgo.KDF_SHA512,
}

const STORE_CONFIG_S2: relationalStore.StoreConfig = {
    name: "rdbstore4.db",
    encrypt: true,
    securityLevel: relationalStore.SecurityLevel.S2,
    rootDir: "",
    autoCleanDirtyData: true,
    allowRebuild: true,
    vector: true,
    isReadOnly: true,
    pluginLibs: ['rdbstore4.db'],
    cryptoParam: cryptoParam1,
    tokenizer: relationalStore.Tokenizer.CUSTOM_TOKENIZER,
    persist: true,
    enableSemanticIndex: true
}

let cryptoParam2: relationalStore.CryptoParam = {
    encryptionKey: new Uint8Array([10, 20, 30]),
    encryptionAlgo: relationalStore.EncryptionAlgo.PLAIN_TEXT,
    hmacAlgo: relationalStore.HmacAlgo.SHA256,
    kdfAlgo: relationalStore.KdfAlgo.KDF_SHA256,
}
const STORE_CONFIG_S3: relationalStore.StoreConfig = {
    name: "rdbstore5",
    encrypt: false,
    securityLevel: relationalStore.SecurityLevel.S3,
    rootDir: "",
    autoCleanDirtyData: false,
    allowRebuild: false,
    vector: false,
    isReadOnly: false,
    pluginLibs: undefined,
    cryptoParam: cryptoParam2,
    tokenizer: relationalStore.Tokenizer.ICU_TOKENIZER,
    persist: false,
    enableSemanticIndex: false
       
};


let cryptoParam3: relationalStore.CryptoParam = {
    encryptionKey: new Uint8Array([10, 20, 30]),
     encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_GCM,
     hmacAlgo: relationalStore.HmacAlgo.SHA1,
     kdfAlgo: relationalStore.KdfAlgo.KDF_SHA1,
   }
const STORE_CONFIG_S4: relationalStore.StoreConfig = {
    name: "rdbstore6",
    encrypt: false,
    securityLevel: relationalStore.SecurityLevel.S4,
    rootDir: "",
    autoCleanDirtyData: false,
    allowRebuild: false,
    vector: false,
    isReadOnly: false,
    pluginLibs: [],
    cryptoParam: cryptoParam3,
    tokenizer: relationalStore.Tokenizer.NONE_TOKENIZER,      
};

export default function rdbstoreStoreExcuteSqlErrorTest() {
  describe("rdbstoreStoreExcuteSqlErrorTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async () => {
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await rdbStore.executeSql("DELETE FROM test");
      console.info(TAG + "beforeEach");
    });

    afterEach(async () => {
      console.info(TAG + "afterEach");
      await relationalStore.deleteRdbStore(context, "ExcuteSqlTest.db");
    });

    afterAll(async () => {
      console.info(TAG + "afterAll");
    });

     /**
     * @tc.name   testRdbStoreExecuteSqlError001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ExecuteSqlErrorAPITest_0100
     * @tc.desc   RdbStore executeSql promise with null or undefined or ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("testRdbStoreExecuteSqlError001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testRdbStoreExecuteSqlError001 start *************");
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
         try {
          await rdbStore.executeSql(null, ["18", "28"]);
          expect().assertFail();
          done();
        } catch (err) {
          console.error(TAG + `testRdbStoreExecuteSqlError001, errcode:${JSON.stringify(err)}`);
          expect(err.code).assertEqual("401");
          done();
        }
  
        try {
            await rdbStore.executeSql(undefined, ["18", "28"]);
            expect().assertFail();
            done()
        } catch (err) {
          console.error(TAG + `testRdbStoreExecuteSqlError001, errcode:${JSON.stringify(err)}`);
          expect(err.code).assertEqual("401");
          done();
        }
  
        try {
            await rdbStore.executeSql("", ["18", "28"]);
            expect().assertFail();
            done()
        } catch (err) {
          console.error(TAG + `testRdbStoreExecuteSqlError001, errcode:${JSON.stringify(err)}`);
          expect(err.code).assertEqual("401");
          done();
        }
     
        console.log(TAG + "************* testRdbStoreExecuteSqlError001 end *************");
      })
  
      /**
       * @tc.name   testRdbStoreExecuteSqlError002
       * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ExecuteSqlErrorAPITest_0200
       * @tc.desc   RdbStore executeSql promise with null undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it("testRdbStoreExecuteSqlError002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testRdbStoreExecuteSqlError002 start *************");
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
         try {
          await rdbStore?.executeSql("DELETE FROM test WHERE age = ? OR age = ?", undefined);
          expect().assertFail();
          done();
        } catch (err) {
          console.error(TAG + `testRdbStoreExecuteSqlError002, errcode:${JSON.stringify(err)}`);
          expect(err.code).assertEqual(14800000);
          done();
        }
  
        try {
            await rdbStore.executeSql("DELETE FROM test WHERE age = ? OR age = ?", null);
            expect().assertFail();
            done();
        } catch (err) {
          console.error(TAG + `testRdbStoreExecuteSqlError002, errcode:${JSON.stringify(err)}`);
          expect(err.code).assertEqual(14800000);
          done();
        }
     
        console.log(TAG + "************* testRdbStoreExecuteSqlError002 end *************");
      })
  
      /**
       * @tc.name   testRdbStoreExecuteSqlError003
       * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ExecuteSqlErrorAPITest_0300
       * @tc.desc   RdbStore executeSql err.code 
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it("testRdbStoreExecuteSqlError003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testRdbStoreExecuteSqlError003 start *************");
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
            await rdbStore.close();
            await rdbStore.executeSql("DELETE FROM test WHERE age = ? OR age = ?", ["18", "28"]);
        }catch (err) {
            console.error(TAG + `testRdbStoreExecuteSqlError003, errcode:${JSON.stringify(err)}`);
            expect(err.code).assertEqual("14800014");
            done();
        }
        console.info(TAG + "************* testRdbStoreExecuteSqlError003 end *************");
      });

    /**
     * @tc.name   testGetRdbStoreError0100
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreErrorAPITest_0100
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreError0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testGetRdbStoreError0100 start *************");
        try {
          relationalStore.getRdbStore(null, STORE_CONFIG, async (err: BusinessError) => {
            console.info(`testGetRdbStoreError0100 faied.`);
            expect(!err).assertFail();
            done();
          });
        } catch (err) {
          console.error(TAG + `testGetRdbStoreError0100, errcode:${JSON.stringify(err)}`);
          expect(err.code).assertEqual('401')
          done();
        }
        console.info(TAG + "************* testGetRdbStoreError0100 end   *************");
      });

    /**
     * @tc.name   testGetRdbStoreError0200
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreErrorAPITest_0200
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreError0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testGetRdbStoreError0200 start *************");
        try {
          relationalStore.getRdbStore(context, null, async (err: BusinessError) => {
            console.info(`testGetRdbStoreError0200 faied.`);
            expect(!err).assertFail();
            done();
          });
        } catch (err) {
            console.error(TAG + `testGetRdbStoreError0200, errcode:${JSON.stringify(err)}`);
          expect(err.code).assertEqual('401')
          done();
        }
        console.info(TAG + "************* testGetRdbStoreError0200 end   *************");
      });

    /**
     * @tc.name   testGetRdbStoreError0300
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreErrorAPITest_0300
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreError0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testGetRdbStoreError0300 start *************");
        try {
          await relationalStore.getRdbStore(context, null)
          expect().assertFail();
          done();
        } catch (err) {
            console.error(TAG + `testGetRdbStoreError0300, errcode:${JSON.stringify(err)}`);
          expect(err.code).assertEqual('401')
          done();
        }
        console.info(TAG + "************* testGetRdbStoreError0300 end   *************");
      });

    /**
     * @tc.name   testGetRdbStoreError0400
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreErrorAPITest_0400
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreError0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testGetRdbStoreError0400 start *************");
        try {
          await relationalStore.getRdbStore(null, STORE_CONFIG)
          expect().assertFail();
          done();
        } catch (err) {
            console.error(TAG + `testGetRdbStoreError0400, errcode:${JSON.stringify(err)}`);
          expect(err.code).assertEqual('401')
          done();
        }
        console.info(TAG + "************* testGetRdbStoreError0400 end   *************");
      });

    /**
     * @tc.name   testGetRdbStoreError0500
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreErrorAPITest_0500
     * @tc.desc   getRdbStore callback with err rootDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreError0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testGetRdbStoreError0500 start *************");
        let config: relationalStore.StoreConfig = {
            name: "ExcuteSqlTest.db",
            securityLevel: relationalStore.SecurityLevel.S1,
            rootDir: "./"
          };
          try{
            relationalStore.getRdbStore(context, config, async(err: BusinessError) => {
                expect(!err).assertFail();
              done();
            })
          }catch (e) {
            console.error(TAG + `testGetRdbStoreError0500 failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual("14800010");
            done();
          }
        console.info(TAG + "************* testGetRdbStoreError0500 end   *************");
      });

    /**
     * @tc.name   testGetRdbStoreError0600
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreErrorAPITest_0600
     * @tc.desc   getRdbStore promise with err rootDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreError0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testGetRdbStoreError0600 start *************");
        let config: relationalStore.StoreConfig = {
            name: "ExcuteSqlTest.db",
            securityLevel: relationalStore.SecurityLevel.S1,
            rootDir: "./"
          };
          try{
            await relationalStore.getRdbStore(context, config)
            expect().assertFail();
            done();
          }catch (e) {
            console.error(TAG + `testGetRdbStoreError0600 failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual("14800010");
            done();
          }
        console.info(TAG + "************* testGetRdbStoreError0600 end   *************");
      });
  
    /**
     * @tc.name   testDeleteRdbStoreError0100
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreErrorAPITest_0100
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreError0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testDeleteRdbStoreError0100 start *************");
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        try {
            relationalStore.deleteRdbStore(null, "secure.db", async (err: BusinessError) => {
              expect(!err).assertFail();
              done();
            });
          } catch (err) {
            console.error(TAG + `testDeleteRdbStoreError0100, errcode:${JSON.stringify(err)}`);
            expect(err.code).assertEqual('401')
            done();
          }
        console.info(TAG + "************* testDeleteRdbStoreError0100 end   *************");
      });

    /**
     * @tc.name   testDeleteRdbStoreError0200
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreErrorAPITest_0200
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreError0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testDeleteRdbStoreError0200 start *************");
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        try {
            relationalStore.deleteRdbStore(context, null, async (err: BusinessError) => {
              expect(!err).assertFail();
              done();
            });
          } catch (err) {
            console.error(TAG + `testDeleteRdbStoreError0200, errcode:${JSON.stringify(err)}`);
            expect(err.code).assertEqual('401')
            done();
          }
        console.info(TAG + "************* testDeleteRdbStoreError0200 end   *************");
      });

    /**
     * @tc.name   testDeleteRdbStoreError0300
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreErrorAPITest_0300
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreError0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testDeleteRdbStoreError0300 start *************");
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        try {
            await relationalStore.deleteRdbStore(null, "secure.db")
            expect().assertFail();
            done();
          } catch (err) {
            console.error(TAG + `testDeleteRdbStoreError0300, errcode:${JSON.stringify(err)}`);
            expect(err.code).assertEqual('401')
            done();
          }
        console.info(TAG + "************* testDeleteRdbStoreError0300 end   *************");
      });

    /**
     * @tc.name   testDeleteRdbStoreError0400
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreErrorAPITest_0400
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreError0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testDeleteRdbStoreError0400 start *************");
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        try {
            await relationalStore.deleteRdbStore(context, null)
            expect().assertFail();
            done();
          } catch (err) {
            console.error(TAG + `testDeleteRdbStoreError0400, errcode:${JSON.stringify(err)}`);
            expect(err.code).assertEqual('401')
            done();
          }
        console.info(TAG + "************* testDeleteRdbStoreError0400 end   *************");
      });

    /**
     * @tc.name   testDeleteRdbStoreError0500
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreErrorAPITest_0500
     * @tc.desc   getRdbStore promise with rootDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreError0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testDeleteRdbStoreError0500 start *************");
        let config: relationalStore.StoreConfig = {
            name: "ExcuteSqlTest.db",
            securityLevel: relationalStore.SecurityLevel.S1,
            rootDir: "./"
          };
        try {
            await relationalStore.deleteRdbStore(context, config)
            expect().assertFail();
            done();
          } catch (err) {
            console.error(TAG + `testDeleteRdbStoreError0500, errcode:${JSON.stringify(err)}`);
            expect(err.code).assertEqual('14800010')
            done();
          }
        console.info(TAG + "************* testDeleteRdbStoreError0500 end   *************");
      });

    /**
     * @tc.name   testDeleteRdbStoreError0600
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreErrorAPITest_0600
     * @tc.desc   getRdbStore callback with rootDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreError0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testDeleteRdbStoreError0600 start *************");
        let config: relationalStore.StoreConfig = {
            name: "ExcuteSqlTest.db",
            securityLevel: relationalStore.SecurityLevel.S1,
            rootDir: "./"
          };
        try {
            relationalStore.deleteRdbStore(context, config, async (err: BusinessError) => {
                expect(!err).assertFail();
                done();
              });
          } catch (err) {
            console.error(TAG + `testDeleteRdbStoreError0600, errcode:${JSON.stringify(err)}`);
            expect(err.code).assertEqual('14800010')
            done();
          }
        console.info(TAG + "************* testDeleteRdbStoreError0600 end   *************");
      });

    /**
     * @tc.name   testGetRdbStoreConfig0100
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreConfigAPITest_0100
     * @tc.desc   getRdbStore promise with 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreConfig0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testGetRdbStoreConfig0100 start *************");
          try{
            let store = await relationalStore.getRdbStore(context, STORE_CONFIG_S2)
            expect(typeof(store) === "object").assertTrue();
            done();
          }catch (e) {
            console.error(TAG + `testGetRdbStoreConfig0100 failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual("801");
            done();
          }
          await relationalStore.deleteRdbStore(context, STORE_CONFIG_S2)
          try{
            await relationalStore.getRdbStore(context, STORE_CONFIG_S2, (err, store) => {
              if(err){
                expect(err.code).assertEqual("801");
                done();
              }else{
                expect(typeof(store) === "object").assertTrue();
                done();
              }
            })
           
          }catch (e) {
            console.error(TAG + `testGetRdbStoreConfig0100 failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual("801");
            done();
          }
          await relationalStore.deleteRdbStore(context, STORE_CONFIG_S2)
        console.info(TAG + "************* testGetRdbStoreConfig0100 end   *************");
      });

    /**
     * @tc.name   testGetRdbStoreConfig0200
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreConfigAPITest_0200
     * @tc.desc   getRdbStore promise with 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreConfig0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testGetRdbStoreConfig0200 start *************");
          try{
            let store = await relationalStore.getRdbStore(context, STORE_CONFIG_S3)
            expect(typeof(store) === "object").assertTrue();
            done();
          }catch (e) {
            console.error(TAG + `testGetRdbStoreConfig0200 failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual("801");
            done();
          }
          await relationalStore.deleteRdbStore(context, STORE_CONFIG_S3)

          try{
            await relationalStore.getRdbStore(context, STORE_CONFIG_S3, (err, store) => {
              if(err){
                expect(err.code).assertEqual("801");
                done();
              }else{
                expect(typeof(store) === "object").assertTrue();
                done();
              }
            })
           
          }catch (e) {
            console.error(TAG + `testGetRdbStoreConfig0100 failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual("801");
            done();
          }
          await relationalStore.deleteRdbStore(context, STORE_CONFIG_S3)
        console.info(TAG + "************* testGetRdbStoreConfig0200 end   *************");
      });

    /**
     * @tc.name   testGetRdbStoreConfig0300
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreConfigAPITest_0300
     * @tc.desc   getRdbStore promise with 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreConfig0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testGetRdbStoreConfig0300 start *************");
          try{
            let store = await relationalStore.getRdbStore(context, STORE_CONFIG_S4)
            expect(typeof(store) === "object").assertTrue();
            done();
          }catch (e) {
            console.error(TAG + `testGetRdbStoreConfig0300 failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual("801");
            done();
          }
          await relationalStore.deleteRdbStore(context, STORE_CONFIG_S4)

          try{
            await relationalStore.getRdbStore(context, STORE_CONFIG_S4, (err, store) => {
              if(err){
                expect(err.code).assertEqual("801");
                done();
              }else{
                expect(typeof(store) === "object").assertTrue();
                done();
              }
            })
           
          }catch (e) {
            console.error(TAG + `testGetRdbStoreConfig0100 failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual("801");
            done();
          }
          await relationalStore.deleteRdbStore(context, STORE_CONFIG_S4)
        console.info(TAG + "************* testGetRdbStoreConfig0300 end   *************");
      });

    /**
     * @tc.name   testDeleteRdbStoreConfig0100
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreConfigAPITest_0100
     * @tc.desc   deleteRdbStore callback  
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreConfig0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testDeleteRdbStoreConfig0100 start *************");
        let num = 1;
          try{
            relationalStore.deleteRdbStore(context, STORE_CONFIG_S3, async (err: BusinessError) => {
                if(err){
                    expect(err.code).assertEqual("801");
                    done();
                }else{
                    expect(num).assertEqual(1);
                    done();
                }      
            })
           
          }catch (e) {
            console.error(TAG + `testDeleteRdbStoreConfig0100 failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual("801");
            done();
          }
        console.info(TAG + "************* testDeleteRdbStoreConfig0100 end   *************");
      });

    /**
     * @tc.name   testDeleteRdbStoreConfig0200
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreConfigAPITest_0200
     * @tc.desc   deleteRdbStore callback  
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreConfig0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testDeleteRdbStoreConfig0200 start *************");
        let num = 1;
          try{
            relationalStore.deleteRdbStore(context, STORE_CONFIG_S2, async (err: BusinessError) => {
                if(err){
                    expect(err.code).assertEqual("801");
                    done();
                }else{
                    expect(num).assertEqual(1);
                    done();
                }      
            })
           
          }catch (e) {
            console.error(TAG + `testDeleteRdbStoreConfig0200 failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual("801");
            done();
          }
        console.info(TAG + "************* testDeleteRdbStoreConfig0200 end   *************");
      });

    /**
     * @tc.name   testDeleteRdbStoreConfig0300
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreConfigAPITest_0300
     * @tc.desc   deleteRdbStore callback  
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreConfig0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
        console.info(TAG + "************* testDeleteRdbStoreConfig0200 start *************");
        let num = 1;
          try{
            relationalStore.deleteRdbStore(context, STORE_CONFIG_S4, async (err: BusinessError) => {
                if(err){
                    expect(err.code).assertEqual("801");
                    done();
                }else{
                    expect(num).assertEqual(1);
                    done();
                }      
            })
           
          }catch (e) {
            console.error(TAG + `testDeleteRdbStoreConfig0300 failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual("801");
            done();
          }
        console.info(TAG + "************* testDeleteRdbStoreConfig0300 end   *************");
      });

     /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0300
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0300
     * @tc.desc   Test remoteQuery callback device with null or undefined or ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0300',
     TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0300 start-----")
       let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
       predicates.greaterThan("id", 0);
       let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
       if (store != undefined) {
         try{
           (store as relationalStore.RdbStore).remoteQuery("", "EMPLOYEE", predicates,
             ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
           })
         }catch(err) {
           console.info(TAG + "Remote query error" + err);
           expect(err.code).assertEqual("401");
         }
       }

      if (store != undefined) {
         try{
           (store as relationalStore.RdbStore).remoteQuery(null, "EMPLOYEE", predicates,
             ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
           })
         }catch(err) {
           console.info(TAG + "Remote query error" + err);
           expect(err.code).assertEqual("401");
         }
       }

     if (store != undefined) {
         try{
           (store as relationalStore.RdbStore).remoteQuery(undefined, "EMPLOYEE", predicates,
             ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
           })
         }catch(err) {
           console.info(TAG + "Remote query error" + err);
           expect(err.code).assertEqual("401");
         }     
       }
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0300 end-----")
     })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0400
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0400
     * @tc.desc   Test remoteQuery promise table with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0400',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0100 start-----")
      let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.greaterThan("id", 0);
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      if (store != undefined) {
        try{
          await (store as relationalStore.RdbStore).remoteQuery("12345678", null, predicates,
          ["ID", "NAME", "AGE", "SALARY", "CODES"])
          expect().assertFail();
      }catch(err) {
        console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401");
       }  
      }

      if (store != undefined) {
        try{
          await (store as relationalStore.RdbStore).remoteQuery("12345678", undefined, predicates,
          ["ID", "NAME", "AGE", "SALARY", "CODES"])
          expect().assertFail();
      }catch(err) {
        console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401");
       }  
      }

       if (store != undefined) {
        try{
          await (store as relationalStore.RdbStore).remoteQuery("12345678", "", predicates,
          ["ID", "NAME", "AGE", "SALARY", "CODES"])
          expect().assertFail();
      }catch(err) {
        console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401");
       }  
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0400 end-----")
    })

      /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0500
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0500
     * @tc.desc   Test remoteQuery callback table with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
      it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0100 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery("12345678", "", predicates,
                ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                  expect().assertFail();
              })
          }catch(err) {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual("401");
           } 
        }

        if (store != undefined) {
          try{
          (store as relationalStore.RdbStore).remoteQuery("12345678", null, predicates,
              ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
            })
        }catch(err) {
          console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401");
         }  
        }

         if (store != undefined) {
          try{
          (store as relationalStore.RdbStore).remoteQuery("12345678", undefined, predicates,
              ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
            })
        }catch(err) {
          console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401");
         }  
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0500 end-----")
      })

      /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0600
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0600
     * @tc.desc   Test remoteQuery promise columns with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0600',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0600 start-----")
      let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.greaterThan("id", 0);
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      try{
        if (store != undefined) {
            await (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", predicates,
              undefined);
              expect().assertFail();
          }
      }catch(err) {
        console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual(14800000);
       } 
    
      if (store != undefined) {
        try{
          await (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", predicates,
          null);
          expect().assertFail();
      }catch(err) {
        console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual(14800000);
       }  
      }

       if (store != undefined) {
        try{
          await (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", predicates,
          []);
          expect().assertFail();
      }catch(err) {
        console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual(14800000);
       }  
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0600 end-----")
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0700
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0700
     * @tc.desc   Test remoteQuery callback predicates with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0700',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0700 start-----")
      let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.greaterThan("id", 0);
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      if (store != undefined) {
        try{
          (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", null,
          ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
            expect().assertFail();
         })
      }catch(err) {
        console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401");
       }
      }

       if (store != undefined) {
        try{
          (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", undefined,
          ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
            expect().assertFail();
         })
      }catch(err) {
        console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401");
       }  
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0700 end-----")
    })

     /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0800
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0800
     * @tc.desc   Test remoteQuery callback columns with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0800',
     TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0800 start-----")
       let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
       predicates.greaterThan("id", 0);
       let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
       if (store != undefined) {
         try{
           (store as relationalStore.RdbStore).remoteQuery("12345789", "EMPLOYEE", predicates,
               [], (err) => {
                expect(err.code).assertEqual(14800000);
             })
         }catch(err) {
           console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
           expect(err.code).assertEqual(14800000);
          }
       }

       if (store != undefined) {
         try{
         (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", predicates,
             null, (err) => {
                expect(err.code).assertEqual(14800000);
           })
       }catch(err) {
         console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
         expect(err.code).assertEqual(14800000);
        }  
       }

        if (store != undefined) {
         try{
         (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", predicates,
            undefined, (err) => {
            expect(err.code).assertEqual(14800000);
           })
       }catch(err) {
         console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
         expect(err.code).assertEqual(14800000);
        }  
       }
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0800 end-----")
     })

     /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0900
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0900
     * @tc.desc   Test remoteQuery promise predicates with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0900',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0900 start-----")  
      let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.greaterThan("id", 0);
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      if (store != undefined) {
        try{
          await (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", null,
          ["ID", "NAME", "AGE", "SALARY", "CODES"]);
          expect().assertFail();
      }catch(err) {
        console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401");
       }
      }

       if (store != undefined) {
        try{
         await  (store as relationalStore.RdbStore).remoteQuery("123467890", "EMPLOYEE", undefined,
          ["ID", "NAME", "AGE", "SALARY", "CODES"]);
          expect().assertFail();
      }catch(err) {
        console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401");
       }  
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0900 end-----")
    })

     /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_1000
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_1000
     * @tc.desc   Test remoteQuery promise devices with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_1000',
     TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_1000 start-----")  
       let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
       predicates.greaterThan("id", 0);
       let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
       if (store != undefined) {
         try{
           await (store as relationalStore.RdbStore).remoteQuery(undefined, "EMPLOYEE", predicates,
           ["ID", "NAME", "AGE", "SALARY", "CODES"]);
           expect().assertFail();
       }catch(err) {
         console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
         expect(err.code).assertEqual("401");
        }
       }
        if (store != undefined) {
         try{
          await  (store as relationalStore.RdbStore).remoteQuery("", "EMPLOYEE", predicates,
           ["ID", "NAME", "AGE", "SALARY", "CODES"]);
           expect().assertFail();
       }catch(err) {
         console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
         expect(err.code).assertEqual("401");
        }  
       }
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_1000 end-----")
     })

      /**
     * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_0900
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0900
     * @tc.desc   Test on dataChange is null or undefined return 401 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0900 start-----")
      let storeObserver = (devices: Array<string>) => {
        if (devices != undefined) {
          for (let i = 0; i < devices.length; i++) {
            console.info(TAG + `device= ${devices[i]} data changed`);
          }
        }
      }
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      try {
        if (store != undefined) {
          (store as relationalStore.RdbStore).on(null, relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            storeObserver);
          console.info(TAG + 'on success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401")
      }

      try {
        if (store != undefined) {
          (store as relationalStore.RdbStore).on(undefined, relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            storeObserver);
          console.info(TAG + 'on success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0900 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_1000
   * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_1000
   * @tc.desc   Test on dataChange return 14800014
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_on_ErrTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1000 start-----")
      let storeObserver = (devices: Array<string>) => {
        if (devices != undefined) {
          for (let i = 0; i < devices.length; i++) {
            console.info(TAG + `device= ${devices[i]} data changed`);
          }
        }
      }
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      try {
        if (store != undefined) {
          await store.close();
          (store as relationalStore.RdbStore).on("dataChange", relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            storeObserver);
          console.info(TAG + 'on success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("14800014")
      }

      console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1000 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_1100
   * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_1100
   * @tc.desc   Test on storeObserver with null or undefined or ""
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_on_ErrTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1100 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let storeObserver = () => {
        console.info(TAG + `storeObserver`);
      }
      try {
        if(store != undefined) {
          (store as relationalStore.RdbStore).on('', false, storeObserver);
          console.info(TAG + 'on success.')
        }
      } catch (err) {
        console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401")
      }
      try {
        if(store != undefined) {
          (store as relationalStore.RdbStore).on(undefined, false, storeObserver);
          console.info(TAG + 'on success.')
        }
      } catch (err) {
        console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401")
      }

      try {
        if(store != undefined) {
          (store as relationalStore.RdbStore).on(null, false, storeObserver);
          console.info(TAG + 'on success.')
        }
      } catch (err) {
        console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1100 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_1200
   * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_1200
   * @tc.desc   Test on storeObserver 14800014
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_on_ErrTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1200 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let storeObserver = () => {
        console.info(TAG + `storeObserver`);
      }
      try {
        if(store != undefined) {
          await store.close();
          (store as relationalStore.RdbStore).on('storeObserver', false, storeObserver);
          console.info(TAG + 'on success.')
        }
      } catch (err) {
        console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("14800014")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1200 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_1300
   * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_1300
   * @tc.desc   Test on
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_on_ErrTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1300 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let progressDetail = (progressDetail: relationalStore.ProgressDetails) => {
        console.info(`progress: ${progressDetail}`);
      }
      if(store != undefined) {
        try {
          (store as relationalStore.RdbStore).on(null, progressDetail);
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }
      }

      if(store != undefined) {
        try {
          (store as relationalStore.RdbStore).on(undefined, progressDetail);
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1300 end-----")
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_1500
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_1500
     * @tc.desc   Test on statistics with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1500 start-----")
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let sqlExecutionInfo = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(`sql: ${sqlExecutionInfo.sql[0]}`);
          console.info(`totalTime: ${sqlExecutionInfo.totalTime}`);
          console.info(`waitTime: ${sqlExecutionInfo.waitTime}`);
          console.info(`prepareTime: ${sqlExecutionInfo.prepareTime}`);
          console.info(`executeTime: ${sqlExecutionInfo.executeTime}`);
        }

        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).on(null, sqlExecutionInfo);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }

      try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).on(undefined, sqlExecutionInfo);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1500 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_1600
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_1600
     * @tc.desc   Test on statistics with 14800014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1600 start-----")
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let sqlExecutionInfo = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(`sql: ${sqlExecutionInfo.sql[0]}`);
          console.info(`totalTime: ${sqlExecutionInfo.totalTime}`);
          console.info(`waitTime: ${sqlExecutionInfo.waitTime}`);
          console.info(`prepareTime: ${sqlExecutionInfo.prepareTime}`);
          console.info(`executeTime: ${sqlExecutionInfo.executeTime}`);
        }

        try {
          if (store != undefined) {
            await store.close();
            (store as relationalStore.RdbStore).on('statistics', sqlExecutionInfo);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("14800014")
        }

        try {
          if (store != undefined) {
          
            (store as relationalStore.RdbStore).on("perfStat", sqlExecutionInfo);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("14800014")
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1600 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_1700
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_1700
     * @tc.desc   Test on dataChange SUBSCRIBE_TYPE_LOCAL_DETAILS with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1700 start-----")
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let changeInfos = (changeInfos: Array<relationalStore.ChangeInfo>) => {
          for(let i =0; i< changeInfos.length; i++){
              console.info(`changeInfos: ${JSON.stringify(changeInfos[i])}`);
          }
        }
       try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).on(null, relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, changeInfos);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }

      try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).on(undefined, relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, changeInfos);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1700 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_1800
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_1800
     * @tc.desc   Test on dataChange SUBSCRIBE_TYPE_LOCAL_DETAILS 14800014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1800 start-----")
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let changeInfos = (changeInfos: Array<relationalStore.ChangeInfo>) => {
          for(let i =0; i< changeInfos.length; i++){
              console.info(`changeInfos: ${JSON.stringify(changeInfos[i])}`);
          }
        }
       try {
          if (store != undefined) {
            await store.close();
            (store as relationalStore.RdbStore).on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, changeInfos);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("14800014")
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_1800 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_0900
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0900
     * @tc.desc   Test off dataChange with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0900 start-----")
      let storeObserver = (devices: Array<string>) => {
        if (devices != undefined) {
          for (let i = 0; i < devices.length; i++) {
            console.info(TAG + `device= ${devices[i]} data changed`);
          }
        }
      }
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      try {
        if (store != undefined) {
          (store as relationalStore.RdbStore).off(null, relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            storeObserver);
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401");
      }

      try {
        if (store != undefined) {
          (store as relationalStore.RdbStore).off(undefined, relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            storeObserver);
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0900 end-----")
    })

    /**
   * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_1000
   * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_1000
   * @tc.desc   Test off dataChange with 14800014
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_off_ErrTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1000 start-----")
      let storeObserver = (devices: Array<string>) => {
        if (devices != undefined) {
          for (let i = 0; i < devices.length; i++) {
            console.info(TAG + `device= ${devices[i]} data changed`);
          }
        }
      }
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      try {
        if (store != undefined) {
          await store.close();
          (store as relationalStore.RdbStore).off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            storeObserver);
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("14800014")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1000 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_1100
   * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_1100
   * @tc.desc   Test off storeObserver with null or undefined
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_off_ErrTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1100 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let storeObserver = () => {
        console.info(TAG + `storeObserver`);
      }
      try {
        if (store != undefined) {
          (store as relationalStore.RdbStore).off(null, false, storeObserver);
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401")
      }
      try {
        if (store != undefined) {
          (store as relationalStore.RdbStore).off(undefined, false, storeObserver);
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1100 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_1200
   * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_1200
   * @tc.desc   Test off storeObserver with 14800014
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_off_ErrTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1200 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let storeObserver = () => {
        console.info(TAG + `storeObserver`);
      }
      try {
        if (store != undefined) {
          await store.close();
          (store as relationalStore.RdbStore).off('storeObserver', false, storeObserver);
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("14800014")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1200 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_1300
   * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_1300
   * @tc.desc   Test off autoSyncProgress with null or undefined
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_off_ErrTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1300 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let progressDetail = (progressDetail: relationalStore.ProgressDetails) => {
        console.info(TAG + `progress: ${progressDetail}`);
      }
      try {
        if (store != undefined) {
          (store as relationalStore.RdbStore).off(null, progressDetail);
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401")
      }

     try {
        if (store != undefined) {
          (store as relationalStore.RdbStore).off(undefined, progressDetail);
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1300 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_1400
   * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_1400
   * @tc.desc   Test off autoSyncProgress with 14800014
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_off_ErrTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1400 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let progressDetail = (progressDetail: relationalStore.ProgressDetails) => {
        console.info(TAG + `progress: ${progressDetail}`);
      }
      try {
        if (store != undefined) {
          await store.close();
          (store as relationalStore.RdbStore).off('autoSyncProgress', progressDetail);
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("14800014")
      }

      try {
        if (store != undefined) {
          await store.close();
          (store as relationalStore.RdbStore).on('autoSyncProgress', progressDetail);
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("14800014")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1400 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_1500
   * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_1500
   * @tc.desc   Test off statistics undefined
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_off_ErrTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1500 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      try {
        if (store != undefined) {
          (store as relationalStore.RdbStore).off(undefined);
          expect().assertFail()
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1500 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_1600
   * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_1600
   * @tc.desc   Test off statistics 14800014
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_off_ErrTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1600 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      try {
        if (store != undefined) {
          await store.close();
          (store as relationalStore.RdbStore).off('statistics');
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("14800014")
      }

      try {
        if (store != undefined) {
          await store.close();
          (store as relationalStore.RdbStore).off('perfStat');
          console.info(TAG + 'off success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("14800014")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1600 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_1700
   * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_1700
   * @tc.desc   Test off dataChange SUBSCRIBE_TYPE_LOCAL_DETAILS 14800014
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_off_ErrTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1700 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let changeInfos = (changeInfos: Array<relationalStore.ChangeInfo>) => {
        for(let i =0; i< changeInfos.length; i++){
            console.info(`changeInfos: ${JSON.stringify(changeInfos[i])}`);
        }
      }
     try {
        if (store != undefined) {
          await store.close();
          (store as relationalStore.RdbStore).off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, changeInfos);
          console.info(TAG + 'on success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("14800014")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1700 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_1800
   * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_1800
   * @tc.desc   Test off dataChange SUBSCRIBE_TYPE_LOCAL_DETAILS with null or undefined
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_off_ErrTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1700 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let changeInfos = (changeInfos: Array<relationalStore.ChangeInfo>) => {
        for(let i =0; i< changeInfos.length; i++){
            console.info(`changeInfos: ${JSON.stringify(changeInfos[i])}`);
        }
      }
     try {
        if (store != undefined) {
          (store as relationalStore.RdbStore).off(null, relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, changeInfos);
          console.info(TAG + 'on success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual("401")
      }

     try {
        if (store != undefined) {
          (store as relationalStore.RdbStore).off(undefined, relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, changeInfos);
          console.info(TAG + 'on success.');
        }
      } catch (err) {
        console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
       expect(err.code).assertEqual("401")
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1800 end-----")
    })

     /**
     * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_1900
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_1900
     * @tc.desc   Test on statistics with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_DistributedData_RelationalStore_off_ErrTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1900 start-----")
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let sqlExecutionInfo = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(`sql: ${sqlExecutionInfo.sql[0]}`);
          console.info(`totalTime: ${sqlExecutionInfo.totalTime}`);
          console.info(`waitTime: ${sqlExecutionInfo.waitTime}`);
          console.info(`prepareTime: ${sqlExecutionInfo.prepareTime}`);
          console.info(`executeTime: ${sqlExecutionInfo.executeTime}`);
        }

        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off(null, sqlExecutionInfo);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }

      try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off(undefined, sqlExecutionInfo);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_1900 end-----")
      })

       /**
     * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_2000
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_2000
     * @tc.desc   Test on statistics with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_DistributedData_RelationalStore_off_ErrTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_2000 start-----")
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let exceptionMessages = (exceptionMessages: relationalStore.ExceptionMessage) => {
          console.info(`sql: ${exceptionMessages.code}`);
          console.info(`sql: ${exceptionMessages.message}`);
        }

        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off(null, exceptionMessages);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }

      try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off(undefined, exceptionMessages);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_2000 end-----")
      })

        /**
     * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_2000
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_2000
     * @tc.desc   Test on statistics with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_DistributedData_RelationalStore_on_ErrTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_2000 start-----")
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let exceptionMessages = (exceptionMessages: relationalStore.ExceptionMessage) => {
          console.info(`sql: ${exceptionMessages.code}`);
          console.info(`sql: ${exceptionMessages.message}`);
        }

        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).on(null, exceptionMessages);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }

      try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).on(undefined, exceptionMessages);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_2000 end-----")
      })

     /**
     * @tc.name   SUB_DistributedData_RelationalStore_emit_ErrTest_0300
     * @tc.number SUB_DistributedData_RelationalStore_emit_ErrTest_0300
     * @tc.desc   Test emit with null or undefined or ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_DistributedData_RelationalStore_emit_ErrTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
     async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_emit_ErrTest_0300 start-----")
       let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
       let num = 1;
       if (store != undefined) {
         try {
           (store as relationalStore.RdbStore).emit(undefined);
           expect(num).assertEqual(1)
         } catch (err) {
           console.error(TAG + 'Failed to emit.Code: ' + err.code + ',message:' + err.message);
           expect(err.code).assertEqual("401")
         }

         try {
           (store as relationalStore.RdbStore).emit("");
           expect(num).assertEqual(1)
         } catch (err) {
           console.error(TAG + 'Failed to emit.Code: ' + err.code + ',message:' + err.message);
           expect(err.code).assertEqual("401")
         }
       }
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_emit_ErrTest_0300 end-----")
     })

      /**
     * @tc.name   SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0200
     * @tc.number SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0200
     * @tc.desc   Test queryLockedRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0200',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0200 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
      predicates.equalTo("NAME", "Rose");
      if (store != undefined) {
        try {
          (store as relationalStore.RdbStore).queryLockedRow(undefined, ["ID", "NAME", "AGE", "SALARY", "CODES"]);
          console.info(TAG + 'queryLockedRow success')
        } catch (err) {
          console.error(TAG + 'Failed to queryLockedRow.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401')
        }

      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0200 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0300
   * @tc.number SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0300
   * @tc.desc   Test queryLockedRow
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0300',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    console.info(TAG + "-----SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0300 start-----")
    let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
    let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
    predicates.equalTo("NAME", "Rose");
    if (store != undefined) {
      try {
        (store as relationalStore.RdbStore).queryLockedRow(predicates, null);
        console.info(TAG + 'queryLockedRow success')
      } catch (err) {
        console.error(TAG + 'Failed to queryLockedRow.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual('401')
      }

      try {
        (store as relationalStore.RdbStore).queryLockedRow(predicates, undefined);
        console.info(TAG + 'queryLockedRow success')
      } catch (err) {
        console.error(TAG + 'Failed to queryLockedRow.Code: ' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual('401')
      }

    }
    console.info(TAG + "-----SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0300 end-----")
  })

   /**
   * @tc.name   SUB_DistributedData_RelationalStore_queryLockedRow_0400
   * @tc.number SUB_DistributedData_RelationalStore_queryLockedRow_0400
   * @tc.desc   Test queryLockedRow
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
   it('SUB_DistributedData_RelationalStore_queryLockedRow_0400',
   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_queryLockedRow_0400 start-----")
     let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
     let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
     predicates.equalTo("NAME", "Rose");
     if (store != undefined) {
        store.queryLockedRow(predicates, ["ID", "NAME", "AGE", "SALARY", "CODES"]).then((resultSet: relationalStore.ResultSet) => {
        console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(-1).assertEqual(resultSet.rowCount);
      }).catch((err: BusinessError) => {
        console.error(`Lock failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      })

     }
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_queryLockedRow_0400 end-----")
   })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_insert_ErrTest_0200
     * @tc.number SUB_DistributedData_RelationalStore_insert_ErrTest_0200
     * @tc.desc   Test insert values with null or undefiend
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_insert_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_insert_ErrTest_0200 start-----")
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            expect(typeof(transaction) === "object").assertTrue();
              transaction.insert("EMPLOYEE", undefined, relationalStore.ConflictResolution.ON_CONFLICT_NONE)
              .then((rowId: number) => {
                transaction.rollback();
                expect().assertFail();
              })
              .catch((err: BusinessError) => {
                console.error(TAG + 'Failed to insert.Code: ' + err.code + ',message:' + err.message);
                transaction.rollback();
                expect(err.code).assertEqual("401");
              });
          }).catch((err: BusinessError) => {
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual("401");
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_insert_ErrTest_0200 end-----")
      })

       /**
     * @tc.name   SUB_DistributedData_RelationalStore_insert_ErrTest_0300
     * @tc.number SUB_DistributedData_RelationalStore_insert_ErrTest_0300
     * @tc.desc   Test insert table with null or undefiend
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_insert_ErrTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_insert_ErrTest_0300 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      const u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:relationalStore.ValuesBucket= {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      if (store != undefined) {
        (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
          transaction.insert("", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_FAIL)
            .then((rowId: number) => {
              transaction.rollback();
              expect().assertFail();
            })
            .catch((err: BusinessError) => {
              console.error(TAG + 'Failed to insert.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual(14800000);
            });

            transaction.insert(null, valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ABORT)
            .then((rowId: number) => {
              transaction.rollback();
              expect().assertFail();
            })
            .catch((err: BusinessError) => {
              console.error(TAG + 'Failed to insert.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual(14800000);
            });

            transaction.insert(undefined, valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE)
            .then((rowId: number) => {
              transaction.rollback();
              expect().assertFail();
            })
            .catch((err: BusinessError) => {
              console.error(TAG + 'Failed to insert.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual(14800000);
            });
        }).catch((err: BusinessError) => {
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_insert_ErrTest_0300 end-----")
    })


     /**
     * @tc.name   SUB_DistributedData_RelationalStore_insertSync_ErrTest_0200
     * @tc.number SUB_DistributedData_RelationalStore_insertSync_ErrTest_0200
     * @tc.desc   Test insertSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_DistributedData_RelationalStore_insertSync_ErrTest_0200',
     TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_insertSync_ErrTest_0200 start-----")
       let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
       if (store != undefined) {
         (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
           try {
             let rowId: number = (transaction as relationalStore.Transaction).insertSync("EMPLOYEE", undefined,
               relationalStore.ConflictResolution.ON_CONFLICT_NONE);
             transaction.rollback();
             expect().assertFail();
           } catch (err) {
             console.error(TAG + 'Failed to insertSync.Code: ' + err.code + ',message:' + err.message);
             transaction.rollback();
             expect(err.code).assertEqual('401');
           }
         }).catch((err: BusinessError) => {
           expect(err.code).assertEqual('401')
           console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
         });
       }
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_insertSync_ErrTest_0200 end-----")
     })

    /**
    * @tc.name   SUB_DistributedData_RelationalStore_insertSync_ErrTest_0300
    * @tc.number SUB_DistributedData_RelationalStore_insertSync_ErrTest_0300
    * @tc.desc   Test insertSync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('SUB_DistributedData_RelationalStore_insertSync_ErrTest_0300',
   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_insertSync_ErrTest_0300 start-----")
     let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
     const u8 = new Uint8Array([1, 2, 3]);
     const valueBucket:relationalStore.ValuesBucket= {
       "name": "zhangsan",
       "age": 20,
       "salary": 220.5,
       "blobType": u8,
     };
     if (store != undefined) {
       (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
         try {
           let rowId: number = (transaction as relationalStore.Transaction).insertSync("", valueBucket,
             relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
           transaction.rollback();
           expect().assertFail();
         } catch (err) {
           console.error(TAG + 'Failed to insertSync.Code: ' + err.code + ',message:' + err.message);
           transaction.rollback();
           expect(err.code).assertEqual(14800000);
         }
       }).catch((err: BusinessError) => {
         expect(err.code).assertEqual('401')
         console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
       });
     }
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_insertSync_ErrTest_0300 end-----")
   })

    /**
    * @tc.name   SUB_DistributedData_RelationalStore_insertSync_ErrTest_0400
    * @tc.number SUB_DistributedData_RelationalStore_insertSync_ErrTest_0400
    * @tc.desc   Test insertSync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('SUB_DistributedData_RelationalStore_insertSync_ErrTest_0400',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_insertSync_ErrTest_0400 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      const u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:relationalStore.ValuesBucket= {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      if (store != undefined) {
        (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
          try {
            let rowId: number = (transaction as relationalStore.Transaction).insertSync(null, valueBucket,
              relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
            transaction.rollback();
            expect().assertFail();
          } catch (err) {
            console.error(TAG + 'Failed to insertSync.Code: ' + err.code + ',message:' + err.message);
            transaction.rollback();
            expect(err.code).assertEqual(14800000);
          }
        }).catch((err: BusinessError) => {
          expect(err.code).assertEqual('401')
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        });
      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_insertSync_ErrTest_0400 end-----")
    })

     /**
    * @tc.name   SUB_DistributedData_RelationalStore_insertSync_ErrTest_0500
    * @tc.number SUB_DistributedData_RelationalStore_insertSync_ErrTest_0500
    * @tc.desc   Test insertSync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
     it('SUB_DistributedData_RelationalStore_insertSync_ErrTest_0500',
     TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_insertSync_ErrTest_0500 start-----")
       let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
       const u8 = new Uint8Array([1, 2, 3]);
       const valueBucket:relationalStore.ValuesBucket= {
         "name": "zhangsan",
         "age": 20,
         "salary": 220.5,
         "blobType": u8,
       };
       if (store != undefined) {
         (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
           try {
             let rowId: number = (transaction as relationalStore.Transaction).insertSync(null, valueBucket,
               relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
             transaction.rollback();
             expect().assertFail();
           } catch (err) {
             console.error(TAG + 'Failed to insertSync.Code: ' + err.code + ',message:' + err.message);
             transaction.rollback();
             expect(err.code).assertEqual(14800000);
           }
         }).catch((err: BusinessError) => {
           expect(err.code).assertEqual('401')
           console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
         });
       }
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_insertSync_ErrTest_0500 end-----")
     })
 


   /**
    * @tc.name   SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0200
    * @tc.number SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0200
    * @tc.desc   Test batchInsert
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0200',
     TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0200 start-----")
       let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
       if (store != undefined) {
         (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
           transaction.batchInsert("EMPLOYEE", undefined).then((insertNum: number) => {
             transaction.rollback();
             expect().assertFail();
           }).catch((err: BusinessError) => {
             console.error(TAG + 'Failed to batchInsert.Code: ' + err.code + ',message:' + err.message);
             transaction.rollback();
             expect(err.code).assertEqual('401');
           });
         }).catch((err: BusinessError) => {
           expect(err.code).assertEqual('401');
           console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
         });
       }
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0200 end-----")
     })

   /**
    * @tc.name   SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0300
    * @tc.number SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0300
    * @tc.desc   Test batchInsert
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0300',
   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0300 start-----")
     let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
     const u8 = new Uint8Array([1, 2, 3]);
     const valueBucket:relationalStore.ValuesBucket= {
       "name": "zhangsan",
       "age": 20,
       "salary": 220.5,
       "blobType": u8,
     };
     if (store != undefined) {
       (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
         transaction.batchInsert("", [valueBucket]).then((insertNum: number) => {
           transaction.rollback();
           expect().assertFail();
         }).catch((err: BusinessError) => {
           console.error(TAG + 'Failed to batchInsert.Code: ' + err.code + ',message:' + err.message);
           transaction.rollback();
           expect(err.code).assertEqual(14800000);
         });
       }).catch((err: BusinessError) => {
         expect(err.code).assertEqual('401');
         console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
       });
     }
     await relationalStore.deleteRdbStore(context, STORE_CONFIG);
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0300 end-----")
   })

   /**
    * @tc.name   SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0400
    * @tc.number SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0400
    * @tc.desc   Test batchInsert
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0400',
   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0400 start-----")
     let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
     await store.executeSql(CREATE_TABLE_TEST, null);
     const u8 = new Uint8Array([1, 2, 3]);
     const valueBucket:relationalStore.ValuesBucket= {
       "name": "zhangsan",
       "age": 20,
       "salary": 220.5,
       "blobType": u8,
     };
     if (store != undefined) {
       (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
         transaction.batchInsert(null, [valueBucket]).then((insertNum: number) => {
           transaction.rollback();
           expect().assertFail();
         }).catch((err: BusinessError) => {
           console.error(TAG + 'Failed to batchInsert.Code: ' + err.code + ',message:' + err.message);
           transaction.rollback();
           expect(err.code).assertEqual(14800000);
         });
       }).catch((err: BusinessError) => {
         expect(err.code).assertEqual('401');
         console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
       });
     }
     await relationalStore.deleteRdbStore(context, STORE_CONFIG);
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0400 end-----")
   })

   /**
    * @tc.name   SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0500
    * @tc.number SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0500
    * @tc.desc   Test batchInsert
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0500',
   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0500 start-----")
     let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
     const u8 = new Uint8Array([1, 2, 3]);
     const valueBucket:relationalStore.ValuesBucket= {
       "name": "zhangsan",
       "age": 20,
       "salary": 220.5,
       "blobType": u8,
     };
     if (store != undefined) {
       (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
         transaction.batchInsert(undefined, [valueBucket]).then((insertNum: number) => {
           transaction.rollback();
           expect().assertFail();
         }).catch((err: BusinessError) => {
           console.error(TAG + 'Failed to batchInsert.Code: ' + err.code + ',message:' + err.message);
           transaction.rollback();
           expect(err.code).assertEqual(14800000);
         });
       }).catch((err: BusinessError) => {
         expect(err.code).assertEqual('401');
         console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
       });
     }
     await relationalStore.deleteRdbStore(context, STORE_CONFIG);
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0500 end-----")
   })

   /**
    * @tc.name   SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0200
    * @tc.number SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0200
    * @tc.desc   Test batchInsertSync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0200',
     TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0200 start-----")
       let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
       if (store != undefined) {
         (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
           try {
             let insertNum: number = (transaction as relationalStore.Transaction).batchInsertSync("EMPLOYEE", undefined);
             transaction.rollback();
             expect().assertFail();
           } catch (err) {
             console.error(TAG + 'Failed to batchInsertSync.Code: ' + err.code + ',message:' + err.message);
             transaction.rollback();
             expect(err.code).assertEqual('401');
           }
         }).catch((err: BusinessError) => {
           expect(err.code).assertEqual('401');
           console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
         });
         
       }
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0200 end-----")
     })

   /**
    * @tc.name   SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0300
    * @tc.number SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0300
    * @tc.desc   Test batchInsertSync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0300',
   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0300 start-----")
     let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
     const u8 = new Uint8Array([1, 2, 3]);
     const valueBucket:relationalStore.ValuesBucket= {
       "name": "zhangsan",
       "age": 20,
       "salary": 220.5,
       "blobType": u8,
     };
     if (store != undefined) {
       (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
         try {
           let insertNum: number = (transaction as relationalStore.Transaction).batchInsertSync("", [valueBucket]);
           transaction.rollback();
           expect().assertFail();
         } catch (err) {
           console.error(TAG + 'Failed to batchInsertSync.Code: ' + err.code + ',message:' + err.message);
           transaction.rollback();
           expect(err.code).assertEqual(14800000);
         }      
       }).catch((err: BusinessError) => {
        expect(err.code).assertEqual('401');
         console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
       });
       await relationalStore.deleteRdbStore(context, STORE_CONFIG);
     }
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0300 end-----")
   })

   /**
    * @tc.name   SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0400
    * @tc.number SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0400
    * @tc.desc   Test batchInsertSync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0400',
   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0400 start-----")
     let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
     const u8 = new Uint8Array([1, 2, 3]);
     const valueBucket:relationalStore.ValuesBucket= {
       "name": "zhangsan",
       "age": 20,
       "salary": 220.5,
       "blobType": u8,
     };
     if (store != undefined) {
       (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
         try {
           let insertNum: number = (transaction as relationalStore.Transaction).batchInsertSync(null, [valueBucket]);
           transaction.rollback();
           expect().assertFail();
         } catch (err) {
           console.error(TAG + 'Failed to batchInsertSync.Code: ' + err.code + ',message:' + err.message);
           transaction.rollback();
           expect(err.code).assertEqual("401");
         }      
       }).catch((err: BusinessError) => {
        expect(err.code).assertEqual('401');
         console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
       });
       await relationalStore.deleteRdbStore(context, STORE_CONFIG);
     }
     console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0400 end-----")
   })

     /**
    * @tc.name   SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0500
    * @tc.number SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0500
    * @tc.desc   Test batchInsertSync
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
     it('SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0500',
     TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0500 start-----")
       let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
       const u8 = new Uint8Array([1, 2, 3]);
       const valueBucket:relationalStore.ValuesBucket= {
         "name": "zhangsan",
         "age": 20,
         "salary": 220.5,
         "blobType": u8,
       };
       if (store != undefined) {
         (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
           try {
             let insertNum: number = (transaction as relationalStore.Transaction).batchInsertSync(undefined, [valueBucket]);
             transaction.rollback();
             expect().assertFail();
           } catch (err) {
             console.error(TAG + 'Failed to batchInsertSync.Code: ' + err.code + ',message:' + err.message);
             transaction.rollback();
             expect(err.code).assertEqual("401");
           }      
         }).catch((err: BusinessError) => {
          expect(err.code).assertEqual('401');
           console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
         });
         await relationalStore.deleteRdbStore(context, STORE_CONFIG);
       }
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0500 end-----")
     })


      /**
     * @tc.name   SUB_DistributedData_RelationalStore_update_ErrTest_0200
     * @tc.number SUB_DistributedData_RelationalStore_update_ErrTest_0200
     * @tc.desc   Test update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_update_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_update_ErrTest_0200 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.equalTo("NAME", "Lisa");
      if (store != undefined) {
        (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            transaction.update(undefined, predicates, relationalStore.ConflictResolution.ON_CONFLICT_NONE)
            .then(async (rows: Number) => {
              transaction.rollback();
              expect().assertFail();
            })
            .catch((err: BusinessError) => {
              console.error(TAG + 'Failed to update.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual('401');
            });
        }).catch((err: BusinessError) => {
          expect(err.code).assertEqual('401');
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        });
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_update_ErrTest_0200 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_update_ErrTest_0300
   * @tc.number SUB_DistributedData_RelationalStore_update_ErrTest_0300
   * @tc.desc   Test update
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_update_ErrTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
  async () => {
    console.info(TAG + "-----SUB_DistributedData_RelationalStore_update_ErrTest_0300 start-----")
    let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
    let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
    predicates.equalTo("NAME", "Lisa");
    const u8 = new Uint8Array([1, 2, 3]);
    const valueBucket1:relationalStore.ValuesBucket = {
      "name": "lisi",
      "age": 16,
      "salary": 100.5,
      "blobType": u8,
    };
    if (store != undefined) {
      (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
        transaction.update(valueBucket1, null, relationalStore.ConflictResolution.ON_CONFLICT_ABORT)
          .then(async (rows: Number) => {
            transaction.rollback();
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(TAG + 'Failed to update.Code: ' + err.code + ',message:' + err.message);
            transaction.rollback();
            expect(err.code).assertEqual("401");
          });
      }).catch((err: BusinessError) => {
        expect(err.code).assertEqual('401');
        console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
      });
    }
    await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    console.info(TAG + "-----SUB_DistributedData_RelationalStore_update_ErrTest_0300 end-----")
  })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_update_ErrTest_0400
   * @tc.number SUB_DistributedData_RelationalStore_update_ErrTest_0400
   * @tc.desc   Test update
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_update_ErrTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
  async () => {
    console.info(TAG + "-----SUB_DistributedData_RelationalStore_update_ErrTest_0400 start-----")
    let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
    let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
    predicates.equalTo("NAME", "Lisa");
    const u8 = new Uint8Array([1, 2, 3]);
    const valueBucket1:relationalStore.ValuesBucket = {
      "name": "lisi",
      "age": 16,
      "salary": 100.5,
      "blobType": u8,
    };
    if (store != undefined) {
      (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
        transaction.update(valueBucket1, undefined, relationalStore.ConflictResolution.ON_CONFLICT_ABORT)
          .then(async (rows: Number) => {
            transaction.rollback();
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(TAG + 'Failed to update.Code: ' + err.code + ',message:' + err.message);
            transaction.rollback();
            expect(err.code).assertEqual(14800000);
          });
      }).catch((err: BusinessError) => {
        expect(err.code).assertEqual('401');
        console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
      });
    }
    await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    console.info(TAG + "-----SUB_DistributedData_RelationalStore_update_ErrTest_0400 end-----")
  })


  /**
   * @tc.name   SUB_DistributedData_RelationalStore_updateSync_ErrTest_0300
   * @tc.number SUB_DistributedData_RelationalStore_updateSync_ErrTest_0300
   * @tc.desc   Test updateSync
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_updateSync_ErrTest_0300',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_updateSync_ErrTest_0300 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.equalTo("NAME", "Lisa");
      const u8 = new Uint8Array([1, 2, 3]);
      const valueBucket1:relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      if (store != undefined) {
        (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
          try {
            let rows: Number = (transaction as relationalStore.Transaction).updateSync(valueBucket1, null,
              relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
            transaction.rollback();
            expect().assertFail();
          } catch (err) {
            console.error(TAG + 'Failed to updateSync.Code: ' + err.code + ',message:' + err.message);
            transaction.rollback();
            expect(err.code).assertEqual("401");
          }
        }).catch((err: BusinessError) => {
          expect(err.code).assertEqual('401');
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        });
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_updateSync_ErrTest_0300 end-----")
    })

     /**
   * @tc.name   SUB_DistributedData_RelationalStore_updateSync_ErrTest_0400
   * @tc.number SUB_DistributedData_RelationalStore_updateSync_ErrTest_0400
   * @tc.desc   Test updateSync
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_updateSync_ErrTest_0400',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    console.info(TAG + "-----SUB_DistributedData_RelationalStore_updateSync_ErrTest_0400 start-----")
    let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
    let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
    predicates.equalTo("NAME", "Lisa");
    const u8 = new Uint8Array([1, 2, 3]);
    const valueBucket1:relationalStore.ValuesBucket = {
      "name": "lisi",
      "age": 16,
      "salary": 100.5,
      "blobType": u8,
    };
    if (store != undefined) {
      (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
        try {
          let rows: Number = (transaction as relationalStore.Transaction).updateSync(valueBucket1, undefined,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
          transaction.rollback();
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to updateSync.Code: ' + err.code + ',message:' + err.message);
          transaction.rollback();
          expect(err.code).assertEqual("401");
        }
      }).catch((err: BusinessError) => {
        expect(err.code).assertEqual('401');
        console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
      });
    }
    await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    console.info(TAG + "-----SUB_DistributedData_RelationalStore_updateSync_ErrTest_0400 end-----")
  })



    /**
   * @tc.name   SUB_DistributedData_RelationalStore_updateSync_ErrTest_0200
   * @tc.number SUB_DistributedData_RelationalStore_updateSync_ErrTest_0200
   * @tc.desc   Test updateSync
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_updateSync_ErrTest_0200',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    console.info(TAG + "-----SUB_DistributedData_RelationalStore_updateSync_ErrTest_0200 start-----")
    let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
    let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
    predicates.equalTo("NAME", "Lisa");
    if (store != undefined) {
      (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
        try {
          let rows: Number = (transaction as relationalStore.Transaction).updateSync(undefined, predicates,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          transaction.rollback();
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to updateSync.Code: ' + err.code + ',message:' + err.message);
          transaction.rollback();
          expect(err.code).assertEqual('401');
        }
      }).catch((err: BusinessError) => {
        expect(err.code).assertEqual('401');
        console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
      });
    }
    await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    console.info(TAG + "-----SUB_DistributedData_RelationalStore_updateSync_ErrTest_0200 end-----")
  })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_delete_ErrTest_0200
   * @tc.number SUB_DistributedData_RelationalStore_delete_ErrTest_0200
   * @tc.desc   Test delete
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_delete_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_delete_ErrTest_0200 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      if (store != undefined) {
        (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
          transaction.delete(undefined).then((rows: Number) => {
            transaction.rollback();
            expect().assertFail();
          }).catch((err: BusinessError) => {
            console.error(TAG + 'Failed to delete.Code: ' + err.code + ',message:' + err.message);
            transaction.rollback();
            expect(err.code).assertEqual('401');
          });
        }).catch((err: BusinessError) => {
          expect(err.code).assertEqual('401');
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        });
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_delete_ErrTest_0200 end-----")
    })

  /**
   * @tc.name   SUB_DistributedData_RelationalStore_deleteSync_ErrTest_0200
   * @tc.number SUB_DistributedData_RelationalStore_deleteSync_ErrTest_0200
   * @tc.desc   Test deleteSync
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('SUB_DistributedData_RelationalStore_deleteSync_ErrTest_0200',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_deleteSync_ErrTest_0200 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      if (store != undefined) {
        (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
          try {
            let rows: Number = (transaction as relationalStore.Transaction).deleteSync(undefined);
            transaction.rollback();
            expect().assertFail();
          } catch (err) {
            console.error(TAG + 'Failed to deleteSync.Code: ' + err.code + ',message:' + err.message);
            transaction.rollback();
            expect(err.code).assertEqual('401');
          }
        }).catch((err: BusinessError) => {
          expect(err.code).assertEqual('401');
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        });
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_deleteSync_ErrTest_0100 end-----")
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_lockedRow_ErrTest_0100
     * @tc.number SUB_DistributedData_RelationalStore_lockedRow_ErrTest_0100
     * @tc.desc   Test lckedRow witn null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_lockedRow_ErrTest_0100',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_lockedRow_ErrTest_0100 start-----")
      let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
      predicates.equalTo("NAME", "Rose");
      if (store != undefined) {
        try {
          (store as relationalStore.RdbStore).lockRow(null);
          console.info(TAG + 'lockedRow success')
          expect().assertFail()
        } catch (err) {
          console.error(TAG + 'Failed to lockedRow Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }

        try {
          (store as relationalStore.RdbStore).lockRow(undefined);
          console.info(TAG + 'lockedRow success')
          expect().assertFail()
        } catch (err) {
          console.error(TAG + 'Failed to lockedRow Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);

      }
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_lockedRow_ErrTest_0100 end-----")
    })

     /**
     * @tc.name   SUB_DistributedData_RelationalStore_unlockedRow_ErrTest_0100
     * @tc.number SUB_DistributedData_RelationalStore_unlockedRow_ErrTest_0100
     * @tc.desc   Test unlockedRow witn null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_DistributedData_RelationalStore_unlockedRow_ErrTest_0100',
     TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_unlockedRow_ErrTest_0100 start-----")
       let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
       let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
       predicates.equalTo("NAME", "Rose");
       if (store != undefined) {
         try {
           (store as relationalStore.RdbStore).unlockRow(null);
           console.info(TAG + 'lockedRow success')
           expect().assertFail()
         } catch (err) {
           console.error(TAG + 'Failed to lockedRow Code: ' + err.code + ',message:' + err.message);
           expect(err.code).assertEqual("401")
         }
 
         try {
          (store as relationalStore.RdbStore).unlockRow(undefined);
          console.info(TAG + 'lockedRow success')
          expect().assertFail()
        } catch (err) {
          console.error(TAG + 'Failed to lockedRow Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual("401")
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
       }
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_unlockedRow_ErrTest_0100 end-----")
     })

     /**
     * @tc.name   SUB_DistributedData_RelationalStore_createTransaction_ErrTest_0100
     * @tc.number SUB_DistributedData_RelationalStore_createTransaction_ErrTest_0100
     * @tc.desc   Test createTransaction witn null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_DistributedData_RelationalStore_createTransaction_ErrTest_0100',
     TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_createTransaction_ErrTest_0100 start-----")
       let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
      try {
        store.createTransaction(null).then((transaction: relationalStore.Transaction) => {
          console.info(`createTransaction success`);
          expect(typeof(transaction) === "object").assertTrue();
        }).catch((err: BusinessError) => {
          console.error(`createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401")
      }

      try {
        store.createTransaction(undefined).then((transaction: relationalStore.Transaction) => {
          console.info(`createTransaction success`);
          expect(typeof(transaction) === "object").assertTrue();
        }).catch((err: BusinessError) => {
          console.error(`createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401")
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_createTransaction_ErrTest_0100 end-----")
     })

     /**
     * @tc.name   testReadOnly2100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_2100
     * @tc.desc   executeSync param with "" or null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testReadOnly2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "************* testReadOnly2100 start *************");
        try {
            let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
            expect(store === undefined).assertFalse();
            expect(store.version).assertEqual(0);
          await store.executeSync('PRAGMA user_version', undefined);
          expect().assertFail();
        } catch (err) {
          console.error(TAG, `set user_version failed, errCode:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(14800030);
        }
  
        try {
            let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
            expect(store === undefined).assertFalse();
            expect(store.version).assertEqual(0);   
            await store.executeSync('PRAGMA user_version', null)
            expect().assertFail();
        } catch (err) {
          console.error(TAG, `set user_version failed, errCode:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(14800030);
        }
  
         try {
          let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
          expect(store === undefined).assertFalse();
          expect(store.version).assertEqual(0);
          await store.executeSync('PRAGMA user_version', [])
          expect().assertFail();
        } catch (err) {
          console.error(TAG, `set user_version failed, errCode:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(14800030);
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG2);
        console.info(TAG + "************* testReadOnly2100 end *************");
      })
  
      /**
       * @tc.name   testReadOnly2200
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_2200
       * @tc.desc   executeSync
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testReadOnly2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "************* testReadOnly2200 start *************");
        try {
          let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
          expect(store === undefined).assertFalse();
          expect(store.version).assertEqual(0);
          let pr = await store.executeSync('PRAGMA user_version');
          expect(pr).assertEqual(0);
        } catch (err) {
          console.error(TAG, `set user_version failed, errCode:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual("14800014");
        }

        try {
          let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
          expect(store === undefined).assertFalse();
          expect(store.version).assertEqual(0);
          await store.close();
         await store.executeSync('PRAGMA user_version');
          expect().assertFail();
        } catch (err) {
          console.error(TAG, `set user_version failed, errCode:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual("14800014");
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        console.info(TAG + "************* testReadOnly2200 end *************");
      })

      /**
     * @tc.name   ExcuteSqlErrorTest0100
     * @tc.number ExcuteSqlErrorTest0100
     * @tc.desc   1. Insert data and set sql as null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExcuteSqlErrorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () =>  {
        console.info(TAG + "************* ExcuteSqlErrorTest0100 start *************");
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          await rdbStore.executeSql(null);
          expect(null).assertFail();
        } catch (err) {
          expect('401').assertEqual(err.code);
          console.error(`insert data failed, code:${err.code}, message: ${err.message}`);
        }
  
        try {
          await rdbStore.executeSql(undefined);
          expect(null).assertFail();
        } catch (err) {
          expect('401').assertEqual(err.code);
          console.error(`insert data failed, code:${err.code}, message: ${err.message}`);
        }
  
        try {
          await rdbStore.executeSql("");
          expect(null).assertFail();
        } catch (err) {
          expect('401').assertEqual(err.code);
          console.error(`insert data failed, code:${err.code}, message: ${err.message}`);
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        console.info(TAG + "************* ExcuteSqlErrorTest0100 end   *************");
      })

    /**
     * @tc.name   ExcuteSqlErrorTest0200
     * @tc.number ExcuteSqlErrorTest0200
     * @tc.desc   1. Insert data and set sql as null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExcuteSqlErrorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "************* ExcuteSqlErrorTest0200 start *************");
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          await rdbStore.executeSql("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)", null);
          expect(null).assertFail();
        } catch (err) {
            expect(14800000).assertEqual(err.code);
          console.error(`insert data failed, code:${err.code}, message: ${err.message}`);
        }
  
        try {
          await rdbStore.executeSql("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)", undefined);
          expect(null).assertFail();
        } catch (err) {
            expect(14800000).assertEqual(err.code);
          console.error(`insert data failed, code:${err.code}, message: ${err.message}`);
        }
  
        try {
          await rdbStore.executeSql("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)", []);
          expect(null).assertFail();
        } catch (err) {
            expect(14800000).assertEqual(err.code);
          console.error(`insert data failed, code:${err.code}, message: ${err.message}`);
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        console.info(TAG + "************* ExcuteSqlErrorTest0200 end   *************");
      })

    /**
     * @tc.name   testExecuteError0100
     * @tc.number testExecuteError0100
     * @tc.desc   execute sql with "" or null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExecuteError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "************* testExecuteError0100 start *************");
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let txId = 1;
       try{
            await rdbStore.execute("", txId, ['tt', 28, 50000])
            console.info(TAG + `testExecuteError0100 execute is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `testExecuteError0100 execute is failed, code is ${err.code},message is ${err.message}`);
            expect("401").assertEqual(err.code);
          }
          try{
            await rdbStore.execute(null, txId, ['tt', 28, 50000])
            console.info(TAG + `testExecuteError0100 execute is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `testExecuteError0100 execute is failed, code is ${err.code},message is ${err.message}`);
            expect("401").assertEqual(err.code);
          }
          try{
            await rdbStore.execute(undefined, txId, ['tt', 28, 50000])
            console.info(TAG + `testExecuteError0100 execute is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `testExecuteError0100 execute is failed, code is ${err.code},message is ${err.message}`);
            expect("401").assertEqual(err.code);
          }
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        console.info(TAG + "************* testExecuteError0100 end   *************");
    })

     /**
     * @tc.name   testExecuteError0200
     * @tc.number testExecuteError0200
     * @tc.desc   execute err.code 14800000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExecuteError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "************* testExecuteError0200 start *************");
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let txId = 1;
       try{
            await rdbStore.execute("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)", txId, [])
            console.info(TAG + `testExecuteError0200 execute is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `testExecuteError0200 execute is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800000);
          }

          try{
            let pr = await rdbStore.execute("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)", txId, ['tt', 28, 50000])
            console.info(TAG + `testExecuteError0100 execute is successful`);
            expect(pr).assertEqual(1);
          }catch(err){
            console.error(TAG + `testExecuteError0100 execute is failed, code is ${err.code},message is ${err.message}`);
            expect("401").assertEqual(err.code);
          }
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        console.info(TAG + "************* testExecuteError0200 end   *************");
    })

     /**
     * @tc.name   RdbBackupRestoreErrorTest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreErrorEtsAPITest_0100
     * @tc.desc   RelationalStore restore function test with "" or undefined or null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it('RdbBackupRestoreErrorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        console.info(TAG + "************* RdbBackupRestoreErrorTest0100 start *************")
        let RdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        await RdbStore.backup(DATABASE_BACKUP_NAME).then(() => {
          console.info(TAG + `Backup success.`);
          try{
            RdbStore.restore("",  (err: BusinessError) => {
            if (err) {
              console.error(TAG + `Restore failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual("401")
            }
          })
          }catch(err){
             console.error(TAG + `Backup failed, code is ${err.code},message is ${err.message}`);
             expect(err.code).assertEqual("401")
          }
        })
  
        await RdbStore.backup(DATABASE_BACKUP_NAME).then(() => {
          console.info(TAG + `Backup success.`);
          try{
            RdbStore.restore(undefined, (err: BusinessError) => {
            if (err) {
              console.error(TAG + `Restore failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual("401")
            }
          })
          }catch(err){
             console.error(TAG + `Backup failed, code is ${err.code},message is ${err.message}`);
             expect(err.code).assertEqual("401")
          }
        })
  
        await RdbStore.backup(DATABASE_BACKUP_NAME).then(() => {
          console.info(TAG + `Backup success.`);
          try{
            RdbStore.restore(null, (err: BusinessError) => {
            if (err) {
              console.error(TAG + `Restore failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual("401")
            }
          })
          }catch(err){
             console.error(TAG + `Backup failed, code is ${err.code},message is ${err.message}`);
             expect(err.code).assertEqual("401")
          }
        })
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        console.info(TAG + "************* RdbBackupRestoreErrorTest0100 end *************")
      })
  
       /**
       * @tc.name   RdbBackupRestoreErrorTest0200
       * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreErrorEtsAPITest_0200
       * @tc.desc   RelationalStore restore function test 14800014
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('RdbBackupRestoreErrorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        console.info(TAG + "************* RdbBackupRestoreErrorTest0200 start *************")
        let RdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        await RdbStore.backup(DATABASE_BACKUP_NAME).then(() => {
          console.info(TAG + `Backup success.`);
          RdbStore.close();
          RdbStore.restore(DATABASE_BACKUP_NAME, (err: BusinessError) => {
            expect(!err).assertFail()
          })
        }).catch((err: BusinessError) => {
          console.error(TAG + `Backup failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual("14800014");
        });
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        console.info(TAG + "************* RdbBackupRestoreErrorTest0200 end *************")
      })
  
      
      /**
       * @tc.name   RdbBackupRestoreErrorTest0300
       * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreErrorEtsAPITest_0300
       * @tc.desc   RelationalStore restore promise 14800014
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('RdbBackupRestoreErrorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        console.info(TAG + "************* RdbBackupRestoreErrorTest0300 start *************")
        let RdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          await RdbStore.backup(DATABASE_BACKUP_NAME)
          await RdbStore.close();
          await RdbStore.restore(DATABASE_BACKUP_NAME)
          expect().assertFail()
        } catch(err) {
          console.info(TAG + "error RdbBackupRestoreErrorTest0300" + JSON.stringify(err))
          expect(err.code).assertEqual("14800014")
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        console.info(TAG + "************* RdbBackupRestoreErrorTest0300 end *************")
      })
  
       /**
       * @tc.name   RdbBackupRestoreErrorTest0400
       * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreErrorEtsAPITest_0400
       * @tc.desc   RelationalStore restore promise with "" or null or undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('RdbBackupRestoreErrorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        console.info(TAG + "************* RdbBackupRestoreErrorTest0400 start *************")
        let RdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          await RdbStore.backup(DATABASE_BACKUP_NAME)
          await RdbStore.restore("")
          expect().assertFail();
        } catch(err) {
          console.info(TAG + "error RdbBackupRestoreErrorTest0400" + JSON.stringify(err))
          expect(err.code).assertEqual("401")
        }
  
           try {
          await RdbStore.backup(DATABASE_BACKUP_NAME)
          await RdbStore.restore(undefined);
          expect().assertFail();
        } catch(err) {
          console.info(TAG + "error RdbBackupRestoreErrorTest0400" + JSON.stringify(err))
          expect(err.code).assertEqual("401")
        }
  
        try {
          await RdbStore.backup(DATABASE_BACKUP_NAME)
          await RdbStore.restore(null)
          expect().assertFail();
        } catch(err) {
          console.info(TAG + "error RdbBackupRestoreErrorTest0400" + JSON.stringify(err))
          expect(err.code).assertEqual("401")

        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        console.info(TAG + "************* RdbBackupRestoreErrorTest0400 end *************")
      })

      
     /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionErrcode0800
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionErrcode0800
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionErrcode0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('testRdbStoreBatchInsertWithConflictResolutionErrcode0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0800 start *************");
        try {
          await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", null,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
            expect().assertFail();
            done();
            done();
        } catch (err) {
          console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
          expect(err.code).assertEqual("401")
          done();
        }
  
        try {
          await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", undefined,
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
            expect().assertFail();
            done();
          done();
        } catch (err) {
          console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
          expect(err.code).assertEqual("401")
          done();
        }
        try {
          await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("test", [],
            relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
          expect().assertFail();
          done();
        } catch (err) {
          console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
          expect(err.code).assertEqual("401")
          done();
        }
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0800 end *************");
      })
  
      /**
       * @tc.name   testRdbStoreBatchInsertWithConflictResolutionErrcode0900
       * @tc.number testRdbStoreBatchInsertWithConflictResolutionErrcode0900
       * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionErrcode0900
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testRdbStoreBatchInsertWithConflictResolutionErrcode0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0900 start *************");
        let u8 = new Uint8Array([1, 2, 3])
          const valueBucket:relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          try{
            await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution("", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
            expect(null).assertFail()
            done();
         } catch (err) {
            console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
            expect(err.code).assertEqual("401")
            done();
         }
          try{
            await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution(null, valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_NONE);
            expect(null).assertFail()
            done();
         } catch (err) {
            console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
            expect(err.code).assertEqual("401")
            done();
         }
         try{
          await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolution(undefined, valueBucketArray,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect(null).assertFail()
          done();
       } catch (err) {
          console.log(TAG + err +"batchInsertWithConflictResolution failed" + err.code);
          expect(err.code).assertEqual("401")
          done();
       }
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0900 end *************");
        })
  
  
        /**
       * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0800
       * @tc.number testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0800
       * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0800
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0800 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket:relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray:relationalStore.ValuesBucket[] = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        try{
          await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("", valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
          expect(null).assertFail()
          done();
        } catch (err) {
          console.log(TAG + err +"batchInsertWithConflictResolutionSync failed" + err.code);
          expect(err.code).assertEqual("401")
          done();
        }
        try{
          await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync(null, valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
          expect(null).assertFail()
          done();
        } catch (err) {
          console.log(TAG + err +"batchInsertWithConflictResolutionSync failed" + err.code);
          expect(err.code).assertEqual("401")
          done();
        }
        try{
          await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync(undefined, valueBucketArray,
            relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
          expect(null).assertFail()
          done();
        } catch (err) {
          console.log(TAG + err +"batchInsertWithConflictResolutionSync failed" + err.code);
          expect(err.code).assertEqual("401")
          done();
        }
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0800 end *************");
      })
  
      /**
       * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0900
       * @tc.number testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0900
       * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0900
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0900 start *************");
        try{
          await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", null,
            relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
          expect(null).assertFail()
          done();
        } catch (err) {
          console.log(TAG + err +"batchInsertWithConflictResolutionSync failed" + err.code);
          expect(err.code).assertEqual("401")
          done();
        }
        try{
          await (rdbStore as relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test", undefined,
            relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
          expect(null).assertFail()
          done();
        } catch (err) {
          console.log(TAG + err +"batchInsertWithConflictResolutionSync failed" + err.code);
          expect(err.code).assertEqual("401")
          done();
        }
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0900 end *************");
      })

       /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_1100
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_1100
     * @tc.desc   Test remoteQuery 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_1100 start-----")  
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            let res = await (store as relationalStore.RdbStore).remoteQuery("1234567", "EMPLOYEE", predicates,
            ["ID", "NAME", "AGE", "SALARY", "CODES"]);
            expect(typeof(res) === "object").assertTrue();
        }catch(err) {
          console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(14800000);
         }
        }
         if (store != undefined) {
          try{
           (store as relationalStore.RdbStore).remoteQuery("1234567", "EMPLOYEE", predicates,
            ["ID", "NAME", "AGE", "SALARY", "CODES"], (err, res)=>{
              if(err){
                expect(err.code).assertEqual(14800000);
              }else{
                expect(typeof(res) === "object").assertTrue();
              }
     
            });
        }catch(err) {
          console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(14800000);
         }  
        }
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_1100 end-----")
      })

       /**
     * @tc.name   testExecuteError0300
     * @tc.number testExecuteError0300
     * @tc.desc   execute err.code 14800000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
   it('testExecuteError0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    console.info(TAG + "************* testExecuteError0200 start *************");
    let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
   try{
        await rdbStore.execute("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)",  [])
        console.info(TAG + `testExecuteError0200 execute is successful`);
        expect().assertFail();
      }catch(err){
        console.error(TAG + `testExecuteError0200 execute is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800000);
      }

      try{
        let pr = await rdbStore.execute("INSERT INTO test (name, age, salary) VALUES (?, ?, ?)", ['tt', 28, 50000])
        console.info(TAG + `testExecuteError0100 execute is successful`);
        expect(pr).assertEqual(1);
      }catch(err){
        console.error(TAG + `testExecuteError0100 execute is failed, code is ${err.code},message is ${err.message}`);
        expect("401").assertEqual(err.code);
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    console.info(TAG + "************* testExecuteError0300 end   *************");
})

    /**
     * @tc.name   testRekeyParam0100
     * @tc.number testRekeyParam0100
     * @tc.desc   Test rekey 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekeyParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
          console.log(TAG + "************* testRekeyParam0100 start *************");
          let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
          try {
            await rdbStore.rekey(cryptoParam1);
            expect().assertFail();
            done();
          } catch (err) {
            console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
            expect(err.code).assertEqual(801);
            done();
          }
          try {
            await rdbStore.rekey(cryptoParam2);
            expect().assertFail();
            done();
          } catch (err) {
            console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
            expect(err.code).assertEqual(801);
            done();
          }
          try {
            await rdbStore.rekey(cryptoParam3);
            expect().assertFail();
            done();
          } catch (err) {
            console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
            expect(err.code).assertEqual(801);
            done();
          }
          await relationalStore.deleteRdbStore(context, STORE_CONFIG);
          console.log(TAG + "************* testRekeyParam0100 end *************");
      });

      
    /**
     * @tc.name   testRekeyExParam0100
     * @tc.number testRekeyExParam0100
     * @tc.desc   Test rekey 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekeyExParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekeyExParam0100 start *************");
      let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      try {
        await rdbStore.rekeyEx(cryptoParam1);
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual(801);
        done();
      }
      try {
        await rdbStore.rekeyEx(cryptoParam2);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual(801);
        done();
      }
      try {
        await rdbStore.rekeyEx(cryptoParam3);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual(801);
        done();
      }
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      console.log(TAG + "************* testRekeyExParam0100 end *************");
  });

  

  
    
    });
  }
  