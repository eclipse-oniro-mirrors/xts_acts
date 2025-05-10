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
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc';
import * as specUtil from './utils/common/keyGenSpecUtil';
import * as signVerifyPromiseFunc from './utils/signVerify/signVerifyAsyPromiseFunc';
import * as signVerifyCallbackFunc from './utils/signVerify/signVerifyAsyCallbackFunc';
import { stringToUint8Array } from './utils/common/commonUtils';

export default function SecurityCryptoFwSignVerifyECCBrainPoolTestUnit() {
  describe('SecurityCryptoFwSignVerifyECCBrainPoolTestUnit', () => {
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
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0100
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0100", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0100: started.");
      let algName: string = "ECC_BrainPoolP160r1";
      let signVerifyAlg: string = "ECC_BrainPoolP160r1|SHA1";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0100: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0100: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0200
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP192t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0200", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0200: started.");
      let algName: string = "ECC_BrainPoolP192t1";
      let signVerifyAlg: string = "ECC_BrainPoolP192t1|SHA224";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0200: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0200: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0300
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP224r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0300", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0300: started.");
      let algName: string = "ECC_BrainPoolP224r1";
      let signVerifyAlg: string = "ECC_BrainPoolP224r1|SHA256";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0300: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0300: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0400
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP256t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0400", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0400: started.");
      let algName: string = "ECC_BrainPoolP256t1";
      let signVerifyAlg: string = "ECC_BrainPoolP256t1|SHA256";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0400: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0400: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0500
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP320r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0500", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0500: started.");
      let algName: string = "ECC_BrainPoolP320r1";
      let signVerifyAlg: string = "ECC_BrainPoolP320r1|SHA384";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0500: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0500: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0600
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP384t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0600", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0600: started.");
      let algName: string = "ECC_BrainPoolP384t1";
      let signVerifyAlg: string = "ECC_BrainPoolP384t1|SHA512";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0600: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0600: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0700
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0700", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0700: started.");
      let algName: string = "ECC_BrainPoolP512r1";
      let signVerifyAlg: string = "ECC_BrainPoolP512r1|MD5";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0700: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0700 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0700: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0800
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0800", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0800: started.");
      let algName: string = "ECC_BrainPoolP160t1";
      let signVerifyAlg: string = "ECC_BrainPoolP160t1|SHA1";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0800: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0800: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0900
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP192r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0900", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0900: started.");
      let algName: string = "ECC_BrainPoolP192r1";
      let signVerifyAlg: string = "ECC_BrainPoolP192r1|SHA224";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0900: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0900 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0900: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1000
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP224t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1000", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1000: started.");
      let algName: string = "ECC_BrainPoolP224t1";
      let signVerifyAlg: string = "ECC_BrainPoolP224t1|SHA256";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1000: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1000: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1100
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP256r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1100", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1100: started.");
      let algName: string = "ECC_BrainPoolP256r1";
      let signVerifyAlg: string = "ECC_BrainPoolP256r1|SHA256";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1100: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1100: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1200
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP320t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1200", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1200: started.");
      let algName: string = "ECC_BrainPoolP320t1";
      let signVerifyAlg: string = "ECC_BrainPoolP320t1|SHA384";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1200: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1200: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1300
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP384r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1300", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1300: started.");
      let algName: string = "ECC_BrainPoolP384r1";
      let signVerifyAlg: string = "ECC_BrainPoolP384r1|SHA512";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1300: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1300: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1400
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512t1
     * @tc.desc 3. Test interface with Callback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1400", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1400: started.");
      let algName: string = "ECC_BrainPoolP512t1";
      let signVerifyAlg: string = "ECC_BrainPoolP512t1|MD5";
      try {
        let res: boolean = await signVerifyCallbackFunc.normalProcess(signVerifyAlg, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1400: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1400: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1500
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1500", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1500: started.");
      let spec: cryptoFramework.AsyKeySpec = specUtil.genP512t1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
      let signVerifyAlg: string = "ECC_BrainPoolP512t1|MD5";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, spec);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1500: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1500: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1600
     * @tc.name Test signVerify with brainPool, process is successful
     * @tc.desc 1. AsyKeyGeneratorBySpec with algName ECC_BrainPoolP512t1
     * @tc.desc 2. Test interface with Callback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1600", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1600: started.");
      let curveName: string = "NID_brainpoolP512t1";
      let spec: cryptoFramework.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
        params: cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName),
        sk: specUtil.p512t1Sk(),
        pk: specUtil.p512t1Pk(),
      };
      let signVerifyAlg: string = "ECC_BrainPoolP512t1|MD5";
      try {
        let res: boolean = await signVerifyCallbackFunc.normalProcess(signVerifyAlg, spec);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1600: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1600: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1700
     * @tc.name Test signVerify with error brainPool, process is fail
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160r1|NoHash
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1700", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1700: started.");
      let signVerifyAlg: string[] = ["ECC_BrainPoolP160r1|NoHash", "ECC_BrainPoolP160r1|SM3"];
      for (let i = 0; i < signVerifyAlg.length; i++) {
        try {
          cryptoFramework.createSign(signVerifyAlg[i]);
          console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1700: createSign succeed`);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(401);
          console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1700 catch error: “${err}“, error code: ${err.code}`);
        }
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1700: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1800
     * @tc.name Test signVerify with error brainPool, process is fail
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160r1|NoHash
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1800", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1800: started.");
      let signVerifyAlg: string[] = ["ECC_BrainPoolP160r1|NoHash", "ECC_BrainPoolP160r1|SM3"];
      for (let i = 0; i < signVerifyAlg.length; i++) {
        try {
          cryptoFramework.createVerify(signVerifyAlg[i]);
          console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1800: createVerify succeed`);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(401);
          console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1800 catch error: “${err}“, error code: ${err.code}`);
        }
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1800: success.");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerify_BrainPool_Func_3100
     * @tc.name Test signVerify algName with brainPool, process success
     * @tc.desc create Sign/Verify with ECC_BrainPoolP224t1|SHA256
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerify_BrainPool_Func_3100", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_SignVerify_BrainPool_Func_3100";
      console.log(testNumber + ": started");
      let signVerifyAlg: string = "ECC_BrainPoolP224t1|SHA256";
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signVerifyAlg);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signVerifyAlg);
        expect(sign.algName == signVerifyAlg).assertTrue();
        expect(verify.algName == signVerifyAlg).assertTrue();
      } catch (err) {
        console.error(testNumber + `: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

  })
}