/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import * as symCallback from './utils/symmetric/publicSymmetricCallback';
import * as symPromise from './utils/symmetric/publicSymmetricPromise';

export default function cryptoSymOptAADJsTestUnit() {
  describe('cryptoSymOptAADJsTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_0100
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0100
     * @tc.desc   3. Test Interface with AsyncCallback Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES128", "AES128|GCM|PKCS7", "genGcmParamsSpecNullAAD");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_0200
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0200
     * @tc.desc   3. Test Interface with AsyncCallback Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS7", "genGcmParamsSpecEmptyAAD");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_0300
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0300
     * @tc.desc   3. Test Interface with AsyncCallback Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES128", "AES128|GCM|PKCS7", "genGcmParamsSpecAADNullData");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_0400
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0400
     * @tc.desc   3. Test Interface with AsyncCallback Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS7", "genGcmParamsSpecWithoutAAD");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_0500
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0500
     * @tc.desc   3. Test Interface with AsyncCallback Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS7", "genGcmParamsSpecWithoutAADData");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_0600
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0600
     * @tc.desc   3. Test Interface with AsyncCallback Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS7",
          "genGcmParamsSpecWithVariableLength", 8, 13);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0600 catch error1: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS7",
          "genGcmParamsSpecWithVariableLength", 8, 16);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0600 catch error2: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS7",
          "genGcmParamsSpecWithVariableLength", 8, 0);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0600 catch error3: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS7",
          "genGcmParamsSpecWithVariableLength", 8, 17);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0600 catch error4: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS7",
          "genGcmParamsSpecWithVariableLength", 8, 128);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0600 catch error4: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS7",
          "genGcmParamsSpecWithVariableLength", 8, 129);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0600 catch error4: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_0700
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0700
     * @tc.desc   3. Test Interface with AsyncCallback Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|NoPadding",
          "genGcmParamsSpecWithVariableLength", 0, 12);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0700 catch error1: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|NoPadding",
          "genGcmParamsSpecWithVariableLength", 9, 12);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0700 catch error2: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|NoPadding",
          "genGcmParamsSpecWithVariableLength", 2048, 12);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0700 catch error3: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_0800
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0800
     * @tc.desc   3. Test Interface with AsyncCallback Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 0, 13);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0800 catch error1: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 33, 15);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0800 catch error2: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 2049, 17);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0800 catch error3: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 2049, 128);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0800 catch error3: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 2049, 129);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0800 catch error3: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 2048, 0);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0800 catch error4: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_0900
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0900
     * @tc.desc   3. Test Interface with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES128", "AES128|GCM|NoPadding", "genGcmParamsSpecNullAAD");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0900 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_1000
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1000
     * @tc.desc   3. Test Interface with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS5", "genGcmParamsSpecEmptyAAD");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_1100
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1100
     * @tc.desc   3. Test Interface with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES128", "AES128|GCM|PKCS5", "genGcmParamsSpecAADNullData");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_1200
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1200
     * @tc.desc   3. Test Interface with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|NoPadding", "genGcmParamsSpecWithoutAAD");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_1300
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1300
     * @tc.desc   3. Test Interface with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS5", "genGcmParamsSpecWithoutAADData");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_1400
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1400
     * @tc.desc   3. Test Interface with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|NoPadding",
          "genGcmParamsSpecWithVariableLength", 8, 13);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1400 catch error1: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|NoPadding",
          "genGcmParamsSpecWithVariableLength", 8, 16);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1400 catch error2: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|NoPadding",
          "genGcmParamsSpecWithVariableLength", 8, 0);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1400 catch error3: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|NoPadding",
          "genGcmParamsSpecWithVariableLength", 8, 17);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1400 catch error4: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|NoPadding",
          "genGcmParamsSpecWithVariableLength", 8, 128);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1400 catch error4: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|NoPadding",
          "genGcmParamsSpecWithVariableLength", 8, 129);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1400 catch error4: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_1500
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1500
     * @tc.desc   3. Test Interface with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS7",
          "genGcmParamsSpecWithVariableLength", 0, 12);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1500 catch error1: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS7",
          "genGcmParamsSpecWithVariableLength", 9, 12);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1500 catch error2: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES256", "AES256|GCM|PKCS7",
          "genGcmParamsSpecWithVariableLength", 2048, 12);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1500 catch error3: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SymOptAAD_Func_1600
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1600
     * @tc.desc   3. Test Interface with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 0, 13);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1600 catch error1: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 33, 15);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1600 catch error2: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 2049, 17);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1600 catch error3: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 2049, 128);
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1600 catch error3: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 2049, 129);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1600 catch error3: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS5",
          "genGcmParamsSpecWithVariableLength", 2048, 0);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1600 catch error4: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });
  })
}