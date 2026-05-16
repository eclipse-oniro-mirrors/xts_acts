/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium";
import relationalStore from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import hilog from '@ohos.hilog'

let context: common.UIAbilityContext | undefined;

let domain: int  = 0x0000;
let tag: string = "testTag";

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
"name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
"name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

let dataBaseDir: String;

const STORE_CONFIG: relationalStore.StoreConfig = {
    name: "rdbstore.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1: relationalStore.StoreConfig = {
    name: "rdbstore1.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG2: relationalStore.StoreConfig = {
    name: "rdbstore2.db",
    encrypt: true,
    securityLevel: relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG3: relationalStore.StoreConfig = {
    name: "rdbstore3.db",
    encrypt: true,
    securityLevel: relationalStore.SecurityLevel.S1,
}

let cryptoParam1: relationalStore.CryptoParam = {
    encryptionKey: new Uint8Array([10, 20, 30]),
    encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_CBC,
    hmacAlgo: relationalStore.HmacAlgo.SHA512,
    kdfAlgo: relationalStore.KdfAlgo.KDF_SHA512,
}

const STORE_CONFIG4: relationalStore.StoreConfig = {
    name: "rdbstore4.db",
    encrypt: false,
    securityLevel: relationalStore.SecurityLevel.S2,
    rootDir: "",
    autoCleanDirtyData: true,
    allowRebuild: true,
    vector: true,
    isReadOnly: true,
    pluginLibs: ['123456.db'],
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
const STORE_CONFIG5: relationalStore.StoreConfig = {
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
}

let cryptoParam3: relationalStore.CryptoParam = {
    encryptionKey: new Uint8Array([10, 20, 30]),
    encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_GCM,
    hmacAlgo: relationalStore.HmacAlgo.SHA1,
    kdfAlgo: relationalStore.KdfAlgo.KDF_SHA1,
}
const STORE_CONFIG6: relationalStore.StoreConfig = {
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
}

export default function rdbStoreAttachErrorTest() {
    describe('rdbStoreAttachErrorTest', (): void => {
        beforeAll(async (): Promise<void> => {
            console.info(tag + 'beforeAll');
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
            await Utils.msSleep(5000);
            context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        })
        
        beforeEach(async (): Promise<void> => {
            console.info(tag + 'beforeEach');
            try{
                let attachStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
                console.info(tag + 'beforeEach context databasedir: ' + context!.databaseDir);
                dataBaseDir = context!.databaseDir + "/rdb/";
                console.info(tag + 'beforeEach STORE_CONFIG1 success');
                await attachStore.executeSql(CREATE_TABLE_TEST1);
                let attachStore1 = await relationalStore.getRdbStore(context!, STORE_CONFIG2);
                await attachStore1.executeSql(CREATE_TABLE_TEST1);
            } catch (e) {
                console.info(tag + 'beforeEach STORE_CONFIG1 error, err: code=' + e.code + ' message=' + e.message);
            }

        })
        
        afterEach(async (): Promise<void> => {
            console.info(tag + 'afterEach');
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG2);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
            console.info(tag + 'afterEach success');
        })
        
        afterAll(async (): Promise<void> => {
            console.info(tag + 'afterAll');
        })
        
        
        const attachInsert: (store: relationalStore.RdbStore, tableName: string) => Promise<void> =
            async (store: relationalStore.RdbStore, tableName: string): Promise<void> => {
            let u8 = new Uint8Array([1, 2, 3]);
            hilog.info(domain, tag, 'RA0104 u8:' + JSON.stringify(u8));
            const valueBucket: relationalStore.ValuesBucket = {
                "name": "zhangsan",
                "age": 18 as Long,
                "salary": 100.5,
                "blobType": u8,
            };
            hilog.info(domain, tag, 'RA0111 valueBucket:' + JSON.stringify(valueBucket));
            await store.insert(tableName, valueBucket);
            hilog.info(domain, tag, 'RA0113 ');
        }

        const attachBatchInsert: (store: relationalStore.RdbStore, tableName: string) => Promise<void> =
            async (store: relationalStore.RdbStore, tableName: string): Promise<void> => {
            let u8 = new Uint8Array([1, 2, 3]);
            const valueBucket: relationalStore.ValuesBucket = {
                "name": "zhangsan",
                "age": 18 as Long,
                "salary": 100.5,
                "blobType": u8,
            };
            let valueBucketArray = new Array<relationalStore.ValuesBucket>();
            for (let i = 0; i < 10; i++) {
                valueBucketArray.push(valueBucket);
            }
            await store.batchInsert(tableName, valueBucketArray);
        }
        
        const insertCheck: (store: relationalStore.RdbStore, tableName: string, ret: number) => Promise<void> =
            async (store: relationalStore.RdbStore, tableName: string, ret: number): Promise<void> => {
            let predicates = new relationalStore.RdbPredicates(tableName);
            let resultSet = await store.query(predicates);
            let count = resultSet.rowCount;
            expect(ret).assertEqual(count);
            resultSet.close();
        }

        const updateCheck: (store: relationalStore.RdbStore, tableName: string) => Promise<void> =
            async (store: relationalStore.RdbStore, tableName: string): Promise<void> => {
            let u8 = new Uint8Array([4, 5, 6]);
            const valueBucket: relationalStore.ValuesBucket = {
                "name": "lisi",
                "age": 20 as Long,
                "salary": 200.5,
                "blobType": u8,
            };
            let predicates = new relationalStore.RdbPredicates(tableName);
            predicates.equalTo("id", "1");
            let ret = await store.update(valueBucket, predicates);
            expect(1).assertEqual(ret);
        }
        
        const deleteCheck: (store: relationalStore.RdbStore, tableName: string, count: number) => Promise<void> =
            async (store: relationalStore.RdbStore, tableName: string, count: number): Promise<void> => {
            let predicates = new relationalStore.RdbPredicates(tableName);
            let ret = await store.delete(predicates);
            expect(count).assertEqual(ret);
        }
        
        const attachCheck: (store: relationalStore.RdbStore) => Promise<void> =
            async (store: relationalStore.RdbStore): Promise<void> => {
            await attachInsert(store, "test");
            await insertCheck(store, "test", 2);
            await updateCheck(store, "test");
            await attachBatchInsert(store, "test");
            await insertCheck(store, "test", 12);
            await deleteCheck(store, "test", 12);
        
            await attachInsert(store, "test1");
            await insertCheck(store, "test1", 1);
            await updateCheck(store, "test1");
            await attachBatchInsert(store, "test1");
            await insertCheck(store, "test1", 11);
            await deleteCheck(store, "test1", 11);
        }
        
        console.log(tag + "*************Ets Test Begin*************");
        
         /**
         * @tc.name   testRdbStoreAttachErr0001
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0060
         * @tc.desc   attach with ""
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttachErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttachErr0001 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            try {
                await store!.attach("", "attachName", 0);
                expect(true).assertFail();
            } catch (err){
                hilog.error(domain, tag, 'testRdbStoreAttachErr0001 err:' + JSON.stringify(err));
                expect(err.code).assertEqual(401);
            }
            console.log(tag + "************* testRdbStoreAttachErr0001 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttachErr0002
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0070
         * @tc.desc   attach with ""
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttachErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttachErr0002 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            try {
                await store!.attach("pullpath", "", 0);
                expect(true).assertFail();
            } catch (err){
                hilog.error(domain, tag, 'testRdbStoreAttachErr0002 err:' + JSON.stringify(err));
                expect(err.code).assertEqual(401);
            }
            console.log(tag + "************* testRdbStoreAttachErr0002 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttachErr0003
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0080
         * @tc.desc   attach with ""
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttachErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttachErr0003 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            try {
                await store!.attach("pullpath", "attachName", undefined);
                expect(true).assertFail();
            } catch (err){
                hilog.error(domain, tag, 'testRdbStoreAttachErr0003 err:' + JSON.stringify(err));
                expect(err.code).assertEqual(14800010);
            }
            console.log(tag + "************* testRdbStoreAttachErr0003 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttachErr0004
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0090
         * @tc.desc   attach with ""
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttachErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttachErr0004 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            try {
                let num = await store!.attach("pullpath", "attachName", 3);
                expect(num > 0).assertTrue();
            } catch (err){
                hilog.error(domain, tag, 'testRdbStoreAttachErr0004 err:' + JSON.stringify(err));
                expect(err.code).assertEqual(14800010);
            }      
            console.log(tag + "************* testRdbStoreAttachErr0004 end *************");
        })
        
        /**
         * @tc.name   testRdbStoreAttachErr0006
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0100
         * @tc.desc   attach 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreAttachErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttachErr0006 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG5);
            expect(STORE_CONFIG5.autoCleanDirtyData).assertEqual(false)
            try {
                let num = await store!.attach(context!, STORE_CONFIG5, 'attachDB');
                expect(num > 0).assertTrue();
            } catch (err){
                if(err.code === 801){
                    hilog.error(domain, tag, 'testRdbStoreAttachErr0006 err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(801);  
                }else{
                    hilog.error(domain, tag, 'testRdbStoreAttachErr0006 err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(14800016);
                }
                
            }  
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG5);      
            console.log(tag + "************* testRdbStoreAttachErr0006 end *************");
        })

         /**
         * @tc.name   testRdbStoreAttachErr0007
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0110
         * @tc.desc   attach with ""
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('testRdbStoreAttachErr0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttachErr0007 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG6);
            expect(STORE_CONFIG6.tokenizer).assertEqual(0)
            expect(relationalStore.Tokenizer.NONE_TOKENIZER).assertEqual(0)
            try {
                let num =await store!.attach(context!, STORE_CONFIG6, 'attachDB');
                expect(num > 0).assertTrue();
            } catch (err){
                hilog.error(domain, tag, 'testRdbStoreAttachErr0007 err:' + JSON.stringify(err));
                expect(err.code).assertEqual(801);
            }  
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG6);    
            console.log(tag + "************* testRdbStoreAttachErr0007 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttachErr0008
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0120
         * @tc.desc   attach with ""
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('testRdbStoreAttachErr0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttachErr0008 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            try {
                let num = await store!.attach(context!, STORE_CONFIG, '', 3);
                expect(num>0).assertTrue();
            } catch (err){
                hilog.error(domain, tag, 'testRdbStoreAttachErr0008 err:' + JSON.stringify(err));
                expect(err.code).assertEqual(401);
            }      
            console.log(tag + "************* testRdbStoreAttachErr0008 end *************");
        })

        /**
         * @tc.name   testRdbStoreAttachErr0009
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_0130
         * @tc.desc   attach with ""
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('testRdbStoreAttachErr0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttachErr0009 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);  
            try {
                let num = await store!.attach(context!, STORE_CONFIG, 'attachDB', undefined);
                expect(num>0).assertTrue();
            } catch (err){
                hilog.error(domain, tag, 'testRdbStoreAttachErr0009 err:' + JSON.stringify(err));
                expect(err.code).assertEqual(401);
            }  
            console.log(tag + "************* testRdbStoreAttachErr0009 end *************");
        })

          /**
         * @tc.name   testRdbStoreAttachErr0005
         * @tc.number SUB_Distributed_relationalStore_SDK_AttachAPITest_2400
         * @tc.desc   attach 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
          it('testRdbStoreAttachErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            console.log(tag + "************* testRdbStoreAttachErr0005 start *************");
            let store = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            try {
                let num = await store!.attach(context!, STORE_CONFIG4, 'attachDB');
                expect(num > 0).assertTrue();
            } catch (err){
                if(err.code === 801){
                    hilog.error(domain, tag, 'testRdbStoreAttachErr0005 err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(801);  
                }else{
                    hilog.error(domain, tag, 'testRdbStoreAttachErr0005 err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(14800010);
                }
                
            }  
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG);      
            console.log(tag + "************* testRdbStoreAttachErr0006 end *************");
        })



        console.log(tag + "*************Ets Test End*************");
        })
}