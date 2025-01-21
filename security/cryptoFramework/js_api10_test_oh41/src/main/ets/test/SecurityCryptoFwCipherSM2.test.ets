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
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as specUtil from './utils/common/keyGenSpecUtil';
import * as cipherCallbackFunc from './utils/cipher/cipherAsyCallbackFunc';
import * as cipherPromiseFunc from './utils/cipher/cipherAsyPromiseFunc';

export default function SecurityCryptoFwGenerateECCBrainPoolTestUnit() {
  describe('SecurityCryptoFwCipherSM2TestUnit', () => {
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
     * @tc.number Security_CryptoFramework_Cipher_SM2_Func_0100
     * @tc.name Test cipher with SM2_256|SHA256, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName SM2256
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("Security_CryptoFramework_Cipher_SM2_Func_0100", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_Cipher_SM2_Func_0100: started.");
      let cipherAlg: string = "SM2_256|SHA256";
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(`Security_CryptoFramework_Cipher_SM2_Func_0100: genSpec succeed`);
        let res: boolean = await cipherPromiseFunc.normalProcess(cipherAlg, spec, null);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_Cipher_SM2_Func_0100: cipher succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_Cipher_SM2_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_Cipher_SM2_Func_0100: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Cipher_SM2_Func_0200
     * @tc.name Test cipher with SM2_256|SHA256, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName SM2256
     * @tc.desc 3. Test interface with Callback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("Security_CryptoFramework_Cipher_SM2_Func_0200", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_Cipher_SM2_Func_0200: started.");
      let cipherAlg: string = "SM2_256|SHA256";
      let curveName: string = "NID_sm2";
      try {
        let spec: cryptoFramework.ECCKeyPairSpec = {
          algName: "SM2",
          specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
          params: cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName),
          sk: specUtil.SM2Sk(),
          pk: specUtil.SM2Pk(),
        };
        console.log(`Security_CryptoFramework_Cipher_SM2_Func_0200: genSpec succeed`);
        let res: boolean = await cipherCallbackFunc.normalProcess(cipherAlg, spec, null);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_Cipher_SM2_Func_0200: cipher succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_Cipher_SM2_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_Cipher_SM2_Func_0200: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Cipher_SM2_Func_0300
     * @tc.name Test getCipherSpec with SM2_256, process is successful
     * @tc.desc 1. getCipherSpec with MD5
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Cipher_SM2_Func_0300", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_Cipher_SM2_Func_0300: started.");
      let cipherAlg: string = "SM2_256|MD5";
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlg);
        cipher.getCipherSpec(cryptoFramework.CipherSpecItem.SM2_MD_NAME_STR);
        console.log(`Security_CryptoFramework_Cipher_SM2_Func_0300: getCipherSpec succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_Cipher_SM2_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_Cipher_SM2_Func_0300: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Cipher_SM2_Func_0400
     * @tc.name Test getCipherSpec with SM2_256, process is successful
     * @tc.desc 1. getCipherSpec with SHA1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Cipher_SM2_Func_0400", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_Cipher_SM2_Func_0400: started.");
      let cipherAlg: string = "SM2_256|SHA1";
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlg);
        cipher.getCipherSpec(cryptoFramework.CipherSpecItem.SM2_MD_NAME_STR);
        console.log(`Security_CryptoFramework_Cipher_SM2_Func_0400: getCipherSpec succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_Cipher_SM2_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_Cipher_SM2_Func_0400: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Cipher_SM2_Func_0500
     * @tc.name Test getCipherSpec with SM2, process is successful
     * @tc.desc 1. getCipherSpec with SHA224
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Cipher_SM2_Func_0500", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_Cipher_SM2_Func_0500: started.");
      let cipherAlg: string = "SM2|SHA224";
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlg);
        cipher.getCipherSpec(cryptoFramework.CipherSpecItem.SM2_MD_NAME_STR);
        console.log(`Security_CryptoFramework_Cipher_SM2_Func_0500: getCipherSpec succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_Cipher_SM2_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_Cipher_SM2_Func_0500: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Cipher_SM2_Func_0600
     * @tc.name Test getCipherSpec with SM2_256, process is successful
     * @tc.desc 1. getCipherSpec with SHA256
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Cipher_SM2_Func_0600", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_Cipher_SM2_Func_0600: started.");
      let cipherAlg: string = "SM2_256|SHA256";
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlg);
        cipher.getCipherSpec(cryptoFramework.CipherSpecItem.SM2_MD_NAME_STR);
        console.log(`Security_CryptoFramework_Cipher_SM2_Func_0600: getCipherSpec succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_Cipher_SM2_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_Cipher_SM2_Func_0600: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Cipher_SM2_Func_0700
     * @tc.name Test getCipherSpec with SM2_256, process is successful
     * @tc.desc 1. getCipherSpec with SHA384
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Cipher_SM2_Func_0700", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_Cipher_SM2_Func_0700: started.");
      let cipherAlg: string = "SM2_256|SHA384";
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlg);
        cipher.getCipherSpec(cryptoFramework.CipherSpecItem.SM2_MD_NAME_STR);
        console.log(`Security_CryptoFramework_Cipher_SM2_Func_0700: getCipherSpec succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_Cipher_SM2_Func_0700 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_Cipher_SM2_Func_0700: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Cipher_SM2_Func_0800
     * @tc.name Test getCipherSpec with SM2_256, process is successful
     * @tc.desc 1. getCipherSpec with SHA512
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Cipher_SM2_Func_0800", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_Cipher_SM2_Func_0800: started.");
      let cipherAlg: string = "SM2_256|SHA512";
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlg);
        cipher.getCipherSpec(cryptoFramework.CipherSpecItem.SM2_MD_NAME_STR);
        console.log(`Security_CryptoFramework_Cipher_SM2_Func_0800: getCipherSpec succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_Cipher_SM2_Func_0800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_Cipher_SM2_Func_0800: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Cipher_SM2_Func_0900
     * @tc.name Test getCipherSpec with SM2_256, process is successful
     * @tc.desc 1. getCipherSpec with SM3
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Cipher_SM2_Func_0900", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_Cipher_SM2_Func_0900: started.");
      let cipherAlg: string = "SM2_256|SM3";
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlg);
        cipher.getCipherSpec(cryptoFramework.CipherSpecItem.SM2_MD_NAME_STR);
        console.log(`Security_CryptoFramework_Cipher_SM2_Func_0900: getCipherSpec succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_Cipher_SM2_Func_0900 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_Cipher_SM2_Func_0900: success`);
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Cipher_SM2_Func_1100
     * @tc.name Test Cipher algName with SM2_256, process success
     * @tc.desc digest is SM3
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Cipher_SM2_Func_1100", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Cipher_SM2_Func_1100";
      console.log(testNumber + ": started");
      let cipherAlg: string = "SM2_256|SM3";
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlg);
        expect(cipher.algName == cipherAlg);
      } catch (err) {
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

  })
}