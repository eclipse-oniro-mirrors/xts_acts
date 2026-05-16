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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common'
import { fileIo as fs } from '@kit.CoreFileKit';
import contextConstant from '@ohos.app.ability.contextConstant';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let context: common.UIAbilityContext | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const DOMAIN = 0x0985;
const TAG = "[RDB_STORE_GET_RDB_STORE_SYNC_ETS_TEST]";

const RDB_TEST_NAME = 'RdbTest.db';
const SQL_CREATE_TABLE =
  'CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB, IDENTITY UNLIMITED INT)';
const value1 = 'Lisa';
const value2 = 18 as long;
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
export default function RdbStoreArkGetRdbStoreSyncAddTest() {
  describe('RdbStoreArkGetRdbStoreSyncAddTest', (): void => {
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, 'beforeAll: Test suite initialization');
      await Utils.msSleep(2000);
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
      hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
    })
    beforeEach(async () => {
      hilog.info(DOMAIN, TAG, 'beforeEach: Cleanup before each test');
    })
    afterEach(async () => {
      hilog.info(DOMAIN, TAG, 'afterEach: Cleanup after each test');
    })
    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'afterAll: Test suite cleanup');
    })
    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   RelationalStore_Ark_getRdbStoreSyncAddTest001
     * @tc.number SUB_DistributedData_RelationalStore_Ark_getRdbStoreSyncAddTest001
     * @tc.desc   the autoCleanDirtyData is true
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_Ark_getRdbStoreSyncAddTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest001 start *************");
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
      let rdbstore: relationalStore.RdbStore | undefined = undefined;
      try {
        console.log(TAG, "Step 1: Get RdbStore");
        rdbstore = relationalStore.getRdbStoreSync(context!, storeConfig);
        expect(rdbstore !== undefined).assertTrue();
        expect(rdbstore!.version).assertEqual(0);
        expect(rdbstore!.rebuilt).assertEqual(0);
      } catch (e) {
        const err = e as BusinessError;
        console.log(TAG, `RelationalStore_Ark_getRdbStoreSyncAddTest001 failed. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      } finally {
        rdbstore?.close();
        await relationalStore.deleteRdbStore(context!, storeConfig);
        done();
      }
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest001 end *************");
    })
    /**
     * @tc.name   RelationalStore_Ark_getRdbStoreSyncAddTest002
     * @tc.number SUB_DistributedData_RelationalStore_Ark_getRdbStoreSyncAddTest002
     * @tc.desc   the tokenizer is ICU_TOKENIZER,
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_Ark_getRdbStoreSyncAddTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest002 start *************");
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
      let rdbstore: relationalStore.RdbStore | undefined = undefined;
      try {
        console.log(TAG, "Step 1: Get RdbStore");
        rdbstore = relationalStore.getRdbStoreSync(context!, storeConfig);
        expect(rdbstore !== undefined).assertTrue();
      } catch (e) {
        const err = e as BusinessError;
        console.log(TAG, `RelationalStore_Ark_getRdbStoreSyncAddTest002 failed. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      } finally {
        rdbstore?.close();
        await relationalStore.deleteRdbStore(context!, storeConfig);
      }
      done();
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest002 end *************");
    })
    /**
     * @tc.name   RelationalStore_Ark_getRdbStoreSyncAddTest003
     * @tc.number SUB_DistributedData_RelationalStore_Ark_getRdbStoreSyncAddTest003
     * @tc.desc   the pluginLibs is [''],
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_Ark_getRdbStoreSyncAddTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest003 start *************");
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
        let rdbstore: relationalStore.RdbStore | undefined = undefined;
        try {
          console.log(TAG, "Step 1: Get RdbStore");
          rdbstore = relationalStore.getRdbStoreSync(context!, storeConfig);
          expect(rdbstore !== undefined).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          console.log(TAG, `RelationalStore_Ark_getRdbStoreSyncAddTest003 failed. Code:${err.code}, message:${err.message}`);
          expect().assertFail();
        } finally {
          rdbstore?.close();
          await relationalStore.deleteRdbStore(context!, storeConfig);
          done();
        }
      }
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest003 end *************");
    })
    /**
     * @tc.name   RelationalStore_Ark_getRdbStoreSyncAddTest004
     * @tc.number SUB_DistributedData_RelationalStore_Ark_getRdbStoreSyncAddTest004
     * @tc.desc   the ncryptionAlgo is PLAIN_TEXT,
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_Ark_getRdbStoreSyncAddTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest004 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S4,
        cryptoParam: {
          encryptionKey:new Uint8Array([10, 20, 30]),
          encryptionAlgo: relationalStore.EncryptionAlgo.PLAIN_TEXT,
        },
      };
      let rdbstore: relationalStore.RdbStore | undefined = undefined;
      try {
        console.log(TAG, "Step 1: Get RdbStore");
        rdbstore = relationalStore.getRdbStoreSync(context!, storeConfig);
        expect(rdbstore !== undefined).assertTrue();
      } catch (e) {
        const err = e as BusinessError;
        console.log(TAG, `RelationalStore_Ark_getRdbStoreSyncAddTest004 failed. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      } finally {
        rdbstore?.close();
        await relationalStore.deleteRdbStore(context!, storeConfig);
      }
      done();
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest004 end *************");
    })
    /**
     * @tc.name   RelationalStore_Ark_getRdbStoreSyncAddTest005
     * @tc.number SUB_DistributedData_RelationalStore_Ark_getRdbStoreSyncAddTest005
     * @tc.desc   the tokenizer is CUSTOM_TOKENIZER,
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_Ark_getRdbStoreSyncAddTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest005 start *************");
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
        let rdbstore: relationalStore.RdbStore | undefined = undefined;
        try {
          console.log(TAG, "Step 1: Get RdbStore");
          rdbstore = relationalStore.getRdbStoreSync(context!, storeConfig);
          expect(rdbstore !== undefined).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          console.log(TAG, `RelationalStore_Ark_getRdbStoreSyncAddTest005 failed. Code:${err.code}, message:${err.message}`);
          expect().assertFail();
        } finally {
          rdbstore?.close();
          await relationalStore.deleteRdbStore(context!, storeConfig);
          done();
        }
      }
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest005 end *************");
    })
    /**
     * @tc.name   RelationalStore_Ark_getRdbStoreSyncAddTest006
     * @tc.number SUB_DistributedData_RelationalStore_Ark_getRdbStoreSyncAddTest006
     * @tc.desc   encrypt is true
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_Ark_getRdbStoreSyncAddTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest006 start *************");
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
      let rdbstore: relationalStore.RdbStore | undefined = undefined;
      try {
        console.log(TAG, "Step 1: Get RdbStore");
        rdbstore = relationalStore.getRdbStoreSync(context!, storeConfig);
        expect(rdbstore !== undefined).assertTrue();
      } catch (e) {
        const err = e as BusinessError;
        console.log(TAG, `RelationalStore_Ark_getRdbStoreSyncAddTest006 failed. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      } finally {
        rdbstore?.close();
        await relationalStore.deleteRdbStore(context!, storeConfig);
      }
      done();
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest006 end *************");
    })
    /**
     * @tc.name   RelationalStore_Ark_getRdbStoreSyncAddTest007
     * @tc.number SUB_DistributedData_RelationalStore_Ark_getRdbStoreSyncAddTest007
     * @tc.desc   pluginLibs is not null
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_Ark_getRdbStoreSyncAddTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest007 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S4,
        pluginLibs:['librdb_custom.so', 'libfts_tokenizer.so', 'libcrypto_helper.so'],
      };
      let rdbstore: relationalStore.RdbStore | undefined = undefined;
      try {
        console.log(TAG, "Step 1: Get RdbStore");
        rdbstore = relationalStore.getRdbStoreSync(context!, storeConfig);
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        console.log(TAG, `RelationalStore_Ark_getRdbStoreSyncAddTest007 failed. Code:${err.code}, message:${err.message}`);
        expect(14800010).assertEqual(err.code);
      } finally {
        rdbstore?.close();
        await relationalStore.deleteRdbStore(context!, storeConfig);
      }
      done();
      console.log(TAG, "************* RelationalStore_Ark_getRdbStoreSyncAddTest007 end *************");
    })
  })
}
