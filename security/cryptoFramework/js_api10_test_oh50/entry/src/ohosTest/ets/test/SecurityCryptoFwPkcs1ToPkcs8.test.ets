/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as commonUtils from './utils/common/commonUtils';
import * as pkcs1topkcs8 from './utils/pkcs1Topkcs8/pkcs1topkcs8';



export default function SecurityCryptoFwPkcs1ToPkcs8TestUnit() {
  describe('SecurityCryptoFwPkcs1ToPkcs8TestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0001
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let priString  = "";
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA512', pkcs1topkcs8.priKeyPkcs1Str512);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA768', pkcs1topkcs8.priKeyPkcs1Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA1024', pkcs1topkcs8.priKeyPkcs1Str1024);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA2048', pkcs1topkcs8.priKeyPkcs1Str2048);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA3072', pkcs1topkcs8.priKeyPkcs1Str3072);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA4096', pkcs1topkcs8.priKeyPkcs1Str4096);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA8192', pkcs1topkcs8.priKeyPkcs1Str8192);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0002
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let priString  = "";
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA512', pkcs1topkcs8.priKeyPkcs1Str512);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA768', pkcs1topkcs8.priKeyPkcs1Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA1024', pkcs1topkcs8.priKeyPkcs1Str1024);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA2048', pkcs1topkcs8.priKeyPkcs1Str2048);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA3072', pkcs1topkcs8.priKeyPkcs1Str3072);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA4096', pkcs1topkcs8.priKeyPkcs1Str4096);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA8192', pkcs1topkcs8.priKeyPkcs1Str8192);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0003
     * @tc.name test pubkey is null, prikey is not null pkcs8 to pkcs1
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let priString  = "";
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA512', pkcs1topkcs8.priKeyPkcs8Str512);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA768', pkcs1topkcs8.priKeyPkcs8Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA1024', pkcs1topkcs8.priKeyPkcs8Str1024);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA2048', pkcs1topkcs8.priKeyPkcs8Str2048);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA3072', pkcs1topkcs8.priKeyPkcs8Str3072);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA4096', pkcs1topkcs8.priKeyPkcs8Str4096);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA8192', pkcs1topkcs8.priKeyPkcs8Str8192);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0004
     * @tc.name test pubkey is null, prikey is not null pkcs8 to pkcs1
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let priString  = "";
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA512', pkcs1topkcs8.priKeyPkcs8Str512);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA768', pkcs1topkcs8.priKeyPkcs8Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA1024', pkcs1topkcs8.priKeyPkcs8Str1024);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA2048', pkcs1topkcs8.priKeyPkcs8Str2048);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA3072', pkcs1topkcs8.priKeyPkcs8Str3072);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA4096', pkcs1topkcs8.priKeyPkcs8Str4096);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA8192', pkcs1topkcs8.priKeyPkcs8Str8192);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0005
     * @tc.name test pubkey is not null pkcs1 to x509, prikey is null
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let pubString  = "";
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
      } catch (error) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
      } catch (error) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
      } catch (error) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
      } catch (error) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
      } catch (error) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0006
     * @tc.name test pubkey is not null pkcs1 to x509, prikey is null
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let pubString  = "";
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
      } catch (error) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
      } catch (error) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
      } catch (error) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
      } catch (error) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
      } catch (error) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0007
     * @tc.name  test pubkey is not null x509 to pkcs1, prikey is null
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let pubString  = "";
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA512', pkcs1topkcs8.pubKeyX509Str512);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA768', pkcs1topkcs8.pubKeyX509Str768);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA1024', pkcs1topkcs8.pubKeyX509Str1024);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
      } catch (error) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA2048', pkcs1topkcs8.pubKeyX509Str2048);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
      } catch (error) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA3072', pkcs1topkcs8.pubKeyX509Str3072);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
      } catch (error) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA4096', pkcs1topkcs8.pubKeyX509Str4096);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
      } catch (error) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA8192', pkcs1topkcs8.pubKeyX509Str8192);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
      } catch (error) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0008
     * @tc.name  test pubkey is not null x509 to pkcs1, prikey is null
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let pubString  = "";
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA512', pkcs1topkcs8.pubKeyX509Str512);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA768', pkcs1topkcs8.pubKeyX509Str768);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA1024', pkcs1topkcs8.pubKeyX509Str1024);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
      } catch (error) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA2048', pkcs1topkcs8.pubKeyX509Str2048);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
      } catch (error) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA3072', pkcs1topkcs8.pubKeyX509Str3072);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
      } catch (error) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA4096', pkcs1topkcs8.pubKeyX509Str4096);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
      } catch (error) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA8192', pkcs1topkcs8.pubKeyX509Str8192);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
      } catch (error) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0009
     * @tc.name  test pubkey pkcs1 to x509, prikey pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512, pkcs1topkcs8.priKeyPkcs1Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyPkcs1Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs1Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072, pkcs1topkcs8.priKeyPkcs1Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096, pkcs1topkcs8.priKeyPkcs1Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192, pkcs1topkcs8.priKeyPkcs1Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0010
     * @tc.name  test pubkey pkcs1 to x509, prikey pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512, pkcs1topkcs8.priKeyPkcs1Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyPkcs1Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs1Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072, pkcs1topkcs8.priKeyPkcs1Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096, pkcs1topkcs8.priKeyPkcs1Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192, pkcs1topkcs8.priKeyPkcs1Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0011
     * @tc.name  test pubkey pkcs1 to x509, prikey pkcs8 to pkcs1
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512, pkcs1topkcs8.priKeyPkcs8Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyPkcs8Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs8Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072, pkcs1topkcs8.priKeyPkcs8Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096, pkcs1topkcs8.priKeyPkcs8Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192, pkcs1topkcs8.priKeyPkcs8Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0012
     * @tc.name  test pubkey pkcs1 to x509, prikey pkcs8 to pkcs1
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512, pkcs1topkcs8.priKeyPkcs8Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyPkcs8Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs8Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072, pkcs1topkcs8.priKeyPkcs8Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096, pkcs1topkcs8.priKeyPkcs8Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192, pkcs1topkcs8.priKeyPkcs8Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0013
     * @tc.name  test pubkey X509 to PKCS1, prikey pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA512', pkcs1topkcs8.pubKeyX509Str512, pkcs1topkcs8.priKeyPkcs1Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA768', pkcs1topkcs8.pubKeyX509Str768, pkcs1topkcs8.priKeyPkcs1Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA1024', pkcs1topkcs8.pubKeyX509Str1024, pkcs1topkcs8.priKeyPkcs1Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA2048', pkcs1topkcs8.pubKeyX509Str2048, pkcs1topkcs8.priKeyPkcs1Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA3072', pkcs1topkcs8.pubKeyX509Str3072, pkcs1topkcs8.priKeyPkcs1Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA4096', pkcs1topkcs8.pubKeyX509Str4096, pkcs1topkcs8.priKeyPkcs1Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA8192', pkcs1topkcs8.pubKeyX509Str8192, pkcs1topkcs8.priKeyPkcs1Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0014
     * @tc.name  test pubkey X509 to PKCS1, prikey pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA512', pkcs1topkcs8.pubKeyX509Str512, pkcs1topkcs8.priKeyPkcs1Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA768', pkcs1topkcs8.pubKeyX509Str768, pkcs1topkcs8.priKeyPkcs1Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA1024', pkcs1topkcs8.pubKeyX509Str1024, pkcs1topkcs8.priKeyPkcs1Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA2048', pkcs1topkcs8.pubKeyX509Str2048, pkcs1topkcs8.priKeyPkcs1Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA3072', pkcs1topkcs8.pubKeyX509Str3072, pkcs1topkcs8.priKeyPkcs1Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA4096', pkcs1topkcs8.pubKeyX509Str4096, pkcs1topkcs8.priKeyPkcs1Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA8192', pkcs1topkcs8.pubKeyX509Str8192, pkcs1topkcs8.priKeyPkcs1Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0015
     * @tc.name  test pubkey X509 to PKCS1, prikey pkcs8 to pkcs1
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA512', pkcs1topkcs8.pubKeyX509Str512, pkcs1topkcs8.priKeyPkcs8Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA768', pkcs1topkcs8.pubKeyX509Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA1024', pkcs1topkcs8.pubKeyX509Str1024, pkcs1topkcs8.priKeyPkcs8Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA2048', pkcs1topkcs8.pubKeyX509Str2048, pkcs1topkcs8.priKeyPkcs8Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA3072', pkcs1topkcs8.pubKeyX509Str3072, pkcs1topkcs8.priKeyPkcs8Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA4096', pkcs1topkcs8.pubKeyX509Str4096, pkcs1topkcs8.priKeyPkcs8Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA8192', pkcs1topkcs8.pubKeyX509Str8192, pkcs1topkcs8.priKeyPkcs8Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0016
     * @tc.name  test pubkey X509 to PKCS1, prikey pkcs8 to pkcs1
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA512', pkcs1topkcs8.pubKeyX509Str512, pkcs1topkcs8.priKeyPkcs8Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA768', pkcs1topkcs8.pubKeyX509Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA1024', pkcs1topkcs8.pubKeyX509Str1024, pkcs1topkcs8.priKeyPkcs8Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA2048', pkcs1topkcs8.pubKeyX509Str2048, pkcs1topkcs8.priKeyPkcs8Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA3072', pkcs1topkcs8.pubKeyX509Str3072, pkcs1topkcs8.priKeyPkcs8Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA4096', pkcs1topkcs8.pubKeyX509Str4096, pkcs1topkcs8.priKeyPkcs8Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA8192', pkcs1topkcs8.pubKeyX509Str8192, pkcs1topkcs8.priKeyPkcs8Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0100
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0200
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyError, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0300
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(null, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0400
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA3072";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyError, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0500
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyError, pkcs1topkcs8.priKeyPkcs1Str1024);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0600
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0700
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0800
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        let pubString = keyPair.pubKey.getEncodedPem('PKCS1');
        let priString = keyPair.priKey.getEncodedPem('PKCS8');
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0900
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1000
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA2048";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1100
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA2048";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs1Str2048_B);
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1200
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1300
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyError, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1400
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(null, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1500
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA3072";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyError, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1600
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyError, pkcs1topkcs8.priKeyPkcs1Str1024);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1700
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1800
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str768);
        expect(null).assertNull();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1900
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        let pubString = keyPair.pubKey.getEncodedPem('PKCS1');
        let priString = keyPair.priKey.getEncodedPem('PKCS8');
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2000
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str1024);
        expect(null).assertNull();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2100
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA2048";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str2048);
        expect(null).assertNull();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2200
     * @tc.name test pubkey is null, prikey is not null pkcs1 to pkcs8
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA2048";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs1Str2048_B);
        expect(null).assertNull();
      } catch (error) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2300
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(pkcs1topkcs8.pubKeyX509Str1024, null);
        keyPair.pubKey.getEncodedPem("PKCS8");
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2400
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA2048";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(pkcs1topkcs8.pubKeyX509Str2048, null);
        keyPair.pubKey.getEncodedPem("PKCS8");
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2500
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        keyPair.pubKey.getEncodedPem("PKCS8");
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2600
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA3072";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        keyPair.priKey.getEncodedPem("X509");
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2700
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA4096";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(null, pkcs1topkcs8.priKeyPkcs1Str4096);
        keyPair.priKey.getEncodedPem("X509");
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2800
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA8192";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(null, pkcs1topkcs8.priKeyPkcs1Str8192);
        keyPair.priKey.getEncodedPem("X509");
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2900
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA768";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(null, pkcs1topkcs8.priKeyPkcs8Str768);
        keyPair.priKey.getEncodedPem("X509");
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3000
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(null, pkcs1topkcs8.priKeyPkcs8Str1024);
        keyPair.priKey.getEncodedPem("X509");
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });


  });
}