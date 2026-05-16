/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import common from '@ohos.app.ability.common';
import { relationalStore } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';

const TAG = "[ttt]"
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbTest.db",
  securityLevel: relationalStore.SecurityLevel.S3
};
const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS EMPLOYEE (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL, age INTEGER, salary REAL, blobType BLOB)";

let store: relationalStore.RdbStore | undefined = undefined;
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
export default function relationalStoreEtsTest() {
  describe('relationalStoreEtsTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      try {
        store = await relationalStore.getRdbStore(context, STORE_CONFIG)
        console.info(TAG + 'Get RdbStore successfully.');
        await (store as relationalStore.RdbStore).executeSql(CREATE_TABLE_TEST);
      } catch (err) {
        console.error(TAG + `Get RdbStore failed, code is ${err.code},message is ${err.message}`);
      }
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      if(store != undefined){
        await relationalStore.deleteRdbStore(context, "RdbTest.db");
      }
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    });
    console.info(TAG + "*************Unit Test Begin*************");
    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_0100
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0100 start *************");
      try {
        await relationalStore.deleteRdbStore(null, "RdbTest.db");
        console.info(TAG + "deleteRdbStore success");
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401")
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0100 end *************");
    });
    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_0200
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0200 start *************");
      try {
        await relationalStore.deleteRdbStore(undefined, "RdbTest.db");
        console.info(TAG + "deleteRdbStore success");
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401")
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0200 end *************");
    });
    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_0300
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0300 start *************");
      try {
        let count = 0;
        await relationalStore.deleteRdbStore(context, "");
        count += 1;
        console.info(TAG + "deleteRdbStore success");
        expect(count).assertEqual(1);
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0300 end *************");
    });
    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_0400
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0400 start *************");
      try {
        await relationalStore.deleteRdbStore(context, null);
        console.info(TAG + "deleteRdbStore success");
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401")
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0400 end *************");
    });

    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_0500
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0500 start *************");
      try {
        await relationalStore.deleteRdbStore(context, null);
        console.info(TAG + "deleteRdbStore success");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401")
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0500 end *************");
    });

    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_0600
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0600 start *************");
      try {
        const delConfig: relationalStore.StoreConfig = {
          name: "RdbTest.db",
          securityLevel: relationalStore.SecurityLevel.S3
        };
        let count = 0;
        await relationalStore.deleteRdbStore(context, delConfig);
        count += 1;
        console.info(TAG + "deleteRdbStore success");
        expect(count).assertEqual(1);
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0600 end *************");
    });

    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_0700
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0700 start *************");
      try {
        const delConfig: relationalStore.StoreConfig = {
          name: "RdbTest.db",
          securityLevel: relationalStore.SecurityLevel.S2
        };
        let count = 0;
        await relationalStore.deleteRdbStore(context, delConfig);
        count += 1;
        console.info(TAG + "deleteRdbStore success");
        expect(count).assertEqual(1);
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0700 end *************");
    });

    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest0800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_0800
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0800 start *************");
      try {
        const delConfig: relationalStore.StoreConfig = {
          name: "RdbTest.db",
          securityLevel: relationalStore.SecurityLevel.S2,
          rootDir:"",
          autoCleanDirtyData: true,
          allowRebuild: false,
          isReadOnly: false,
          pluginLibs:[],
          persist: true,
          enableSemanticIndex: true,
          tokenizer: relationalStore.Tokenizer.NONE_TOKENIZER
        };
        let count = 0;
        await relationalStore.deleteRdbStore(context, delConfig);
        count += 1;
        console.info(TAG + "deleteRdbStore success");
        expect(count).assertEqual(1);
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0800 end *************");
    });

    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest0900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_0900
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0900 start *************");
      try {
        const delConfig: relationalStore.StoreConfig = {
          name: "RdbTest.db",
          securityLevel: relationalStore.SecurityLevel.S2,
          pluginLibs:[""],
          tokenizer: relationalStore.Tokenizer.ICU_TOKENIZER,
          enableSemanticIndex: false,
          cryptoParam:{
            encryptionKey: new Uint8Array([1, 2, 3]),
            encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_GCM,
            hmacAlgo: relationalStore.HmacAlgo.SHA1,
            kdfAlgo: relationalStore.KdfAlgo.KDF_SHA1
          }
        };
        let count = 0;
        await relationalStore.deleteRdbStore(context, delConfig);
        count += 1;
        console.info(TAG + "deleteRdbStore success");
        expect(count).assertEqual(1);
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest0900 end *************");
    });

    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest1000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_1000
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest1000 start *************");
      try {
        const delConfig: relationalStore.StoreConfig = {
          name: "RdbTest.db",
          securityLevel: relationalStore.SecurityLevel.S2,
          cryptoParam:{
            encryptionKey: new Uint8Array([1, 2, 3]),
            encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_CBC,
            hmacAlgo: relationalStore.HmacAlgo.SHA256,
            kdfAlgo: relationalStore.KdfAlgo.KDF_SHA256
          }
        };
        let count = 0;
        await relationalStore.deleteRdbStore(context, delConfig);
        count += 1;
        console.info(TAG + "deleteRdbStore success");
        expect(count).assertEqual(1);
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest1000 end *************");
    });

    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest1100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_1100
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest1100 start *************");
      try {
        const delConfig: relationalStore.StoreConfig = {
          name: "RdbTest.db",
          securityLevel: relationalStore.SecurityLevel.S2,
          cryptoParam:{
            encryptionKey: new Uint8Array([1, 2, 3]),
            encryptionAlgo: relationalStore.EncryptionAlgo.PLAIN_TEXT,
            hmacAlgo: relationalStore.HmacAlgo.SHA512,
            kdfAlgo: relationalStore.KdfAlgo.KDF_SHA512
          }
        };
        let count = 0;
        await relationalStore.deleteRdbStore(context, delConfig);
        count += 1;
        console.info(TAG + "deleteRdbStore success");
        expect(count).assertEqual(1);
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest1100 end *************");
    });

    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest1200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_1200
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest1200 start *************");
      try {
        const delConfig: relationalStore.StoreConfig = {
          name: "RdbTest.db",
          securityLevel: relationalStore.SecurityLevel.S2,
          dataGroupId: "000"
        };
        await relationalStore.deleteRdbStore(context, delConfig);
        console.info(TAG + "deleteRdbStore success");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("14801002");
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest1200 end *************");
    });

    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest1300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_1300
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest1300 start *************");
      try {
        const delConfig: relationalStore.StoreConfig = {
          name: "RdbTest.db",
          securityLevel: relationalStore.SecurityLevel.S2,
        };
        await relationalStore.deleteRdbStore(null, delConfig);
        console.info(TAG + "deleteRdbStore success");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest1300 end *************");
    });

    /**
     * @tc.name   testRdbStoreDeleteRdbStoretest1400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteRdbStoretest_1400
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest1400 start *************");
      try {
        const delConfig: relationalStore.StoreConfig = {
          name: "RdbTest.db",
          securityLevel: relationalStore.SecurityLevel.S2,
        };
        await relationalStore.deleteRdbStore(undefined, delConfig);
        console.info(TAG + "deleteRdbStore success");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretest1400 end *************");
    });

    /**
     * @tc.name   testIsTokenizerSupportedTest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupportedTest_0100
     * @tc.desc   isTokenizerSupported test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsTokenizerSupportedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testIsTokenizerSupportedTest0100 start *************");
      let customType = relationalStore.Tokenizer.NONE_TOKENIZER;
      try {
        let customTypeSupported = relationalStore.isTokenizerSupported(customType);
        console.log(TAG + "ICU tokenizer supported on current platform:" + customTypeSupported);
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testIsTokenizerSupportedTest0100 end *************");
    })

    /**
     * @tc.name   testRdbGetInsertSqlInfoErr0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetInsertSqlInfoErrTest_0100
     * @tc.desc   testRdbGetInsertSqlInfoErr0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0100 start *************");
      try {
        const bucket: relationalStore.ValuesBucket = {
          name: "Logitech",
          age: "18",
          sex: "man",
          desc: "asserter"
        };
        const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
          "",
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0100 end *************");
    });

    /**
     * @tc.name   testRdbGetInsertSqlInfoErr0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetInsertSqlInfoErrTest_0200
     * @tc.desc   testRdbGetInsertSqlInfoErr0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0200 start *************");
      try {
        const bucket: relationalStore.ValuesBucket = {
          name: "Logitech",
          age: "18",
          sex: "man",
          desc: "asserter"
        };
        const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
          null,
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0200 end *************");
    });

    /**
     * @tc.name   testRdbGetInsertSqlInfoErr0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetInsertSqlInfoErrTest_0300
     * @tc.desc   testRdbGetInsertSqlInfoErr0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0300 start *************");
      try {
        const bucket: relationalStore.ValuesBucket = {
          name: "Logitech",
          age: "18",
          sex: "man",
          desc: "asserter"
        };
        const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
          undefined,
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0300 end *************");
    });

    /**
     * @tc.name   testRdbGetInsertSqlInfoErr0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetInsertSqlInfoErrTest_0400
     * @tc.desc   testRdbGetInsertSqlInfoErr0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0400 start *************");
      try {
        const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
          "EMPLOYEE",
          null,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0400 end *************");
    });

    /**
     * @tc.name   testRdbGetInsertSqlInfoErr0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetInsertSqlInfoErrTest_0500
     * @tc.desc   testRdbGetInsertSqlInfoErr0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoErr0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0500 start *************");
      try {
        const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
          "EMPLOYEE",
          undefined,
          relationalStore.ConflictResolution.ON_CONFLICT_NONE
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0500 end *************");
    });

    /**
     * @tc.name   testRdbGetInsertSqlInfoErr0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetInsertSqlInfoErrTest_0600
     * @tc.desc   testRdbGetInsertSqlInfoErr0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoErr0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0600 start *************");
      try {
        const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
          "EMPLOYEE",
          null,
          relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0600 end *************");
    });

    /**
     * @tc.name   testRdbGetInsertSqlInfoErr0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetInsertSqlInfoErrTest_0700
     * @tc.desc   testRdbGetInsertSqlInfoErr0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoErr0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0700 start *************");
      try {
        const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
          "EMPLOYEE",
          null,
          relationalStore.ConflictResolution.ON_CONFLICT_ABORT
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0700 end *************");
    });

    /**
     * @tc.name   testRdbGetInsertSqlInfoErr0800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetInsertSqlInfoErrTest_0800
     * @tc.desc   testRdbGetInsertSqlInfoErr0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoErr0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0800 start *************");
      try {
        const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
          "EMPLOYEE",
          null,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0800 end *************");
    });

    /**
     * @tc.name   testRdbGetInsertSqlInfoErr0900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetInsertSqlInfoErrTest_0900
     * @tc.desc   testRdbGetInsertSqlInfoErr0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetInsertSqlInfoErr0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0900 start *************");
      try {
        const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
          "EMPLOYEE",
          null,
          relationalStore.ConflictResolution.ON_CONFLICT_IGNORE
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetInsertSqlInfoErr0900 end *************");
    });

    /**
     * @tc.name   testRdbGetUpdateSqlInfoErr0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetUpdateSqlInfoErrTest_0100
     * @tc.desc   testRdbGetUpdateSqlInfoErr0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfoErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfoErr0100 start *************");
      try {
        const bucket: relationalStore.ValuesBucket = {
          name: "Logitech",
          age: "18",
          sex: "man",
          desc: "asserter"
        };
        const predicates = new relationalStore.RdbPredicates("");
        const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
          predicates,
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("401");
      }
      console.log(TAG + "************* testRdbGetUpdateSqlInfoErr0100 end *************");
    });

    /**
     * @tc.name   testRdbGetUpdateSqlInfoErr0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetUpdateSqlInfoErrTest_0200
     * @tc.desc   testRdbGetUpdateSqlInfoErr0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfoErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfoErr0200 start *************");
      try {
        const bucket: relationalStore.ValuesBucket = {
          name: "Logitech",
          age: "18",
          sex: "man",
          desc: "asserter"
        };
        const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
          null,
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_ABORT
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetUpdateSqlInfoErr0200 end *************");
    });

    /**
     * @tc.name   testRdbGetUpdateSqlInfoErr0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetUpdateSqlInfoErrTest_0300
     * @tc.desc   testRdbGetUpdateSqlInfoErr0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfoErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfoErr0300 start *************");
      try {
        const bucket: relationalStore.ValuesBucket = {
          name: "Logitech",
          age: "18",
          sex: "man",
          desc: "asserter"
        };
        const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
          undefined,
          bucket,
          relationalStore.ConflictResolution.ON_CONFLICT_FAIL
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetUpdateSqlInfoErr0300 end *************");
    });

    /**
     * @tc.name   testRdbGetUpdateSqlInfoErr0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetUpdateSqlInfoErrTest_0400
     * @tc.desc   testRdbGetUpdateSqlInfoErr0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfoErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfoErr0400 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates("users");
        const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
          predicates,
          null,
          relationalStore.ConflictResolution.ON_CONFLICT_IGNORE
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetUpdateSqlInfoErr0400 end *************");
    });

    /**
     * @tc.name   testRdbGetUpdateSqlInfoErr0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetUpdateSqlInfoErrTest_0500
     * @tc.desc   testRdbGetUpdateSqlInfoErr0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetUpdateSqlInfoErr0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetUpdateSqlInfoErr0500 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates("users");
        const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
          predicates,
          undefined,
          relationalStore.ConflictResolution.ON_CONFLICT_REPLACE
        );
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetUpdateSqlInfoErr0500 end *************");
    });

    /**
     * @tc.name   testRdbGetDeleteSqlInfoErr0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetDeleteSqlInfoErrTest_0100
     * @tc.desc   testRdbGetDeleteSqlInfoErr0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetDeleteSqlInfoErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetDeleteSqlInfoErr0100 start *************");
      try {
        const info: relationalStore.SqlInfo = relationalStore.getDeleteSqlInfo(null);
        expect().assertFail();
      }catch (err) {
        console.error( TAG + 'err' + err.code + err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetDeleteSqlInfoErr0100 end *************");
    });

    /**
     * @tc.name   testRdbGetDeleteSqlInfoErr0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetDeleteSqlInfoErrTest_0200
     * @tc.desc   testRdbGetDeleteSqlInfoErr0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetDeleteSqlInfoErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetDeleteSqlInfoErr0200 start *************");
      try {
        const info: relationalStore.SqlInfo = relationalStore.getDeleteSqlInfo(null);
        expect().assertFail();
      }catch (err) {
        console.error( TAG + 'err' + err.code + err.message);
        expect(err.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetDeleteSqlInfoErr0200 end *************");
    });

    /**
     * @tc.name   testRdbGetQuerySqlInfoErr0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetQuerySqlInfoErrTest_0100
     * @tc.desc   testRdbGetQuerySqlInfoErr0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetQuerySqlInfoErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetQuerySqlInfoErr0100 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates("users");
        const info: relationalStore.SqlInfo = relationalStore.getQuerySqlInfo(predicates, null);
        expect(info.sql).assertEqual("SELECT * FROM users");
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect().assertFail();
      }
      console.log(TAG + "************* testRdbGetQuerySqlInfoErr0100 end *************");
    });

    /**
     * @tc.name   testRdbGetQuerySqlInfoErr0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetQuerySqlInfoErrTest_0200
     * @tc.desc   testRdbGetQuerySqlInfoErr0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetQuerySqlInfoErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetQuerySqlInfoErr0200 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates("users");
        const info: relationalStore.SqlInfo = relationalStore.getQuerySqlInfo(predicates, undefined);
        expect(info.sql).assertEqual("SELECT * FROM users");
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect().assertFail();
      }
      console.log(TAG + "************* testRdbGetQuerySqlInfoErr0200 end *************");
    });

    /**
     * @tc.name   testRdbGetQuerySqlInfoErr0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetQuerySqlInfoErrTest_0300
     * @tc.desc   testRdbGetQuerySqlInfoErr0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetQuerySqlInfoErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetQuerySqlInfoErr0300 start *************");
      try {
        const info: relationalStore.SqlInfo = relationalStore.getQuerySqlInfo(null);
        expect().assertFail();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetQuerySqlInfoErr0300 end *************");
    });

    /**
     * @tc.name   testRdbGetQuerySqlInfoErr0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetQuerySqlInfoErrTest_0400
     * @tc.desc   testRdbGetQuerySqlInfoErr0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetQuerySqlInfoErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbGetQuerySqlInfoErr0400 start *************");
      try {
        const info: relationalStore.SqlInfo = relationalStore.getQuerySqlInfo(undefined);
        expect().assertFail();
      } catch (e) {
        console.error( TAG + 'getInsertSqlInfo' + e.code + e.message);
        expect(e.code).assertEqual("14800001");
      }
      console.log(TAG + "************* testRdbGetQuerySqlInfoErr0400 end *************");
    });

    /**
     * @tc.name   testRdbGetColumnIndexErrtest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetColumnIndexErrtest_0100
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnIndexErrtest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetColumnIndexErrtest0100 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getColumnIndex("")
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetColumnIndexErrtest0100 end *************");
    });

    /**
     * @tc.name   testRdbGetColumnIndexErrtest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetColumnIndexErrtest_0200
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnIndexErrtest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetColumnIndexErrtest0200 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getColumnIndex(null)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetColumnIndexErrtest0200 end *************");
    });

    /**
     * @tc.name   testRdbGetColumnIndexErrtest0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetColumnIndexErrtest_0300
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnIndexErrtest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetColumnIndexErrtest0300 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getColumnIndex(undefined)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetColumnIndexErrtest0300 end *************");
    });

    /**
     * @tc.name   testRdbGetColumnNameErrtest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetColumnNameErrtest_0100
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnNameErrtest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetColumnNameErrtest0100 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getColumnName(null)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetColumnNameErrtest0100 end *************");
    });

    /**
     * @tc.name   testRdbGetColumnNameErrtest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetColumnNameErrtest_0200
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnNameErrtest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetColumnNameErrtest0200 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getColumnName(undefined)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetColumnNameErrtest0200 end *************");
    });

    /**
     * @tc.name   testRdbGoToErrtest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGoToErrtest_0100
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGoToErrtest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGoToErrtest0100 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.goTo(null)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGoToErrtest0100 end *************");
    });

    /**
     * @tc.name   testRdbGoToErrtest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGoToErrtest_0200
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGoToErrtest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGoToErrtest0200 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.goTo(undefined)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGoToErrtest0200 end *************");
    });

    /**
     * @tc.name   testRdbGoToRowErrtest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGoToRowErrtest_0100
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGoToRowErrtest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGoToRowErrtest0100 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.goToRow(null)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGoToRowErrtest0100 end *************");
    });

    /**
     * @tc.name   testRdbGoToRowErrtest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGoToRowErrtest_0200
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGoToRowErrtest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGoToRowErrtest0200 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.goToRow(undefined)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGoToRowErrtest0200 end *************");
    });

    /**
     * @tc.name   testRdbGetBlobErrtest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetBlobErrtest_0100
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetBlobErrtest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetBlobErrtest0100 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getBlob(null)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetBlobErrtest0100 end *************");
    });

    /**
     * @tc.name   testRdbGetBlobErrtest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetBlobErrtest_0200
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetBlobErrtest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetBlobErrtest0200 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getBlob(undefined)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetBlobErrtest0200 end *************");
    });

    /**
     * @tc.name   testRdbGetStringErrtest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetStringErrtest_0100
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetStringErrtest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetStringErrtest0100 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getString(null)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetStringErrtest0100 end *************");
    });

    /**
     * @tc.name   testRdbGetStringErrtest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetStringErrtest_0200
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetStringErrtest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetStringErrtest0200 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getString(undefined)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetStringErrtest0200 end *************");
    });

    /**
     * @tc.name   testRdbGetLongErrtest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetLongErrtest_0100
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetLongErrtest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetLongErrtest0100 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getLong(null)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetLongErrtest0100 end *************");
    });

    /**
     * @tc.name   testRdbGetLongErrtest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetLongErrtest_0200
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetLongErrtest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetLongErrtest0200 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getLong(undefined)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetLongErrtest0200 end *************");
    });

    /**
     * @tc.name   testRdbGetDoubleErrtest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetDoubleErrtest_0100
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetDoubleErrtest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetDoubleErrtest0100 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getDouble(null)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetDoubleErrtest0100 end *************");
    });

    /**
     * @tc.name   testRdbGetDoubleErrtest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbGetDoubleErrtest_0200
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetDoubleErrtest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbGetDoubleErrtest0200 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.getDouble(undefined)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbGetDoubleErrtest0200 end *************");
    });

    /**
     * @tc.name   testRdbIsColumnNullErrtest0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbSsColumnNullErrtest_0100
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbIsColumnNullErrtest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbIsColumnNullErrtest0100 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.isColumnNull(null)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbIsColumnNullErrtest0100 end *************");
    });

    /**
     * @tc.name   testRdbIsColumnNullErrtest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbSsColumnNullErrtest_0200
     * @tc.desc   RelationalStore resultSet test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbIsColumnNullErrtest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbIsColumnNullErrtest0200 start *************");
      try {
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        resultSet = await (store as relationalStore.RdbStore).query(predicates)
        let res = resultSet.isColumnNull(undefined)
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbIsColumnNullErrtest0200 end *************");
    });

    /**
     * @tc.name   testRdbStoreDeleteRdbStoretestAdd0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreDeleteRdbStoretestAdd_0100
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretestAdd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0100 start *************");
      let rdbName = "a".repeat(994)
      try {
        await relationalStore.deleteRdbStore(context, rdbName);
        console.info(TAG + "deleteRdbStore success ");
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401")
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0100 end *************");
    });
    /**
     * @tc.name   testRdbStoreDeleteRdbStoretestAdd0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreDeleteRdbStoretestAdd_0200
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretestAdd0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0200 start *************");
      let rdbName = "a".repeat(993)
      try {
        let num = 0;
        await relationalStore.deleteRdbStore(context, rdbName);
        num += 1;
        console.info(TAG + "deleteRdbStore success ");
        expect(num).assertEqual(1)
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail()
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0200 end *************");
    });
    /**
     * @tc.name   testRdbStoreDeleteRdbStoretestAdd0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreDeleteRdbStoretestAdd_0300
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreDeleteRdbStoretestAdd0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0300 start *************");
      let rdbName = "";
      try {
        let num = 0;
        await relationalStore.deleteRdbStore(context, rdbName);
        num += 1;
        console.info(TAG + "deleteRdbStore success");
        expect(num).assertEqual(1)
      } catch (err) {
        console.error(TAG + `deleteRdbStore is failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail()
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0300 end *************");
    });
    /**
     * @tc.name   testRdbStoreDeleteRdbStoretestAdd0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreDeleteRdbStoretestAdd_0400
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoreDeleteRdbStoretestAdd0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0400 start *************");
      let rdbName = "a".repeat(994)
      try {
        relationalStore.deleteRdbStore(context, rdbName, async (err: BusinessError) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.error(TAG + `testRdbStoreDeleteRdbStoretestAdd0400, errcode:${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue()
        done();
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0400 end   *************");
    });
    /**
     * @tc.name   testRdbStoreDeleteRdbStoretestAdd0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreDeleteRdbStoretestAdd_0500
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoreDeleteRdbStoretestAdd0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0500 start *************");
      let rdbName = "a".repeat(993)
      try {
        relationalStore.deleteRdbStore(context, rdbName, async (err: BusinessError) => {
          let num = 0;
          await relationalStore.deleteRdbStore(context, rdbName);
          num += 1;
          console.info(TAG + "deleteRdbStore success ");
          expect(num).assertEqual(1)
          done()
        });
      } catch (err) {
        console.error(TAG + `testRdbStoreDeleteRdbStoretestAdd0500, errcode:${JSON.stringify(err)}`);
        expect(!err).assertFail();
        done();
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0500 end   *************");
    });
    /**
     * @tc.name   testRdbStoreDeleteRdbStoretestAdd0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreDeleteRdbStoretestAdd_0600
     * @tc.desc   RelationalStore deleteRdbStore test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoreDeleteRdbStoretestAdd0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0600 start *************");
      let rdbName = ""
      try {
        relationalStore.deleteRdbStore(context, rdbName, async (err: BusinessError) => {
          let num = 0;
          await relationalStore.deleteRdbStore(context, rdbName);
          num += 1;
          console.info(TAG + "deleteRdbStore success ");
          expect(num).assertEqual(1)
          done()
        });
      } catch (err) {
        console.error(TAG + `testRdbStoreDeleteRdbStoretestAdd0600, errcode:${JSON.stringify(err)}`);
        expect(!err).assertFail();
        done();
      }
      console.info(TAG + "************* testRdbStoreDeleteRdbStoretestAdd0600 end   *************");
    });
  })
}
