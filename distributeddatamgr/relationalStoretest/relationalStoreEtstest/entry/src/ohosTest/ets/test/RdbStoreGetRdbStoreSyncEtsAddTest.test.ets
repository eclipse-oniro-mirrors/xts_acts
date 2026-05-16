/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import relationalStore from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import taskpool from '@ohos.taskpool';
import { Context } from '@ohos.abilityAccessCtrl';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const DOMAIN = 0x0985;
const TAG = "[RDB_STORE_GET_RDB_STORE_SYNC_ETS_TEST]";

const RDB_TEST_NAME = 'RdbTest.db';
const SQL_CREATE_TABLE =
  'CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB, IDENTITY UNLIMITED INT)';

const value1 = 'Lisa';
const value2 = 18;
const value3 = 100.5;
const value4 = new Uint8Array([1, 2, 3, 4, 5]);
const value5 = BigInt('15822401018187971961171');
const valueBucket: relationalStore.ValuesBucket = {
  'NAME': value1,
  'AGE': value2,
  'SALARY': value3,
  'CODES': value4,
  'IDENTITY': value5,
};
export default function RdbStoreGetRdbStoreSyncEtsAddTest() {
  describe('RdbStoreGetRdbStoreSyncEtsAddTest', () => {
    beforeAll(async () => {
      console.log(TAG, 'beforeAll: Test suite initialization');
    })
    beforeEach(async () => {
      console.log(TAG, 'beforeEach: Cleanup before each test');
      await relationalStore.deleteRdbStore(context, RDB_TEST_NAME);
    })
    afterEach(async () => {
      console.log(TAG, 'afterEach: Cleanup after each test');
      await relationalStore.deleteRdbStore(context, RDB_TEST_NAME);
    })
    afterAll(async () => {
      console.log(TAG, 'afterAll: Test suite cleanup');
    })
    console.log(TAG + "*************Unit Test Begin*************");
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncAddTest001
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncAddTest001
     * @tc.desc   the autoCleanDirtyData is true
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncAddTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest001 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S4,
        autoCleanDirtyData:true,
        allowRebuild:true,
        vector:false,
        pluginLibs:[],
        encrypt:true,
        cryptoParam: {
          encryptionKey:new Uint8Array([10, 20, 30]),
          encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_GCM,
          hmacAlgo: relationalStore.HmacAlgo.SHA1,
          kdfAlgo: relationalStore.KdfAlgo.KDF_SHA1
        },
        tokenizer:relationalStore.Tokenizer.NONE_TOKENIZER,
        persist:true,
        enableSemanticIndex:true,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        console.log(TAG, "Step 1: Get RdbStore");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        expect(store !== undefined).assertTrue();
        expect(store!.version).assertEqual(0);
        expect(store!.rebuilt).assertEqual(0);
      } catch (e) {
        const err = e as BusinessError;
        console.log(TAG, `RelationalStore_getRdbStoreSyncAddTest001 failed. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest001 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncAddTest002
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncAddTest002
     * @tc.desc   the tokenizer is ICU_TOKENIZER,
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncAddTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest002 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S4,
        autoCleanDirtyData:false,
        allowRebuild:false,
        vector:false,
        tokenizer:relationalStore.Tokenizer.ICU_TOKENIZER,
        persist:false,
        enableSemanticIndex:false,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        console.log(TAG, "Step 1: Get RdbStore");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        expect(store !== undefined).assertTrue();
      } catch (e) {
        const err = e as BusinessError;
        console.log(TAG, `RelationalStore_getRdbStoreSyncAddTest002 failed. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest002 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncAddTest003
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncAddTest003
     * @tc.desc   the pluginLibs is [''],
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncAddTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest003 start *************");
      let supported = relationalStore.isVectorSupported();
      if (!supported) {
        console.info(TAG + `vector not supported`);
        done();
      }else{
        const storeConfig: relationalStore.StoreConfig = {
          name: RDB_TEST_NAME,
          securityLevel: relationalStore.SecurityLevel.S4,
          vector:true,
          pluginLibs:[''],
          encrypt:true,
          cryptoParam: {
            encryptionKey:new Uint8Array([10, 20, 30]),
            encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_CBC,
            hmacAlgo: relationalStore.HmacAlgo.SHA512,
            kdfAlgo: relationalStore.KdfAlgo.KDF_SHA512
          },
        };
        let store: relationalStore.RdbStore | undefined = undefined;
        try {
          console.log(TAG, "Step 1: Get RdbStore");
          store = relationalStore.getRdbStoreSync(context, storeConfig);
          expect(store !== undefined).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          console.log(TAG, `RelationalStore_getRdbStoreSyncAddTest003 failed. Code:${err.code}, message:${err.message}`);
          expect().assertFail();
        } finally {
          await store?.close();
          await relationalStore.deleteRdbStore(context, storeConfig);
          done();
        }
      }
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest003 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncAddTest004
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncAddTest004
     * @tc.desc   the ncryptionAlgo is PLAIN_TEXT,
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncAddTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest004 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S4,
        cryptoParam: {
          encryptionKey:new Uint8Array([10, 20, 30]),
          encryptionAlgo: relationalStore.EncryptionAlgo.PLAIN_TEXT,
        },
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        console.log(TAG, "Step 1: Get RdbStore");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        expect(store !== undefined).assertTrue();
      } catch (e) {
        const err = e as BusinessError;
        console.log(TAG, `RelationalStore_getRdbStoreSyncAddTest004 failed. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest004 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncAddTest005
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncAddTest005
     * @tc.desc   the tokenizer is CUSTOM_TOKENIZER,
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncAddTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest005 start *************");
      const isCustomSupported = relationalStore.isTokenizerSupported(relationalStore.Tokenizer.CUSTOM_TOKENIZER);
      if (!isCustomSupported) {
        console.info(TAG + `custom tokenizer not supported`);
        done();
      }else{
        const storeConfig: relationalStore.StoreConfig = {
          name: RDB_TEST_NAME,
          securityLevel: relationalStore.SecurityLevel.S4,
          tokenizer:relationalStore.Tokenizer.CUSTOM_TOKENIZER,
        };
        let store: relationalStore.RdbStore | undefined = undefined;
        try {
          console.log(TAG, "Step 1: Get RdbStore");
          store = relationalStore.getRdbStoreSync(context, storeConfig);
          expect(store !== undefined).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          console.log(TAG, `RelationalStore_getRdbStoreSyncAddTest005 failed. Code:${err.code}, message:${err.message}`);
          expect().assertFail();
        } finally {
          await store?.close();
          await relationalStore.deleteRdbStore(context, storeConfig);
          done();
        }
      }
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest005 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncAddTest006
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncAddTest006
     * @tc.desc   encrypt is true
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncAddTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest006 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S4,
        encrypt:true,
        cryptoParam: {
          encryptionKey:new Uint8Array([10, 20, 30]),
          encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: relationalStore.HmacAlgo.SHA256,
          kdfAlgo: relationalStore.KdfAlgo.KDF_SHA256
        },
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        console.log(TAG, "Step 1: Get RdbStore");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        expect(store !== undefined).assertTrue();
      } catch (e) {
        const err = e as BusinessError;
        console.log(TAG, `RelationalStore_getRdbStoreSyncAddTest006 failed. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest006 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncAddTest007
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncAddTest007
     * @tc.desc   pluginLibs is not null
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncAddTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest007 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S4,
        pluginLibs:['librdb_custom.so', 'libfts_tokenizer.so', 'libcrypto_helper.so'],
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        console.log(TAG, "Step 1: Get RdbStore");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        console.log(TAG, `RelationalStore_getRdbStoreSyncAddTest007 failed. Code:${err.code}, message:${err.message}`);
        expect(14800010).assertEqual(err.code);
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      console.log(TAG, "************* RelationalStore_getRdbStoreSyncAddTest007 end *************");
    })
  })
}
