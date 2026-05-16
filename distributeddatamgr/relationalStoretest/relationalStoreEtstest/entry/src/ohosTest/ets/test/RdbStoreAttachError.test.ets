/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import data_relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "[RdbStoreAttachErrorTest]  ";
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
"name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
"name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

let dataBaseDir : String;

const STORE_CONFIG: data_relationalStore.StoreConfig = {
    name: "rdbstore.db",
    securityLevel: data_relationalStore.SecurityLevel.S1,
}

let cryptoParam1: data_relationalStore.CryptoParam = {
    encryptionKey: new Uint8Array([10, 20, 30]),
    encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
    hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
    kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
}

const STORE_CONFIG_S2: data_relationalStore.StoreConfig = {
    name: "rdbstore4.db",
    encrypt: true,
    securityLevel: data_relationalStore.SecurityLevel.S2,
    rootDir: "",
    autoCleanDirtyData: true,
    allowRebuild: true,
    vector: true,
    isReadOnly: true,
    pluginLibs: ['rdbstore4.db'],
    cryptoParam: cryptoParam1,
    tokenizer: data_relationalStore.Tokenizer.CUSTOM_TOKENIZER,
    persist: true,
    enableSemanticIndex: true
}

let cryptoParam2: data_relationalStore.CryptoParam = {
    encryptionKey: new Uint8Array([10, 20, 30]),
    encryptionAlgo: data_relationalStore.EncryptionAlgo.PLAIN_TEXT,
    hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
    kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
}
const STORE_CONFIG_S3: data_relationalStore.StoreConfig = {
    name: "rdbstore5",
    encrypt: false,
    securityLevel: data_relationalStore.SecurityLevel.S3,
    rootDir: "",
    autoCleanDirtyData: false,
    allowRebuild: false,
    vector: false,
    isReadOnly: false,
    pluginLibs: undefined,
    cryptoParam: cryptoParam2,
    tokenizer: data_relationalStore.Tokenizer.ICU_TOKENIZER,
    persist: false,
    enableSemanticIndex: false
       
};


let cryptoParam3: data_relationalStore.CryptoParam = {
    encryptionKey: new Uint8Array([10, 20, 30]),
     encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
     hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
     kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
   }
const STORE_CONFIG_S4: data_relationalStore.StoreConfig = {
    name: "rdbstore6",
    encrypt: false,
    securityLevel: data_relationalStore.SecurityLevel.S4,
    rootDir: "",
    autoCleanDirtyData: false,
    allowRebuild: false,
    vector: false,
    isReadOnly: false,
    pluginLibs: [],
    cryptoParam: cryptoParam3,
    tokenizer: data_relationalStore.Tokenizer.NONE_TOKENIZER,      
};

export default function rdbStoreAttachErrorTest() {
    describe('rdbStoreAttachErrorTest', () => {
        beforeAll(async () => {
            console.info(TAG + 'beforeAll');
        })
        
        beforeEach(async () =>{
            console.info(TAG + 'beforeEach');
            try{
                let attachStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
                console.info(TAG + 'beforeEach context databasedir: ' + context.databaseDir);
                dataBaseDir = context.databaseDir + "/rdb/";
                console.info(TAG + 'beforeEach STORE_CONFIG success');
                await attachStore.executeSql(CREATE_TABLE_TEST1);
            }catch{
                console.info(TAG + 'beforeEach STORE_CONFIG error:');
            }

        })
        
        afterEach(async () => {
            console.info(TAG + 'afterEach');
            await data_relationalStore.deleteRdbStore(context, "rdbstore.db");
            console.info(TAG + 'afterEach success');
        })
        
        afterAll(async () => {
            console.info(TAG + 'afterAll');
        })

        /**
         * @tc.name   testRdbStoreAttach0030
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_3000
         * @tc.desc   non encrypted database attach waitTime with null or undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0030 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
            try {
                let number = await store.attach(dataBaseDir + "rdbstore1.db", "attachDB", null);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0030 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(e.code).assertEqual("401");
            }

            try {
                let number = await store.attach(dataBaseDir + "rdbstore1.db", "attachDB", undefined);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0030 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(e.code).assertEqual("401");
            }
            console.log(TAG + "************* testRdbStoreAttach0030 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttach0031
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_3100
         * @tc.desc   attach fullpath with null or undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0031 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
            try {
                let number = await store.attach(null, "attachDB", 1);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0031 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(e.code).assertEqual("401");
            }

            try {
                let number = await store.attach(undefined, "attachDB", 1);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0031 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(e.code).assertEqual("401");
            }

            try {
                let number = await store.attach("", "attachDB", 1);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0031 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(e.code).assertEqual("401");
            }
            console.log(TAG + "************* testRdbStoreAttach0031 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttach0032
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_3200
         * @tc.desc   attach attachName with null or undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0032 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
            try {
                let number = await store.attach(dataBaseDir + "rdbstore1.db", "", 1);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0032 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(e.code).assertEqual("401");
            }

            try {
                let number = await store.attach(dataBaseDir + "rdbstore1.db", null, 1);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0032 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(e.code).assertEqual("401");
            }

             try {
                let number = await store.attach(dataBaseDir + "rdbstore1.db", undefined, 1);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0032 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(e.code).assertEqual("401");
            }
            console.log(TAG + "************* testRdbStoreAttach0032 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttach0033
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_3300
         * @tc.desc   attach attachName with null or undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0032 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
            try {
                let number = await store.attach(dataBaseDir + "rdbstore1.db", "", 1);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0033 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(e.code).assertEqual("401");
            }

            try {
                let number = await store.attach(dataBaseDir + "rdbstore1.db", null, 1);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0033 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(e.code).assertEqual("401");
            }

             try {
                let number = await store.attach(dataBaseDir + "rdbstore1.db", undefined, 1);
                expect(1).assertEqual(number);
            } catch(e) {
                console.log("testRdbStoreAttach0033 err: failed, err: code=" + e.code + " message=" + e.message);
                expect(e.code).assertEqual("401");
            }
            console.log(TAG + "************* testRdbStoreAttach0033 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttach0034
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachErrorAPITest_0100
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0034 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
            try{
                let number = await store.attach(context, STORE_CONFIG_S2, "attachDB", 1);
                expect(1).assertEqual(number);
            }catch(e) {
                if(e.code === "801"){
                    console.log("testRdbStoreAttach0034 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual("801");
                }else{
                    console.log("testRdbStoreAttach0034 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual(14800010);
                }
            
            }
            await data_relationalStore.deleteRdbStore(context, STORE_CONFIG_S2);
            
            console.log(TAG + "************* testRdbStoreAttach0034 end *************");
              
        })

        /**
         * @tc.name   testRdbStoreAttach0035
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachErrorAPITest_0200 
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0035 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
            try{
            let number = await store.attach(context, STORE_CONFIG_S3, "attachDB", 1);
            expect(1).assertEqual(number);
            }catch(e) {
                if(e.code === "801"){
                    console.log("testRdbStoreAttach0035 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual("801");
                }else{
                    console.log("testRdbStoreAttach0035 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual(14800010);
                }
            }
            await data_relationalStore.deleteRdbStore(context, STORE_CONFIG_S3);
        
            console.log(TAG + "************* testRdbStoreAttach0035 end *************");
              
        })

        /**
         * @tc.name   testRdbStoreAttach0036
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachErrorAPITest_0300
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0036 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
            try{
            let number = await store.attach(context, STORE_CONFIG_S4, "attachDB", 1);
            expect(1).assertEqual(number);
            }catch(e) {
                if(e.code === "801"){
                    console.log("testRdbStoreAttach0036 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual("801");
                }else{
                    console.log("testRdbStoreAttach0036 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual(14800010);
                }
            }
            await data_relationalStore.deleteRdbStore(context, STORE_CONFIG_S4);

            console.log(TAG + "************* testRdbStoreAttach0036 end *************");
                  
        })

        /**
         * @tc.name   testRdbStoreAttach0037
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachErrorAPITest_0400
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0037 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
            try{
            let number = await store.attach(context, null, "attachDB", 1);
            expect(1).assertEqual(number);
            }catch(e) {
                if(e.code === "801"){
                    console.log("testRdbStoreAttach0037 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual("801");
                }else{
                    console.log("testRdbStoreAttach0037 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual("401");
                }
            }

            try{
                let number = await store.attach(context, undefined, "attachDB", 1);
                expect(1).assertEqual(number);
                }catch(e) {
                    if(e.code === "801"){
                        console.log("testRdbStoreAttach0037 err: failed, err: code=" + e.code + " message=" + e.message);
                        expect(e.code).assertEqual("801");
                    }else{
                        console.log("testRdbStoreAttach0037 err: failed, err: code=" + e.code + " message=" + e.message);
                        expect(e.code).assertEqual("401");
                    }
                }
            await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);

            console.log(TAG + "************* testRdbStoreAttach0037 end *************");
                  
        })

        /**
         * @tc.name   testRdbStoreAttach0038
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachErrorAPITest_0500
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttach0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0038 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
            try{
            let number = await store.attach(context, STORE_CONFIG, "attachDB", undefined);
            expect(1).assertEqual(number);
            }catch(e) {
                if(e.code === "801"){
                    console.log("testRdbStoreAttach0038 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual("801");
                }else{
                    console.log("testRdbStoreAttach0038 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual("401");
                }
            }

            try{
                let number = await store.attach(context, STORE_CONFIG, "attachDB", null);
                expect(1).assertEqual(number);
                }catch(e) {
                    if(e.code === "801"){
                        console.log("testRdbStoreAttach0038 err: failed, err: code=" + e.code + " message=" + e.message);
                        expect(e.code).assertEqual("801");
                    }else{
                        console.log("testRdbStoreAttach0038 err: failed, err: code=" + e.code + " message=" + e.message);
                        expect(e.code).assertEqual("401");
                    }
                }
            await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);

            console.log(TAG + "************* testRdbStoreAttach0038 end *************");
                  
        })

          /**
         * @tc.name   testRdbStoreAttach0039
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachErrorAPITest_0600
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
          it('testRdbStoreAttach0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0039 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
            try{
            let number = await store.attach(null, STORE_CONFIG, "attachDB", 1);
            expect(1).assertEqual(number);
            }catch(e) {
                if(e.code === "801"){
                    console.log("testRdbStoreAttach0039 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual("801");
                }else{
                    console.log("testRdbStoreAttach0039 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual("401");
                }
            }

            try{
                let number = await store.attach(undefined, STORE_CONFIG, "attachDB", 1);
                expect(1).assertEqual(number);
                }catch(e) {
                    if(e.code === "801"){
                        console.log("testRdbStoreAttach0039 err: failed, err: code=" + e.code + " message=" + e.message);
                        expect(e.code).assertEqual("801");
                    }else{
                        console.log("testRdbStoreAttach0039 err: failed, err: code=" + e.code + " message=" + e.message);
                        expect(e.code).assertEqual("401");
                    }
                }
            await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);

            console.log(TAG + "************* testRdbStoreAttach0039 end *************");
                  
        })

         /**
         * @tc.name   testRdbStoreAttach0040
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachErrorAPITest_0700
         * @tc.desc   non encrypted database attach non encrypted database
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('testRdbStoreAttach0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0040 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
            try{
            let number = await store.attach(context, STORE_CONFIG, "", 1);
            expect(1).assertEqual(number);
            }catch(e) {
                if(e.code === "801"){
                    console.log("testRdbStoreAttach0040 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual("801");
                }else{
                    console.log("testRdbStoreAttach0040 err: failed, err: code=" + e.code + " message=" + e.message);
                    expect(e.code).assertEqual("401");
                }
            }

            try{
                let number = await store.attach(context, STORE_CONFIG, null, 1);
                expect(1).assertEqual(number);
                }catch(e) {
                    if(e.code === "801"){
                        console.log("testRdbStoreAttach0040 err: failed, err: code=" + e.code + " message=" + e.message);
                        expect(e.code).assertEqual("801");
                    }else{
                        console.log("testRdbStoreAttach0040 err: failed, err: code=" + e.code + " message=" + e.message);
                        expect(e.code).assertEqual("401");
                    }
                }

                
            try{
                let number = await store.attach(context, STORE_CONFIG, undefined, 1);
                expect(1).assertEqual(number);
                }catch(e) {
                    if(e.code === "801"){
                        console.log("testRdbStoreAttach0040 err: failed, err: code=" + e.code + " message=" + e.message);
                        expect(e.code).assertEqual("801");
                    }else{
                        console.log("testRdbStoreAttach0040 err: failed, err: code=" + e.code + " message=" + e.message);
                        expect(e.code).assertEqual("401");
                    }
                }
            await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);

            console.log(TAG + "************* testRdbStoreAttach0040 end *************");
                  
        })


        /**
         * @tc.name   testRdbStoreDetach0001
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_DetachErrorAPITest_0100
         * @tc.desc   detach attachName with null or undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreDetach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreAttach0032 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
             try {
                await store.detach("", 1)
                console.info(TAG + "testRdbStoreDetach0001 success " );
                expect().assertFail();
            } catch (err) {
                console.error(TAG + "testRdbStoreDetach0001 failed err.code:" + err.code );
                expect(err.code).assertEqual("401");
            }

            try {
                 await store.detach(null, 1)
                expect().assertFail();
            } catch (err) {
                console.error(TAG + "testRdbStoreDetach0001 failed err.code:" + err.code );
                expect(err.code).assertEqual("401");
            }

            try {
                await store.detach(undefined, 1)
                expect().assertFail();
            } catch (err) {
                console.error(TAG + "testRdbStoreDetach0001 failed err.code:" + err.code );
                expect(err.code).assertEqual("401");
            }
            console.log(TAG + "************* testRdbStoreDetach0001 end *************");
        })

         /**
         * @tc.name   testRdbStoreDetach0002
         * @tc.number SUB_Distributed_Data_RelationalStore_SDK_DetachErrorAPITest_0200
         * @tc.desc   detach waitTime with null or undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreDetach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            console.log(TAG + "************* testRdbStoreDetach0002 start *************");
            let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await store.executeSql(CREATE_TABLE_TEST);
           
             try {
               let num =  await store.detach("attachDB", null)
               console.log(TAG + "testRdbStoreDetach0002 success: " + num );
               expect().assertFail();
                
            } catch (err) {
                console.error(TAG + "testRdbStoreDetach0002 failed err.code:" + err.code );
                expect(err.code).assertEqual("401");
            }

            try {
                let num =  await store.detach("attachDB", undefined)
                expect().assertFail();

            } catch (err) {
                console.log(TAG + "err.code:" + err.code );
                expect(err.code).assertEqual("401");
            }
            console.log(TAG + "************* testRdbStoreDetach0002 end *************");
        })

    })
}

