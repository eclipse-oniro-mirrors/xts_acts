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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import * as symCallback from './utils/symmetric/publicSymmetricCallback';
import * as symPromise from './utils/symmetric/publicSymmetricPromise';

export default function cryptoSymOptAADJsTestUnit() {
  describe('cryptoSymOptAADJsTestUnit', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(function () {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0100
     * @tc.name Test GcmParamsSpec with AAD as null
     * @tc.desc 1. SymKeyGenerator with algName AES128
     * @tc.desc 2. Cipher with algName AES128|GCM|PKCS7
     * @tc.desc 3. Test Interface with AsyncCallback Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0100", 0, async function (done) {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES128", "AES128|GCM|PKCS7", "genGcmParamsSpecNullAAD");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0200
     * @tc.name Test GcmParamsSpec with AAD as Empty Array
     * @tc.desc 1. SymKeyGenerator with algName AES192
     * @tc.desc 2. Cipher with algName AES192|GCM|PKCS7
     * @tc.desc 3. Test Interface with AsyncCallback Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0200", 0, async function (done) {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS7", "genGcmParamsSpecEmptyAAD");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0300
     * @tc.name Test GcmParamsSpec with AAD as Null Data
     * @tc.desc 1. SymKeyGenerator with algName AES128
     * @tc.desc 2. Cipher with algName AES128|GCM|PKCS7
     * @tc.desc 3. Test Interface with AsyncCallback Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0300", 0, async function (done) {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES128", "AES128|GCM|PKCS7", "genGcmParamsSpecAADNullData");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0400
     * @tc.name Test GcmParamsSpec without AAD
     * @tc.desc 1. SymKeyGenerator with algName AES192
     * @tc.desc 2. Cipher with algName AES192|GCM|PKCS7
     * @tc.desc 3. Test Interface with AsyncCallback Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0400", 0, async function (done) {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS7", "genGcmParamsSpecWithoutAAD");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0500
     * @tc.name Test GcmParamsSpec without AAD data
     * @tc.desc 1. SymKeyGenerator with algName AES192
     * @tc.desc 2. Cipher with algName AES192|GCM|PKCS7
     * @tc.desc 3. Test Interface with AsyncCallback Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0500", 0, async function (done) {
      try {
        await symCallback.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS7", "genGcmParamsSpecWithoutAADData");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0600
     * @tc.name Test GcmParamsSpec with aad length fixed at 8 and iv length is variable
     * @tc.desc 1. SymKeyGenerator with algName AES256
     * @tc.desc 2. Cipher with algName AES256|GCM|PKCS7
     * @tc.desc 3. Test Interface with AsyncCallback Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0600", 0, async function (done) {
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
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0600 catch error4: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0700
     * @tc.name Test GcmParamsSpec with iv length fixed at 12 and aad length is variable
     * @tc.desc 1. SymKeyGenerator with algName AES256
     * @tc.desc 2. Cipher with algName AES256|GCM|NoPadding
     * @tc.desc 3. Test Interface with AsyncCallback Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0700", 0, async function (done) {
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
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0800
     * @tc.name Test GcmParamsSpec with both of iv and aad length are variable
     * @tc.desc 1. SymKeyGenerator with algName AES256
     * @tc.desc 2. Cipher with algName AES256|GCM|PKCS5
     * @tc.desc 3. Test Interface with AsyncCallback Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0800", 0, async function (done) {
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
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_0900
     * @tc.name Test GcmParamsSpec with AAD as null
     * @tc.desc 1. SymKeyGenerator with algName AES128
     * @tc.desc 2. Cipher with algName AES128|GCM|NoPadding
     * @tc.desc 3. Test Interface with Promise Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_0900", 0, async function (done) {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES128", "AES128|GCM|NoPadding", "genGcmParamsSpecNullAAD");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_0900 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1000
     * @tc.name Test GcmParamsSpec with AAD as Empty Array
     * @tc.desc 1. SymKeyGenerator with algName AES192
     * @tc.desc 2. Cipher with algName AES192|GCM|PKCS5
     * @tc.desc 3. Test Interface with Promise Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1000", 0, async function (done) {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS5", "genGcmParamsSpecEmptyAAD");
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1100
     * @tc.name Test GcmParamsSpec with AAD as Null Data
     * @tc.desc 1. SymKeyGenerator with algName AES128
     * @tc.desc 2. Cipher with algName AES128|GCM|PKCS5
     * @tc.desc 3. Test Interface with Promise Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1100", 0, async function (done) {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES128", "AES128|GCM|PKCS5", "genGcmParamsSpecAADNullData");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1100 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1200
     * @tc.name Test GcmParamsSpec without AAD
     * @tc.desc 1. SymKeyGenerator with algName AES192
     * @tc.desc 2. Cipher with algName AES192|GCM|NoPadding
     * @tc.desc 3. Test Interface with Promise Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1200", 0, async function (done) {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|NoPadding", "genGcmParamsSpecWithoutAAD");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1200 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1300
     * @tc.name Test GcmParamsSpec without AAD data
     * @tc.desc 1. SymKeyGenerator with algName AES192
     * @tc.desc 2. Cipher with algName AES192|GCM|PKCS5
     * @tc.desc 3. Test Interface with Promise Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1300", 0, async function (done) {
      try {
        await symPromise.encryptAndDecryptNormalProcess("AES192", "AES192|GCM|PKCS5", "genGcmParamsSpecWithoutAADData");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1300 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1400
     * @tc.name Test GcmParamsSpec with aad length fixed at 8 and iv length is variable
     * @tc.desc 1. SymKeyGenerator with algName AES256
     * @tc.desc 2. Cipher with algName AES256|GCM|NoPadding
     * @tc.desc 3. Test Interface with Promise Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1400", 0, async function (done) {
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
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_SymOptAAD_Func_1400 catch error4: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1500
     * @tc.name Test GcmParamsSpec with iv length fixed at 12 and aad length is variable
     * @tc.desc 1. SymKeyGenerator with algName AES256
     * @tc.desc 2. Cipher with algName AES256|GCM|PKCS7
     * @tc.desc 3. Test Interface with Promise Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1500", 0, async function (done) {
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
     * @tc.number Security_CryptoFramework_SymOptAAD_Func_1600
     * @tc.name Test GcmParamsSpec with both of iv and aad length are variable
     * @tc.desc 1. SymKeyGenerator with algName AES192
     * @tc.desc 2. Cipher with algName AES192|GCM|PKCS5
     * @tc.desc 3. Test Interface with Promise Style
     */
    it("Security_CryptoFramework_SymOptAAD_Func_1600", 0, async function (done) {
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